// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from 'stimulus';
//Contains markers for pet friendly places
let markers = [];
let placeIdArray = [];

export default class extends Controller {
  // DOM elements linked to this controller
  static targets = ['field', 'map', 'placeName'];

  connect() {
    // check whether the global google variable is initialized
    if (typeof google != 'undefined') {
      this.initializeMap();
    }
  }

  addMarkers(place, map, cb = () => {}) {
    let marker = new google.maps.Marker({
      map,
      position: {
        lat: place.geometry.location.lat(),
        lng: place.geometry.location.lng(),
      },
    });

    marker.setVisible(true);

    markers = [...markers, marker];

    const infowindow = new google.maps.InfoWindow({
      content: `<div class="card shadow rounded px-5 py-3">
                  <h6 class="mb-1">${place.name}</h6>
                  <p>${place.formatted_address}</p>
                  <button id="iw-button" class="button button-sm primary-green">View</button>
                </div>`,
    });

    marker.addListener('click', () => {
      infowindow.open(map, marker);
    });

    google.maps.event.addListener(infowindow, 'domready', () => {
      google.maps.event.addDomListener(
        document.getElementById('iw-button'),
        'click',
        (e) => {
          e.preventDefault();
          cb();
        }
      );
    });
  }

  preventSubmit(e) {
    if (e.key == 'Enter') {
      e.preventDefault();
    }
  }

  enableAddressAutocomplete(map) {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    this.autocomplete.bindTo('bounds', map);
    this.autocomplete.setFields([
      'address_components',
      'icon',
      'geometry',
      'name',
    ]);

    this.autocomplete.addListener(
      'place_changed',
      this.onPlaceChange.bind(this)
    );
  }

  onPlaceChange() {
    let place = this.autocomplete.getPlace();

    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`);
      return;
    }

    if (place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport);
    } else {
      this.map.setCenter(place.geometry.location);
      this.map.setZoom(17);
    }

    this.getPetFriendlyCafes(
      place.geometry.location.lat(),
      place.geometry.location.lng(),
      this.map
    );
  }

  getPetFriendlyCafes(lat, lng, map) {
    let request = {
      location: new google.maps.LatLng(lat, lng),
      radius: '5000',
      keyword: ['pet friendly'],
      type: 'cafe',
    };

    markers = [];
    const service = new google.maps.places.PlacesService(map);

    service.textSearch(request, (places, status) => {
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        places.slice(0, 5).forEach((place) => {
          this.addMarkers(place, map);
          this.addMarkers(place, map, () => {
            fetch(`/places/check_place/${place.place_id}`)
              .then((response) => response.json())
              .then((data) => {
                if (!data) {
                  let request = {
                    placeId: place.place_id,
                  };

                  service.getDetails(request, (place, status) => {
                    if (status == google.maps.places.PlacesServiceStatus.OK) {
                      let data = {
                        address: place.formatted_address,
                        name: place.name,
                        phone: place.formatted_phone_number,
                        website: place.website,
                        rating: place.rating,
                        photo: place.photos
                          ? place.photos[0].getUrl({
                              maxWidth: 100,
                              maxHeight: 100,
                            })
                          : '',
                        google_place_id: place.place_id,
                      };
                      fetch('/places/add_place', {
                        method: 'POST',
                        headers: {
                          'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data),
                      })
                        .then((response) => response.json())
                        .then((place_details) => {
                          console.log(place_details);
                          if (place_details) {
                            window.location.href = `/places/${place_details.google_place_id}`;
                          } else {
                            console.log('no place details');
                          }
                        })
                        .catch((err) => console.log(err));
                    } else {
                      window.alert(
                        'Google maps did not return details for the place'
                      );
                    }
                  });
                } else {
                  window.location.href = `/places/${data.google_place_id}`;
                }
              });
          });
        });
      } else {
        window.alert('Google maps did not return pet friendly cafes');
      }
    });
  }

  initializeMap() {
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(-37.840935, 144.946457),
      zoom: 12,
    });

    this.getPetFriendlyCafes(-37.840935, 144.946457, this.map);
    this.enableAddressAutocomplete(this.map);
  }
}

function place() {
  service.getDetails(request, (place, status) => {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      console.log(place);
      let data = {
        address: place.formatted_address,
        name: place.name,
        phone: place.formatted_phone_number,
        website: place.website,
        rating: place.rating,
        photo: place.photos
          ? place.photos[0].getUrl({
              maxWidth: 450,
              maxHeight: 450,
            })
          : '',
        google_place_id: place.place_id,
      };

      fetch('/places/add_place', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      })
        .then((response) => response.json())
        .then((place_details) => {
          console.log(place_details);
          if (place_details) {
            window.location.href = `/places/${place_details.google_place_id}`;
          } else {
            console.log('no place details');
          }
        })
        .catch((err) => console.log(err));
    } else {
      window.alert('Google maps did not return details for the place');
    }
  });
}

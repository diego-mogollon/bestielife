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
      console.log('hello');
      this.initializeMap();
    }
  }

  initializeMap() {
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(39.5, -98.35),
      zoom: 17,
    });

    this.setCurrentLocation(this.map);
    this.enableAddressAutocomplete(this.map);
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

  setCurrentLocation(map) {
    if (navigator.geolocation) {
      let options = {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0,
      };
      navigator.geolocation.getCurrentPosition(
        (position) => {
          console.log(position);
          let initialLocation = new google.maps.LatLng(
            position.coords.latitude,
            position.coords.longitude
          );

          map.setCenter(initialLocation);
          let marker = new google.maps.Marker({
            map: map,
            position: {
              lat: position.coords.latitude,
              lng: position.coords.longitude,
            },
          });

          marker.setVisible(true);
          markers = [...markers, marker];
        },
        (err) =>
          alert(
            `Google maps geolocation failed: ${err.code}: ${err.message}. Try again`
          ),
        options
      );
    } else {
      window.alert('Error when performing geolocation. Please try again');
      return;
    }
  }

  onPlaceChange() {
    let place = this.autocomplete.getPlace();

    markers.forEach((marker) => {
      marker.setVisible(false);
    });

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

    this.getAddress(
      place.geometry.location.lat(),
      place.geometry.location.lng(),
      (placeId) =>
        this.getPlacesInfo(
          place.geometry.location.lat(),
          place.geometry.location.lng(),
          placeId,
          this.map
        )
    );
  }

  preventSubmit(e) {
    if (e.key == 'Enter') {
      e.preventDefault();
    }
  }

  getPlacesInfo(lat, lng, id, map) {
    let place_details;
    var request = {
      location: new google.maps.LatLng(lat, lng),
      radius: '5000',
      keyword: ['pet friendly'],
      type: 'cafe',
    };

    const service = new google.maps.places.PlacesService(map);

    service.textSearch(request, (places, status) => {
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        places.slice(0, 5).forEach((place) => {
          let marker = new google.maps.Marker({
            map: map,
            position: {
              lat: place.geometry.location.lat(),
              lng: place.geometry.location.lng(),
            },
          });
          marker.setVisible(true);
          markers = [...markers, marker];
          map.setZoom(13);

          const infowindow = new google.maps.InfoWindow({
            content: `<div>
                  <h6>${place.name}</h6>
                  <span class="text-muted">${place.formatted_address}</span>
                  <button id="info-window-button">View</button>
                  </div>`,
          });

          marker.addListener('click', () => {
            infowindow.open(map, marker);
          });

          google.maps.event.addListener(infowindow, 'domready', () => {
            google.maps.event.addDomListener(
              document.getElementById('info-window-button'),
              'click',
              (e) => {
                e.preventDefault();

                placeIdArray = [...placeIdArray, place.place_id];

                fetch(`/places/check_place/${place.place_id}`)
                  .then((response) => response.json())
                  .then((data) => {
                    if (!data) {
                      let request = {
                        placeId: place.place_id,
                      };

                      service.getDetails(request, (place, status) => {
                        if (
                          status == google.maps.places.PlacesServiceStatus.OK
                        ) {
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
                          window.alert(
                            'Google maps did not return details for the place'
                          );
                        }
                      });
                    } else {
                      window.location.href = `/places/${data.google_place_id}`;
                    }
                  });
              }
            );
          });
        });
      }
    });
  }

  sendPlaceDetails(id, service) {
    let request = {
      placeId: id,
    };

    service.getDetails(request, function (place, status) {
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        // console.log(place);
      }
    });
  }

  getAddress(lat, lng, callback) {
    const geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(lat, lng);
    let address = '';

    geocoder.geocode(
      {
        location: latlng,
      },
      (results, status) => {
        if (status === google.maps.GeocoderStatus.OK) {
          if (results[1]) {
            // console.log(results[1]);
            callback(results[1].formatted_address);
          } else {
            alert('No results found');
            return false;
          }
        } else {
          alert('Geocoder failed due to: ' + status);
          return false;
        }
      }
    );

    return address;
  }
}

// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from 'stimulus';
let markers = [];

export default class extends Controller {
  static targets = ['field', 'map', 'latitude', 'longitude'];

  connect() {
    if (typeof google != 'undefined') {
      this.initializeMap();
    }
  }

  initializeMap() {
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(39.5, -98.35),
      zoom: 17,
    });

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        let initialLocation = new google.maps.LatLng(
          position.coords.latitude,
          position.coords.longitude
        );

        this.map.setCenter(initialLocation);
        let marker = new google.maps.Marker({
          map: this.map,
          position: {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          },
        });
        marker.setVisible(true);
        markers = [...markers, marker];
      });
    }

    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    this.autocomplete.bindTo('bounds', this.map);
    this.autocomplete.setFields([
      'address_components',
      'icon',
      'geometry',
      'name',
    ]);

    this.autocomplete.addListener(
      'place_changed',
      this.placeChanged.bind(this)
    );
  }

  placeChanged() {
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
      (placeId) => {
        this.getPlacesInfo(
          place.geometry.location.lat(),
          place.geometry.location.lng(),
          placeId,
          this.map
        );
      }
    );
  }

  preventSubmit(e) {
    if (e.key == 'Enter') {
      e.preventDefault();
    }
  }

  getPlacesInfo(lat, lng, id, map) {
    var request = {
      location: new google.maps.LatLng(lat, lng),
      radius: '5000',
      keyword: ['pet friendly'],
      type: 'cafe',
    };

    var service = new google.maps.places.PlacesService(map);

    service.textSearch(request, function (places, status) {
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
        });
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
            console.log(results[1]);
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

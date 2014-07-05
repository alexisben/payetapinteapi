# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->

  lat = $('#map-canvas').data 'lat'
  lng = $('#map-canvas').data 'lng'
  myLatLng = new google.maps.LatLng(lat, lng)

  initialize = () ->
    mapOptions =
      zoom: 15
      center: myLatLng
      mapTypeId: google.maps.MapTypeId.ROADMAP
      panControl: false
      zoomControl: false
      mapTypeControl: false
      scaleControl: false
      streetViewControl: false
      overviewMapControl: false
      rotateControl: false
      zoomControlOptions: false
      scaleControlOptions: false
      styles: [{
        "featureType": "poi",
        "stylers": [{ "visibility": "off" }]
      }]

    map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions)

    marker = new google.maps.Marker
      map: map
      position: myLatLng
      animation: google.maps.Animation.DROP
      icon : new google.maps.MarkerImage( 'http://payetapinte.fr/assets/img/icons/marker.png', null,  null, null, new google.maps.Size(34, 44))

  $ ->
    initialize()
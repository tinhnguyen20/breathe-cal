// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

function initAutocomplete() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {
      lat: 37.8716,
      lng: -122.2727
    },
    zoom: 13,
    mapTypeId: 'roadmap'
  });
  var geocoder = new google.maps.Geocoder();
  
  google.maps.event.addDomListener(window, "resize", function() {
   var center = map.getCenter();
   google.maps.event.trigger(map, "resize");
   map.setCenter(center); 
  });
  
  $('#left-col').css('height', (window.innerHeight - 15 - 35).toString());
  $('#right-col').css('height', (window.innerHeight - 15 - 35).toString());
  $('#detail-box').css('height', (window.innerHeight - 15 - 185 - 35).toString());
  $('#detail-box-mask').css('height', (window.innerHeight - 15 - 185 - 35).toString());
  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      // $("#city-name").text(JSON.stringify(place.geometry.location))
      // console.log(place);
      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "city_data",
        data: JSON.stringify({geo: place.geometry.location, name: place.name}),
        success: function(data){
          $("#city-info").text(JSON.stringify(data));
          console.log("hello");
          // console.log(JSON.stringify(data));
        }
        
      });
      
      
      // $.getJSON("MYURL.json", function(){
      //   $("do some stuff here")
      // });
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      }
      else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
  
  var canMark = false;
  var markerCount = 0;
  
  var fetchedMarkers = []
  
  $("#breathe").click(function(){
    var bounds = map.getBounds();
    var NECorner = bounds.getNorthEast();
    var SWCorner = bounds.getSouthWest();
    $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: "markers",
      data: JSON.stringify({uplat:NECorner.lat(),downlat:SWCorner.lat(),rightlong:NECorner.lng(),leftlong:SWCorner.lng()}),
      success: function(data){
        fetchedMarkers.push(1)
        console.log(data)
      },
      dataType: "json"
    })
  
  })
  
  
  $("#marker-cta").click(function(){
    canMark = true;
    $("#somegarbage").show();
  })
  
  $("#marker-cancel").click(function(){
    canMark = false;
    markerCount = 0;
    for(i=0;i<uncommittedMarkers.length;i++){
      uncommittedMarkers[i].setMap(null);
    }
    uncommittedMarkers = [];
    
    $("#somegarbage").hide()
  })
  var markers = [];
  var uncommittedMarkers = [];
  
  google.maps.event.addListener(map, 'click', function(event) {
    if (markerCount < 1 && canMark){
      placeMarker(event.latLng);  
      markerCount+=1;
    }
  })
  
  // thats pretty coooool
  
  $("#marker-submit").click(function(){
    canMark = false;
    markerCount = 0;
    for(i=0;i<uncommittedMarkers.length;i++){
      
      markers.push(uncommittedMarkers[i]);
      markers[i].draggable = false;

      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "markers",
        data: JSON.stringify({marker: {lat: markers[i].position.lat(), 
        lng:markers[i].position.lng(),
        cat: true, dog: true, mold: true}}),
        success: function(data){
          console.log("successful save?")
        }
        // basically grab the data from XYZ. and yea. 
        // post to the marker?? 
      })

    }
    uncommittedMarkers = [];
    // on submit, check XYZ
    //

    $("#somegarbage").hide();
    
  })
  
  
  function placeMarker(location) {
    var marker = new google.maps.Marker({
      position: location,
      map: map,
      draggable: true,
      title: "test",
    })
    uncommittedMarkers.push(marker)
  }
  
}

$(document).ready(initAutocomplete);
$(document).on('page:load', initAutocomplete);
$(document).on('page:change', initAutocomplete);


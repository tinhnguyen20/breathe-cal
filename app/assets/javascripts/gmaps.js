// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
var fetchedMarkers = [];

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
  
  var markers = [];
  var uncommittedMarker;
  
  
  // allow user to put down a marker
  $("#marker-cta").click(function(){
    canMark = true;
  })

  google.maps.event.addListener(map, 'click', function(event) {
    if (canMark){
      placeMarker(event.latLng);  
      canMark = false;
    }
  })
  
  var recentMarker;
  
  function placeMarker(location) {
    var marker = new google.maps.Marker({
      position: location,
      map: map,
      draggable: true,
      title: "test",
      custom: "cat",
      custom2: "dog"
      
    })
    uncommittedMarker = marker;
    
    var contentString = $(
      "<form id='markerForm' action='markers' method='POST'>"+
      "<input type = 'checkbox' name='cat' value='true'> Cats Here <br>"+
      "<input type = 'checkbox' name='dog' value='true'> Dogs Here <br>"+
      "<input type = 'checkbox' name='mold' value='true'> Mold Here <br>"+
      "<input type='submit' value='Submit'>"+
      "</form>"
    );
    
    var infowindow = new google.maps.InfoWindow();
    infowindow.open(map,marker);
    infowindow.setContent(contentString[0]);
    marker.infowindow = infowindow;
    google.maps.event.addListener(marker, 'click', function(){
      marker.infowindow.open(map,marker);
    });
    
    recentMarker = marker;
    
    $(document).on('submit', '#markerForm', function(e){
      e.preventDefault();
      infowindow.close();
      var postData = $(this).serializeArray();
      postData.push({name: "lat", value: location.lat()});
      postData.push({name: "lng", value: location.lng()});
      var convData = {};
      $(postData).each(function(idnex,obj){
        convData[obj.name] = obj.value;
      })
      
      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "markers",
        data: JSON.stringify({marker: convData}),
        success: function(d){
          
          var newContent = $("<div>"+
                              "cat " + d.cat + 
                              "<br> dog " + d.dog +
                              "<br> mold " + d.mold + "</div>");
          // marker.infowindow = new google.maps.InfoWindow();
          // marker.infowindow.setContent(newContent[0]);
          recentMarker.infowindow.setContent(newContent[0]);
          recentMarker.infowindow.open(map,recentMarker);
          recentMarker.draggable = false;
          // get back the marker info. rebind the infowindow for this marker?
        }
      })
      return false;
    });
  }
  
  $("#breathe").unbind('click').bind('click', function(){
    var bounds = map.getBounds();
    var NECorner = bounds.getNorthEast();
    var SWCorner = bounds.getSouthWest();
    $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: "markers",
      data: {bounds :{uplat:NECorner.lat(),downlat:SWCorner.lat(),rightlong:NECorner.lng(),leftlong:SWCorner.lng()}},
      success: function(data){
        for(i=0;i<data.length; i++){
          var location = {};
          location.lat = parseFloat(data[i].lat);
          location.lng = parseFloat(data[i].lng);
          var marker = new google.maps.Marker({
                position: location,
                map: map,
                draggable: false,
                title: "test",
                custom: "cat",
                custom2: "dog"
                });
          var newContent = $("<div>"+
                    "cat " + data[i].cat + 
                    "<br> dog " + data[i].dog +
                    "<br> mold " + data[i].mold + "</div>");
          marker.info = new google.maps.InfoWindow();
          marker.info.setContent(newContent[0]);
          google.maps.event.addListener(marker, 'click', function(){
            this.info.open(map, this);
          });
        }

        
      }
    })
  
  })

  
  

  
}

$(document).ready(initAutocomplete);
$(document).on('page:load', initAutocomplete);
$(document).on('page:change', initAutocomplete);


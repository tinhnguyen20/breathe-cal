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


  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();


    if (places.length === 0) {
      return;
    }


    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];


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


      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "city_data",
        data: JSON.stringify({geo: place.geometry.location, name: place.name}),
        success: function(data){
          $("#city-info").text(JSON.stringify(data));
          console.log("hello");
        }
        
      });
      
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));


      if (place.geometry.viewport) {
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
  
  function createContentString(data){
    var title = data.title;
    var attributes = ["cat", "bee", "perfume", "oak", "peanut", "gluten", "dog", "dust", "smoke", "mold"];
    var contentString ="<div>";
    contentString += "Allergens at " + title + "<br>";
    for(var i=0; i<attributes.length; i++){
      if (data[attributes[i]]){
        contentString += attributes[i] + "<br>";  
      }
    }
    contentString += "</div>"
    var content = $(contentString);
    return content
  }
  
  function placeMarker(location) {
    var marker = new google.maps.Marker({
      position: location,
      map: map,
      draggable: true,
    })
    uncommittedMarker = marker;
    
    var contentString = $(
      "<form id='markerForm' action='markers' method='POST'>"+
      "Area Description <br> <input type='text' name='description'> <br>" + 
      "<input type = 'checkbox' name='cat' value='true'> Cats <br>"+
      "<input type = 'checkbox' name='bee' value='true'> Bees <br>"+
      "<input type = 'checkbox' name='perfume' value='true'> Perfume <br>"+
      "<input type = 'checkbox' name='oak' value='true'> Oak <br>"+
      "<input type = 'checkbox' name='peanut' value='true'> Peanut <br>"+
      "<input type = 'checkbox' name='gluten' value='true'> Gluten <br>"+
      "<input type = 'checkbox' name='dog' value='true'> Dogs <br>"+
      "<input type = 'checkbox' name='dust' value='true'> Dust <br>"+
      "<input type = 'checkbox' name='smoke' value='true'> Smoke <br>"+
      "<input type = 'checkbox' name='mold' value='true'> Mold <br>"+
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
          var newContent = createContentString(d);
          // var newContent = $("<div>"+
          //                     "cat " + d.cat + 
          //                     "<br> dog " + d.dog +
          //                     "<br> mold " + d.mold + "</div>");
          recentMarker.infowindow.setContent(newContent[0]);
          recentMarker.infowindow.open(map,recentMarker);
          recentMarker.draggable = false;
        }
      })
      return false;
    });
  }
  
  // maybe just send a list of attributes to tell javascript to use....? 
  
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
        for(var i=0;i<data.length; i++){
          var location = {};
          location.lat = parseFloat(data[i].lat);
          location.lng = parseFloat(data[i].lng);
          var marker = new google.maps.Marker({
                position: location,
                map: map,
                draggable: false,
                });
          var newContent = createContentString(data[i]);      
          // var newContent = $("<div>"+
          //           "cat " + data[i].cat + 
          //           "<br> dog " + data[i].dog +
          //           "<br> mold " + data[i].mold + "</div>");
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







<!DOCTYPE html>
<html>
  <head>
    <title>Travel Modes in Directions</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcTm3Gm9yOVdpHtvAXtJ9ZUhosp1m-Osc&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: "Roboto", "sans-serif";
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
    <script>
      (function(exports) {
        "use strict";

        function initMap() {
          var directionsRenderer = new google.maps.DirectionsRenderer();
          var directionsService = new google.maps.DirectionsService();
          var map = new google.maps.Map(document.getElementById("map"), {
            zoom: 14,
            center: {
              lat: 37.77,
              lng: -122.447
            }
          });
          directionsRenderer.setMap(map);
          calculateAndDisplayRoute(directionsService, directionsRenderer);
          document
            .getElementById("mode")
            .addEventListener("change", function() {
              calculateAndDisplayRoute(directionsService, directionsRenderer);
            });
        }

        function calculateAndDisplayRoute(
          directionsService,
          directionsRenderer
        ) {
          var selectedMode = document.getElementById("mode").value;
          directionsService.route(
            {
              origin: {
                lat: 37.77,
                lng: -122.447
              },
              // Haight.
              destination: {
                lat: 37.768,
                lng: -122.511
              },
              // Ocean Beach.
              // Note that Javascript allows us to access the constant
              // using square brackets and a string value as its
              // "property."
              travelMode: google.maps.TravelMode[selectedMode]
            },
            function(response, status) {
              if (status == "OK") {
                directionsRenderer.setDirections(response);
              } else {
                window.alert("Directions request failed due to " + status);
              }
            }
          );
        }

        exports.calculateAndDisplayRoute = calculateAndDisplayRoute;
        exports.initMap = initMap;
      })((this.window = this.window || {}));
    </script>
  </head>
  <body>
    <div id="floating-panel">
      <b>Mode of Travel: </b>
      <select id="mode">
        <option value="DRIVING">Driving</option>
        <option value="WALKING">Walking</option>
        <option value="BICYCLING">Bicycling</option>
        <option value="TRANSIT">Transit</option>
      </select>
    </div>
    <div id="map"></div>
  </body>
</html>
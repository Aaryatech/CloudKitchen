<!DOCTYPE html>
<html>
<head>
<title>Directions Service (Complex)</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A"></script>

<style type="text/css">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
html, body, #map-canvas {
	height: 100%;
	width: 100%;
	margin: 0px;
	padding: 0px
}
</style>
<script>
	function mapLocation() {
		var directionsDisplay;
		var directionsService = new google.maps.DirectionsService();
		var map;

		function initialize() {
			directionsDisplay = new google.maps.DirectionsRenderer();
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(p) {
					var LatLng = new google.maps.LatLng(p.coords.latitude,
							p.coords.longitude);

					var chicago = new google.maps.LatLng(p.coords.latitude,
							p.coords.longitude);
					var mapOptions = {
						zoom : 7,
						center : chicago
					};
					map = new google.maps.Map(document
							.getElementById('map-canvas'), mapOptions);
					directionsDisplay.setMap(map);
					google.maps.event.addDomListener(document
							.getElementById('routebtn'), 'click', calcRoute);
				});
			} else {
				alert('Geo Location feature is not supported in this browser.');
			}
		}

		function calcRoute() {
			var start = new google.maps.LatLng(20.0116769, 73.7968206);
			//var end = new google.maps.LatLng(38.334818, -181.884886);
			var end = new google.maps.LatLng(20.0011423, 73.78327);
			var request = {
				origin : start,
				destination : end,
				travelMode : google.maps.TravelMode.DRIVING
			};
			directionsService
					.route(request,
							function(response, status) {
								if (status == google.maps.DirectionsStatus.OK) {
									directionsDisplay.setDirections(response);
									directionsDisplay.setMap(map);
								} else {
									alert("Directions Request from "
											+ start.toUrlValue(6) + " to "
											+ end.toUrlValue(6) + " failed: "
											+ status);
								}
							});
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	}
	mapLocation();
</script>
</head>
<body>
	<input type="button" id="routebtn" value="route" />
	<div id="map-canvas"></div>
</body>
</html>
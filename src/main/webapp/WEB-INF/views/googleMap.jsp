<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style type="text/css">
body {
	font-family: Arial;
	font-size: 10pt;
}
</style>
</head>
<body>

	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&libraries=places">
		
	</script>
	<script type="text/javascript">
		google.maps.event.addDomListener(window, 'load', function() {
			var places = new google.maps.places.Autocomplete(document
					.getElementById('txtPlaces'));
			google.maps.event.addListener(places, 'place_changed', function() {
				var place = places.getPlace();
				var address = place.formatted_address;
				var latitude = place.geometry.location.lat();
				var longitude = place.geometry.location.lng();
				var mesg = "Address: " + address;
				mesg += "\nLatitude: " + latitude;
				mesg += "\nLongitude: " + longitude;

				document.getElementById("display").innerHTML = mesg;

				distance(latitude, longitude, 20.0073753, 73.7673653, 'K');
			});
		});

		function distance(lat1, lon1, lat2, lon2, unit) {
			if ((lat1 == lat2) && (lon1 == lon2)) {
				return 0;
			} else {
				var radlat1 = Math.PI * lat1 / 180;
				var radlat2 = Math.PI * lat2 / 180;
				var theta = lon1 - lon2;
				var radtheta = Math.PI * theta / 180;
				var dist = Math.sin(radlat1) * Math.sin(radlat2)
						+ Math.cos(radlat1) * Math.cos(radlat2)
						* Math.cos(radtheta);
				if (dist > 1) {
					dist = 1;
				}
				dist = Math.acos(dist);
				dist = dist * 180 / Math.PI;
				dist = dist * 60 * 1.1515;
				if (unit == "K") {
					dist = dist * 1.609344
				}
				if (unit == "N") {
					dist = dist * 0.8684
				}
				document.getElementById("distance").innerHTML = dist.toFixed(2);
			}
		}
	</script>
	<span>Location:</span>
	<input type="text" id="txtPlaces" style="width: 250px"
		placeholder="Enter a location" />

	<div id="display"></div>
	<div id="distance"></div>
</body>
</html>
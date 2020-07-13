
<!DOCTYPE html>
<html>
<body>

	<h1>My First Google Map</h1>

	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4944.55328848016!2d72.81545531489864!3d18.914606687180793!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7d1d2659eb285%3A0xc2c90000ec7ef672!2sSPD+RUSA+Maharashtra!5e1!3m2!1sen!2sin!4v1559551333875!5m2!1sen!2sin"
		class="map" width="100%" height="540" frameborder="0"
		style="border: 0" allowfullscreen></iframe>

	<script>
		function myMap() {
			var mapProp = {
				center : new google.maps.LatLng(51.508742, -0.120850),
				zoom : 5,
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);
		}
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMnghBOYIGTz_a3pX4KFU81ChVkxQqKfU&callback=myMap"></script>

</body>
</html>
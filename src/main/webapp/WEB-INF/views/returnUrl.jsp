<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>

<!-- If you enabled Analytics in your project, add the Firebase SDK for Analytics -->
<script
	src="https://www.gstatic.com/firebasejs/7.15.5/firebase-analytics.js"></script>

<!-- Add Firebase products that you want to use -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js"></script>
<!--    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-firestore.js"></script>
-->
<script
	src="https://www.gstatic.com/firebasejs/7.15.5/firebase-database.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"
	type="text/javascript"></script>
<style type="text/css">
.loader {
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.50);
	left: 0;
	top: 0;
	z-index: 999999;
}

.loader img {
	position: absolute;
	left: 45%;
	top: 35%;
}
</style>
<body>

	<div class="loader" id="loaderimg">
		<img
			src="${pageContext.request.contextPath}/resources/assets/img/svg/loader.svg"
			alt="">
	</div>


	<script>
		// Your web app's Firebase configuration
		var firebaseConfig = {
			apiKey : "AIzaSyBe2YU3P7ehVwd-WSKNSbpRCUbjOYAjVpw",
			authDomain : "firbase-1fba8.firebaseapp.com",
			databaseURL : "https://firbase-1fba8.firebaseio.com",
			projectId : "firbase-1fba8",
			storageBucket : "firbase-1fba8.appspot.com",
			messagingSenderId : "188159878978",
			appId : "1:188159878978:web:77d2e57846f034d0b0cadb",
			measurementId : "G-859DV2EL3H"
		};
		// Initialize Firebase
		firebase.initializeApp(firebaseConfig);
		firebase.analytics();
		//firebase.database.Reference
		//var database = firebase.database();
		const messaging = firebase.messaging();
		var today_date_temp = 't_order';
		const dbrefObject = firebase.database().ref(today_date_temp);
		var db = firebase.database();
		var status = '${status}';
		var orderId = '${orderId}';
		var paid = '${paid}';

		/* alert(status)
		alert(paid)
		alert(orderId) */
		/* db.ref(today_date_temp + "/" + orderId + "/status").set(status);
		db.ref(today_date_temp + "/" + orderId + "/paymentStatus").set(paid);

		setTimeout(function() {
			window.location.replace("https://madhvi.in/");
		}, 5000); */
	</script>
</body>
</html>
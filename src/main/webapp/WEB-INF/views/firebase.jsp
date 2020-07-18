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

	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
	<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>

	<!-- If you enabled Analytics in your project, add the Firebase SDK for Analytics -->
	<script
		src="https://www.gstatic.com/firebasejs/7.15.5/firebase-analytics.js"></script>

	<!-- Add Firebase products that you want to use -->
	<script
		src="https://www.gstatic.com/firebasejs/7.15.5/firebase-auth.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js"></script>
	<!--    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-firestore.js"></script>
-->
	<script
		src="https://www.gstatic.com/firebasejs/7.15.5/firebase-database.js"></script>

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
		const dbrefObject_adminsingle = firebase.database().ref(
				today_date_temp + "-adminsingle");
		/* messaging
				.usePublicVapidKey('BCMRT4wtRInQjue7hAjVwcgdqcbfTF8cwYQk7qimWOBJqwNZNijKKj8Ev53TqiIX0yoDPGBFBk7ROkXQL_ti8z0'); */
	</script>
	<script type="text/javascript">
		function additem() {

			var data_add = {
				"date_added" : "2020-07-20",
				"from_id" : 1,
				"from_user_name" : "akshay kasar",
				"to_id" : '0',
				"chat_message" : "hiiii",
				"item" : "item_detail"

			}

			var key = firebase.database().ref().child(today_date_temp).push(
					data_add).key;
			console.log('key. ', key);
		}

		function deleteitem() {

			/* var data_add = {
				"date_added" : "2020-07-20",
				"from_id" : 1,
				"from_user_name" : "Anmol",
				"to_id" : '0',
				"chat_message" : "hiiii",
				"item" : "item_detail"

			}

			var updates = {};
			updates["/t_order/" + "MCRzizxFLn1va4dbMJK"] = data_add;
			firebase.database().ref().update(updates); */
			firebase.database().ref().child(today_date_temp).remove();
		}

		//add event
		dbrefObject.on('child_added', function(snapshot) {
			console.log('child_added. ', snapshot.val());

		});
		//change event
		dbrefObject.on('child_changed', function(snapshot) {
			console.log('child_changed. ', snapshot.val());

		});
		//reove event
		dbrefObject.on('child_removed', function(snapshot) {
			console.log('child_removed	. ', snapshot.val());
		});
		// show all data on each event
		/* dbrefObject.on('value', function(snapshot) {
			//console.log('Message received. ', snapshot.val());
			snapshot.forEach(function(childSnapshot) {
				var childKey = childSnapshot.key;
				var childData = childSnapshot.val();
				console.log('childKey', childKey);
				console.log('childData', childData.chat_message);
			});
		}); */
	</script>
	<a href="#" class="detail_btn_round" title="Delete" onclick="additem()"><i
		class="fa fa-times" aria-hidden="true"></i> add item</a>
	<a href="#" class="detail_btn_round" title="Delete"
		onclick="deleteitem()"><i class="fa fa-times" aria-hidden="true"></i>
		Delete</a>
	<div id="group_chat_history"></div>
</body>
</html>
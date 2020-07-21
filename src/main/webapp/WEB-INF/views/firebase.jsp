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
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="single_row">
		<div class="pop_frm_one">
			<span>Delivery Address *</span>
			<textarea name="myInput1" id="myInput1" type="text" class="frm_inpt"></textarea>
		</div>
	</div>
	<a href="#" title="Delete" onclick="additem()"> add item</a>

	<a href="#" title="Delete" onclick="updateitem()"> Update</a>
	<div class="component">
		<table class="overflow-y" id="printtable3">
			<thead>
				<tr>
					<th class="sorting_desc">Msg</th>
					<th class="sorting_desc">Action</th>
				</tr>
			</thead>
			<tbody>


			</tbody>
		</table>


	</div>

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

		/* messaging
				.usePublicVapidKey('BCMRT4wtRInQjue7hAjVwcgdqcbfTF8cwYQk7qimWOBJqwNZNijKKj8Ev53TqiIX0yoDPGBFBk7ROkXQL_ti8z0'); */
	</script>
	<script type="text/javascript">
		function additem() {

			var txt = $('#myInput1').val();

			var data_add = {
				"date_added" : "2020-07-20",
				"from_id" : 1,
				"from_user_name" : "akshay kasar",
				"chat_message" : txt
			}

			var key = firebase.database().ref().child(today_date_temp).push(
					data_add).key;
			console.log('key. ', key);

			sendNotification();

		}

		function deleteitem(key) {

			var fdb = firebase.database().ref();
			if (confirm('Are you sure?')) {
				firebase.database().ref('t_order/' + key + '/') // create a reference to the driver
				.remove();
				sendNotification();
			}

		}

		function updateitem(key) {
			var txt = $('#myInput1').val();
			var db = firebase.database();
			db.ref("t_order/" + key + "/chat_message").set(txt);
			sendNotification();
		}
		function sendNotification() {
			var fd = new FormData();
			$.ajax({
				url : '${pageContext.request.contextPath}/sendNotification',
				type : 'post',
				dataType : 'json',
				data : fd,
				contentType : false,
				processData : false,
				success : function(response) {

				},
			});

		}
		//add event
		/* dbrefObject.on('child_added', function(snapshot) {
			console.log('child_added. ', snapshot.val());

		});
		//change event
		dbrefObject.on('child_changed', function(snapshot) {
			console.log('child_changed. ', snapshot.val());

		});
		//reove event
		dbrefObject.on('child_removed', function(snapshot) {
			console.log('child_removed	. ', snapshot.val());
		}); */
		// show all data on each event
		dbrefObject
				.on(
						'value',
						function(snapshot) {
							//console.log('Message received. ', snapshot.val());
							$("#printtable3 tbody").empty();
							snapshot
									.forEach(function(childSnapshot) {
										var childKey = childSnapshot.key;
										var childData = childSnapshot.val();
										console.log('childKey', childKey);
										console.log('childData',
												childData.chat_message);

										var tr_data = '<tr  id="'+childKey+'"> <td class="user-name"  >'
												+ childData.chat_message
												+ '</td> <td class="user-name"><a href="#" title="Delete" onclick="deleteitem(\''
												+ childKey
												+ '\')"> Delete</a><a href="#" title="Delete" onclick="updateitem(\''
												+ childKey
												+ '\')"> Update</a></td>   </tr>';
										$('#printtable3').append(tr_data);
										/* var audio = new Audio(
												'https://notificationsounds.com/notification-sounds/for-sure-576/download/mp3');
										audio.play(); */
									});
						});

		messaging
				.onMessage(function(payload) {

					const notificationTitle = payload.data.title;
					const notificationOptions = {
						body : payload.data.body,
						icon : payload.data.icon,
					};

					if (!("Notification" in window)) {
						console
								.log("This browser does not support system notifications.");
					} else if (Notification.permission === "granted") {
						// If it's okay let's create a notification
						var notification = new Notification(notificationTitle,
								notificationOptions);
						notification.onclick = function(event) {
							event.preventDefault();
							window.open(payload.data.click_action, '_blank');
							notification.close();
						}
					}

				});
	</script>

</body>
</html>
<!DOCTYPE html>
<!--
Copyright (c) 2016 Google Inc.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<html>
<head>
<meta charset=utf-8 />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Firebase Cloud Messaging Example</title>

<!-- Material Design Theming -->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>

<link rel="manifest"
	href="${pageContext.request.contextPath}/resources/assets/js/manifest.json">
<style type="text/css">
html, body {
	font-family: 'Roboto', 'Helvetica', sans-serif;
}

a {
	text-decoration: none;
}

li a {
	text-decoration: underline;
	color: #0288d1;
}

.mdl-grid {
	max-width: 1024px;
	margin: auto;
}

.mdl-layout__header-row {
	padding: 0;
}

.quickstart-user-details-container {
	margin-top: 20px;
	line-height: 25px;
}

#quickstart-sign-in-status {
	font-weight: bold;
}

pre {
	overflow-x: scroll;
	line-height: 18px;
}

code {
	white-space: pre-wrap;
	word-break: break-all;
}

h3 {
	background-size: 40px;
	padding-left: 50px;
	color: white;
}
</style>
</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<!-- Header section containing title -->
		<header
			class="mdl-layout__header mdl-color-text--white mdl-color--light-blue-700">
			<div
				class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-grid">
				<div
					class="mdl-layout__header-row mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--8-col-desktop">
					<h3>Firebase Cloud Messaging</h3>
				</div>
			</div>
		</header>

		<main class="mdl-layout__content mdl-color--grey-100">
		<div
			class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-grid">

			<!-- Container for the Table of content -->
			<div
				class="mdl-card mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-desktop">
				<div class="mdl-card__supporting-text mdl-color-text--grey-600">
					<!-- div to display the generated Instance ID token -->
					<div id="token_div" style="display: none;">
						<h4>Instance ID Token</h4>
						<p id="token" style="word-break: break-all;"></p>
						<button
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							onclick="deleteToken()">Delete Token</button>
					</div>
					<!-- div to display the UI to allow the request for permission to
               notify the user. This is shown if the app has not yet been
               granted permission to notify. -->
					<div id="permission_div" style="display: none;">
						<h4>Needs Permission</h4>
						<p id="token"></p>
						<button
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							onclick="requestPermission()">Request Permission</button>
					</div>
					<!-- div to display messages received by this app. -->
					<div id="messages"></div>
				</div>
			</div>

		</div>
		</main>
	</div>

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
	<script
		src="https://www.gstatic.com/firebasejs/7.15.5/firebase-firestore.js"></script>

	<script
		src="https://www.gstatic.com/firebasejs/7.15.5/firebase-database.js"></script>

	<script>
	 
  // [START get_messaging_object]
  // Retrieve Firebase Messaging object.
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
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();
  // [END get_messaging_object]
  // [START set_public_vapid_key]
  // Add the public key generated from the console here.
  messaging.usePublicVapidKey('BCMRT4wtRInQjue7hAjVwcgdqcbfTF8cwYQk7qimWOBJqwNZNijKKj8Ev53TqiIX0yoDPGBFBk7ROkXQL_ti8z0');
  // [END set_public_vapid_key]
  
 Notification.requestPermission().then(function(permission) {
   $("#ispermission").val(permission);  
   console.log('permiss', permission)});
  
// Get Instance ID token. Initially this makes a network call, once retrieved
// subsequent calls to getToken will return from cache.
messaging.onTokenRefresh(function() {
   messaging.getToken().then(function(refreshedToken) {
       $("#fcmtokenid").val(refreshedToken);
       console.log('Token refreshed.');
       setTokenSentToServer(false);
       // Send Instance ID token to app server.
       sendTokenToServer(refreshedToken);
   }).catch(function(err) {
       console.log('Unable to retrieve refreshed token ', err);
   });
});

messaging.onMessage(function(payload) {
   console.log("payload Message received. ", payload);
   fcmFgUI(payload);
});

function initToken() {
   messaging.getToken().then(function(currentToken) {
       $("#fcmtokenid").val(currentToken);
       console.log("currentToken. ", currentToken);
       if (currentToken) {
           sendTokenToServer(currentToken);
       } else {
           console.log('No Instance ID token available. Request permission to generate one.');
           permissionRequiredUI();
           setTokenSentToServer(false);
       }
   }).catch(function(err) {
       console.log('An error occurred while retrieving token. ', err);
       setTokenSentToServer(false);
   });
}

function sendTokenToServer(currentToken) {
   if (!isTokenSentToServer()) {
       console.log('Sending token to server...');
       // TODO(developer): Send the current token to your server.
       // get old token
       // api del old token
       // api metch
       setTokenSentToServer(true);
       // senf topic api to app server
       subTopic();
   } else {
       console.log('Token already sent to server so won\'t send it again unless it changes');
   }
}

function requestPermission() {
   console.log('Requesting permission...');
   messaging.requestPermission().then(function() {
       initToken();
   }).catch(function(err) {
       console.log('Unable to get permission to notify.', err);
   });
}

function deleteToken() {
   messaging.getToken().then(function(currentToken) {
       messaging.deleteToken(currentToken).then(function() {
           console.log('Token deleted.');
           setTokenSentToServer(false);
           initToken();
       }).catch(function(err) {
           console.log('Unable to delete token. ', err);
       });
   }).catch(function(err) {
       console.log('Error retrieving Instance ID token. ', err);
   });
}


function fcmFgUI(payload) {
   
   messaging.onMessage((payload) => {
 
 var title = payload.data.title;
 
 var options = { 
   body : payload.data.body,
   icon : payload.data.icon,
   image : payload.data.image,
   click_action : payload.data.click_action,
     };
 var myNotification = new Notification(title,options);

 console.log('Message received. ', payload);
});
}

function subTopic() {
   // TODO
}

function permissionRequiredUI() {
   // TODO
}

function isTokenSentToServer() {
   if (window.localStorage.getItem('sentToServer') == 1) {
       return true;
   }
   return false;
}

function setTokenSentToServer(sent) {
   if (sent) {
       window.localStorage.setItem('sentToServer', 1);
   } else {
   window.localStorage.setItem('sentToServer', 0);
   }
}
initToken();
</script>
</body>
</html>
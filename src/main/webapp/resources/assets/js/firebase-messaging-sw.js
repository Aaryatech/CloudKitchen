// Give the service worker access to Firebase Messaging.
// Note that you can only use Firebase Messaging here, other Firebase libraries
// are not available in the service worker.
importScripts('https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js');

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
// Retrieve Firebase Messaging object.
const messaging = firebase.messaging();

/*
 * messaging.setBackgroundMessageHandler(function(payload) {
 * console.log('[firebase-messaging-sw.js] Received background message ',
 * payload);
 * 
 * var title = payload.data.title;
 * 
 * var options = { body : payload.data.body, icon : payload.data.icon, image :
 * payload.data.image, click_action : payload.data.click_action, }; return
 * self.registration.showNotification(title, options); });
 */

messaging
		.setBackgroundMessageHandler(function(payload) {
			console.log('tomcatyy action', payload);

			const notificationTitle = payload.data.title;
			const notificationOptions = {
				body : payload.data.body,
				icon : payload.data.icon,
				sound : 'https://notificationsounds.com/notification-sounds/for-sure-576/download/mp3',
				tag : payload.data.click_action
			};

			return self.registration.showNotification(notificationTitle,
					notificationOptions);
		});
self.addEventListener('notificationclick', function(e) {
	var notification = e.notification;
	console.log('notification', notification);
	var action = notification.tag;
	if (action === 'close') {
		notification.close();
	} else {
		clients.openWindow(action);
		notification.close();
	}
});

/*
 * 'use strict';
 * 
 * self.addEventListener('push', function(event) { console.log('Received a push
 * message', event);
 * 
 * var title = 'Yay a message.'; var body = 'We have received a push message.';
 * var icon = '/images/icon-192x192.png'; var tag =
 * 'simple-push-demo-notification-tag';
 * 
 * event.waitUntil( self.registration.showNotification(title, { body: body,
 * icon: icon, tag: tag }) ); });
 */

/*
 * self.addEventListener('notificationclick', function(event) { console.log('On
 * notification click: ', event.notification.tag); // Android doesn’t close the
 * notification when you click on it // See: http://crbug.com/463146
 * event.notification.close(); // This looks to see if the current is already
 * open and // focuses if it is event.waitUntil(clients.matchAll({ type:
 * 'window' }).then(function(clientList) { for (var i = 0; i <
 * clientList.length; i++) { var client = clientList[i]; if (client.url === '/' &&
 * 'focus' in client) { return client.focus(); } } if (clients.openWindow) {
 * return clients.openWindow('/'); } })); });
 */
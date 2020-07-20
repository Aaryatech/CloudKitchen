
<!DOCTYPE html>
<html>
<head>
<title>Firebase File Upload</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
</head>
<body>
	<div>
		Upload Files<br /> <input type="file" id="files" multiple /><br />
		<br />
		<button id="send">Upload</button>
		<button id="send1" onclick="getFileUrl()">Download</button>
		<button id="send1" onclick="deletefile()">Delete</button>
		<p id="uploading"></p>
		<progress value="0" max="100" id="progress"></progress>
		<img height="125" width="150" />
	</div>

	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-app.js"></script>

	<!-- TODO: Add SDKs for Firebase products that you want to use -->
	<script
		src="https://www.gstatic.com/firebasejs/7.13.1/firebase-storage.js"></script>

	<script>
// Your web app's Firebase configuration
var firebaseConfig = {
		apiKey : "AIzaSyBe2YU3P7ehVwd-WSKNSbpRCUbjOYAjVpw",
		authDomain : "firbase-1fba8.firebaseapp.com",
		databaseURL : "https://firbase-1fba8.firebaseio.com",
		projectId : "firbase-1fba8",
		storageBucket : "firbase-1fba8.appspot.com",
		messagingSenderId : "188159878978",
		appId : "1:188159878978:web:77d2e57846f034d0b0cadb"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
</script>

	<script>
var files = [];
document.getElementById("files").addEventListener("change", function(e) {
  files = e.target.files;
  for (let i = 0; i < files.length; i++) {
    console.log(files[i]);
  }
});

document.getElementById("send").addEventListener("click", function() {
  //checks if files are selected
  if (files.length != 0) {
    //Loops through all the selected files
    for (let i = 0; i < files.length; i++) {
      //create a storage reference
      var storage = firebase.storage().ref(files[i].name);

      //upload file
      var upload = storage.put(files[i]);

      //update progress bar
      upload.on(
        "state_changed",
        function progress(snapshot) {
          var percentage =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          document.getElementById("progress").value = percentage;
        },

        function error() {
          alert("error uploading file");
        },

        function complete() {
          document.getElementById(
            "uploading"
          ).innerHTML += `${files[i].name} upoaded <br />`;
        }
      );
    }
  } else {
    alert("No file chosen");
  }
});

function getFileUrl() {
  //create a storage reference
  var storage = firebase.storage().ref('default-user.jpg');

  //get file url
  storage
    .getDownloadURL()
    .then(function(url) {
      console.log(url);
      document.querySelector('img').src = url;
    })
    .catch(function(error) {
      console.log("error encountered");
    });
}

function deletefile() {
	  //create a storage reference
	  var desertRef = firebase.storage().refFromURL('https://firebasestorage.googleapis.com/v0/b/firbase-1fba8.appspot.com/o/default-user.jpg?alt=media&token=b89f48ca-2619-4cd9-b517-e0a85cf97cb1')

// Delete the file
desertRef.delete().then(function() {
  // File deleted successfully
}).catch(function(error) {
  // Uh-oh, an error occurred!
});

	  document.getElementById(
	            "uploading"
	          ).innerHTML += 'Deleted<br />';
	}
</script>
</body>
</html>
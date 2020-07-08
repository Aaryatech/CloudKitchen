<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="keywords" content="#">
<meta name="description" content="#">
<title>Cloud Kitchen | Reset Password</title>
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="#">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="#">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="#">
<link rel="apple-touch-icon-precomposed" href="#">
<link rel="shortcut icon" href="#">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Fontawesome -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.css"
	rel="stylesheet">
<!-- Flaticons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/font/flaticon.css"
	rel="stylesheet">
<!-- Swiper Slider -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/swiper.min.css"
	rel="stylesheet">
<!-- Range Slider -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/ion.rangeSlider.min.css"
	rel="stylesheet">
<!-- magnific popup -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css"
	rel="stylesheet">
<!-- Nice Select -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/style.css"
	rel="stylesheet">
<!-- Custom Responsive -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/responsive.css"
	rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap"
	rel="stylesheet">
<!-- place -->
</head>

<body>
	<div class="inner-wrapper">
		<div class="container-fluid no-padding">
			<div class="row no-gutters overflow-auto">
				<div class="col-md-6">
					<div class="main-banner">
						<img
							src="${pageContext.request.contextPath}/resources/assets/img/login_pic.jpg"
							alt="" class="img-fluid full-width main-img" alt="banner">
						<!-- https://via.placeholder.com/952x646-->

						<img
							src="${pageContext.request.contextPath}/resources/assets/img/burger.png"
							alt="" class="footer-img" alt="footer-img">
						<!--https://via.placeholder.com/340x220-->
					</div>
				</div>
				<div class="col-md-6">
					<div class="section-2 user-page main-padding">
						<div class="login-sec">
							<div class="login-box">
								<form>
									<div class="form-group">
										<center>
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/logo.png"
												class="logo_pic" alt="">
										</center>
									</div>

									<h4 class="text-light-black fw-600">Reset Password</h4>
									<div class="row">
										<div class="col-12">
											<!-- <p class="text-light-black">Have a corporate username? <a href="add-restaurant.html">Click here</a>
                      </p> -->

											<div class="form-froup">
												<!-- <div class="info-msg"><i class="fa fa-info-circle"></i> This is an info message.</div> -->
												<!-- <div class="warning-msg"><i class="fa fa-warning"></i> This is a warning message.</div> -->
												<div class="success-msg">
													<i class="fa fa-check"></i> Reset Password Link Sent to
													your registered email - XXXXXXXXX@gmail.com
												</div>
												<div class="error-msg">
													<i class="fa fa-times-circle"></i> Entered email id /
													mobile no not registered with system. Please contact system
													administrator.
												</div>
											</div>

											<div class="form-group">
												<h4 class="welcone_pass">
													Welcome to, <span>Ansari Mohsin </span>
												</h4>
												<p class="text-light-white dont_worry">Don't worry, Well
													send the account details to your email Address.</p>
											</div>

											<div class="form-group">
												<label class="text-light-white fs-14">New Password</label> <input
													type="password" id="new-password" name="#"
													class="form-control form-control-submit"
													value="New Password" placeholder="New Password" required>
												<div data-name="#new-password"
													class="fa fa-fw fa-eye field-icon toggle-password"></div>
											</div>

											<div class="form-group" name="frmCheckPassword"
												id="frmCheckPassword">
												<label class="text-light-white fs-14">Confirm
													Password</label> <input type="password" name="password"
													id="password" class="form-control form-control-submit"
													onKeyUp="checkPasswordStrength();" value="Confirm Password"
													placeholder="Confirm Password" required />
												<div data-name="#password"
													class="fa fa-fw fa-eye field-icon toggle-password"></div>
												<div id="password-strength-status"></div>
											</div>

											<!-- <div name="frmCheckPassword" id="frmCheckPassword">
        <label>Password:</label>
        <input type="password" name="password" id="password" class="demoInputBox" onKeyUp="checkPasswordStrength();" />
        <div id="password-strength-status"></div>
    </div> -->


											<div class="form-group">
												<button type="submit"
													class="btn-second btn-submit full-width">
													<img
														src="${pageContext.request.contextPath}/resources/assets/img/M.png"
														alt="btn logo">Sign in
												</button>
											</div>




										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Place all Scripts Here -->
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<!-- Popper -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<!-- Range Slider -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/ion.rangeSlider.min.js"></script>
	<!-- Swiper Slider -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/swiper.min.js"></script>
	<!-- Nice Select -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	<!-- magnific popup -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<!-- Maps -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnd9JwZvXty-1gHZihMoFhJtCXmHfeRQg"></script>
	<!-- sticky sidebar -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/sticksy.js"></script>
	<!-- Munch Box Js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/munchbox.js"></script>
	<!-- /Place all Scripts Here -->


	<script>
		function checkPasswordStrength() {
			var number = /([0-9])/;
			var alphabets = /([a-zA-Z])/;
			var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
			if ($('#password').val().length < 6) {
				$('#password-strength-status').removeClass();
				$('#password-strength-status').addClass('weak-password');
				$('#password-strength-status').html(
						"Weak (should be atleast 6 characters.)");
			} else {
				if ($('#password').val().match(number)
						&& $('#password').val().match(alphabets)
						&& $('#password').val().match(special_characters)) {
					$('#password-strength-status').removeClass();
					$('#password-strength-status').addClass('strong-password');
					$('#password-strength-status').html("Strong");
				} else {
					$('#password-strength-status').removeClass();
					$('#password-strength-status').addClass('medium-password');
					$('#password-strength-status')
							.html(
									"Medium (should include alphabets, numbers and special characters.)");
				}
			}
		}
	</script>
</body>

</html>
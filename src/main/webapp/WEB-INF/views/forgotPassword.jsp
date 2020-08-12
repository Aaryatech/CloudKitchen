<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="keywords" content="#">
<meta name="description" content="#">
<title>Cloud Kitchen | Forgot Password</title>
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="#">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="#">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="#">
<link rel="apple-touch-icon-precomposed" href="#">
<link rel="shortcut icon" href="#">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.png"
	type="images/png" sizes="32x32">
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
								<form
									action="${pageContext.request.contextPath}/submitResetPassword"
									method="post">
									<div class="form-group">
										<center>
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/logo.png"
												class="logo_pic" alt="">
										</center>
									</div>

									<h4 class="text-light-black fw-600 signin_title">Reset Password</h4>
									<div class="row">
										<div class="col-12">
											<c:if test="${sessionScope.errorMsg!=null}">
												<div class="error-msg">
													<i class="fa fa-times-circle"></i> ${sessionScope.errorMsg}
												</div>

												<%
													session.removeAttribute("errorMsg");
												%>
											</c:if>
											<c:if test="${sessionScope.successMsg!=null}">
												<div class="success-msg">
													<i class="fa fa-check"></i> ${sessionScope.successMsg}
												</div>
												<%
													session.removeAttribute("successMsg");
												%>
											</c:if>
											<div class="form-group">
												<label class="text-light-white fs-14">Email Id or
													Mobile Number</label> <input type="text" name="username"
													class="form-control form-control-submit"
													placeholder="Email Id or Mobile Number" required>
											</div>


											<div class="form-group">
												<button type="submit"
													class="btn-second btn-submit full-width">Submit</button>

											</div>
											<div>
												<a href="${pageContext.request.contextPath}/">
													<button type="button"
														class="btn-second btn-submit full-width">Back</button>
												</a>
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
	<script type="text/javascript">
		$(document).ready(function() {
			setTimeout(function() {
				$('.error-msg').hide();
				$('.success-msg').hide();
			}, 3000);
		});
	</script>

</body>

</html>
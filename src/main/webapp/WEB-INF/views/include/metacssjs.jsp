<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jQuery -->

<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"
	type="text/javascript"></script>
<!-- Popper -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"
	type="text/javascript"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- Range Slider -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/ion.rangeSlider.min.js"
	type="text/javascript"></script>
<!-- Swiper Slider -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/swiper.min.js"
	type="text/javascript"></script>
<!-- Nice Select -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"
	type="text/javascript"></script>
<!-- magnific popup -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.min.js"
	type="text/javascript"></script>
<!-- Maps -->

<!-- sticky sidebar -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/sticksy.js"
	type="text/javascript"></script>
<!-- Munch Box Js -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/munchbox.js"
	type="text/javascript"></script>
<!-- /Place all Scripts Here -->


<!-- <script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.stickyheader.js"
	type="text/javascript"></script>-->
<!-- new menu js-->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/ace-responsive-menu.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/select2.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>

<!--sticky table js -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.ba-throttle-debounce.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.stickyheader.js"></script>

<script>
	function imgError(image, imagepath) {
		//alert(imagepath)
		image.onerror = "";
		image.src = imagepath;
		return true;
	}
</script>
<script>
	$(".country").select2({
		placeholder : "Select Option",
		allowClear : false
	});
</script>
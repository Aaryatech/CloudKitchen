<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jQuery -->
<div class="modal fade kot-popup" id="confirm">
	<div class="modal-dialog modal-md">
		<!--modal-lg-->
		<div class="modal-content kot_content">
			<button type="button" class="close kot_close" data-dismiss="modal">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
					alt="">
			</button>

			<div class="pop_logo"><img
							src="${pageContext.request.contextPath}/resources/assets/img/dashboard_logo.png"
							class="img-fluid" alt="Logo"></div>
			<div class="pop_signup" id="popupheading">Are you sure?</div>
			<p class="confirm_txt">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
			<div class="pop_btn_cntr">
				<button type="button" data-dismiss="modal"
					class="button_place  popup submitmodel" id="submitOrder">Submit </button>
				<button type="button" data-dismiss="modal" class="button_place popup"
					id="cancelOrder">Cancel </button>
			</div>

		</div>
	</div>
</div>
<div class="modal fade kot-popup" id="confirmdivcart">
	<div class="modal-dialog modal-md">
		<!--modal-lg-->
		<div class="modal-content kot_content">
			<button type="button" class="close kot_close" data-dismiss="modal">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
					alt="">
			</button>
			<div class="pop_logo"><img
							src="${pageContext.request.contextPath}/resources/assets/img/dashboard_logo.png"
							class="img-fluid" alt="Logo"></div>
			<div class="pop_signup" id="popupheadingcart">Are you sure?</div>
			<p class="confirm_txt">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
			<div class="pop_btn_cntr">

				<button type="button" data-dismiss="modal" class="button_place popup"
					id="cancelOrder">OK</button>
			</div>

		</div>
	</div>
</div>
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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

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
<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script> -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js"></script>


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
	function imgErrorJavascript(image, type) {
		//alert(imagepath)
		image.onerror = "";
		if (type == 1) {
			image.src = '${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg';//taste
		} else if (type == 2) {
			image.src = '${pageContext.request.contextPath}/resources/assets/img/italian.jpg';//related item
		} else if (type == 3) {
			image.src = '${pageContext.request.contextPath}/resources/assets/img/trending_1.jpg';//offer
		}

		return true;
	}
</script>
<script>
	jQuery('.numbersOnly').keyup(function() {
		this.value = this.value.replace(/[^0-9\.]/g, '');
	});
	jQuery('.alphaonly').keyup(function() {
		this.value = this.value.replace(/[^a-zA-Z\s]+$/, '');
	});
	jQuery('.alhanumeric').keyup(function() {
		this.value = this.value.replace(/[^a-zA-Z0-9\-\s]+$/, '');
	});
	jQuery('.dob').keyup(function() {
		this.value = this.value.replace(/[^a-zA-Z0-9\-\s]+$/, '');
	});
</script>
<script>
	$(".country").select2({
		placeholder : "Select Option",
		allowClear : false
	});
</script>
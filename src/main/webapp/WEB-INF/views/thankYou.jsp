<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.loader {
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.5);
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

</body>
</html>
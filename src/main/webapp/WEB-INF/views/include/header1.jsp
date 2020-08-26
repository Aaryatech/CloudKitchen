<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="keywords" content="#">
<meta name="description" content="#">
<title>Cloud Kitchen</title>
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="#">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="#">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="#">
<link rel="apple-touch-icon-precomposed" href="#">
<link rel="shortcut icon" href="#">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.png"
	type="images/png" sizes="32x32">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Fontawesome -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css"
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
<!-- sticky table css -->
<!-- <link
	href="${pageContext.request.contextPath}/resources/assets/css/component-new.css"
	rel="stylesheet">-->
<!-- menu menu css -->

<!-- table-new cs -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/component.css"
	rel="stylesheet">



<link
	href="${pageContext.request.contextPath}/resources/assets/css/ace-responsive-menu.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css" />
<!-- <link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/themes/smoothness/jquery-ui.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/jquery-ui.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap"
	rel="stylesheet">
<!-- place -->
<!-- Navigation -->
<div class="header">
	<header class="full-width">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 mainNavCol new">
					<!-- logo -->
					<div class="logo mainNavCol new">
						<a href="${pageContext.request.contextPath}/dashboard"> <img
							src="${pageContext.request.contextPath}/resources/assets/img/dashboard_logo.png"
							class="img-fluid" alt="Logo">
						</a>
					</div>
					<!-- logo -->
					<div class="main-search mainNavCol new">
						<form class="main-search search-form full-width">
							<div class="row">
								<!-- location picker -->
								<div class="col-lg-12 col-md-12">
									<!-- col-lg-6 col-md-5 -->
									<div class="head_search">
										<div class="head_search_l">
											<i class="fa fa-search" aria-hidden="true"></i> <input
												type="text" onkeyup="allItemSearch()" name="myInput1"
												id="myInput1" class="top_place"
												placeholder="Search for restaurant, cuisine or a dish" />
										</div>
										<input type="hidden" value="${sessionScope.frIdForOrder}"
											id="hiddenSelectedFrId" name="hiddenSelectedFrId">
										<div class="head_search_r">
											<select class="country top_drop_ones" id="headerFrId"
												name="headerFrId" onchange="changeFrId()">
												<%-- <c:forEach items="${franchiseList}" var="franchiseList">
													<c:choose>
														<c:when
															test="${sessionScope.frIdForOrder==franchiseList.frId}">
															<option value="${franchiseList.frId}" selected>${franchiseList.frName}</option>
														</c:when>
														<c:otherwise>
															<option value="${franchiseList.frId}">${franchiseList.frName}</option>
														</c:otherwise>
													</c:choose>

												</c:forEach> --%>

											</select>
										</div>

									</div>

								</div>
								<!-- location picker -->

							</div>
						</form>
					</div>


					<div class="right-side fw-700 mainNavCol new">

						<!-- welcome user -->
						<div class="welcome_top">
							Welcome to <span>Cloud Kitchen!</span>
						</div>

						<!-- user notification -->
						<!-- <div class="cart-btn notification-btn">
							<a href="#" class="text-custom-white fw-700"> <i
								class="fas fa-bell"></i> <span class="user-alert-notification">10</span>
							</a>
							<div class="notification-dropdown">
								<div class="product-detail">
									notification
									<ul class="new_notif">
										<li>
											<div class="not_one">
												<a href="#"> <img src="https://via.placeholder.com/40"
													class="rounded-circle" alt="image"> Stephan Parker <span>marked
														the task as done a day ago</span>
												</a>
											</div>
										</li>
										<li>
											<div class="not_one">
												<a href="#"> <img src="https://via.placeholder.com/40"
													class="rounded-circle" alt="image"> Steve O'Reilly <span>Answered
														to your comment on the Cash Flow Forecast's graph</span>
												</a>
											</div>
										</li>
										<li>
											<div class="not_one">
												<a href="#"> <img src="https://via.placeholder.com/40"
													class="rounded-circle" alt="image"> Stephan Parker <span>marked
														the task as done a day ago</span>
												</a>
											</div>
										</li>
										<li>
											<div class="not_one">
												<a href="#"> <img src="https://via.placeholder.com/40"
													class="rounded-circle" alt="image"> Steve O'Reilly <span>Answered
														to your comment on the Cash Flow Forecast's graph</span>
												</a>
											</div>
										</li>
										<li>
											<div class="not_one">
												<a href="#"> <img src="https://via.placeholder.com/40"
													class="rounded-circle" alt="image"> Stephan Parker <span>marked
														the task as done a day ago</span>
												</a>
											</div>
										</li>
										<li>
											<div class="not_one">
												<a href="#"> <img src="https://via.placeholder.com/40"
													class="rounded-circle" alt="image"> Steve O'Reilly <span>Answered
														to your comment on the Cash Flow Forecast's graph</span>
												</a>
											</div>
										</li>
									</ul>
								</div>

							</div>
						</div> -->
						<!-- user notification -->

						<!-- user account -->
						<div class="user-details p-relative">
							<a href="#" class="text-custom-white fw-500"> <img
								src="${sessionScope.profilePicUrl}${sessionScope.userInfo.profilePic}"
								class="rounded-circle" alt="userimg"
								onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/default-user.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/default-user.jpg';"
								style="width: 30px; height: 30px;"> <span>Hi,
									${sessionScope.userInfo.userName}</span>
							</a>
							<div class="user-dropdown">
								<!-- <ul>
									<li><a href="order-details.html">
											<div class="icon">
												<i class="flaticon-rewind"></i>
											</div> <span class="details">Past Orders</span>
									</a></li>
									<li><a href="order-details.html">
											<div class="icon">
												<i class="flaticon-takeaway"></i>
											</div> <span class="details">Upcoming Orders</span>
									</a></li>
									<li><a href="#">
											<div class="icon">
												<i class="flaticon-breadbox"></i>
											</div> <span class="details">Saved</span>
									</a></li>
									<li><a href="#">
											<div class="icon">
												<i class="flaticon-gift"></i>
											</div> <span class="details">Gift cards</span>
									</a></li>
									<li><a href="#">
											<div class="icon">
												<i class="flaticon-refer"></i>
											</div> <span class="details">Refer a friend</span>
									</a></li>
									<li><a href="#">
											<div class="icon">
												<i class="flaticon-diamond"></i>
											</div> <span class="details">Perks</span>
									</a></li>
									<li><a href="#">
											<div class="icon">
												<i class="flaticon-user"></i>
											</div> <span class="details">Account</span>
									</a></li>
									<li><a href="#">
											<div class="icon">
												<i class="flaticon-board-games-with-roles"></i>
											</div> <span class="details">Help</span>
									</a></li>
								</ul> -->
								<div class="user-footer">
									<span class="text-light-black">Not Jhon?</span> <a
										href="${pageContext.request.contextPath}/">Sign Out</a>
								</div>
							</div>
						</div>

						<!-- user cart -->
						<div class="cart-btn cart-dropdown">
							<a href="#" class="text-custom-white fw-700"> <i
								class="fas fa-shopping-bag"></i> <span class="user-alert-cart"
								id="cart_item_count">0</span>
							</a>
							<div class="cart-detail-box">
								<div class="card">
									<div class="card-header padding-15">${sessionScope.liveCustomer.custName},${sessionScope.liveCustomer.phoneNumber}<br>
										Your Order
									</div>
									<div class="card-body no-padding" id="item_cart_list">
										<!-- <div class="cat-product-box">
											<div class="cat-product">
												<div class="cat-name">
													<a href="#">
														<p class="text-light-green">
															<span class="text-dark-white">1</span> Chilli Chicken
														</p> <span class="text-light-white">small, chilli
															chicken</span>
													</a>
												</div>
												<div class="delete-btn">
													<a href="#" class="text-dark-white"> <i
														class="far fa-trash-alt"></i>
													</a>
												</div>
												<div class="price">
													<a href="#" class="text-dark-white fw-500"> $2.25 </a>
												</div>
											</div>
										</div>
										<div class="cat-product-box">
											<div class="cat-product">
												<div class="cat-name">
													<a href="#">
														<p class="text-light-green">
															<span class="text-dark-white">1</span> loaded cheese
														</p> <span class="text-light-white">small, chilli
															chicken</span>
													</a>
												</div>
												<div class="delete-btn">
													<a href="#" class="text-dark-white"> <i
														class="far fa-trash-alt"></i>
													</a>
												</div>
												<div class="price">
													<a href="#" class="text-dark-white fw-500"> $2.25 </a>
												</div>
											</div>
										</div>
										<div class="cat-product-box">
											<div class="cat-product">
												<div class="cat-name">
													<a href="#">
														<p class="text-light-green">
															<span class="text-dark-white">1</span> Tortia Chicken
														</p> <span class="text-light-white">small, chilli
															chicken</span>
													</a>
												</div>
												<div class="delete-btn">
													<a href="#" class="text-dark-white"> <i
														class="far fa-trash-alt"></i>
													</a>
												</div>
												<div class="price">
													<a href="#" class="text-dark-white fw-500"> $2.25 </a>
												</div>
											</div>
										</div> -->
										<div class="item-total">
											<div class="total-price border-0">
												<span class="text-dark-white fw-700">Items subtotal:</span>
												<span class="text-dark-white fw-700">00.00</span>
											</div>
											<div class="empty-bag padding-15">
												<a href="#">Clear Cart</a>
											</div>
										</div>
									</div>
									<div class="card-footer padding-15">
										<a href="javascript:void(0)"
											class="btn-first green-btn text-custom-white full-width fw-500"
											onclick="checkOutProcess()">Proceed to Checkout</a>
									</div>
								</div>
							</div>
						</div>
						<!-- user cart -->


					</div>
				</div>
				<div class="col-sm-12 mobile-search">
					<div class="mobile-address">
						<a href="#" class="delivery-add" data-toggle="modal"
							data-target="#address-box"> <span class="address">Brooklyn,
								NY</span>
						</a>
					</div>
					<div class="sorting-addressbox">
						<span class="full-address text-light-green">Brooklyn, NY
							10041</span>
						<div class="btns">
							<div class="filter-btn">
								<button type="button">
									<i class="fas fa-sliders-h text-light-green fs-18"></i>
								</button>
								<span class="text-light-green">Sort</span>
							</div>
							<div class="filter-btn">
								<button type="button">
									<i class="fas fa-filter text-light-green fs-18"></i>
								</button>
								<span class="text-light-green">Filter</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</header>
</div>
<div class="main-sec"></div>
<script type="text/javascript">
	function checkOutProcess() {

		var isError = false;
		var cartValue = sessionStorage.getItem("cartValue");
		var table = $.parseJSON(cartValue);

		var itemIds = [];

		if (table.length < 1) {
			isError = true;
			//alert("Select minimum one item.")

			$('#popupheadingcart').html("Select minimum one item.");
			$('#confirmdivcart').modal({
				backdrop : 'static',
				keyboard : false
			});

		}

		if (!isError) {

			document.getElementById("loaderimg").style.display = "block";

			for (var i = 0; i < table.length; i++) {
				itemIds.push(table[i].itemId);
			}

			var fd = new FormData();

			fd.append("itemIds", JSON.stringify(itemIds));

			$
					.ajax({
						url : '${pageContext.request.contextPath}/setItemIdsForRelatedItemList',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							var url = '${pageContext.request.contextPath}/checkout';
							window.location = url;

						},
					});

		}

	}
</script>
</head>
<!-- Navigation -->
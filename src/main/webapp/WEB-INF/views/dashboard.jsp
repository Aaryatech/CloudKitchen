<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Bootstrap -->

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
.pac-container {
	z-index: 10000 !important;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />

<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>

<!-- If you enabled Analytics in your project, add the Firebase SDK for Analytics -->
<script
	src="https://www.gstatic.com/firebasejs/7.15.5/firebase-analytics.js"></script>

<!-- Add Firebase products that you want to use -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js"></script>
<!--    <script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-firestore.js"></script>
-->
<script
	src="https://www.gstatic.com/firebasejs/7.15.5/firebase-database.js"></script>
<body>
	<div class="loader" id="loaderimg" style="display: none;">
		<img
			src="${pageContext.request.contextPath}/resources/assets/img/svg/loader.svg"
			alt="">
	</div>

	<section class="final-order section-padding bg-light-grey">
		<div class="container-fluid">


			<!--top-search-->
			<div class="main-box padding-20  margin_bottom">


				<c:choose>
					<c:when test="${sessionScope.successMsg!=null}">
						<div class="success-msg" id="finalSuccessMsg">
							<i class="fa fa-check"></i><span id="finalsuccessmsgcontent">
								${sessionScope.successMsg}</span>
						</div>
						<%
							session.removeAttribute("successMsg");
						%>
					</c:when>
					<c:otherwise>
						<div class="success-msg" style="display: none;"
							id="finalSuccessMsg">
							<i class="fa fa-check"></i><span id="finalsuccessmsgcontent">
								${sessionScope.successMsg}</span>
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.errorMsg!=null}">
						<div class="error-msg" id="finalFailedMsg">
							<i class="fa fa-times-circle"></i> <span
								id="finalerrormsgcontent">${sessionScope.errorMsg}</span>
						</div>
						<%
							session.removeAttribute("errorMsg");
						%>
					</c:when>
					<c:otherwise>
						<div class="error-msg" style="display: none;" id="finalFailedMsg">
							<i class="fa fa-times-circle"></i> <span
								id="finalerrormsgcontent">${sessionScope.errorMsg}</span>
						</div>
					</c:otherwise>
				</c:choose>


				<!-- <div class="success-msg" style="display: none;"
						id="finalSuccessMsg">
						<i class="fa fa-check"></i><span id="finalsuccessmsgcontent">
							Success Message</span>
					</div>
					<div class="error-msg" style="display: none;" id="finalFailedMsg">
						<i class="fa fa-times-circle"></i> <span id="finalerrormsgcontent">Error
							message.</span>
					</div> -->

				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="input_one">
							<form id="findCustomerByMobileNo">
								<input name="mobileNoSearch" type="text"
									class="input_no numbersOnly  "
									placeholder="Customer Mobile Number " id="mobileNoSearch"
									maxlength="10" /> <i class="fa fa-mobile mobile"
									aria-hidden="true"></i>
								<button type="submit" value="Submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</div>
						<span style="color: red; display: none;"
							id="error_findCustomerByMobileNo">* Mobile no. is not
							register.</span>


					</div>
					<!-- <div class="col-lg-3 col-md-6 col-sm-6"> -->

					<!-- switch toggle -->
					<!-- <label class="switch">
							<input class="switch-input" type="checkbox" />
							<span class="switch-label" data-on="On" data-off="Off"></span> 
							<span class="switch-handle"></span> 
						</label> -->


					<!-- <div class="input_one"> -->
					<!-- <input name="" type="text" class="input_no"
									placeholder="Search by Order Number" /> <i
									class="fa fa-check mobile check" aria-hidden="true"></i>
								<button type="submit" value="Submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button> -->
					<!-- </div> -->
					<!-- <span style="color: red;">* Order no. not found.</span> -->
					<!-- </div> -->

					<div class="col-lg-3 col-md-6 col-sm-6" id="preferredLangDiv">
						<label class="prefered fs-14">Preferred Language : <Span
							id="showPreferredLang">${customer.langName}</Span></label>

					</div>
					<div class="col-lg-3 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 sec_title right_btn">
						<a href="javascript:void(0)" onclick="addNewCustomerModel()"
							class="order_btn"> New Customer Registration</a>
					</div>
				</div>

			</div>

			<!--dashboard 5 boxes -->
			<div class="dashboard_count">
				<ul>
					<li><a href="javascript:void(0)" onclick="changeHeadName(5)">
							<div class="dash_one dash_common">
								<h3 class="dash_txt">
									Online Payment Pending Order <span
										id="online_payment_pending_order">0</span>

								</h3>
								<i class="fa fa-shopping-cart"></i>
							</div>
					</a></li>
					<li><a href="javascript:void(0)" onclick="changeHeadName(0)">
							<div class="dash_one dash_common">
								<h3 class="dash_txt">
									PENDING ORDER
									<div class="grievence">
										<div class="grievence_one">
											PARK <span id="park_count">0</span>
										</div>
										<div class="grievence_one">
											SHOP PENDING <span id="shop_pending_count">0</span>
										</div>
									</div>
								</h3>
								<i class="fa fa-shopping-cart"></i>
							</div>
					</a></li>
					<li><a href="javascript:void(0)" onclick="changeHeadName(1)">
							<div class="dash_two dash_common">
								<h3 class="dash_txt">
									LIVE ORDER
									<div class="grievence">
										<div class="grievence_one three">
											ACCEPT <span id="accept_count">0</span>
										</div>
										<div class="grievence_one three">
											PROCESSING <span id="process_count">0</span>
										</div>
										<div class="grievence_one three">
											<!-- DELIVERY -->
											PENDING <span id="delivery_pending_count">0</span>
										</div>
									</div>
								</h3>
								<i class="fa fa-user" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="javascript:void(0)" onclick="changeHeadName(2)">
							<div class="dash_three dash_common">
								<h3 class="dash_txt">
									TODAY DELIVERDED <span id="delivered_count">0</span>
								</h3>
								<i class="fa fa-check" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="javascript:void(0)" onclick="changeHeadName(3)"><div
								class="dash_four dash_common">
								<h3 class="dash_txt">
									Today Cancelled
									<div class="grievence">
										<div class="grievence_one three">
											REJECT
											<!-- BY SHOP -->
											<span id="rejected_count">0</span>
										</div>
										<div class="grievence_one three">
											RETURN <span id="return_count">0</span>
										</div>
										<div class="grievence_one three">
											CANCELLED<span id="cancelled_count">0</span>
										</div>
									</div>
								</h3>
								<i class="fa fa-times" aria-hidden="true"></i>
							</div></a></li>
					<!-- <li>
						<div class="dash_five dash_common">
							<h3 class="dash_txt">
								Grievences
								<div class="grievence">
									<div class="grievence_one">
										Pending <span>0</span>
									</div>
									<div class="grievence_one">
										Resolve <span>0</span>
									</div>
								</div>
							</h3>
							<i class="fa fa-repeat" aria-hidden="true"></i>
						</div>
					</li> -->
				</ul>
			</div>

			<!--Live orderes table -->
			<div id="tableDive">

				<div class="main-box padding-20 margin_bottom">


					<div id="payment_pending_order_div" style="display: none;">
						<div class="sec_title flt_lft">Online Payment Pending Order</div>
						<div class="related_row_r right_serach">
							<i class="fa fa-search" aria-hidden="true"></i> <input
								name="paymentPendingOrderText" id="paymentPendingOrderText"
								type="text" class="rel_search"
								onkeyup="searchPaymentPendingOrder()" placeholder="Search">
						</div>

						<div class="component">
							<table class="overflow-y" id="payment_pending_order_table">
								<thead>
									<tr>
										<th style="text-align: center; width: 5%;"></th>
										<th class="sorting_desc"
											style="text-align: center; width: 5%;">Order NO.</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Customer Name</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Shop Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center; width: 10%;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center; width: 5%;">Type</th>
										<th class="sorting_desc"
											style="text-align: center; width: 7%;">Total</th>
										<th class="sorting_desc"
											style="text-align: center; width: 10%;">Payment Status</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Order Status</th>
										<th class="sorting_desc"
											style="text-align: center; width: 10%;">Action</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>


						</div>
					</div>

					<div id="pending_order_div" style="display: none;">
						<div class="sec_title flt_lft">Pending Order</div>
						<div class="related_row_r right_serach">
							<i class="fa fa-search" aria-hidden="true"></i> <input
								name="pendingOrderText" id="pendingOrderText" type="text"
								class="rel_search" onkeyup="searchPendingOrder()"
								placeholder="Search">
						</div>

						<div class="component">
							<table class="overflow-y" id="pending_order_table">
								<thead>
									<!-- <tr>
										<th></th>
										<th class="sorting_desc" style="text-align: center;">Order
											NO.</th>
										<th class="sorting_desc" style="text-align: center;">Customer
											Name</th>
										<th class="sorting_desc" style="text-align: center;">Shop
											Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Type</th>
										<th class="sorting_desc" style="text-align: center;">Total</th>
										<th class="sorting_desc" style="text-align: center;">Payment
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Order
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Action</th>
									</tr> -->
									<tr>
										<th style="text-align: center; width: 5%;"></th>
										<th class="sorting_desc"
											style="text-align: center; width: 5%;">Order NO.</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Customer Name</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Shop Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center; width: 10%;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center; width: 5%;">Type</th>
										<th class="sorting_desc"
											style="text-align: center; width: 7%;">Total</th>
										<th class="sorting_desc"
											style="text-align: center; width: 10%;">Payment Status</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Order Status</th>
										<th class="sorting_desc"
											style="text-align: center; width: 10%;">Action</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>


						</div>
					</div>

					<div id="live_order_div">
						<div class="sec_title flt_lft">Live Orders</div>

						<div class="related_row_r right_serach">
							<i class="fa fa-search" aria-hidden="true"></i> <input
								name="pendingOrderText" id="liveOrderText" type="text"
								class="rel_search" onkeyup="searchLiveOrder()"
								placeholder="Search">
						</div>
						<div class="component">
							<!-- <div class="related_row_r">
								<i class="fa fa-search" aria-hidden="true"></i> <input
									name="related_item_text" type="text" class="rel_search"
									placeholder="Search" id="related_item_text"
									onkeyup="searchRelatedItem()">
							</div> -->
							<table class="overflow-y" id="live_order_table">
								<thead>
									<tr>
										<th style="text-align: center; width: 5%;"></th>
										<th class="sorting_desc"
											style="text-align: center; width: 5%;">Order NO.</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Customer Name</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Shop Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center; width: 10%;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center; width: 5%;">Type</th>
										<th class="sorting_desc"
											style="text-align: center; width: 7%;">Total</th>
										<th class="sorting_desc"
											style="text-align: center; width: 10%;">Payment Status</th>
										<th class="sorting_desc"
											style="text-align: center; width: 15%;">Order Status</th>
										<th class="sorting_desc"
											style="text-align: center; width: 10%;">Action</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>


						</div>
					</div>

					<div id="delivered_order_div" style="display: none;">
						<div class="sec_title flt_lft">Delivered Order</div>
						<div class="related_row_r right_serach">
							<i class="fa fa-search" aria-hidden="true"></i> <input
								name="deliverdOrderText" id="deliverdOrderText" type="text"
								class="rel_search" onkeyup="searchDeliverdOrder()"
								placeholder="Search">
						</div>
						<div class="component">
							<table class="overflow-y" id="delivered_order_table">
								<thead>
									<tr>
										<th></th>
										<th class="sorting_desc" style="text-align: center;">Order
											NO.</th>
										<th class="sorting_desc" style="text-align: center;">Customer
											Name</th>
										<th class="sorting_desc" style="text-align: center;">Shop
											Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Type</th>
										<th class="sorting_desc" style="text-align: center;">Total</th>
										<th class="sorting_desc" style="text-align: center;">Payment
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Order
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Action</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>


						</div>
					</div>

					<div id="cancelled_order_div" style="display: none;">
						<div class="sec_title flt_lft">Cancelled Order</div>
						<div class="related_row_r right_serach">
							<i class="fa fa-search" aria-hidden="true"></i> <input
								name="cancelOrOrderText" id="cancelOrOrderText" type="text"
								class="rel_search" onkeyup="searchCancelOrder()"
								placeholder="Search">
						</div>
						<div class="component">
							<table class="overflow-y" id="cancelled_order_table">
								<thead>
									<tr>
										<th></th>
										<th class="sorting_desc" style="text-align: center;">Order
											NO.</th>
										<th class="sorting_desc" style="text-align: center;">Customer
											Name</th>
										<th class="sorting_desc" style="text-align: center;">Shop
											Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Type</th>
										<th class="sorting_desc" style="text-align: center;">Total</th>
										<th class="sorting_desc" style="text-align: center;">Payment
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Order
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Action</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>


						</div>
					</div>

				</div>
			</div>
			<!-- -->
			<div class="row margin_bottom">
				<div class="col-lg-4">
					<div class="main-box padding-20 marg_mob">
						<div class="edit_prof">
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/default-user.jpg"
								alt="">
						</div>
						<div class="profile_title">
							<div class="profile_title_l">Customer Profile</div>
							<div class="profile_title_r" id="editCustomerSign">
								<c:if test="${customer.phoneNumber!=null}">
									<a href="javascript:void(0)" onclick="editCustomer()"><i
										class="fa fa-pencil" aria-hidden="true"></i></a>
								</c:if>

							</div>
							<div class="clr"></div>
						</div>

						<div class="profile_bx">
							<div class="profile_one">
								<span>Name</span> : <span id="profileCustName">${customer.custName}</span>
							</div>
							<div class="profile_one">
								<span>Mobile No.</span> : <span id="profileMobileNo">${customer.phoneNumber}</span>
							</div>
							<div class="profile_one">
								<span>Whats App No.</span> : <span id="profilewhatappNo">${customer.whatsappNo}</span>
							</div>
							<div class="profile_one">
								<span>Email Id</span> : <span id="profileemail">${customer.emailId}</span>
							</div>

							<div class="profile_one">
								<span>Preferred Language</span> : <span
									id="profilepreferredLang">${customer.langName}</span>
							</div>
							<div class="profile_one">
								<span>Delivery Address</span> : <span id="profileDeliveryAdd">
									<a title="Add New Address" class="detail_btn_round"
									href="javascript:void(0)" onclick="addCustomerAdd()"><i
										class="fa fa-plus" aria-hidden="true"></i></a> <a
									href="javascript:void(0)" title="Address List"
									class="detail_btn_round" onclick="customerAddList()"><i
										class="fa fa-list" aria-hidden="true"></i></a>
								</span>

							</div>
						</div>

					</div>
				</div>

				<!--previous order history table-->
				<div class="col-lg-8">
					<div class="main-box padding-20">
						<div class="sec_title ">
							<div class="tab_l">
								<ul>
									<li><a href="javascript:void(0)" class="act"
										id="previousOrderTab" onclick="showPreviousOrGrivienceTab(1)">Previous
											Orders</a></li>
									<li><a href="javascript:void(0)" id="grievencesTab"
										onclick="showPreviousOrGrivienceTab(2)">Grievences</a></li>
								</ul>
							</div>
							<a href="javascript:void(0)" onclick="placeOrderProcess()"
								class="order_btn">New Order Booking</a>
						</div>
						<div id="previousOrderTabDiv">
							<div class="tab_row_top">

								<div class="sec_title flt_lft">previous orders History</div>
								<div class="related_row_r right_serach">
									<i class="fa fa-search" aria-hidden="true"></i> <input
										name="previousOrderText" id="previousOrderText" type="text"
										class="rel_search" onkeyup="searchPreviousOrder()"
										placeholder="Search">
								</div>
								<div class="clr"></div>
							</div>

							<div class="component">
								<table class="overflow-y" id="previousOrderTabl">
									<thead>
										<tr>

											<th style="text-align: center; width: 7%;"></th>
											<th class="sorting_desc"
												style="text-align: center; width: 7%;">Order NO.</th>

											<th class="sorting_desc"
												style="text-align: center; width: 20%;">Shop Name</th>
											<th class="sorting_desc js-sort-date"
												style="text-align: center; width: 15%;">Date</th>
											<th class="sorting_desc js-sort-date"
												style="text-align: center; width: 7%;">Type</th>
											<th class="sorting_desc"
												style="text-align: center; width: 10%;">Amount</th>
											<th class="sorting_desc"
												style="text-align: center; width: 20%;">Status</th>
											<th class="sorting_desc"
												style="text-align: center; width: 15%;">Action</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
						<div id="grievencesTabDiv" style="display: none;">

							<div class="tab_row_top">

								<div class="sec_title flt_lft">Grievence History</div>
								<div class="related_row_r right_serach">
									<i class="fa fa-search" aria-hidden="true"></i> <input
										name="pendingGrivienceText" id="pendingGrivienceText"
										type="text" class="rel_search"
										onkeyup="searchPendingGrivience()" placeholder="Search">
								</div>
								<div class="clr"></div>
							</div>
							<div class="component">
								<table class="overflow-y" id="customerGrivienceTable">
									<thead>
										<tr>


											<th class="sorting_desc"
												style="text-align: center; width: 15%;">Grievence No.</th>
											<th class="sorting_desc"
												style="text-align: center; width: 15%;">Order NO.</th>
											<th class="sorting_desc js-sort-date"
												style="text-align: center; width: 15%;">Date</th>
											<th class="sorting_desc"
												style="text-align: center; width: 10%;">Grievence Type</th>
											<th class="sorting_desc"
												style="text-align: center; width: 20%;">Status</th>

										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>


							</div>
						</div>


					</div>
				</div>
			</div>




		</div>
	</section>

	<div class="modal fade kot-popup fetch_results" id="addCustomer"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close cleardiv"
					data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">
					Customer Registration<a href="#"></a>
				</div>


				<form action="" method="get">

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Delivery City/Village *</span>
							<div class="search_multiple">
								<select class="country" id="addcity" name="addcity"
									onchange="getShopByCityId(this.value)">
									<option value="">Select City</option>
									<c:forEach items="${cityList}" var="cityList">
										<c:set value="City" var="isCityValue"></c:set>
										<c:choose>
											<c:when test="${cityList.exInt1==1}">
												<c:set value="Village" var="isCityValue"></c:set>
											</c:when>
										</c:choose>
										<option value="${cityList.cityId}"
											data-iscity="${cityList.exInt1}"
											id="cityData${cityList.cityId}"
											data-cityname="${cityList.cityName}">${cityList.cityName}
											- ${isCityValue}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_addcity">* This field required.</span>
					</div>
					<div id="landmarkDiv">
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Landmark *</span> <input name="txtPlaces" type="text"
									class="frm_inpt" id="txtPlaces" placeholder="Landmark" /><input
									name="addLatitude" type="hidden" class="frm_inpt"
									id="addLatitude" /><input name="addLongitude" type="hidden"
									class="frm_inpt" id="addLongitude" />
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_txtPlaces">* This
								field required.</span>
						</div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Shop *</span>
							<div class="search_multiple">
								<select class="country" id="addShop" name="addShop"
									onchange="getAgetListByShopId(this.value)">
									<!-- <option value="">Select Area</option>
									<option value="1" data-name="">Nashik Road</option>
									<option value="2" data-name="">Canada Corner</option> -->
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_addShop">* This field required.</span>
					</div>
					<div id="agentDiv">
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Agent *</span>
								<div class="search_multiple">
									<select class="country" id="addCustAgent" name="addCustAgent">
										<!-- <option value="">Select Area</option>
									<option value="1" data-name="">Nashik Road</option>
									<option value="2" data-name="">Canada Corner</option> -->
									</select>
								</div>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addCustAgent">* This
								field required.</span>
						</div>
					</div>
					<div class="single_row">
						<div class="single_row_l">
							<div class="pop_frm_one">
								<span>Your Name *</span> <input name="custname" type="text"
									id="custname" class="frm_inpt" onchange="trim(this)"
									maxlength="50" placeholder="Customer Full Name" />
							</div>
							<span class="model_error_class"
								style="color: red; display: none;" id="error_custname">*
								This field required.</span>
						</div>
						<div class="single_row_r">
							<div class="pop_frm_one">
								<span>Mobile Number *</span> <input name="mobileNo" type="text"
									class="frm_inpt numbersOnly"
									onchange="trim(this);checkMobileNo()" id="mobileNo"
									maxlength="10" placeholder="Customer Mobile No." />
							</div>
							<span class="model_error_class"
								style="color: red; display: none;" id="error_mobileNo">*
								This field required.</span>
						</div>
						<div class="clr"></div>
					</div>
					<div class="single_row">
						<div class="single_row_l">
							<div class="pop_frm_one">
								<span>Email </span> <input name="email" type="text"
									class="frm_inpt" onchange="trim(this)" id="email"
									maxlength="50" placeholder="Email" />
							</div>
							<span class="model_error_class"
								style="color: red; display: none;" id="error_email">*
								This field required.</span>
						</div>
						<div class="single_row_r">

							<div class="pop_frm_one">
								<span>Whats App no.</span><input name="whatappno" type="text"
									class="frm_inpt" style="width: 70%" onchange="trim(this)"
									id="whatappno" maxlength="10" placeholder="Whats App no." /><input
									name="sameMoNo" id="sameMoNo" type="checkbox" class="frm_inpt"
									style="width: 30%" onchange="sameMobileNo()" />
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_whatappno">* This
								field required.</span>
						</div>
						<div class="clr"></div>
					</div>
					<!-- <div class="single_row">
						<div class="pop_frm_one">
							<span>Permanent Address *</span>
							<textarea name="" type="text" class="frm_inpt"></textarea>
						</div>
					</div> -->
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Delivery Address *</span>
							<textarea name="address" id="address" type="text" maxlength="200"
								class="frm_inpt" onchange="trim(this)"
								placeholder="Delivery Address"></textarea>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_address">* This field required.</span>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Language *</span>
							<div class="search_multiple">
								<select class="country" name="language" id="language">
									<option value="">Select Language</option>
									<c:forEach items="${languageList}" var="languageList">

										<c:choose>
											<c:when test="${langId==languageList.langId}">
												<option value="${languageList.langId}" selected>${languageList.langName}</option>
											</c:when>
											<c:otherwise>
												<option value="${languageList.langId}">${languageList.langName}</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_language">* This field required.</span>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Delivery Date *</span> <input type="text" id="regorderDate"
								name="regorderDate" class="frm_inpt datepicker"
								data-date-format="dd-mm-yyyy" placeholder="Delivery Date">
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_regorderDate">* This field required.</span>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Delivery Time *</span><input name="regorderTime"
								id="regorderTime" type="time" class="frm_inpt" />
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_regorderTime">* This field required.</span>
					</div>
					<div class="pop_btn_row">
						<input id="addnewcustomer" type="button" value="Submit"
							class="next_btn" onclick="sendOtpForCustomerRegistration()" />
					</div>
				</form>
			</div>


		</div>
	</div>

	<div class="modal fade kot-popup" id="otpModel" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>


				<div class="pop_signup">Enter OTP For Registration</div>
				<form action="" method="get">

					<div class="success-msg" style="display: none;" id="otpSuccessMsg">
						<i class="fa fa-check"></i> OTP send to your mobile no.
					</div>
					<div class="error-msg" style="display: none;" id="otpFailedMsg">
						<i class="fa fa-times-circle"></i> Error to send OTP your mobile
						no.
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>OTP *</span> <input name="" type="text" class="frm_inpt" />

						</div>


						<div class="clr"></div>
					</div>

					<div class="pop_btn_row">
						<input name="" type="button"
							onclick="submitCustomerRegistration()" value="Submit"
							class="next_btn" /> <input name="" type="button"
							value="Resend OTP" onclick="resendOTPregistration()"
							class="next_btn" />
					</div>

				</form>
			</div>


		</div>
	</div>

	<div class="modal fade kot-popup fetch_results" id="editCustomerModel"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close cleardiv"
					data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">
					Edit Customer Profile<a href="#"></a>
				</div>


				<form action="" method="get">
					<div class="single_row">
						<div class="single_row_l">
							<div class="pop_frm_one">
								<span>Your Name *</span> <input name="edit_custname" type="text"
									id="edit_custname" class="frm_inpt" onchange="trim(this)"
									maxlength="50" placeholder="Customer Full Name" />
							</div>
							<span class="model_error_class"
								style="color: red; display: none;" id="error_edit_custname">*
								This field required.</span>
						</div>
						<div class="single_row_r">
							<div class="pop_frm_one">
								<span>Mobile Number *</span> <input name="edit_mobileNo"
									type="text" class="frm_inpt numbersOnly" onchange="trim(this)"
									id="edit_mobileNo" maxlength="10"
									placeholder="Customer Mobile No." readonly />
							</div>
							<span class="model_error_class"
								style="color: red; display: none;" id="error_edit_mobileNo">*
								This field required.</span>
						</div>
						<div class="clr"></div>
					</div>
					<div class="single_row">
						<div class="single_row_l">
							<div class="pop_frm_one">
								<span>Email </span> <input name="edit_email" type="text"
									class="frm_inpt" onchange="trim(this)" id="edit_email"
									maxlength="50" placeholder="Email" />
							</div>
							<span class="model_error_class"
								style="color: red; display: none;" id="error_edit_email">*
								This field required.</span>
						</div>
						<div class="single_row_r">

							<div class="pop_frm_one">
								<span>Whats App no.</span><input name="edit_whatappno"
									type="text" class="frm_inpt" onchange="trim(this)"
									id="edit_whatappno" maxlength="10" placeholder="Whats App no." />
								<!-- <input name="" type="checkbox"
									class="frm_inpt" style="width: 30%" /> -->
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_edit_whatappno">*
								This field required.</span>
						</div>
						<div class="clr"></div>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Language *</span>
							<div class="search_multiple">
								<select class="country" name="edit_language" id="edit_language">
									<option value="">Select Language</option>
									<c:forEach items="${languageList}" var="languageList">
										<option value="${languageList.langId}">${languageList.langName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_edit_language">* This field required.</span>
					</div>
					<div class="pop_btn_row">
						<input id="sumbiteditcustprofilebtn" type="button" value="Submit"
							class="next_btn" onclick="sumbitEditCust()" />
					</div>
				</form>
			</div>


		</div>
	</div>

	<div class="modal fade kot-popup fetch_results" id="orderstep1">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close cleardiv"
					data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/restro_icn.png"
						alt=""> New Order <span>About our latest restaurant
						and exclusive offers.</span> <a href="#"></a>
				</div>

				<!-- pop step 1 start here -->
				<!--4 steps bar-->
				<!-- <div class="progress_row">
					<ul class="progressbar">
						<li class="active">Step 1</li>
						<li>Step 2</li>
						<li>Step 3</li>
						<li>Step 4</li>
					</ul>
				</div> -->

				<div class="form_one">
					<form action="" method="get">

						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Address* <a href="javascript:void(0)"
									style="float: right;" class="detail_btn_round"
									title="Add New Address" onclick="addCustomerAdd()"><i
										class="fa fa-plus" aria-hidden="true"></i></a>
								</span>
								<div class="search_multiple">
									<select class="country" id="addressListForOrder"
										name="addressListForOrder"
										onchange="getShopByAddress(this.value)">


									</select>
								</div>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addressListForOrder">*
								This field required.</span>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Shop</span>
								<div class="search_multiple">
									<select class="country" id="frIdForOrder" name="frIdForOrder"
										onchange="getAgetListByShopIdOrderProcess(this.value)">
										<%-- <c:forEach items="${franchiseList}" var="franchiseList">
											<option value="${franchiseList.frId}">${franchiseList.frName}</option>
										</c:forEach> --%>
									</select>
								</div>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_frIdForOrder">* This
								field required.</span>
						</div>
						<div id="agentDivForPlaceOrder">
							<div class="single_row">
								<div class="pop_frm_one">
									<span>Select Agent *</span>
									<div class="search_multiple">
										<select class="country" id="placeCustAgent"
											name="placeCustAgent">
											<!-- <option value="">Select Area</option>
									<option value="1" data-name="">Nashik Road</option>
									<option value="2" data-name="">Canada Corner</option> -->
										</select>
									</div>
								</div>
								<span style="color: red; display: none;"
									class="model_error_class" id="error_placeCustAgent">*
									This field required.</span>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Date</span> <input type="text" id="orderDate"
									placeholder="Delivery Date" name="orderDate"
									class="frm_inpt datepicker" data-date-format="dd-mm-yyyy">
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_orderDate">* This
								field required.</span>
						</div>

						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Time</span> <input name="orderTime"
									id="orderTime" type="time" class="frm_inpt" />
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_orderTime">* This
								field required.</span>
						</div>

						<div class="pop_btn_row">
							<input name="" type="button" value="Go for Order"
								class="next_btn" onclick="changeStep(5)" />
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="grievences"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Customer feedback - against order</div>
				<div class="modal-body" id="modalbody"></div>
			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="grievencesDetail"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Grievences Detail</div>
				<div class="modal-body" id="grievencesDetailModalbody"></div>
			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="repeatOrderOption"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Repeat Order Process</div>
				<div class="modal-body" id="repeatmodalbody"></div>
			</div>
		</div>
	</div>

	<div class="modal fade kot-popup fetch_results" id="cancelOrder"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close cleardiv"
					data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Cancel Order</div>


				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li>
							<div class="pop_txt_l">Order No.:</div>
							<div class="pop_txt_r" id="cancel_order_no">0001</div>
						</li>
						<li>
							<div class="pop_txt_l">Customer Name :</div>
							<div class="pop_txt_r" id="cancel_order_customer_name">:
								Neal Matthews 1</div>
						</li>
						<li>
							<div class="pop_txt_l">Shop Name :</div>
							<div class="pop_txt_r" id="cancel_order_shop_name">:
								Madhavi</div>
						</li>
						<!-- <li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								<span class="paid">Paid</span>
							</div>
						</li> -->

						<li>
							<div class="pop_txt_l">Order Status :</div>
							<div class="pop_txt_r">
								<span class="paid" id="cancel_order_status_view">Going To
									Delivered</span>
							</div>
						</li>
						<li>
							<div class="pop_txt_l">Date & Time :</div>
							<div class="pop_txt_r" id="cancel_order_data_time">:
								10-07-2020 11:00 AM</div>
						</li>
						<li class="total">
							<div class="pop_txt_l">Total :</div>
							<div class="pop_txt_r" id="cancel_order_tatal">: 440 /-</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Status :</div>
							<div class="pop_txt_r" id="cancel_order_payment_Status">:
								Paid</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Method :</div>
							<div class="pop_txt_r" id="cancel_order_payment_method">:
								COD</div>
						</li>
						<li>
							<div class="pop_txt_l">Order Type :</div>
							<div class="pop_txt_r" id="cancel_order_type">: Web</div>
						</li>
					</ul>
				</div>
				<br>


				<div class="component">
					<table class="overflow-y" id="order_cancel_detail">
						<thead>
							<tr>
								<th class="sorting_desc">Name</th>
								<th class="sorting_desc">Special Note</th>
								<!-- <th class="sorting_desc">UOM</th> -->
								<th class="sorting_desc">Rate</th>
								<th class="sorting_desc js-sort-date">Quantity</th>
								<!-- <th class="sorting_desc">Tax %</th> -->
								<th class="sorting_desc">Total</th>

							</tr>
						</thead>
						<tbody>


						</tbody>
					</table>


				</div>

				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li></li>
						<li>
							<div class="pop_txt_l">Item Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="cancel_item_total">440.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Tax</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="cancel_tax_total">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Offer Disc AMT</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="cancel_disc_total">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Delivery Charges</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="cancel_deliverycharge_total">30.00</span>
							</div>
						</li>
						<li></li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="cancel_fianl_total">440.00</span>
							</div>
						</li>
					</ul>
				</div>

				<div class="form_one extra_marg">
					<form id="submitCancelForm">
						<!-- <div class="single_row">
							<div class="pop_frm_one">
								<span>Select Cancel Reason</span>
								<div class="search_multiple">
									<select class="country">
										<option value="">Select Option</option>
										<option value="1">Packing Damage</option>
										<option value="4">Other</option>
									</select>
								</div>
							</div>
						</div> -->
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Remark *</span>
								<textarea name="cancel_remark" cols="" rows="" class="frm_inpt"
									placeholder="Remark" id="cancel_remark"></textarea>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_cancel_remark">* This
								field required.</span>
						</div>
						<div>
							<input name="cancelOrderBtn" type="submit" value="Submit"
								class="next_btn" id="cancelOrderBtn" />
						</div>
						<!-- class="pop_btn_row"-->
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="viewOrder" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">View Order</div>

				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li>
							<div class="pop_txt_l">Order No. :</div>
							<div class="pop_txt_r" id="order_no">: 0001</div>
						</li>
						<li>
							<div class="pop_txt_l">Customer Name :</div>
							<div class="pop_txt_r" id="order_customer_name">: Neal
								Matthews 1</div>
						</li>
						<li>
							<div class="pop_txt_l">Shop Name :</div>
							<div class="pop_txt_r" id="order_shop_name">: Madhavi</div>
						</li>
						<!-- <li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								<span class="paid">Paid</span>
							</div>
						</li> -->

						<li>
							<div class="pop_txt_l">Order Status :</div>
							<div class="pop_txt_r">
								<span class="paid" id="order_status_view">Going To
									Delivered</span>
							</div>
						</li>
						<li>
							<div class="pop_txt_l">Date & Time :</div>
							<div class="pop_txt_r" id="order_data_time">: 10-07-2020
								11:00 AM</div>
						</li>
						<li class="total">
							<div class="pop_txt_l">Total :</div>
							<div class="pop_txt_r" id="order_tatal">: 440 /-</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Status :</div>
							<div class="pop_txt_r" id="order_payment_Status">: Paid</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Method :</div>
							<div class="pop_txt_r" id="order_payment_method">: COD</div>
						</li>
						<li>
							<div class="pop_txt_l">Order Type :</div>
							<div class="pop_txt_r" id="order_type">: Web</div>
						</li>
					</ul>
				</div>
				<br>


				<div class="component">
					<table class="overflow-y" id="order_view_detail">
						<thead>
							<tr>
								<th class="sorting_desc">Name</th>
								<th class="sorting_desc">Special Note</th>
								<th class="sorting_desc">Rate</th>
								<th class="sorting_desc js-sort-date">Quantity</th>
								<th class="sorting_desc">Total</th>

							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>


				</div>
				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li></li>
						<li>
							<div class="pop_txt_l">Item Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="view_item_total">440.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Tax</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="view_tax_total">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Offer Disc AMT</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="view_disc_total">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Delivery Charges</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="view_deliverycharge_total">30.00</span>
							</div>
						</li>
						<li></li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;" id="view_fianl_total">440.00</span>
							</div>
						</li>
					</ul>
				</div>
				<div class="pop_signup">Order Log</div>
				<div class="component">
					<table id="order_view_trail">
						<thead>
							<tr>
								<th class="sorting_desc">Status</th>
								<th class="sorting_desc">Action By</th>
								<th class="sorting_desc">Date Time</th>
								<th class="sorting_desc">Remark</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup fetch_results" id="addAddress"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close cleardiv"
					data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">
					<span id="add_address_lable">Add Address</span>
				</div>

				<!--form-->
				<div class="form_one extra_marg">
					<form action="" method="get">

						<div class="single_row">
							<div class="pop_frm_one">
								<span>Address Caption * <a href="javascript:void(0)"
									style="float: right;" class="detail_btn_round"
									title="Address List" onclick="customerAddList()"><i
										class="fa fa-list" aria-hidden="true"></i></a></span> <input
									name="addressCation" id="addressCation"
									placeholder="Address Caption" type="text" class="frm_inpt" />
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addressCaption">*
								This field required.</span>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Delivery City/Village *</span>
								<div class="search_multiple">
									<select class="country" name="addAddressCity"
										id="addAddressCity"
										onchange="lanmarkValidationForAddAdress(this.value)">
										<option value="">Select City</option>

										<c:forEach items="${cityList}" var="cityList">
											<c:set value="City" var="isCityValue"></c:set>

											<c:if test="${cityList.exInt1==1}">
												<c:set value="Village" var="isCityValue"></c:set>
											</c:if>
											<option value="${cityList.cityId}"
												data-iscity="${cityList.exInt1}"
												id="cityDataAddReg${cityList.cityId}"
												data-cityname="${cityList.cityName}">${cityList.cityName}
												- ${isCityValue}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addAddressCity">*
								This field required.</span>
						</div>

						<!-- <div class="single_row">
							<div class="pop_frm_one">
								<span>Select Delivery Area *</span>
								<div class="search_multiple">
									<select class="country" name="addAddressArea"
										id="addAddressArea">

									</select>
								</div>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addAddressArea">*
								This field required.</span>
						</div> -->

						<div id="addAddressLandMarkDiv">
							<div class="single_row">
								<div class="pop_frm_one">
									<span>Landmark *</span> <input name="addAddressLandmark"
										id="addAddressLandmark" placeholder="Landmark" type="text"
										class="frm_inpt" /><input name="addAddressLatitude"
										type="hidden" class="frm_inpt" id="addAddressLatitude" /><input
										name="addAddressLongitude" type="hidden" class="frm_inpt"
										id="addAddressLongitude" /><input name="addAddressDetailId"
										type="hidden" class="frm_inpt" id="addAddressDetailId"
										value="0" />
								</div>
								<span style="color: red; display: none;"
									class="model_error_class" id="error_addAddressLandmark">*
									This field required.</span>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Address *</span>
								<textarea name="addAddressDeliveryAdd"
									id="addAddressDeliveryAdd" class="frm_inpt"
									placeholder="Delivery Address"></textarea>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addAddressDeliveryAdd">*
								This field required.</span>
						</div>


						<div>
							<input id="addAddressSubmit" onclick="submitAddNewAddress()"
								type="button" value="Submit" class="next_btn" />
						</div>
						<!-- class="pop_btn_row"-->
					</form>
				</div>
				<!--form close-->

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="addressllist"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Address List</div>
				<div class="component">
					<table class="overflow-y" id="addressListtbl">
						<thead>
							<tr>
								<th class="sorting_desc" style="width: 15%">Caption</th>
								<th class="sorting_desc" style="width: 15%">City</th>
								<!-- <th class="sorting_desc">Area</th> -->
								<th class="sorting_desc" style="width: 25%">Landmark</th>
								<th class="sorting_desc" style="width: 25%">Address</th>
								<th class="sorting_desc" style="width: 20%">Action</th>
							</tr>
						</thead>
						<tbody>
							<!--1 row-->
							<!-- <tr>
								<td class="user-name">Home</td>
								<td class="user-name">Nashik</td>
								<td class="user-name">Nashik</td>
								<td class="user-name">Sharanpur Road, Nashik</td>
								<td class="user-name"><a href="#" class="detail_btn_round"
									title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;<a
									href="#" class="detail_btn_round" title="Delete"><i
										class="fa fa-times" aria-hidden="true"></i> </a></td>
							</tr> -->
							<!--1 row-->

						</tbody>
					</table>


				</div>

			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&libraries=places"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datepicker.min.js"></script>
	<!-- <script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script> -->
	<style type="text/css">
solution 1:
        .datepicker {
	font-size: 0.875em;
}
/* solution 2: the original datepicker use 20px so replace with the following:*/
.datepicker td, .datepicker th {
	width: 1.5em;
	height: 1.5em;
}
</style>
	<script type="text/javascript">
		$(function() {

			$('.datepicker').datepicker({
				minDate : new Date(),
				dateFormat : 'dd-mm-yy',
				weekStart : 1,
				daysOfWeekHighlighted : "6,0",
				autoclose : true,
				todayHighlight : true,
			});
			$('.datepicker').datepicker("setDate", new Date());
		});
		/* $('.datepicker').datepicker({
			minDate : '0',
			dateFormat : 'dd-mm-yy',
			weekStart : 1,
			daysOfWeekHighlighted : "6,0",
			autoclose : true,
			todayHighlight : true,
		});
		$('.datepicker').datepicker("setDate", new Date()); */
	</script>

	<script type="text/javascript">
		function placeOrderProcess() {

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/getAddressListOfCustomer',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							//alert(JSON.stringify(response))
							$('#orderstep1').modal('show');

							var html = '<option value="0" id="addressData0" data-iscity="1" data-cityid="0">Select Address</option>';

							for (var i = 0; i < response.length; i++) {

								var latitude = 0;
								var longitude = 0;
								try {
									latitude = parseFloat(response[i].latitude);
									longitude = parseFloat(response[i].longitude);
								} catch (err) {
									latitude = 0;
									longitude = 0;
								}

								html += '<option value="'
										+ response[i].custAddressId
										+ '" id="addressData'
										+ response[i].custAddressId
										+ '" data-iscity="'
										+ response[i].exInt1
										+ '" data-latitude="'
										+ latitude
										+ '"  data-longitude="'
										+ longitude
										+ '" data-cityid="'
										+ response[i].cityId + '">'
										+ response[i].addressCaption
										+ '</option>';

							}

							$('#addressListForOrder').html(html);
							$("#addressListForOrder").val(response.areaId)
									.trigger('change');
							document.getElementById("loaderimg").style.display = "none";
						},
					});

		}

		function getShopByAddress(addressId) {

			document.getElementById("loaderimg").style.display = "block";
			var cityId = $("#addressData" + addressId).data("cityid");
			var iscity = $("#addressData" + addressId).data("iscity");

			var fd = new FormData();
			fd.append('cityId', cityId);
			fd.append('iscity', iscity);
			$
					.ajax({
						url : '${pageContext.request.contextPath}/getShopByCityId',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							sessionStorage.setItem("frList", JSON
									.stringify(response.franchise));

							// will return the number 123
							if (iscity == 1) {
								var html = '<option value="0" selected>Select Shop</option>';

								for (var i = 0; i < response.franchise.length; i++) {

									html += '<option value="' + response.franchise[i].frId + '">'
											+ response.franchise[i].frName
											+ '</option>';

								}

								$('#frIdForOrder').html(html);
								$("#frIdForOrder").trigger("change");
								$("#agentDivForPlaceOrder").show();
							} else {

								var lat = $("#addressData" + addressId).data(
										"latitude");
								var longi = $("#addressData" + addressId).data(
										"longitude");
								calculateDistance(lat, longi, 2);
								$("#agentDivForPlaceOrder").hide();
							}
							document.getElementById("loaderimg").style.display = "none";
						},
					});
		}

		function getAgetListByShopIdOrderProcess(shopId) {

			var cityId = $("#addressData" + $("#addressListForOrder").val())
					.data("cityid");
			var iscity = $("#addressData" + $("#addressListForOrder").val())
					.data("iscity");

			if (iscity == 1) {
				document.getElementById("loaderimg").style.display = "block";

				var fd = new FormData();
				fd.append('cityId', cityId);
				fd.append('shopId', shopId);
				$
						.ajax({
							url : '${pageContext.request.contextPath}/getAgetListByShopId',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {

								var html = '<option value="0" selected>Select Agent</option>';

								for (var i = 0; i < response.length; i++) {

									html += '<option value="' + response[i].agentId + '">'
											+ response[i].agentName
											+ '</option>';

								}

								$('#placeCustAgent').html(html);
								$("#placeCustAgent").trigger("change");
								document.getElementById("loaderimg").style.display = "none";

							},
						});
			}
		}

		function editCustomer() {
			$('.fetch_results').find('input:text').val('');
			$('.fetch_results').find('textarea').val('');

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/editCustomer',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							document.getElementById("loaderimg").style.display = "none";
							//alert(JSON.stringify(response))
							$('#editCustomerModel').modal('show');

							$("#edit_custname").val(response.custName);
							$("#edit_mobileNo").val(response.phoneNumber);
							$("#edit_whatappno").val(response.whatsappNo);
							$("#edit_email").val(response.emailId);
							$("#edit_language").val(response.langId).trigger(
									'change');

						},
					});

		}

		function sumbitEditCust() {

			$("#error_edit_custname").hide();
			$("#error_edit_mobileNo").hide();
			$("#error_edit_whatappno").hide();
			$("#error_edit_email").hide();
			$("#error_edit_language").hide();

			var isError = false;
			if (!$("#edit_custname").val()) {
				isError = true;
				$("#error_edit_custname").show();
			}

			if (!$("#edit_language").val()) {
				isError = true;
				$("#error_edit_language").show();
			}
			if (!$("#edit_whatappno").val()
					|| !validateMobile($("#edit_whatappno").val())) {

				if (!$("#edit_whatappno").val()) {

				} else {
					isError = true;
					document.getElementById("error_whatappno").innerHTML = "* Invalid mobile no.";
					$("#error_edit_whatappno").show();
				}

			}
			if (!$("#edit_email").val()
					|| !validateEmail($("#edit_email").val())) {

				if (!$("#edit_email").val()) {

				} else {
					isError = true;
					document.getElementById("error_edit_email").innerHTML = "* Invalid email.";
					$("#error_edit_email").show();
				}

			}
			if (!isError) {
				document.getElementById("loaderimg").style.display = "block";
				var fd = new FormData();
				fd.append('edit_custname', $("#edit_custname").val());
				fd.append('edit_whatappno', $("#edit_whatappno").val());
				fd.append('edit_email', $("#edit_email").val());
				fd.append('edit_language', $("#edit_language").val());

				$
						.ajax({
							url : '${pageContext.request.contextPath}/sumbitEditCust',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {

								$('#editCustomerModel').modal('hide');

								$('#finalFailedMsg').hide();
								$('#finalSuccessMsg').hide();

								if (response.error == true) {
									document
											.getElementById("finalerrormsgcontent").innerHTML = "Error while update customer profile.";

									$('#finalFailedMsg').show();
								} else {
									document
											.getElementById("finalsuccessmsgcontent").innerHTML = "Profile updated Successfully.";
									$('#finalSuccessMsg').show();

								}
								document.getElementById("loaderimg").style.display = "none";
								displayCustomerInfo();
								$('.fetch_results').find('textarea').val('');
								$('.fetch_results').find('input:text').val('');
								setTimeout(function() {
									$('#finalFailedMsg').hide();
									$('#finalSuccessMsg').hide();
								}, 5000);
							},
						});

			}

		}

		function checkMobileNo() {

			var mobileNo = $("#mobileNo").val();

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			fd.append("mobileNo", mobileNo);

			$
					.ajax({
						url : '${pageContext.request.contextPath}/checkMobileNo',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							$("#error_mobileNo").hide();

							if (response.error == true) {
								$("#error_mobileNo").show();
								document.getElementById("error_mobileNo").innerHTML = "* "
										+ mobileNo + " is already register.";
								$("#mobileNo").val('');
							}
							document.getElementById("loaderimg").style.display = "none";
						},
					});

		}

		function displayCustomerInfo() {

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/displayCustomerInfo',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							if (response.customerInfo.custId != 0) {
								document.getElementById("profileCustName").innerHTML = response.customerInfo.custName;
								document.getElementById("profileMobileNo").innerHTML = response.customerInfo.phoneNumber;
								document.getElementById("profilewhatappNo").innerHTML = response.customerInfo.whatsappNo;
								document.getElementById("profileemail").innerHTML = response.customerInfo.emailId;
								document.getElementById("profilepreferredLang").innerHTML = response.customerInfo.langName;
								document.getElementById("profileDeliveryAdd").innerHTML = '' /*<span id="profileDeliveryAdd">*/
										+ '<a title="Add New Address" class="detail_btn_round" href="javascript:void(0)" onclick="addCustomerAdd()">'
										+ '<i class="fa fa-plus" aria-hidden="true"></i></a><a href="javascript:void(0)" title="Address List"'
										+ 'class="detail_btn_round" onclick="customerAddList()"><i class="fa fa-list" aria-hidden="true"></i></a>'
										+ ''; /*</span>*/
								document.getElementById("showPreferredLang").innerHTML = response.customerInfo.langName;
								document.getElementById("editCustomerSign").innerHTML = '<a href="javascript:void(0)" onclick="editCustomer()"><i class="fa fa-pencil" aria-hidden="true"></i></a>';

								sessionStorage
										.setItem(
												"previous_order_history",
												JSON
														.stringify(response.orderListByStatus));
								sessionStorage
										.setItem(
												"customer_grivience_history",
												JSON
														.stringify(response.grievienceList));
							} else {
								document.getElementById("finalerrormsgcontent").innerHTML = "Error while customer Registration";
								document.getElementById("profileCustName").innerHTML = "-";
								document.getElementById("profileMobileNo").innerHTML = "-";
								document.getElementById("profilewhatappNo").innerHTML = "-";
								document.getElementById("profileemail").innerHTML = "-";
								document.getElementById("profilepreferredLang").innerHTML = "-";
								document.getElementById("profileDeliveryAdd").innerHTML = "-";
								document.getElementById("showPreferredLang").innerHTML = "-";
								document.getElementById("editCustomerSign").innerHTML = '';
								var list = [];
								sessionStorage.setItem(
										"previous_order_history", JSON
												.stringify(list));
								sessionStorage.setItem(
										"customer_grivience_history", JSON
												.stringify(list));
							}
							getpreviousorderlist();
							document.getElementById("loaderimg").style.display = "none";
						},
					});

		}

		function addCustomerAdd() {
			$('.fetch_results').find('input:text').val('');
			$('.fetch_results').find('textarea').val('');
			$("#add_address_lable").html("Add Address");
			$("#addAddressDetailId").val(0);
			$('#addAddress').modal('show');

		}

		function showPreviousOrGrivienceTab(value) {

			$(".sticky-thead").css({
				"width" : "100%"
			});
			var active = document.querySelector(".act");
			active.classList.remove("act");

			if (value == 1) {
				$('#previousOrderTab').addClass("act");
				$('#previousOrderTabDiv').show();
				$('#grievencesTabDiv').hide();
			} else {
				$('#grievencesTab').addClass("act");
				$('#previousOrderTabDiv').hide();
				$('#grievencesTabDiv').show();
			}

		}

		function insertgrievences(orderId) {

			//document.getElementById("loaderimg").style.display = "block";
			var strhref = "${pageContext.request.contextPath}/grievences?orderId="
					+ orderId;
			$("#modalbody").load(strhref);
			$("#grievences").modal("show");
			$('#grievences').on('hidden.bs.modal', function() {
				$("#modalbody").html("");
				setTimeout(function() {
					$('#finalFailedMsg').hide();
					$('#finalSuccessMsg').hide();
				}, 5000);
				displayCustomerInfo();
			});
			//document.getElementById("loaderimg").style.display = "none";
		}

		function viewGrvDetailFun(grvId) {

			//document.getElementById("loaderimg").style.display = "block";
			var strhref = "${pageContext.request.contextPath}/viewGrvDetail?grvId="
					+ grvId;
			$("#grievencesDetailModalbody").load(strhref);
			$("#grievencesDetail").modal("show");
			$('#grievencesDetail').on('hidden.bs.modal', function() {
				$("#grievencesDetailModalbody").html("");
			});
			//document.getElementById("loaderimg").style.display = "none";
		}

		function repeateOrder(orderId, frId, addressId) {

			//document.getElementById("loaderimg").style.display = "block";
			var strhref = "${pageContext.request.contextPath}/selectOptionForRepeateOrder?orderId="
					+ orderId + "&frId=" + frId + "&addressId=" + addressId;
			$("#repeatmodalbody").load(strhref);
			$("#repeatOrderOption").modal("show");
			$('#repeatOrderOption').on('hidden.bs.modal', function() {
				$("#repeatmodalbody").html("");
				setTimeout(function() {
					$('#finalFailedMsg').hide();
					$('#finalSuccessMsg').hide();
				}, 5000);
			});
			//document.getElementById("loaderimg").style.display = "none";
		}
		function getpreviousorderlist() {

			$('#pendingGrivienceText').val('');
			$('#previousOrderText').val('');

			var previous_order_history = sessionStorage
					.getItem("previous_order_history");
			var table = $.parseJSON(previous_order_history);

			$("#previousOrderTabl tbody").empty();

			for (var i = 0; i < table.length; i++) {

				var action = '';

				var orderStatus = 'PARK ORDER';

				if (table[i].orderStatus == 1) {
					orderStatus = 'Shop Confirmation Pending';
					action = '<a href="javascript:void(0)" onclick="cancelOrderFun('
							+ table[i].orderId
							+ ',3)" class="detail_btn_round" title="Cancel Order"><i class="fa fa-times" aria-hidden="true"></i>'
							+ '</a>';
				} else if (table[i].orderStatus == 2) {
					orderStatus = 'Accept by shop';
					action = '<a href="javascript:void(0)" onclick="cancelOrderFun('
							+ table[i].orderId
							+ ',3)" class="detail_btn_round" title="Cancel Order"><i class="fa fa-times" aria-hidden="true"></i>'
							+ '</a>';
				} else if (table[i].orderStatus == 3) {
					orderStatus = 'Processing';
				} else if (table[i].orderStatus == 4) {
					orderStatus = 'Delivery Pending';
				} else if (table[i].orderStatus == 5) {
					orderStatus = 'Delivered';
				} else if (table[i].orderStatus == 6) {
					orderStatus = 'Reject By shop';
				} else if (table[i].orderStatus == 7) {
					orderStatus = 'Return';
				} else if (table[i].orderStatus == 8) {
					orderStatus = 'Cancelled';
				} else if (table[i].orderStatus == 9) {
					orderStatus = 'Online Payment Pending';
					action = '<a href="javascript:void(0)" onclick="cancelOrderFun('
							+ table[i].orderId
							+ ',3)" class="detail_btn_round" title="Cancel Order"><i class="fa fa-times" aria-hidden="true"></i>'
							+ '</a>';
				} else {
					action = '<a href="javascript:void(0)" onclick="cancelOrderFun('
							+ table[i].orderId
							+ ',3)" class="detail_btn_round" title="Cancel Order"><i class="fa fa-times" aria-hidden="true"></i>'
							+ '</a>';
				}

				var platform = 'Web';

				if (table[i].orderPlatform == 2) {
					platform = 'Mobile App';
				} else if (table[i].orderPlatform == 3) {
					platform = 'Website';
				}

				action = action
						+ '<a href="javascript:void(0)" onclick="insertgrievences('
						+ table[i].orderId
						+ ')" class="detail_btn_round" title="Grievences">'
						+ '<i class="fa fa-exclamation-triangle" aria-hidden="true"></i></a><a href="#" onclick=repeateOrder('
						+ table[i].orderId + ',' + table[i].frId + ','
						+ table[i].addressId
						+ ') class="detail_btn_round" title="Repeat Order">'
						+ '<i class="fa fa-repeat" aria-hidden="true"></i></a>'
				var tr_data = '<tr> <td class="user-name"><a href="javascript:void(0)" class="text-custom-white fw-500"> <img '+
				'src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg" class="rounded-circle" alt="userimg">'
						+ '</a></td> <td class="user-name"><strong><a href="javascript:void(0)" onclick="viewOrderFun('
						+ table[i].orderId
						+ ',3)">'
						+ table[i].orderNo
						+ '</a></strong></td>'
						+ '<td class="user-name">'
						+ table[i].frName
						+ '</td><td class="user-name" style="text-align: center;">'
						+ table[i].deliveryDate
						+ '</td><td class="user-name">'
						+ platform
						+ '</td> <td class="user-name" style="text-align: right;">'
						+ (table[i].totalAmt).toFixed(2)
						+ '</td>'
						+ '<td class="user-name"> <span class="paid">'
						+ orderStatus
						+ '</span></td> <td class="user-name" style="text-align: center; padding:0;">'
						+ action + '</td> </tr>';
				$('#previousOrderTabl').append(tr_data);
			}

			var customer_grivience_history = sessionStorage
					.getItem("customer_grivience_history");
			var griviencehistory = $.parseJSON(customer_grivience_history);

			$("#customerGrivienceTable tbody").empty();

			for (var i = 0; i < griviencehistory.length; i++) {

				var currentSts = 'Pending';

				if (griviencehistory[i].currentStatus == 1) {
					currentSts = 'Solved';
				}
				if (griviencehistory[i].currentStatus == 2) {
					currentSts = 'Damage';
				}

				var tr_data = '<tr> <td class="user-name" style="text-align: center;"><strong><a href="javascript:void(0)" onclick="viewGrvDetailFun('
						+ griviencehistory[i].grieveId
						+ ')">'
						+ griviencehistory[i].grievencceNo
						+ '</a></strong></td>'
						+ '<td class="user-name" style="text-align: center;"><strong><a href="javascript:void(0)" onclick="viewOrderFun('
						+ griviencehistory[i].orderId
						+ ',3)">'
						+ griviencehistory[i].orderNo
						+ '</a></strong></td><td class="user-name" style="text-align: center;">'
						+ griviencehistory[i].date
						+ '</td><td class="user-name" >'
						+ griviencehistory[i].grvInstrustion
						+ '</td><td class="user-name" style="text-align: center;"><span class="paid">'
						+ currentSts + '<span></td>  </tr>';
				$('#customerGrivienceTable').append(tr_data);
			}

		}
		function customerAddList() {

			$(".sticky-thead").css({
				"width" : "100%"
			});

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/getAddressListOfCustomer',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							document.getElementById("loaderimg").style.display = "none";
							$('#addressllist').modal('show');
							$("#addressListtbl tbody").empty();

							for (var i = 0; i < response.length; i++) {

								var action = '<a href="javascript:void(0)" class="detail_btn_round" title="Edit" onclick="editAddress('
										+ response[i].custAddressId
										+ ')"><i class="fa fa-pencil" aria-hidden="true">'
										+ '</i></a> '

								if (response.length > 1) {
									action = action
											+ '&nbsp;<a href="javascript:void(0)" class="detail_btn_round" title="Delete" onclick="deleteAddress('
											+ response[i].custAddressId
											+ ')"><i class="fa fa-times" aria-hidden="true"></i> </a>'
								}

								var tr_data = '<tr> <td class="user-name">'
										+ response[i].addressCaption
										+ '</td> <td class="user-name">'
										+ response[i].cityName
										+ '</td><td class="user-name">'
										+ response[i].landmark + '</td>'
										+ '<td class="user-name">'
										+ response[i].address
										+ '</td> <td class="user-name">'
										+ action + '</td> </tr>';
								$('#addressListtbl').append(tr_data);
							}

						},
					});

		}

		function deleteAddress(id) {
			if (confirm('Are you sure to delete address?')) {
				document.getElementById("loaderimg").style.display = "block";
				var fd = new FormData();
				fd.append('id', id);
				$
						.ajax({
							url : '${pageContext.request.contextPath}/deleteAddress',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {
								document.getElementById("loaderimg").style.display = "none";
								customerAddList();
							},
						});
			}
		}
		function editAddress(id) {

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			fd.append('id', id);
			$
					.ajax({
						url : '${pageContext.request.contextPath}/editAddress',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							$('.model_error_class').hide();
							$('.fetch_results').find('input:text').val('');
							$("#add_address_lable").html("Edit Address");
							$('#addressllist').modal('hide');
							$('#orderstep1').modal('hide');
							$('#addAddress').modal('show');

							$('#addAddressCity').val(response.cityId);
							$("#addAddressCity").trigger("change");
							$("#addressCation").val(response.addressCaption);
							$("#addAddressLandmark").val(response.landmark);
							$("#addAddressDeliveryAdd").val(response.address);
							$("#addAddressLatitude").val(response.latitude);
							$("#addAddressLongitude").val(response.longitude);
							$("#addAddressDetailId")
									.val(response.custAddressId);

							document.getElementById("loaderimg").style.display = "none";

						},
					});

		}

		function submitAddNewAddress() {

			$("#error_addressCaption").hide();
			$("#error_addAddressCity").hide();
			//$("#error_addAddressArea").hide();
			$("#error_addAddressLandmark").hide();
			$("#error_addAddressDeliveryAdd").hide();

			var isError = false;
			if (!$("#addressCation").val()) {
				isError = true;
				$("#error_addressCaption").show();
			}

			if (!$("#addAddressCity").val()) {
				isError = true;
				$("#error_addAddressCity").show();
			}

			var iscity = $("#cityDataAddReg" + $("#addAddressCity").val())
					.data("iscity");

			if (iscity == 0) {
				if (!$("#addAddressLandmark").val()) {
					isError = true;
					document.getElementById("error_addAddressLandmark").innerHTML = "* This filed required.";
					$("#error_addAddressLandmark").show();
				} else {
					if ($("#addAddressLatitude").val() == 0
							|| $("#addAddressLongitude").val() == 0) {
						isError = true;
						document.getElementById("error_addAddressLandmark").innerHTML = "* Invalid Address.";
						$("#addAddressLandmark").val('');
						$("#error_addAddressLandmark").show();
					}
				}
			}

			if (!$("#addAddressDeliveryAdd").val()) {
				isError = true;
				$("#error_addAddressDeliveryAdd").show();
			}

			if (!isError) {
				document.getElementById("loaderimg").style.display = "block";
				var fd = new FormData();
				fd.append('addressCation', $("#addressCation").val());
				fd.append('addAddressCity', $("#addAddressCity").val());
				fd.append('iscity', iscity);
				fd.append('addAddressLandmark', $("#addAddressLandmark").val());
				fd.append('addAddressDeliveryAdd', $("#addAddressDeliveryAdd")
						.val());
				fd.append('addAddressLatitude', $("#addAddressLatitude").val());
				fd.append('addAddressLongitude', $("#addAddressLongitude")
						.val());
				fd.append('addAddressDetailId', $("#addAddressDetailId").val());

				$
						.ajax({
							url : '${pageContext.request.contextPath}/submitAddNewAddress',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {
								document.getElementById("loaderimg").style.display = "none";
								$('#addAddress').modal('hide');

								$('#finalFailedMsg').hide();
								$('#finalSuccessMsg').hide();

								if (response.error == true) {
									document
											.getElementById("finalerrormsgcontent").innerHTML = "Error while add new address";

									$('#finalFailedMsg').show();
								} else {
									document
											.getElementById("finalsuccessmsgcontent").innerHTML = "New address successfully added";
									$('#finalSuccessMsg').show();

								}
								//$("#addAddressDeliveryAdd").val('');
								$('.fetch_results').find('textarea').val('');
								$('.fetch_results').find('input:text').val('');
								setTimeout(function() {
									$('#finalFailedMsg').hide();
									$('#finalSuccessMsg').hide();
								}, 5000);
							},
						});

				//document.getElementById("submtbtn").disabled = true;
				//end ajax send this to php page
			}

		}

		function sendOtpForCustomerRegistration() {

			$("#error_addcity").hide();
			$("#error_custname").hide();
			$("#error_mobileNo").hide();
			$("#error_email").hide();
			//$("#error_addarea").hide();
			$("#error_txtPlaces").hide();
			$("#error_address").hide();
			$("#error_language").hide();
			$("#error_addCustAgent").hide();
			$("#error_regorderDate").hide();
			$("#error_regorderTime").hide();
			$("#error_addShop").hide();
			var isError = false;

			if ($("#addShop").val() == "" || $("#addShop").val() == 0) {
				isError = true;
				$("#error_addShop").show();
			}
			if (!$("#regorderDate").val()) {
				isError = true;
				$("#error_regorderDate").show();
			}
			if (!$("#regorderTime").val()) {
				isError = true;
				$("#error_regorderTime").show();
			}
			if (!$("#custname").val()) {
				isError = true;
				$("#error_custname").show();
			}
			if (!$("#mobileNo").val() || !validateMobile($("#mobileNo").val())) {
				isError = true;
				if (!$("#mobileNo").val()) {
					document.getElementById("error_mobileNo").innerHTML = "* This field is required.";
				} else {
					document.getElementById("error_mobileNo").innerHTML = "* Invalid mobile no.";
				}

				$("#error_mobileNo").show();

			}
			if (!$("#email").val() || !validateEmail($("#email").val())) {

				if (!$("#email").val()) {

				} else {
					isError = true;
					document.getElementById("error_email").innerHTML = "* Invalid email.";
					$("#error_email").show();
				}

			}
			if (!$("#whatappno").val()
					|| !validateMobile($("#whatappno").val())) {

				if (!$("#whatappno").val()) {

				} else {
					isError = true;
					document.getElementById("error_whatappno").innerHTML = "* Invalid mobile no.";
					$("#error_whatappno").show();
				}

			}
			if (!$("#addcity").val()) {
				isError = true;
				$("#error_addcity").show();
				$("#error_addCustAgent").show();
				$("#error_txtPlaces").show();
			} else {
				if ($("#cityData" + $("#addcity").val()).data("iscity") == 1) {

					if ($("#addCustAgent").val() == ""
							|| $("#addCustAgent").val() == 0) {
						isError = true;
						$("#error_addCustAgent").show();
					}
				} else {
					if (!$("#txtPlaces").val()) {
						isError = true;
						$("#error_txtPlaces").show();
					}
				}
			}

			if (!$("#address").val()) {
				isError = true;
				$("#error_address").show();
			}
			if (!$("#language").val()) {
				isError = true;
				$("#error_language").show();
			}

			if (!isError) {
				document.getElementById("loaderimg").style.display = "block";
				var fd = new FormData();
				fd.append('custname', $("#custname").val());
				fd.append('mobileNo', $("#mobileNo").val());
				fd.append('email', $("#email").val());
				fd.append('whatappno', $("#whatappno").val());
				fd.append('addcity', $("#addcity").val());
				fd.append('iscity', $("#cityData" + $("#addcity").val()).data(
						"iscity"));
				fd.append('addShop', $("#addShop").val());
				fd.append('addCustAgent', $("#addCustAgent").val());
				fd.append('regorderDate', $("#regorderDate").val());
				fd.append('regorderTime', $("#regorderTime").val());
				fd.append('txtPlaces', $("#txtPlaces").val());
				fd.append('language', $("#language").val());
				fd.append('address', $("#address").val());
				fd.append('addLatitude', $("#addLatitude").val());
				fd.append('addLongitude', $("#addLongitude").val());

				$
						.ajax({
							url : '${pageContext.request.contextPath}/sendOtpCustRegistration',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {
								document.getElementById("loaderimg").style.display = "none";
								/* $('#addCustomer').modal('hide');
								$('#otpModel').modal('show');

								$('#otpFailedMsg').hide();
								$('#otpSuccessMsg').hide();

								if (response.error == true) {
									$('#otpFailedMsg').show();
									setTimeout(function() {
										$('#otpFailedMsg').hide();
										$('#otpSuccessMsg').hide();
									}, 5000);
								} else {
									$('#otpSuccessMsg').show();
								} */
								submitCustomerRegistration();

							},
						});

				//document.getElementById("submtbtn").disabled = true;
				//end ajax send this to php page
			}

		}

		function submitCustomerRegistration() {
			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/submitCustomerRegistration',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							$('#otpModel').modal('hide');

							$('#finalFailedMsg').hide();
							$('#finalSuccessMsg').hide();

							if (response.error == true) {
								document.getElementById("finalerrormsgcontent").innerHTML = "Error while customer Registration";
								$('#finalFailedMsg').show();
								document.getElementById("loaderimg").style.display = "none";
							} else {
								var url = '${pageContext.request.contextPath}/addOrder';
								window.location = url;

							}
							displayCustomerInfo();
							$('.fetch_results').find('textarea').val('');
							$('.fetch_results').find('input:text').val('');
							setTimeout(function() {
								$('#finalFailedMsg').hide();
								$('#finalSuccessMsg').hide();
							}, 5000);
						},
					});
		}
		function resendOTPregistration() {
			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/resendOTPregistration',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							document.getElementById("loaderimg").style.display = "none";
							$('#otpModel').modal('show');

							$('#otpFailedMsg').hide();
							$('#otpSuccessMsg').hide();

							if (response.error == true) {
								$('#otpFailedMsg').show();
							} else {
								$('#otpSuccessMsg').show();
							}

							setTimeout(function() {
								$('#otpFailedMsg').hide();
								$('#otpSuccessMsg').hide();
							}, 5000);
						},
					});
		}
		function getAreaListByCity(cityId, id) {
			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			fd.append('cityId', cityId);

			$
					.ajax({
						url : '${pageContext.request.contextPath}/getAreaListByCity',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							document.getElementById("loaderimg").style.display = "none";

							var html = '<option value="0">Select Area</option>';

							for (var i = 0; i < response.length; i++) {

								html += '<option value="' + response[i].areaId + '">'
										+ response[i].areaName + '</option>';

							}

							if (id == 1) {
								$('#addarea').html(html);
								$("#addarea").trigger("country:updated");
							} else if (id == 2) {
								$('#addAddressArea').html(html);
								$("#addAddressArea").trigger("country:updated");
							}

						},
					});
		}

		function getShopByCityId(cityId) {

			$('#txtPlaces').val('');
			document.getElementById("loaderimg").style.display = "block";
			var iscity = $("#cityData" + cityId).data("iscity");
			var fd = new FormData();
			fd.append('cityId', cityId);
			fd.append('iscity', iscity);
			$
					.ajax({
						url : '${pageContext.request.contextPath}/getShopByCityId',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							sessionStorage.setItem("frList", JSON
									.stringify(response.franchise));

							var html = '<option value="0" selected>Select Shop</option>';

							for (var i = 0; i < response.franchise.length; i++) {

								html += '<option value="' + response.franchise[i].frId + '">'
										+ response.franchise[i].frName
										+ '</option>';

							}

							$('#addShop').html(html);
							$("#addShop").trigger("change");
							document.getElementById("loaderimg").style.display = "none";
							// will return the number 123
							if (iscity == 1) {
								$("#landmarkDiv").hide();
								$("#agentDiv").show();
							} else {
								$("#landmarkDiv").show();
								$("#agentDiv").hide();
								var cityname = $("#cityData" + cityId).data(
										"cityname");
								$('#txtPlaces').val(cityname);
								document.getElementById("txtPlaces").focus();
							}
						},
					});
		}

		function lanmarkValidationForAddAdress(cityId) {
			var iscity = $("#cityDataAddReg" + cityId).data("iscity")
			$('#addAddressLandmark').val('');
			if (iscity == 1) {
				$('#addAddressLandMarkDiv').hide();
			} else {
				$('#addAddressLandMarkDiv').show(); 
				var cityname = $("#cityDataAddReg" + cityId).data("cityname"); 
				$('#addAddressLandmark').val(cityname);
				document.getElementById("addAddressLandmark").focus();
				
			}

		}

		function getAgetListByShopId(shopId) {

			var cityId = $("#addcity").val();
			var iscity = $("#cityData" + cityId).data("iscity");

			if (iscity == 1) {
				document.getElementById("loaderimg").style.display = "block";

				var fd = new FormData();
				fd.append('cityId', cityId);
				fd.append('shopId', shopId);
				$
						.ajax({
							url : '${pageContext.request.contextPath}/getAgetListByShopId',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {

								var html = '<option value="0" selected>Select Agent</option>';

								for (var i = 0; i < response.length; i++) {

									html += '<option value="' + response[i].agentId + '">'
											+ response[i].agentName
											+ '</option>';

								}

								$('#addCustAgent').html(html);
								$("#addCustAgent").trigger("change");
								document.getElementById("loaderimg").style.display = "none";

							},
						});
			}
		}

		function trim(el) {
			el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
			replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
			replace(/\n +/, "\n"); // Removes spaces after newlines

			return;
		}
		function validateMobile(mobile) {
			var mob = /^[1-9]{1}[0-9]{9}$/;

			if (mob.test($.trim(mobile)) == false) {

				return false;

			}
			return true;

		}
		function validateEmail(email) {

			var eml = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

			if (eml.test($.trim(email)) == false) {

				return false;

			}

			return true;

		}
		function addNewCustomerModel() {
			$('#addCustomer').modal('show');
			$('#mobileNo').val($('#mobileNoSearch').val()).trigger('change');

		}
		function changeHeadName(id) {

			$('#tableDive').show();

			$(".sticky-thead").css({
				"width" : "100%"
			});

			if (id == 0) {
				document.getElementById("pending_order_div").style.display = "block";
				document.getElementById("live_order_div").style.display = "none";
				document.getElementById("delivered_order_div").style.display = "none";
				document.getElementById("cancelled_order_div").style.display = "none";
				document.getElementById("payment_pending_order_div").style.display = "none";
			} else if (id == 1) {
				document.getElementById("pending_order_div").style.display = "none";
				document.getElementById("live_order_div").style.display = "block";
				document.getElementById("delivered_order_div").style.display = "none";
				document.getElementById("cancelled_order_div").style.display = "none";
				document.getElementById("payment_pending_order_div").style.display = "none";
			} else if (id == 2) {
				document.getElementById("pending_order_div").style.display = "none";
				document.getElementById("live_order_div").style.display = "none";
				document.getElementById("delivered_order_div").style.display = "block";
				document.getElementById("cancelled_order_div").style.display = "none";
				document.getElementById("payment_pending_order_div").style.display = "none";
			} else if (id == 3) {
				document.getElementById("pending_order_div").style.display = "none";
				document.getElementById("live_order_div").style.display = "none";
				document.getElementById("delivered_order_div").style.display = "none";
				document.getElementById("cancelled_order_div").style.display = "block";
				document.getElementById("payment_pending_order_div").style.display = "none";
			} else if (id == 4) {
				document.getElementById("pending_order_div").style.display = "none";
				document.getElementById("live_order_div").style.display = "block";
				document.getElementById("delivered_order_div").style.display = "none";
				document.getElementById("cancelled_order_div").style.display = "none";
				document.getElementById("payment_pending_order_div").style.display = "none";
			} else if (id == 5) {
				document.getElementById("pending_order_div").style.display = "none";
				document.getElementById("live_order_div").style.display = "none";
				document.getElementById("delivered_order_div").style.display = "none";
				document.getElementById("cancelled_order_div").style.display = "none";
				document.getElementById("payment_pending_order_div").style.display = "block";
			}

			$('#pendingOrderText').val('');
			$('#liveOrderText').val('');
			$('#deliverdOrderText').val('');
			$('#cancelOrOrderText').val('');
			searchPendingOrder();
			searchLiveOrder();
			searchDeliverdOrder();
			searchCancelOrder();
		}
		function addAddressfun() {
			$('#orderstep1').modal('hide');
			$('#orderstep2').modal('hide');
			$('#orderstep3').modal('hide');
			$('#orderstep4').modal('hide');
			$('#addAddress').modal('show');
		}
		function showHideDiv(id) {
			if (id == 2) {

				document.getElementById("orderstep1").style.display = "none";
				document.getElementById("orderstep2").style.display = "block";
				document.getElementById("orderstep3").style.display = "none";
				document.getElementById("orderstep4").style.display = "none";
			}
		}
		function changeStep(id) {

			var isError = false;

			$("#error_addressListForOrder").hide();
			$("#error_frIdForOrder").hide();
			$("#error_orderTime").hide();
			$("#error_orderDate").hide();
			$("#error_placeCustAgent").hide();

			var agentId = 0;

			var iscity = $("#addressData" + $("#addressListForOrder").val())
					.data("iscity");

			if (iscity == 1) {
				if (!$("#placeCustAgent").val()
						|| $("#placeCustAgent").val() == 0) {
					isError = true;
					$("#error_placeCustAgent").show();
				} else {
					agentId = $("#placeCustAgent").val();
				}
			}
			if (!$("#addressListForOrder").val()
					|| $("#addressListForOrder").val() == 0) {
				isError = true;
				$("#error_addressListForOrder").show();
			}
			if (!$("#frIdForOrder").val() || $("#frIdForOrder").val() == 0) {
				isError = true;
				$("#error_frIdForOrder").show();
			}
			if (!$("#orderTime").val()) {
				isError = true;
				$("#error_orderTime").show();
			}
			if (!$("#orderDate").val()) {
				isError = true;
				$("#error_orderDate").show();
			}
			if (!isError) {
				document.getElementById("loaderimg").style.display = "block";
				var fd = new FormData();
				fd.append('addressId', $("#addressListForOrder").val());
				fd.append('frIdForOrder', $("#frIdForOrder").val());
				fd.append('orderTime', $("#orderTime").val());
				fd.append('orderDate', $("#orderDate").val());
				fd.append('placeCustAgent', agentId);
				fd.append('iscity', iscity);
				$
						.ajax({
							url : '${pageContext.request.contextPath}/orderProcess',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {
								//document.getElementById("loaderimg").style.display = "none";
								var url = '${pageContext.request.contextPath}/addOrder';
								window.location = url;
							},
						});
			}
			/* $('#modal_step1').modal('hide'); */
		}

		function viewOrderFun(orderId, type) {

			$('#viewOrder').modal('show');
			$(".sticky-thead").css({
				"width" : "100%"
			});

			var list;
			if (type == 1) {
				var liveOrderList = sessionStorage.getItem("liveOrderList");
				var table = $.parseJSON(liveOrderList);
				list = table.orderListByStatus;
			} else if (type == 2) {
				var liveOrderList = sessionStorage.getItem("liveOrderList");
				var table = $.parseJSON(liveOrderList);
				list = table.orderListByStatusAndDate;
			} else if (type == 3) {
				var previous_order_history = sessionStorage
						.getItem("previous_order_history");
				var list = $.parseJSON(previous_order_history);
			}

			//console.log(list);

			for (var i = 0; i < list.length; i++) {

				if (list[i].orderId == orderId) {

					//alert(JSON.stringify(list[i].trailList));

					$("#order_no").html(list[i].orderNo);
					$("#order_customer_name").html(list[i].custName);
					$("#order_shop_name").html(list[i].frName);

					var orderStatus = 'PARK ORDER';

					if (list[i].orderStatus == 1) {
						orderStatus = 'Shop Confirmation Pending';
					} else if (list[i].orderStatus == 2) {
						orderStatus = 'Accept by shop';
					} else if (list[i].orderStatus == 3) {
						orderStatus = 'Processing';
					} else if (list[i].orderStatus == 4) {
						orderStatus = 'Delivery Pending';
					} else if (list[i].orderStatus == 5) {
						orderStatus = 'Delivered';
					} else if (list[i].orderStatus == 6) {
						orderStatus = 'Reject By shop';
					} else if (list[i].orderStatus == 7) {
						orderStatus = 'Return';
					} else if (list[i].orderStatus == 8) {
						orderStatus = 'Cancelled';
					} else if (list[i].orderStatus == 9) {
						orderStatus = 'Online Payment Pending';
					}

					$("#order_status_view").html(orderStatus);
					$("#order_data_time").html(
							list[i].orderDate + ' ' + list[i].deliveryTime);
					$("#order_tatal").html((list[i].totalAmt).toFixed(2));

					var platform = 'Web';
					var paymentSts = 'PENDING';

					if (list[i].orderPlatform == 2) {
						platform = 'Mobile App';
					} else if (list[i].orderPlatform == 3) {
						platform = 'Website';
					}

					if (list[i].paidStatus == 1) {
						paymentSts = 'PAID';
					}

					var paymentMethod = "COD";

					if (list[i].paymentMethod == 2) {
						paymentMethod = 'Online';
					}

					$("#order_payment_Status").html(paymentSts);
					$("#order_payment_method").html(paymentMethod);
					$("#order_type").html(platform);

					$("#order_view_detail tbody").empty();

					for (var j = 0; j < list[i].detailList.length; j++) {
						var tr_data = '<tr> <td class="user-name">'
								+ list[i].detailList[j].itemName
								+ '</td> <td class="user-name">'
								+ list[i].detailList[j].remark
								+ '</td>'
								+ '<td class="user-name" style="text-align: right;"><span>'
								+ list[i].detailList[j].rate
								+ '</span></td><td class="user-name" style="text-align: right;">'
								+ list[i].detailList[j].qty
								+ '</td>'
								+ ' <td class="user-name" style="text-align: right;">'
								+ (list[i].detailList[j].totalAmt).toFixed(2)
								+ '</td> </tr>';
						$('#order_view_detail').append(tr_data);
					}
					$("#view_item_total").html((list[i].taxableAmt).toFixed(2));
					$("#view_tax_total").html((list[i].taxAmt).toFixed(2));
					$("#view_disc_total").html((list[i].discAmt).toFixed(2));
					$("#view_deliverycharge_total").html(
							(list[i].deliveryCharges).toFixed(2));
					$("#view_fianl_total").html((list[i].totalAmt).toFixed(2));

					$("#order_view_trail tbody").empty();

					for (var j = 0; j < list[i].trailList.length; j++) {

						var actionStatus = 'PARK ORDER';

						if (list[i].trailList[j].status == 1) {
							actionStatus = 'Apply Order';
						} else if (list[i].trailList[j].status == 2) {
							actionStatus = 'Accept Order by Shop';
						} else if (list[i].trailList[j].status == 3) {
							actionStatus = 'Accept Order For Process By Shop';
						} else if (list[i].trailList[j].status == 4) {
							actionStatus = 'Order Processing Completed By Shop';
						} else if (list[i].trailList[j].status == 5) {
							actionStatus = 'Delivered';
						} else if (list[i].trailList[j].status == 6) {
							actionStatus = 'Rejected By shop';
						} else if (list[i].trailList[j].status == 7) {
							actionStatus = 'Return';
						} else if (list[i].trailList[j].status == 8) {
							actionStatus = 'Cancelled';
						}

						var tr_data = '<tr> <td class="user-name">'
								+ actionStatus + '</td> <td class="user-name">'
								+ list[i].trailList[j].actionUserName + '</td>'
								+ '<td class="user-name"  ><span>'
								+ list[i].trailList[j].actionDateTime
								+ '</span></td><td class="user-name"  ><span>'
								+ list[i].trailList[j].exVar1
								+ '</span></td></tr>';
						$('#order_view_trail').append(tr_data);
					}

					break;
				}
			}

		}

		function cancelOrderFun(orderId, type) {

			$('#cancelOrder').modal('show');
			$(".sticky-thead").css({
				"width" : "100%"
			});

			var list;
			if (type == 1) {
				var liveOrderList = sessionStorage.getItem("liveOrderList");
				var table = $.parseJSON(liveOrderList);
				list = table.orderListByStatus;
			} else if (type == 2) {
				var liveOrderList = sessionStorage.getItem("liveOrderList");
				var table = $.parseJSON(liveOrderList);
				list = table.orderListByStatusAndDate;
			} else if (type == 3) {
				var previous_order_history = sessionStorage
						.getItem("previous_order_history");
				var list = $.parseJSON(previous_order_history);
			}

			//console.log(list);

			for (var i = 0; i < list.length; i++) {

				if (list[i].orderId == orderId) {
					$("#cancel_order_no").html(list[i].orderNo);
					$("#cancel_order_customer_name").html(list[i].custName);
					$("#cancel_order_shop_name").html(list[i].frName);

					var orderStatus = 'PARK ORDER';

					if (list[i].orderStatus == 1) {
						orderStatus = 'Shop Confirmation Pending';
					} else if (list[i].orderStatus == 2) {
						orderStatus = 'Accept by shop';
					} else if (list[i].orderStatus == 3) {
						orderStatus = 'Processing';
					} else if (list[i].orderStatus == 4) {
						orderStatus = 'Delivery Pending';
					} else if (list[i].orderStatus == 5) {
						orderStatus = 'Delivered';
					} else if (list[i].orderStatus == 6) {
						orderStatus = 'Reject By shop';
					} else if (list[i].orderStatus == 7) {
						orderStatus = 'Return';
					} else if (list[i].orderStatus == 8) {
						orderStatus = 'Cancelled';
					} else if (list[i].orderStatus == 9) {
						orderStatus = 'Online Payment Pending';
					}

					$("#cancel_order_status_view").html(orderStatus);
					$("cancel_order_data_time").html(
							list[i].orderDate + ' ' + list[i].deliveryTime);
					$("#cancel_order_tatal")
							.html((list[i].totalAmt).toFixed(2));

					var platform = 'Web';
					var paymentSts = 'PENDING';

					if (list[i].orderPlatform == 2) {
						platform = 'Mobile App';
					} else if (list[i].orderPlatform == 3) {
						platform = 'Website';
					}

					if (list[i].paidStatus == 1) {
						paymentSts = 'PAID';
					}

					var paymentMethod = "COD";

					if (list[i].paymentMethod == 2) {
						paymentMethod = 'Online';
					}

					$("#cancel_order_payment_Status").html(paymentSts);
					$("#cancel_order_payment_method").html(paymentMethod);
					$("#cancel_order_type").html(platform);

					$("#order_cancel_detail tbody").empty();

					for (var j = 0; j < list[i].detailList.length; j++) {
						var tr_data = '<tr> <td class="user-name">'
								+ list[i].detailList[j].itemName
								+ '</td> <td class="user-name">'
								+ list[i].detailList[j].remark
								+ '</td>'
								+ '<td class="user-name" style="text-align: right;"><span>'
								+ list[i].detailList[j].rate
								+ '</span></td><td class="user-name" style="text-align: right;">'
								+ list[i].detailList[j].qty
								+ '</td>'
								+ ' <td class="user-name" style="text-align: right;">'
								+ (list[i].detailList[j].totalAmt).toFixed(2)
								+ '</td> </tr>';
						$('#order_cancel_detail').append(tr_data);
					}
					$("#cancel_item_total").html(
							(list[i].taxableAmt).toFixed(2));
					$("#cancel_tax_total").html((list[i].taxAmt).toFixed(2));
					$("#cancel_disc_total").html((list[i].discAmt).toFixed(2));
					$("#cancel_deliverycharge_total").html(
							(list[i].deliveryCharges).toFixed(2));
					$("#cancel_fianl_total")
							.html((list[i].totalAmt).toFixed(2));
					sessionStorage.setItem("cancel_order_id", list[i].orderId);
					break;
				}
			}

		}

		function placeOrderFun(orderId) {

			var fd = new FormData();
			document.getElementById("loaderimg").style.display = "block";
			fd.append("orderId", orderId);

			$
					.ajax({
						url : '${pageContext.request.contextPath}/parkOrderToPlaceOrder',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							sessionStorage.setItem("cartValue", JSON
									.stringify(response));
							var url = '${pageContext.request.contextPath}/addOrder';
							window.location = url;
						},
					});

		}
	</script>
	<!--Plugin Initialization-->
	<script type="text/javascript">
		function calculateDistance(latitude, longitude, type) {

			var bounds = new google.maps.LatLngBounds;

			var origin1 = {
				lat : latitude,
				lng : longitude
			};

			var waypts = [];

			var frList = sessionStorage.getItem("frList");
			var list = $.parseJSON(frList);
			var newFrList = [];

			for (var i = 0; i < list.length; i++) {
				var data_add = {
					lat : parseFloat(list[i].fromLatitude),
					lng : parseFloat(list[i].fromLongitude)
				}
				waypts.push(data_add);
			}

			//console.log(waypts);

			var geocoder = new google.maps.Geocoder;
			var service = new google.maps.DistanceMatrixService;
			service
					.getDistanceMatrix(
							{
								origins : [ origin1 ],
								destinations : waypts,
								travelMode : 'DRIVING',
								unitSystem : google.maps.UnitSystem.METRIC,
								avoidHighways : false,
								avoidTolls : false
							},
							function(response, status) {

								// alert(JSON.stringify(response))

								if (status !== 'OK') {
									alert('Error was: ' + status);
								} else {

									var html = '<option value="0" selected>Select Shop</option>';
									var originList = response.originAddresses;
									var destinationList = response.destinationAddresses;

									var results = response.rows[0].elements;

									for (var j = 0; j < results.length; j++) {

										try {
											var km = (parseFloat((results[j].distance.value) / 1000))
													.toFixed(2);
											list[j].km = km;
											if (km <= parseFloat(list[j].kmAreaCovered)) {
												html += '<option value="' + list[j].frId + '">'
														+ list[j].frName
														+ ' - '
														+ list[j].km
														+ ' KM</option>';
											}
											newFrList.push(list[j]);

										} catch (err) {

										}

									}
									sessionStorage.setItem("frList", JSON
											.stringify(newFrList));
									if (type == 1) {
										$('#addShop').html(html);
										$("#addShop").trigger("change");
									} else if (type == 2) {
										$('#frIdForOrder').html(html);
										$("#frIdForOrder").trigger("change");
									} else if (type == 3) {
										$('#frIdForRepeatOrder').html(html);
										$("#frIdForRepeatOrder").trigger(
												"change");
									}

								}
							});

		}

		google.maps.event
				.addDomListener(
						window,
						'load',
						function() {
							var places = new google.maps.places.Autocomplete(
									document.getElementById('txtPlaces'),
									{
										fields : [ "name", "geometry.location",
												"place_id", "formatted_address" ]
									});
							places.setFields([ "name", "geometry.location",
									"place_id", "formatted_address" ]);
							google.maps.event
									.addListener(
											places,
											'place_changed',
											function() {
												document
														.getElementById("error_txtPlaces").style.display = "none";
												var place = places.getPlace();

												console.log(place);
												try {
													var address = place.formatted_address;
													var latitude = place.geometry.location
															.lat();
													var longitude = place.geometry.location
															.lng();
													document
															.getElementById("addLatitude").value = latitude;
													document
															.getElementById("addLongitude").value = longitude;
													calculateDistance(latitude,
															longitude, 1);

												} catch (err) {

													document
															.getElementById("txtPlaces").value = "";
													document
															.getElementById("addLatitude").value = 0;
													document
															.getElementById("addLongitude").value = 0;
													document
															.getElementById("error_txtPlaces").innerHTML = "* Invalid Address.";
													document
															.getElementById("error_txtPlaces").style.display = "block";

												}

											});

							var landmark = new google.maps.places.Autocomplete(
									document
											.getElementById('addAddressLandmark'),
									{
										fields : [ "name", "geometry.location",
												"place_id", "formatted_address" ]
									});
							landmark.setFields([ "name", "geometry.location",
									"place_id", "formatted_address" ]);
							google.maps.event
									.addListener(
											landmark,
											'place_changed',
											function() {
												document
														.getElementById("error_addAddressLandmark").style.display = "none";
												var pls = landmark.getPlace();

												try {
													var address = pls.formatted_address;
													var latitude = pls.geometry.location
															.lat();
													var longitude = pls.geometry.location
															.lng();
													document
															.getElementById("addAddressLatitude").value = latitude;
													document
															.getElementById("addAddressLongitude").value = longitude;
												} catch (err) {

													document
															.getElementById("addAddressLandmark").value = "";
													document
															.getElementById("addAddressLatitude").value = 0;
													document
															.getElementById("addAddressLongitude").value = 0;
													document
															.getElementById("error_addAddressLandmark").innerHTML = "* Invalid Address.";
													document
															.getElementById("error_addAddressLandmark").style.display = "block";

												}

											});

						});
	</script>
	<script>
		/* $(function() {
			$('.datepicker').datepicker({
				dateFormat : 'dd-mm-yy'
			}).value;
		}); */
		$('.cleardiv').click(function(e) {
			$('#error_cancel_remark').hide();
			$('.model_error_class').hide();
			$('.fetch_results').find('input:text').val('');
			$('.fetch_results').find('textarea').val('');

			$('#addLatitude').val(0);
			$('#addLongitude').val(0);

			$('#addAddressLatitude').val(0);
			$('#addAddressLongitude').val(0);

			document.getElementById("sameMoNo").checked = false;
		});
	</script>
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
		$(document).ready(function() {
			setTimeout(function() {
				$('.error-msg').hide();
				$('.success-msg').hide();
			}, 3000);

			sessionStorage.removeItem("cartValue");
			sessionStorage.removeItem("allItemList");
			displayCustomerInfo();
			//getLiveList();
		});

		dbrefObject.on('value', function(snapshot) {
			displayCustomerInfo();
			getLiveList();
		});

		function getLiveList() {

			var fd = new FormData();

			$
					.ajax({
						url : '${pageContext.request.contextPath}/getLiveList',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(data) {

							sessionStorage.setItem("liveOrderList", JSON
									.stringify(data));

							var response = data.orderListByStatus;
							var responseByDate = data.orderListByStatusAndDate;

							$("#pending_order_table tbody").empty();
							$("#live_order_table tbody").empty();
							$("#payment_pending_order_table tbody").empty();

							var park_count = 0;
							var shop_pending_count = 0;
							var accept_count = 0;
							var process_count = 0;
							var delivery_pending_count = 0;
							var payment_pending_count = 0;

							for (var i = 0; i < response.length; i++) {

								var actionBtn = '';

								var platform = 'Web';
								var paymentSts = 'PENDING';
								var orderStatus = 'PARK ORDER';

								if (response[i].orderPlatform == 2) {
									platform = 'Mobile App';
								} else if (response[i].orderPlatform == 3) {
									platform = 'Website';
								}

								if (response[i].paidStatus == 1) {
									paymentSts = 'PAID';
								}

								if (response[i].orderStatus == 1) {
									orderStatus = 'Shop Confirmation Pending';
									actionBtn = '<a href="javascript:void(0)"'
											+ 'class="detail_btn_round" title="Cancel Order" onclick="cancelOrderFun('
											+ response[i].orderId
											+ ',1)"><i class="fa fa-times" aria-hidden="true"></i> </a>&nbsp;';
								} else if (response[i].orderStatus == 2) {
									orderStatus = 'Accept by shop';
									actionBtn = '<a href="javascript:void(0)"'
											+ 'class="detail_btn_round" title="Cancel Order" onclick="cancelOrderFun('
											+ response[i].orderId
											+ ',1)"><i class="fa fa-times" aria-hidden="true"></i> </a>&nbsp;';
								} else if (response[i].orderStatus == 3) {
									orderStatus = 'Processing';
								} else if (response[i].orderStatus == 4) {
									orderStatus = 'Delivery Pending';
								} else if (response[i].orderStatus == 9) {
									orderStatus = 'Online Payment Pending';
									actionBtn = '<a href="javascript:void(0)"'
											+ 'class="detail_btn_round" title="Cancel Order" onclick="cancelOrderFun('
											+ response[i].orderId
											+ ',1)"><i class="fa fa-times" aria-hidden="true"></i> </a>&nbsp;';
								} else {
									actionBtn = '<a href="javascript:void(0)"'
											+ 'class="detail_btn_round" title="Place Order" onclick="placeOrderFun('
											+ response[i].orderId
											+ ')"><i class="fa fa-shopping-cart"></i></a>&nbsp;<a href="javascript:void(0)"'
											+ 'class="detail_btn_round" title="Cancel Order" onclick="cancelOrderFun('
											+ response[i].orderId
											+ ',1)"><i class="fa fa-times" aria-hidden="true"></i> </a>&nbsp;';
								}

								actionBtn = actionBtn
										+ '<a href="javascript:void(0)" '
										+ 'onclick="insertgrievences('
										+ response[i].orderId
										+ ')" class="detail_btn_round" title="Grievences">'
										+ '<i class="fa fa-exclamation-triangle" aria-hidden="true"></i></a>';

								var tr_data = '<tr> <td class="user-name"><a href="javascript:void(0)" class="text-custom-white fw-500"> '
										+ '<img src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg" '+
								'class="rounded-circle user_pic_round" alt="userimg"> </a></td> <td class="user-name"><strong>'
										+ '<a href="javascript:void(0)" onclick="viewOrderFun('
										+ response[i].orderId
										+ ',1)">'
										+ response[i].orderNo
										+ '</a></strong></td>'
										+ '<td class="user-name">'
										+ response[i].custName
										+ '</td> <td class="user-name">'
										+ response[i].frName
										+ '</td>'
										+ '<td class="user-name" style="text-align: center;">'
										+ response[i].orderDate
										+ '</td><td class="user-name">'
										+ platform
										+ '</td>'
										+ '<td class="user-name" style="text-align: right;">'
										+ (response[i].totalAmt).toFixed(2)
										+ '</td> <td class="user-name">'
										+ paymentSts
										+ '</td>'
										+ '<td class="user-name"><span class="paid">'
										+ orderStatus
										+ '</span></td> <td class="user-name" style="text-align: center;">'
										+ actionBtn + '</td> </tr>';

								if (response[i].orderStatus == 1) {
									shop_pending_count = shop_pending_count + 1;
									$('#pending_order_table').append(tr_data);
								} else if (response[i].orderStatus == 2) {
									accept_count = accept_count + 1;
									$('#live_order_table').append(tr_data);
								} else if (response[i].orderStatus == 3) {
									process_count = process_count + 1;
									$('#live_order_table').append(tr_data);
								} else if (response[i].orderStatus == 4) {
									delivery_pending_count = delivery_pending_count + 1;
									$('#live_order_table').append(tr_data);
								} else if (response[i].orderStatus == 9) {
									payment_pending_count = payment_pending_count + 1;
									$('#payment_pending_order_table').append(
											tr_data);
								} else {
									park_count = park_count + 1;
									$('#pending_order_table').append(tr_data);
								}

							}
							$('#shop_pending_count').html(shop_pending_count);
							$('#accept_count').html(accept_count);
							$('#process_count').html(process_count);
							$('#delivery_pending_count').html(
									delivery_pending_count);
							$('#park_count').html(park_count);
							$('#online_payment_pending_order').html(
									payment_pending_count);
							// by date	

							var delivered_count = 0;
							var rejected_count = 0;
							var return_count = 0;
							var cancelled_count = 0;

							$("#cancelled_order_table tbody").empty();
							$("#delivered_order_table tbody").empty();
							for (var i = 0; i < responseByDate.length; i++) {

								var platform = 'Web';
								var paymentSts = 'PENDING';
								var orderStatus = 'Delivered';

								if (responseByDate[i].orderPlatform == 2) {
									platform = 'Mobile App';
								} else if (responseByDate[i].orderPlatform == 3) {
									platform = 'Website';
								}

								if (responseByDate[i].paidStatus == 1) {
									paymentSts = 'PAID';
								}

								if (responseByDate[i].orderStatus == 6) {
									orderStatus = 'Reject By shop';
								} else if (responseByDate[i].orderStatus == 7) {
									orderStatus = 'Return';
								} else if (responseByDate[i].orderStatus == 8) {
									orderStatus = 'Cancelled';
								}

								var tr_data = '<tr> <td class="user-name"><a href="javascript:void(0)" class="text-custom-white fw-500"> '
										+ '<img src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg" '+
								'class="rounded-circle user_pic_round" alt="userimg"> </a></td> <td class="user-name"><strong>'
										+ '<a href="javascript:void(0)" onclick="viewOrderFun('
										+ responseByDate[i].orderId
										+ ',2)">'
										+ responseByDate[i].orderNo
										+ '</a></strong></td>'
										+ '<td class="user-name">'
										+ responseByDate[i].custName
										+ '</td> <td class="user-name">'
										+ responseByDate[i].frName
										+ '</td>'
										+ '<td class="user-name" style="text-align: center;">'
										+ responseByDate[i].orderDate
										+ '</td><td class="user-name">'
										+ platform
										+ '</td>'
										+ '<td class="user-name" style="text-align: right;">'
										+ (responseByDate[i].totalAmt)
												.toFixed(2)
										+ '</td> <td class="user-name"> '
										+ paymentSts
										+ '</td>'
										+ '<td class="user-name"><span class="paid">'
										+ orderStatus
										+ '</span></td> <td class="user-name" style="text-align: center;">'
										+ '<a href="javascript:void(0)" onclick="insertgrievences('
										+ responseByDate[i].orderId
										+ ')"  class="detail_btn_round" title="Grievences">'
										+ '<i class="fa fa-exclamation-triangle" aria-hidden="true"></i></a></td> </tr>';

								if (responseByDate[i].orderStatus == 6) {
									rejected_count = rejected_count + 1;
									$('#cancelled_order_table').append(tr_data);
								} else if (responseByDate[i].orderStatus == 7) {
									return_count = return_count + 1;
									$('#cancelled_order_table').append(tr_data);
								} else if (responseByDate[i].orderStatus == 8) {
									cancelled_count = cancelled_count + 1;
									$('#cancelled_order_table').append(tr_data);
								} else {
									delivered_count = delivered_count + 1;
									$('#delivered_order_table').append(tr_data);
								}

							}
							$('#delivered_count').html(delivered_count);
							$('#cancelled_count').html(cancelled_count);
							$('#return_count').html(return_count);
							$('#rejected_count').html(rejected_count);
							//alert(JSON.stringify(response))
						},
					});

			/* $('#modal_step1').modal('hide'); */
		}

		$(document)
				.ready(
						function($) {

							$("#findCustomerByMobileNo")
									.submit(
											function(e) {

												$(
														'#error_findCustomerByMobileNo')
														.hide();
												var mobileNo = $(
														"#mobileNoSearch")
														.val();

												document
														.getElementById("loaderimg").style.display = "block";
												var fd = new FormData();
												fd.append("mobileNo", mobileNo);

												$
														.ajax({
															url : '${pageContext.request.contextPath}/findCustomerByMobileNo',
															type : 'post',
															dataType : 'json',
															data : fd,
															contentType : false,
															processData : false,
															success : function(
																	response) {

																/* alert(JSON
																		.stringify(response)) */
																if (response.error == true) {
																	$(
																			'#tableDive')
																			.hide();

																} else {

																	$(
																			'#error_findCustomerByMobileNo')
																			.show();
																	setTimeout(
																			function() {
																				$(
																						'#error_findCustomerByMobileNo')
																						.hide();
																			},
																			5000);
																	addNewCustomerModel();
																}
																displayCustomerInfo();
																document
																		.getElementById("loaderimg").style.display = "none";

																return false;
															},
														});
												return false;
											});

							$("#submitCancelForm")
									.submit(
											function(e) {

												$('#error_cancel_remark')
														.hide();
												var isError = false;
												if ($("#cancel_remark").val() == "") {
													isError = true;
													$('#error_cancel_remark')
															.show();
												}

												if (!isError) {

													$('#popupheading').html(
															"Cancel Order ?");
													$('#confirm').modal({
														backdrop : 'static',
														keyboard : false
													});

													$(".submitmodel")
															.unbind()
															.click(
																	function() {

																		var order_id = sessionStorage
																				.getItem("cancel_order_id");
																		document
																				.getElementById("loaderimg").style.display = "block";
																		var fd = new FormData();
																		fd
																				.append(
																						"cancel_remark",
																						$(
																								"#cancel_remark")
																								.val());
																		fd
																				.append(
																						"order_id",
																						order_id);
																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/submitCancelOrder',
																					type : 'post',
																					dataType : 'json',
																					data : fd,
																					contentType : false,
																					processData : false,
																					success : function(
																							response) {
																						$(
																								'#confirm')
																								.modal(
																										'hide');
																						$(
																								'#cancelOrder')
																								.modal(
																										'hide');
																						if (response.error == false) {

																							var db = firebase
																									.database();
																							db
																									.ref(
																											today_date_temp
																													+ "/"
																													+ response.message
																													+ "/status")
																									.set(
																											8);

																							document
																									.getElementById("finalsuccessmsgcontent").innerHTML = "Order Cancel Successfully";
																							$(
																									'#finalSuccessMsg')
																									.show();

																						} else {
																							document
																									.getElementById("finalFailedMsg").innerHTML = "Error while Canceling Order.";
																							$(
																									'#finalFailedMsg')
																									.show();
																						}
																						document
																								.getElementById("loaderimg").style.display = "none";
																						setTimeout(
																								function() {
																									$(
																											'#finalFailedMsg')
																											.hide();
																									$(
																											'#finalSuccessMsg')
																											.hide();
																								},
																								5000);
																						return false;
																					},
																				});
																		return false;
																	});
													return false;
												}
												return false;
											});

						});
	</script>


	<script>
		function searchPendingOrder() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("pendingOrderText");
			filter = input.value.toUpperCase();
			table = document.getElementById("pending_order_table");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
		function searchLiveOrder() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("liveOrderText");
			filter = input.value.toUpperCase();
			table = document.getElementById("live_order_table");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
		function searchDeliverdOrder() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("deliverdOrderText");
			filter = input.value.toUpperCase();
			table = document.getElementById("delivered_order_table");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		function searchCancelOrder() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("cancelOrOrderText");
			filter = input.value.toUpperCase();
			table = document.getElementById("cancelled_order_table");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
		function searchPreviousOrder() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("previousOrderText");
			filter = input.value.toUpperCase();
			table = document.getElementById("previousOrderTabl");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		function searchPendingGrivience() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("pendingGrivienceText");
			filter = input.value.toUpperCase();
			table = document.getElementById("customerGrivienceTable");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		function searchPaymentPendingOrder() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("paymentPendingOrderText");
			filter = input.value.toUpperCase();
			table = document.getElementById("payment_pending_order_table");
			tr = table.getElementsByTagName("tr");
			for (i = 1; i < tr.length; i++) {
				td = tr[i];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		function sameMobileNo() {

			if (document.getElementById("sameMoNo").checked == true) {

				$("#whatappno").val($("#mobileNo").val());
			} else {
				$("#whatappno").val('');
			}

		}
	</script>
</body>

</html>
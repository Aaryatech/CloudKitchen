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
<%-- <link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css"
	rel="stylesheet" type="text/css" /> --%>
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
				<form action="" method="get">

					<div class="success-msg" style="display: none;"
						id="finalSuccessMsg">
						<i class="fa fa-check"></i><span id="finalsuccessmsgcontent">
							Success Message</span>
					</div>
					<div class="error-msg" style="display: none;" id="finalFailedMsg">
						<i class="fa fa-times-circle"></i> <span id="finalerrormsgcontent">Error
							message.</span>
					</div>

					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="input_one">
								<input name="" type="text" class="input_no"
									placeholder="Customer Mobile Number " /> <i
									class="fa fa-mobile mobile" aria-hidden="true"></i>
								<button type="submit" value="Submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</div>
							<span style="color: red;">* Mobile no. is not register.</span>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="input_one">
								<input name="" type="text" class="input_no"
									placeholder="Search by Order Number" /> <i
									class="fa fa-check mobile check" aria-hidden="true"></i>
								<button type="submit" value="Submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</div>
							<span style="color: red;">* Order no. not found.</span>
						</div>

						<div class="col-lg-3 col-md-6 col-sm-6" id="preferredLangDiv">
							<label class="prefered fs-14">Preferred Language : <Span
								id="showPreferredLang">${customer.langName}</Span></label>
						</div>

						<div class="col-lg-3 sec_title right_btn">
							<a href="javascript:void(0)" data-toggle="modal"
								data-target="#addCustomer" href="#" class="order_btn"> New
								Customer Registration</a>
						</div>
					</div>
				</form>
			</div>

			<!--dashboard 5 boxes -->
			<div class="dashboard_count">
				<ul>
					<li>
						<div class="dash_one dash_common">
							<h3 class="dash_txt">
								Today Call <span>12,345</span>
							</h3>
							<i class="fa fa-phone" aria-hidden="true"></i>
						</div>
					</li>
					<li><a href="#" onclick="changeHeadName(1)">
							<div class="dash_two dash_common">
								<h3 class="dash_txt">
									Today Live <span>12,345</span>
								</h3>
								<i class="fa fa-user" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" onclick="changeHeadName(2)"><div
								class="dash_three dash_common">
								<h3 class="dash_txt">
									Today delivered <span>12,345</span>
								</h3>
								<i class="fa fa-check" aria-hidden="true"></i>
							</div></a></li>
					<li><a href="#" onclick="changeHeadName(3)"><div
								class="dash_four dash_common">
								<h3 class="dash_txt">
									Today Cancelled <span>12,345</span>
								</h3>
								<i class="fa fa-times" aria-hidden="true"></i>
							</div></a></li>
					<li>
						<div class="dash_five dash_common">
							<h3 class="dash_txt">
								Grievences
								<div class="grievence">
									<div class="grievence_one">
										Pending <span>123</span>
									</div>
									<div class="grievence_one">
										Resolve <span>123</span>
									</div>
								</div>
							</h3>
							<i class="fa fa-repeat" aria-hidden="true"></i>
						</div>
					</li>
				</ul>
			</div>

			<!--Live orderes table -->
			<div class="main-box padding-20 margin_bottom">
				<div class="sec_title" id="tableHeaderName">Live Orders</div>

				<div class="component">
					<table class="overflow-y">
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
								<th class="sorting_desc" style="text-align: center;">Payment
									Method</th>
								<th class="sorting_desc" style="text-align: center;">Action</th>
							</tr>
						</thead>
						<tbody>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle user_pic_round" alt="userimg">
								</a></td>
								<td class="user-name"><strong><a
										href="javascript:void(0)" onclick="viewOrderFun()">0001</a></strong></td>
								<td class="user-name">Neal Matthews 1</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Web</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">Online</td>
								<td class="user-name" style="text-align: center;"><a
									href="${pageContext.request.contextPath}/checkout"
									class="detail_btn_round" title="Edit Order"><i
										class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp; <a
									href="javascript:void(0)" data-toggle="modal"
									data-target="#cancelOrder" class="detail_btn_round"
									title="Cancel Order"><i class="fa fa-times"
										aria-hidden="true"></i> </a>&nbsp;<a href="javascript:void(0)"
									data-toggle="modal" data-target="#grievences"
									class="detail_btn_round" title="Grievences"><i
										class="fa fa-exclamation-triangle" aria-hidden="true"></i></a></td>

							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle" alt="userimg">
								</a></td>
								<td class="user-name"><strong><a
										href="javascript:void(0)" data-toggle="modal"
										data-target="#viewOrder">0001</a></strong></td>
								<td class="user-name">Neal Matthews 1</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Web</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">Online</td>
								<td class="user-name" style="text-align: center;"><a
									href="${pageContext.request.contextPath}/checkout"
									class="detail_btn_round" title="Edit Order"><i
										class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp; <a
									href="javascript:void(0)" data-toggle="modal"
									data-target="#cancelOrder" class="detail_btn_round"
									title="Cancel Order"><i class="fa fa-times"
										aria-hidden="true"></i> </a>&nbsp;<a href="javascript:void(0)"
									data-toggle="modal" data-target="#grievences"
									class="detail_btn_round" title="Grievences"><i
										class="fa fa-exclamation-triangle" aria-hidden="true"></i></a></td>

							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle user_pic_round" alt="userimg">
								</a></td>
								<td class="user-name"><strong><a
										href="javascript:void(0)" data-toggle="modal"
										data-target="#viewOrder">0001</a></strong></td>
								<td class="user-name">Neal Matthews 1</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Web</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">Online</td>
								<td class="user-name" style="text-align: center;"><a
									href="${pageContext.request.contextPath}/checkout"
									class="detail_btn_round" title="Edit Order"><i
										class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp; <a
									href="javascript:void(0)" data-toggle="modal"
									data-target="#cancelOrder" class="detail_btn_round"
									title="Cancel Order"><i class="fa fa-times"
										aria-hidden="true"></i> </a>&nbsp;<a href="javascript:void(0)"
									data-toggle="modal" data-target="#grievences"
									class="detail_btn_round" title="Grievences"><i
										class="fa fa-exclamation-triangle" aria-hidden="true"></i></a></td>

							</tr>

						</tbody>
					</table>


				</div>

			</div>

			<!-- -->
			<div class="row margin_bottom">
				<div class="col-lg-4">
					<div class="main-box padding-20 marg_mob">
						<div class="edit_prof">
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/profile_img.jpg"
								alt="">
						</div>
						<div class="profile_title">
							<div class="profile_title_l">Customer Profile</div>
							<div class="profile_title_r">
								<a href="javascript:void(0)" onclick="editCustomer()"><i
									class="fa fa-pencil" aria-hidden="true"></i></a>


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
										class="fa fa-plus" aria-hidden="true"></i></a>&nbsp;<a
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
						<div class="sec_title">
							previous orders History <a href="javascript:void(0)"
								data-toggle="modal" data-target="#orderstep1" href="#"
								class="order_btn">New Order Booking</a>
						</div>

						<div class="component">
							<table class="overflow-y">
								<thead>
									<tr>

										<th></th>
										<th class="sorting_desc" style="text-align: center;">Order
											NO.</th>

										<th class="sorting_desc" style="text-align: center;">Shop
											Name</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Date</th>
										<th class="sorting_desc js-sort-date"
											style="text-align: center;">Type</th>
										<th class="sorting_desc" style="text-align: center;">Amount</th>
										<th class="sorting_desc" style="text-align: center;">
											Status</th>
										<th class="sorting_desc" style="text-align: center;">Action</th>
									</tr>
								</thead>
								<tbody>
									<!--1 row-->
									<tr>
										<td class="user-name"><a href="#"
											class="text-custom-white fw-500"> <img
												src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
												class="rounded-circle" alt="userimg">
										</a></td>
										<td class="user-name"><strong><a
												href="javascript:void(0)" data-toggle="modal"
												data-target="#viewOrder">0001</a></strong></td>
										<td class="user-name">Shop No. 1</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Live</td>

										<td class="user-name"><a
											href="${pageContext.request.contextPath}/checkout"
											class="detail_btn_round" title="Edit Order"><i
												class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp; <a
											href="javascript:void(0)" data-toggle="modal"
											data-target="#cancelOrder" class="detail_btn_round"
											title="Cancel Order"><i class="fa fa-times"
												aria-hidden="true"></i> </a>&nbsp;<a href="javascript:void(0)"
											data-toggle="modal" data-target="#grievences"
											class="detail_btn_round" title="Grievences"><i
												class="fa fa-exclamation-triangle" aria-hidden="true"></i></a>&nbsp;<a
											href="#" class="detail_btn_round" title="Repeat Order"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><a href="#"
											class="text-custom-white fw-500"> <img
												src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
												class="rounded-circle" alt="userimg">
										</a></td>
										<td class="user-name"><strong><a
												href="javascript:void(0)" data-toggle="modal"
												data-target="#viewOrder">0001</a></strong></td>
										<td class="user-name">Shop No. 1</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Live</td>

										<td class="user-name"><a
											href="${pageContext.request.contextPath}/checkout"
											class="detail_btn_round" title="Edit Order"><i
												class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp; <a
											href="javascript:void(0)" data-toggle="modal"
											data-target="#cancelOrder" class="detail_btn_round"
											title="Cancel Order"><i class="fa fa-times"
												aria-hidden="true"></i> </a>&nbsp;<a href="javascript:void(0)"
											data-toggle="modal" data-target="#grievences"
											class="detail_btn_round" title="Grievences"><i
												class="fa fa-exclamation-triangle" aria-hidden="true"></i></a>&nbsp;<a
											href="#" class="detail_btn_round" title="Repeat Order"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>



								</tbody>
							</table>


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
									class="frm_inpt numbersOnly" onchange="trim(this)"
									id="mobileNo" maxlength="10" placeholder="Customer Mobile No." />
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
									name="" type="checkbox" class="frm_inpt" style="width: 30%" />
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
							<span>Select Delivery City *</span>
							<div class="search_multiple">
								<select class="country" id="addcity" name="addcity"
									onchange="getAreaListByCity(this.value,1)">
									<option value="">Select City</option>
									<c:forEach items="${cityList}" var="cityList">
										<option value="${cityList.cityId}">${cityList.cityName}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_addcity">* This field required.</span>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Delivery Area *</span>
							<div class="search_multiple">
								<select class="country" id="addarea" name="addarea">
									<!-- <option value="">Select Area</option>
									<option value="1" data-name="">Nashik Road</option>
									<option value="2" data-name="">Canada Corner</option> -->
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_addarea">* This field required.</span>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Landmark *</span> <input name="txtPlaces" type="text"
								class="frm_inpt" id="txtPlaces" placeholder="Landmark" /><input
								name="addLatitude" type="hidden" class="frm_inpt"
								id="addLatitude" /><input name="addLongitude" type="hidden"
								class="frm_inpt" id="addLongitude" />
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_txtPlaces">* This field required.</span>
					</div>
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
										<option value="${languageList.langId}">${languageList.langName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_language">* This field required.</span>
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

	<div class="modal fade kot-popup fetch_results" id="editCustomer"
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
									class="frm_inpt numbersOnly" onchange="trim(this)"
									id="mobileNo" maxlength="10" placeholder="Customer Mobile No." />
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
									name="" type="checkbox" class="frm_inpt" style="width: 30%" />
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
							<span>Select Delivery City *</span>
							<div class="search_multiple">
								<select class="country" id="addcity" name="addcity"
									onchange="getAreaListByCity(this.value,1)">
									<option value="">Select City</option>
									<c:forEach items="${cityList}" var="cityList">
										<option value="${cityList.cityId}">${cityList.cityName}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_addcity">* This field required.</span>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Delivery Area *</span>
							<div class="search_multiple">
								<select class="country" id="addarea" name="addarea">
									<!-- <option value="">Select Area</option>
									<option value="1" data-name="">Nashik Road</option>
									<option value="2" data-name="">Canada Corner</option> -->
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_addarea">* This field required.</span>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Landmark *</span> <input name="txtPlaces" type="text"
								class="frm_inpt" id="txtPlaces" placeholder="Landmark" /><input
								name="addLatitude" type="hidden" class="frm_inpt"
								id="addLatitude" /><input name="addLongitude" type="hidden"
								class="frm_inpt" id="addLongitude" />
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_txtPlaces">* This field required.</span>
					</div>
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
										<option value="${languageList.langId}">${languageList.langName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<span style="color: red; display: none;" class="model_error_class"
							id="error_language">* This field required.</span>
					</div>
					<div class="pop_btn_row">
						<input id="addnewcustomer" type="button" value="Submit"
							class="next_btn" onclick="sendOtpForCustomerRegistration()" />
					</div>
				</form>
			</div>


		</div>
	</div>

	<div class="modal fade kot-popup" id="orderstep1">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/restro_icn.png"
						alt=""> New Order <span>About our latest restaurent
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
									title="Add New Address"><i class="fa fa-plus"
										aria-hidden="true"></i></a></span>
								<div class="search_multiple">
									<select class="country">
										<option value="" selected>Select Address</option>
										<option value="Shop 1" data-name="">Home</option>
										<option value="Shop 2" data-name="">Shop</option>

									</select>
								</div>


							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Shop</span>
								<div class="search_multiple">
									<select class="country">
										<option value="">Select Shop</option>
										<option value="Shop 1" data-name="">Shop 1 - 5 KM</option>
										<option value="Shop 2" data-name="">Shop 2 - 5 KM</option>
										<option value="Shop 3" data-name="">Shop 3 - 5 KM</option>
										<option value="Shop 4" data-name="">Shop 4 - 5 KM</option>
										<option value="Shop 5" data-name="">Shop 5 - 5 KM</option>
										<option value="Shop 6" data-name="">Shop 6 - 5 KM</option>
									</select>
								</div>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Date</span> <input type="text" id="datepicker1"
									name="datepicker1" class="frm_inpt datepicker">
							</div>
						</div>

						<div class="single_row">
							<div class="pop_frm_one">
								<input name="" type="time" class="frm_inpt" />
							</div>
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
				<div class="grievences_tab">
					<ul>
						<li><label class="radio_one"> <input type="radio"
								class="option-input radio" name="example" checked /> Grievance
						</label></li>
						<li><label class="radio_one"> <input type="radio"
								class="option-input radio" name="example" /> Appreciation
						</label></li>

					</ul>
				</div>


				<div class="view_order_list">

					<ul>
						<li>
							<div class="pop_txt_l">Order No.</div>
							<div class="pop_txt_r">: 0001</div>
						</li>
						<li>
							<div class="pop_txt_l">Customer Name</div>
							<div class="pop_txt_r">: Neal Matthews 1</div>
						</li>
						<li>
							<div class="pop_txt_l">Shop Name</div>
							<div class="pop_txt_r">: Madhavi</div>
						</li>
						<!-- <li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								<span class="paid">Paid</span>
							</div>
						</li> -->

						<li>
							<div class="pop_txt_l">Order Status</div>
							<div class="pop_txt_r">Going To Delivered</div>
						</li>
						<li>
							<div class="pop_txt_l">Date & Time</div>
							<div class="pop_txt_r">: 10-07-2020 11:00 AM</div>
						</li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">: 440 /-</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								: <span class="paid">Paid</span>
							</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Method</div>
							<div class="pop_txt_r">: COD</div>
						</li>
						<li>
							<div class="pop_txt_l">Order Type</div>
							<div class="pop_txt_r">: Web</div>
						</li>
					</ul>
				</div>
				<br>


				<div class="component">
					<table class="overflow-y">
						<thead>
							<tr>
								<th class="sorting_desc">Name</th>
								<th class="sorting_desc">UOM</th>
								<th class="sorting_desc">Rate</th>
								<th class="sorting_desc js-sort-date">Quantity</th>
								<th class="sorting_desc">Tax %</th>
								<th class="sorting_desc">Total</th>

							</tr>
						</thead>
						<tbody>
							<!--1 row-->
							<tr>
								<td class="user-name">Biryani</td>
								<td class="user-name"><strong>KG</strong></td>
								<td class="user-name"><span class="paid">400</span></td>
								<td class="user-name"><strong>1</strong></td>
								<td class="user-name">18%</td>
								<td class="user-name">400</td>
							</tr>
							<!--1 row-->

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
								: <span style="float: right;">440.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Tax</div>
							<div class="pop_txt_r">
								: <span style="float: right;">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Offer Disc AMT</div>
							<div class="pop_txt_r">
								: <span style="float: right;">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Delivery Charges</div>
							<div class="pop_txt_r">
								: <span style="float: right;">30.00</span>
							</div>
						</li>
						<li></li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;">440.00</span>
							</div>
						</li>
					</ul>
				</div>

				<div class="form_one extra_marg">
					<form action="" method="get">
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Grievance Type</span>
								<div class="search_multiple">
									<select class="country">
										<option value="">Select Option</option>
										<option value="1">Packing Damage</option>
										<option value="4">Other</option>
									</select>
								</div>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Remark</span>
								<textarea name="" cols="" rows="" class="frm_inpt"
									placeholder="Remark"></textarea>
							</div>
						</div>
						<div>
							<input name="" type="button" value="Submit" class="next_btn" />
						</div>
						<!-- class="pop_btn_row"-->
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="cancelOrder"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<!--modal-md-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Cancel Order</div>


				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li>
							<div class="pop_txt_l">Order No.</div>
							<div class="pop_txt_r">: 0001</div>
						</li>
						<li>
							<div class="pop_txt_l">Customer Name</div>
							<div class="pop_txt_r">: Neal Matthews 1</div>
						</li>
						<li>
							<div class="pop_txt_l">Shop Name</div>
							<div class="pop_txt_r">: Madhavi</div>
						</li>
						<!-- <li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								<span class="paid">Paid</span>
							</div>
						</li> -->

						<li>
							<div class="pop_txt_l">Order Status</div>
							<div class="pop_txt_r">Going To Delivered</div>
						</li>
						<li>
							<div class="pop_txt_l">Date & Time</div>
							<div class="pop_txt_r">: 10-07-2020 11:00 AM</div>
						</li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">: 440 /-</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								: <span class="paid">Paid</span>
							</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Method</div>
							<div class="pop_txt_r">: COD</div>
						</li>
						<li>
							<div class="pop_txt_l">Order Type</div>
							<div class="pop_txt_r">: Web</div>
						</li>
					</ul>
				</div>
				<br>


				<div class="component">
					<table class="overflow-y">
						<thead>
							<tr>
								<th class="sorting_desc">Name</th>
								<th class="sorting_desc">UOM</th>
								<th class="sorting_desc">Rate</th>
								<th class="sorting_desc js-sort-date">Quantity</th>
								<th class="sorting_desc">Tax %</th>
								<th class="sorting_desc">Total</th>

							</tr>
						</thead>
						<tbody>
							<!--1 row-->
							<tr>
								<td class="user-name">Biryani</td>
								<td class="user-name"><strong>KG</strong></td>
								<td class="user-name"><span class="paid">400</span></td>
								<td class="user-name"><strong>1</strong></td>
								<td class="user-name">18%</td>
								<td class="user-name">400</td>
							</tr>
							<!--1 row-->

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
								: <span style="float: right;">440.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Tax</div>
							<div class="pop_txt_r">
								: <span style="float: right;">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Offer Disc AMT</div>
							<div class="pop_txt_r">
								: <span style="float: right;">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Delivery Charges</div>
							<div class="pop_txt_r">
								: <span style="float: right;">30.00</span>
							</div>
						</li>
						<li></li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;">440.00</span>
							</div>
						</li>
					</ul>
				</div>

				<div class="form_one extra_marg">
					<form action="" method="get">
						<div class="single_row">
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
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Remark</span>
								<textarea name="" cols="" rows="" class="frm_inpt"
									placeholder="Remark"></textarea>
							</div>
						</div>
						<div>
							<input name="" type="button" value="Submit" class="next_btn" />
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
							<div class="pop_txt_l">Order No.</div>
							<div class="pop_txt_r">: 0001</div>
						</li>
						<li>
							<div class="pop_txt_l">Customer Name</div>
							<div class="pop_txt_r">: Neal Matthews 1</div>
						</li>
						<li>
							<div class="pop_txt_l">Shop Name</div>
							<div class="pop_txt_r">: Madhavi</div>
						</li>
						<!-- <li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								<span class="paid">Paid</span>
							</div>
						</li> -->

						<li>
							<div class="pop_txt_l">Order Status</div>
							<div class="pop_txt_r">Going To Delivered</div>
						</li>
						<li>
							<div class="pop_txt_l">Date & Time</div>
							<div class="pop_txt_r">: 10-07-2020 11:00 AM</div>
						</li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">: 440 /-</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Status</div>
							<div class="pop_txt_r">
								: <span class="paid">Paid</span>
							</div>
						</li>
						<li>
							<div class="pop_txt_l">Payment Method</div>
							<div class="pop_txt_r">: COD</div>
						</li>
						<li>
							<div class="pop_txt_l">Order Type</div>
							<div class="pop_txt_r">: Web</div>
						</li>
					</ul>
				</div>
				<br>


				<div class="component">
					<table class="overflow-y" id="printtable3">
						<thead>
							<tr>
								<th class="sorting_desc">Name</th>
								<th class="sorting_desc">UOM</th>
								<th class="sorting_desc">Rate</th>
								<th class="sorting_desc js-sort-date">Quantity</th>
								<th class="sorting_desc">Tax %</th>
								<th class="sorting_desc">Total</th>

							</tr>
						</thead>
						<tbody>

							<tr>
								<td class="user-name">Biryani</td>
								<td class="user-name"><strong>KG</strong></td>
								<td class="user-name"><span class="paid">400</span></td>
								<td class="user-name"><strong>1</strong></td>
								<td class="user-name">18%</td>
								<td class="user-name">400</td>
							</tr>

							<tr>
								<td class="user-name">Biryani</td>
								<td class="user-name"><strong>KG</strong></td>
								<td class="user-name"><span class="paid">400</span></td>
								<td class="user-name"><strong>1</strong></td>
								<td class="user-name">18%</td>
								<td class="user-name">400</td>
							</tr>




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
								: <span style="float: right;">440.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Tax</div>
							<div class="pop_txt_r">
								: <span style="float: right;">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Offer Disc AMT</div>
							<div class="pop_txt_r">
								: <span style="float: right;">00.00</span>
							</div>
						</li>
						<li></li>
						<li>
							<div class="pop_txt_l">Delivery Charges</div>
							<div class="pop_txt_r">
								: <span style="float: right;">30.00</span>
							</div>
						</li>
						<li></li>
						<li class="total">
							<div class="pop_txt_l">Total</div>
							<div class="pop_txt_r">
								: <span style="float: right;">440.00</span>
							</div>
						</li>
					</ul>
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
								<span>Select Delivery City *</span>
								<div class="search_multiple">
									<select class="country" name="addAddressCity"
										id="addAddressCity" onchange="getAreaListByCity(this.value,2)">
										<option value="">Select City</option>
										<c:forEach items="${cityList}" var="cityList">
											<option value="${cityList.cityId}">${cityList.cityName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<span style="color: red; display: none;"
								class="model_error_class" id="error_addAddressCity">*
								This field required.</span>
						</div>

						<div class="single_row">
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
						</div>
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
								<th class="sorting_desc">Caption</th>
								<th class="sorting_desc">City</th>
								<th class="sorting_desc">Area</th>
								<th class="sorting_desc">Landmark</th>
								<th class="sorting_desc">Address</th>
								<th class="sorting_desc">Action</th>
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
	<!-- <script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&libraries=places"></script> -->
	<script type="text/javascript">
		function addCustomerAdd() {
			$('.fetch_results').find('input:text').val('');
			$('.fetch_results').find('textarea').val('');
			$("#add_address_lable").html("Add Address");
			$("#addAddressDetailId").val(0);
			$('#addAddress').modal('show');

		}
		function customerAddList() {

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
										+ '</i></a>&nbsp;<a href="javascript:void(0)" class="detail_btn_round" title="Delete" onclick="deleteAddress('
										+ response[i].custAddressId
										+ ')"><i class="fa fa-times" aria-hidden="true"></i> </a>'
								var tr_data = '<tr> <td class="user-name">'
										+ response[i].addressCaption
										+ '</td> <td class="user-name">'
										+ response[i].cityName + '</td>'
										+ '<td class="user-name">'
										+ response[i].areaName
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
							$('#addAddress').modal('show');

							fd = new FormData();
							$
									.ajax({
										url : '${pageContext.request.contextPath}/getCityList',
										type : 'post',
										dataType : 'json',
										data : fd,
										contentType : false,
										processData : false,
										success : function(cityList) {

											var html = '';

											for (var i = 0; i < cityList.length; i++) {

												if (cityList[i].cityId == response.cityId) {
													html += '<option value="' + cityList[i].cityId + '" selected>'
															+ cityList[i].cityName
															+ '</option>';
												} else {
													html += '<option value="' + cityList[i].cityId + '">'
															+ cityList[i].cityName
															+ '</option>';
												}

											}
											$("#addAddressCity").val(
													response.cityId).trigger(
													'change');
											var fd = new FormData();
											fd
													.append('cityId',
															response.cityId);

											$
													.ajax({
														url : '${pageContext.request.contextPath}/getAreaListByCity',
														type : 'post',
														dataType : 'json',
														data : fd,
														contentType : false,
														processData : false,
														success : function(
																areaList) {
															document
																	.getElementById("loaderimg").style.display = "none";

															html = '<option value="0">Select Area</option>';

															for (var i = 0; i < areaList.length; i++) {

																if (areaList[i].areaId == response.areaId) {
																	html += '<option value="' + areaList[i].areaId + '" selected>'
																			+ areaList[i].areaName
																			+ '</option>';
																} else {
																	html += '<option value="' + areaList[i].areaId + '">'
																			+ areaList[i].areaName
																			+ '</option>';
																}

															}

															$('#addAddressArea')
																	.html(html);
															$("#addAddressArea")
																	.val(
																			response.areaId)
																	.trigger(
																			'change');

															$("#addressCation")
																	.val(
																			response.addressCaption);
															$(
																	"#addAddressLandmark")
																	.val(
																			response.landmark);
															$(
																	"#addAddressDeliveryAdd")
																	.val(
																			response.address);
															$(
																	"#addAddressLatitude")
																	.val(
																			response.latitude);
															$(
																	"#addAddressLongitude")
																	.val(
																			response.longitude);
															$(
																	"#addAddressDetailId")
																	.val(
																			response.custAddressId);

															document
																	.getElementById("loaderimg").style.display = "none";
														},
													});

										},
									});

						},
					});

		}
		/* $('#addAddressArea').on('change', function(e, data) {
			alert(JSON.stringify(data.somedata));
		}); */
		function submitAddNewAddress() {

			$("#error_addressCaption").hide();
			$("#error_addAddressCity").hide();
			$("#error_addAddressArea").hide();
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
			if (!$("#addAddressArea").val() || $("#addAddressArea").val() == 0) {
				isError = true;
				$("#error_addAddressArea").show();
			}
			if (!$("#addAddressLandmark").val()) {
				isError = true;
				$("#error_addAddressLandmark").show();
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
				fd.append('addAddressArea', $("#addAddressArea").val());
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
			$("#error_addarea").hide();
			$("#error_txtPlaces").hide();
			$("#error_address").hide();
			$("#error_language").hide();
			var isError = false;
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
			}
			if (!$("#addarea").val() || $("#addarea").val() == 0) {
				isError = true;
				$("#error_addarea").show();
			}
			if (!$("#txtPlaces").val()) {
				isError = true;
				$("#error_txtPlaces").show();
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
				fd.append('addarea', $("#addarea").val());
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
								$('#addCustomer').modal('hide');
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
							document.getElementById("loaderimg").style.display = "none";
							$('#otpModel').modal('hide');

							$('#finalFailedMsg').hide();
							$('#finalSuccessMsg').hide();

							if (response.error == true) {
								document.getElementById("finalerrormsgcontent").innerHTML = "Error while customer Registration";
								document.getElementById("profileCustName").innerHTML = "-";
								document.getElementById("profileMobileNo").innerHTML = "-";
								document.getElementById("profilewhatappNo").innerHTML = "-";
								document.getElementById("profileemail").innerHTML = "-";
								document.getElementById("profilepreferredLang").innerHTML = "-";
								document.getElementById("profileDeliveryAdd").innerHTML = "-";
								document.getElementById("showPreferredLang").innerHTML = "-";

								$('#finalFailedMsg').show();
							} else {
								document
										.getElementById("finalsuccessmsgcontent").innerHTML = "Customer Registration Successfully Completed";
								$('#finalSuccessMsg').show();
								document.getElementById("profileCustName").innerHTML = response.custName;
								document.getElementById("profileMobileNo").innerHTML = response.phoneNumber;
								document.getElementById("profilewhatappNo").innerHTML = response.whatsappNo;
								document.getElementById("profileemail").innerHTML = response.emailId;
								document.getElementById("profilepreferredLang").innerHTML = response.langName;
								document.getElementById("profileDeliveryAdd").innerHTML = '<span id="profileDeliveryAdd">'
										+ '<a title="Add New Address" class="detail_btn_round" href="javascript:void(0)" onclick="addCustomerAdd()">'
										+ '<i class="fa fa-plus" aria-hidden="true"></i></a>&nbsp;<a href="javascript:void(0)" title="Address List"'
										+ 'class="detail_btn_round" onclick="customerAddList()"><i class="fa fa-list" aria-hidden="true"></i></a>'
										+ '</span>';
								document.getElementById("showPreferredLang").innerHTML = response.langName;

							}
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
		function changeHeadName(id) {
			var msg = "Live Orders ";
			if (id == 2) {
				msg = "Deliverd Orders ";
			} else if (id == 3) {
				msg = "Cancelled Orders ";
			}
			document.getElementById("tableHeaderName").innerHTML = msg;
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

			if (id == 2) {
				$('#orderstep1').modal('hide');
				$('#orderstep2').modal('show');
				$('#orderstep3').modal('hide');
				$('#orderstep4').modal('hide');
			} else if (id == 3) {
				$('#orderstep1').modal('hide');
				$('#orderstep2').modal('hide');
				$('#orderstep3').modal('show');
				$('#orderstep4').modal('hide');
			} else if (id == 4) {
				$('#orderstep1').modal('hide');
				$('#orderstep2').modal('hide');
				$('#orderstep3').modal('hide');
				$('#orderstep4').modal('show');
			} else if (id == 5) {
				$('#orderstep1').modal('hide');
				$('#orderstep2').modal('hide');
				$('#orderstep3').modal('hide');
				$('#orderstep4').modal('hide');
				var url = '${pageContext.request.contextPath}/addOrder';
				window.location = url;
			}
			/* $('#modal_step1').modal('hide'); */
		}

		function viewOrderFun() {

			$('#viewOrder').modal('show');
			$(".sticky-thead").css({
				"width" : "100%"
			});
			/* $("#printtable3 tbody").empty();
			 
			var tr_data = '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';

			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';

			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			tr_data = tr_data
					+ '<tr> <td class="user-name">Biryani</td> <td class="user-name"><strong>KG</strong></td>'
					+ '<td class="user-name"><span class="paid">400</span></td><td class="user-name"><strong>1</strong></td>'
					+ '<td class="user-name">18%</td> <td class="user-name">400</td> </tr>';
			$('#printtable3').append(tr_data); */

		}
	</script>
	<!--Plugin Initialization-->
	<script type="text/javascript">
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
		$(function() {
			$('.datepicker').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
		$('.cleardiv').click(function(e) {
			$('.model_error_class').hide();
			$('.fetch_results').find('input:text').val('');
			$('.fetch_results').find('textarea').val('');
		});
	</script>
</body>

</html>
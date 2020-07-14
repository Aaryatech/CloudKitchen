<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Bootstrap -->


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%-- <link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css"
	rel="stylesheet" type="text/css" /> --%>
<body>


	<section class="final-order section-padding bg-light-grey">
		<div class="container-fluid">


			<!--top-search-->
			<div class="main-box padding-20  margin_bottom">
				<form action="" method="get">

					<div class="success-msg">
						<i class="fa fa-check"></i> Success Message
					</div>
					<div class="error-msg">
						<i class="fa fa-times-circle"></i> Error message.
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
						<div class="sec_title">
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

				<div class="component1">
					<table class="one" width="100%" id="demo2">
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
									href="javascript:void(0)" data-toggle="modal"
									data-target="#grievences" class="detail_btn">Grievences</a>&nbsp;
									<a href="javascript:void(0)" data-toggle="modal"
									data-target="#cancelOrder" class="detail_btn"
									title="Cancel Order"><i class="fa fa-times"
										aria-hidden="true"></i> </a>&nbsp;<a
									href="${pageContext.request.contextPath}/checkout"
									class="detail_btn" title="Edit Order"><i
										class="fa fa-pencil" aria-hidden="true"></i></a></td>

							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle" alt="userimg">
								</a></td>
								<td class="user-name"><strong>0002</strong></td>
								<td class="user-name">Neal Matthews 2</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Web</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">COD</td>
								<td class="user-name" style="text-align: center;"><a
									href="#" class="detail_btn">View Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle" alt="userimg">
								</a></td>
								<td class="user-name"><strong>0003</strong></td>
								<td class="user-name">Neal Matthews 3</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Web</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">COD</td>
								<td class="user-name" style="text-align: center;"><a
									href="#" class="detail_btn">View Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle" alt="userimg">
								</a></td>
								<td class="user-name"><strong>0004</strong></td>
								<td class="user-name">Neal Matthews 4</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Web</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">COD</td>
								<td class="user-name" style="text-align: center;"><a
									href="#" class="detail_btn">View Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle" alt="userimg">
								</a></td>
								<td class="user-name"><strong>0005</strong></td>
								<td class="user-name">Neal Matthews 5</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Android App</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">COD</td>
								<td class="user-name" style="text-align: center;"><a
									href="#" class="detail_btn">View Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><a href="#"
									class="text-custom-white fw-500"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
										class="rounded-circle" alt="userimg">
								</a></td>
								<td class="user-name"><strong>0006</strong></td>
								<td class="user-name">Neal Matthews 6</td>
								<td class="user-name">Madhavi</td>
								<td class="user-name" style="text-align: center;">10-07-2020</td>
								<td class="user-name">Android App</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name">COD</td>
								<td class="user-name" style="text-align: center;"><a
									href="#" class="detail_btn">View Details</a></td>
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
								<a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>


							</div>
							<div class="clr"></div>
						</div>

						<div class="profile_bx">
							<div class="profile_one">
								<span>Name</span> : Swapnil Mashalkar
							</div>
							<div class="profile_one">
								<span>Delivery location</span> : New Nashik
							</div>
							<div class="profile_one">
								<span>Address</span> : Ashoka Marg Nashik
							</div>
							<div class="profile_one">
								<span>Mobile No.</span> : +91 9011877864
							</div>
							<div class="profile_one">
								<span>Email Id</span> : test@gmail.com
							</div>
							<div class="profile_one">
								<span>Delivery Address</span> : <a href="#"
									title="Add New Address" class="detail_btn"
									href="javascript:void(0)" data-toggle="modal"
									data-target="#addAddress"><i class="fa fa-plus"
									aria-hidden="true"></i></a>&nbsp;<a href="#" title="Address List"
									class="detail_btn" data-target="#addressllist"
									data-toggle="modal"><i class="fa fa-list"
									aria-hidden="true"></i></a>

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

						<div class="component1">
							<table class="one booking" width="100%">
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
										<td class="user-name">xco1234</td>
										<td class="user-name">Shop No. 1</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>

										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><a href="#"
											class="text-custom-white fw-500"> <img
												src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
												class="rounded-circle" alt="userimg">
										</a></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">Shop No. 1</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><a href="#"
											class="text-custom-white fw-500"> <img
												src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
												class="rounded-circle" alt="userimg">
										</a></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">Shop No. 1</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><a href="#"
											class="text-custom-white fw-500"> <img
												src="${pageContext.request.contextPath}/resources/assets/img/profile_pic.jpg"
												class="rounded-circle" alt="userimg">
										</a></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">Shop No. 1</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
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

	<div class="modal fade kot-popup" id="addCustomer"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
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
								<span>Your Name *</span> <input name="" type="text"
									class="frm_inpt" />
							</div>
						</div>
						<div class="single_row_r">
							<div class="pop_frm_one">
								<span>Mobile Number *</span> <input name="" type="text"
									class="frm_inpt" />
							</div>
							<span style="color: red;">* This field required.</span>
						</div>
						<div class="clr"></div>
					</div>
					<div class="single_row">
						<div class="single_row_l">
							<div class="pop_frm_one">
								<span>Email *</span> <input name="" type="text" class="frm_inpt" />

							</div>
						</div>
						<div class="single_row_r">

							<div class="pop_frm_one">
								<span>Whats App no.</span> <input name="" type="text"
									class="frm_inpt" />

							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Permanent Address *</span>
							<textarea name="" type="text" class="frm_inpt"></textarea>
						</div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Delivery City *</span>
							<div class="search_multiple">
								<select class="country">
									<option value="">Select City</option>
									<option value="Shop 1" data-name="">Mumbai</option>
									<option value="Shop 2" data-name="" selected>Nashik</option>
									<option value="Shop 3" data-name="">Pune</option>
								</select>
							</div>
						</div>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Delivery Area *</span>
							<div class="search_multiple">
								<select class="country">
									<option value="">Select Area</option>
									<option value="Shop 1" data-name="" selected>Nashik
										Road</option>
									<option value="Shop 2" data-name="">Canada Corner</option>
								</select>
							</div>
						</div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Delivery Address *</span>
							<textarea name="" type="text" class="frm_inpt"></textarea>
						</div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Landmark *</span> <input name="" type="text"
								class="frm_inpt" />
						</div>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Language *</span>
							<div class="search_multiple">
								<select class="country">
									<option value="1" selected>Gujrati</option>
								</select>
							</div>
						</div>
					</div>
					<div class="pop_btn_row">
						<input name="" type="button" value="Submit" class="next_btn"
							onclick="sendOtp()" />
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


				<div class="pop_signup">
					Enter OTP<a href="#"></a>
				</div>
				<form action="" method="get">

					<div class="success-msg">
						<i class="fa fa-check"></i> OTP send to your mobile no.
					</div>
					<!-- <div class="error-msg">
						<i class="fa fa-times-circle"></i> This is a error message.
					</div> -->
					<div class="single_row">
						<div class="pop_frm_one">
							<span>OTP *</span> <input name="" type="text" class="frm_inpt" />

						</div>


						<div class="clr"></div>
					</div>

					<div class="pop_btn_row">
						<input name="" type="button" value="Submit" class="next_btn" />
					</div>
				</form>
			</div>


		</div>
	</div>
	<!--steps popup up-->


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
								<span>Select Address* <a href="#" style="float: right;"
									class="detail_btn" title="Add New Address" data-toggle="modal"
									data-target="#addAddress"><i class="fa fa-plus"
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
	<div class="modal fade kot-popup" id="orderstep2">
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
						alt=""> New Order Signup <span>About our latest
						restaurent and exclusive offers.</span> <a href="#"></a>
				</div>


				<div class="progress_row">
					<ul class="progressbar">
						<li class="active">Step 1</li>
						<li class="active">Step 2</li>
						<li>Step 3</li>
						<li>Step 4</li>
					</ul>
				</div>

				<div class="form_one">
					<form action="" method="get">
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Shop</span>
								<div class="search_multiple">
									<select class="country">
										<option value="">Select Shop</option>
										<option value="Shop 1" data-name="">Shop 1</option>
										<option value="Shop 2" data-name="">Shop 2</option>
										<option value="Shop 3" data-name="">Shop 3</option>
										<option value="Shop 4" data-name="">Shop 4</option>
										<option value="Shop 5" data-name="">Shop 5</option>
										<option value="Shop 6" data-name="">Shop 6</option>
									</select>
								</div>
							</div>
						</div>
						<div class="pop_btn_row">
							<input name="" type="button" value="Next Step" class="next_btn"
								onclick="changeStep(3)" />
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="orderstep3">
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
						alt=""> New Order Signup <span>About our latest
						restaurent and exclusive offers.</span> <a href="#"></a>
				</div>


				<!-- pop step 3 start here -->
				<!--4 steps bar-->
				<div class="progress_row">
					<ul class="progressbar">
						<li class="active">Step 1</li>
						<li class="active">Step 2</li>
						<li class="active">Step 3</li>
						<li>Step 4</li>
					</ul>
				</div>

				<div class="form_one">
					<form action="" method="get">
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Date</span> <input type="date" id="datepicker"
									name="datepicker" class="frm_inpt">
							</div>
						</div>

						<div class="single_row">
							<div class="pop_frm_one">
								<input name="" type="time" class="frm_inpt" />
							</div>
						</div>
						<div class="pop_btn_row">
							<input name="" type="button" value="Go For Order"
								class="next_btn" onclick="changeStep(5)" />
						</div>
					</form>
				</div>

				<!-- pop step 4 start here -->
				<!--4 steps bar-->

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="orderstep4">
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
						alt=""> New Order Signup <span>About our latest
						restaurent and exclusive offers.</span> <a href="#"></a>
				</div>

				<!-- pop step 1 start here -->
				<!--4 steps bar-->

				<!-- pop step 4 start here -->
				<!--4 steps bar-->
				<div class="progress_row">
					<ul class="progressbar">
						<li class="active">Step 1</li>
						<li class="active">Step 2</li>
						<li class="active">Step 3</li>
						<li class="active">Step 4</li>
					</ul>
				</div>

				<div class="form_one">
					<form action="" method="get">
						<div class="single_row">
							<div class="single_row_l">
								<div class="pop_frm_one">
									<span>Your Name</span> <input name="" type="text"
										class="frm_inpt" />
								</div>
							</div>
							<div class="single_row_r">
								<div class="pop_frm_one">
									<span>Mobile Number</span> <input name="" type="text"
										class="frm_inpt" />
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="single_row">
							<div class="single_row_l">

								<div class="pop_frm_one">
									<span>City</span> <input name="" type="text" class="frm_inpt" />
								</div>
							</div>
							<div class="single_row_r">
								<div class="pop_frm_one">
									<span>Whatsapp Mobile Number</span> <input name="" type="text"
										class="frm_inpt" />
								</div>
							</div>
							<div class="clr"></div>
						</div>
						<div class="pop_btn_row">
							<input name="" type="button" value="Go For Order"
								class="next_btn" onclick="changeStep(5)" />
						</div>
					</form>
				</div>



			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="grievences"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
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
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li><span>Order ID</span> #SK2540 1</li>
						<li><span>Billing Name</span> Neal Matthews 1</li>
						<li><span>Shop Name</span> Madhavi</li>
						<li><span>Total</span> 400.00</li>
						<li><span>Date & Time</span> 10-07-2020 11:00 AM</li>
					</ul>
				</div>

				<!--form-->
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
				<!--form close-->

				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li><span>Payment Status</span> Paid</li>
						<li><span>Payment Method</span> Mastecard</li>
					</ul>
				</div>




			</div>
		</div>
	</div>
	<div class="modal fade kot-popup" id="cancelOrder"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
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
						<li><span>Order ID</span> #SK2540 1</li>
						<li><span>Billing Name</span> Neal Matthews 1</li>
						<li><span>Shop Name</span> Madhavi</li>
						<li><span>Total</span> 400.00</li>
						<li><span>Date & Time</span> 10-07-2020 11:00 AM</li>
					</ul>
				</div>

				<!--form-->
				<div class="form_one extra_marg">
					<form action="" method="get">
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select </span>
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
				<!--form close-->

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="viewOrder" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
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
						<li><span>Order ID</span> #SK2540 1</li>
						<li><span>Customer Name</span> Neal Matthews 1</li>
						<li><span>Shop Name</span> Madhavi</li>
						<li><span>Total</span> 400.00</li>
						<li><span>Date & Time</span> 10-07-2020 11:00 AM</li>

					</ul>
				</div>

				<div class="view_order_list">
					<!-- <h3 class="order_head">View Order Details</h3> -->
					<ul>
						<li><span>Payment Status</span> Paid</li>
						<li><span>Payment Method</span> Mastecard</li>
					</ul>
				</div>




			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="addAddress"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Add Address</div>




				<!--form-->
				<div class="form_one extra_marg">
					<form action="" method="get">

						<div class="single_row">
							<div class="pop_frm_one">
								<span>Address Caption * <a href="#" style="float: right;"
									class="detail_btn" title="Address List" data-toggle="modal"
									data-target="#addressllist"><i class="fa fa-list"
										aria-hidden="true"></i></a></span> <input name="" type="text"
									class="frm_inpt" />
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Delivery City *</span>
								<div class="search_multiple">
									<select class="country">
										<option value="">Select City</option>
										<option value="Shop 1" data-name="">Mumbai</option>
										<option value="Shop 2" data-name="" selected>Nashik</option>
										<option value="Shop 3" data-name="">Pune</option>
									</select>
								</div>
							</div>
						</div>

						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Delivery Area *</span>
								<div class="search_multiple">
									<select class="country">
										<option value="">Select Area</option>
										<option value="Shop 1" data-name="" selected>Nashik
											Road</option>
										<option value="Shop 2" data-name="">Canada Corner</option>
									</select>
								</div>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Address *</span>
								<textarea name="" type="text" class="frm_inpt"></textarea>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Landmark *</span> <input name="" type="text"
									class="frm_inpt" />
							</div>
						</div>

						<div>
							<input name="" type="button" value="Submit" class="next_btn" />
						</div>
						<!-- class="pop_btn_row"-->
					</form>
				</div>
				<!--form close-->

			</div>
		</div>
	</div>

	<div class="modal fade kot-popup" id="addressllist">
		<div class="modal-dialog modal-md">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Address List</div>




				<!--form-->
				<div class="form_one extra_marg">
					<form action="" method="get"></form>
				</div>
				<!--form close-->

			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
	<%-- <script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datepicker.min.js"
		type="text/javascript"></script> --%>

	<script type="text/javascript">
		function sendOtp() {
			$('#addCustomer').modal('hide');
			$('#otpModel').modal('show');
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
	</script>
	<!--Plugin Initialization-->
	<script type="text/javascript">
		/* $(document).ready(function() {
			$("#respMenu").aceResponsiveMenu({
				resizeWidth : '768', // Set the same in Media query
				animationSpeed : 'fast', //slow, medium, fast
				accoridonExpAll : false
			//Expands all the accordion menu on click
			});
		}); */

		/* $(document).ready(function() {
			setTimeout(function() {
				$('.success-msg').remove();
			}, 5000);
		}); */
	</script>
	<script>
		$('.datepicker').datepicker({
			dateFormat : 'dd-mm-yy'
		}).val();

		$(window).on('load', function() {
		});
	</script>
</body>

</html>
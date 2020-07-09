<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Bootstrap -->

</head>


<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<section class="final-order section-padding bg-light-grey">
		<div class="container-fluid">


			<!--top-search-->
			<div class="main-box padding-20  margin_bottom">
				<form action="" method="get">
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
						</div>
						<div class="sec_title">
							<a href="javascript:void(0)" data-toggle="modal"
								data-target="#addCustomer" href="#" class="order_btn">Add
								New Customer Registration</a>
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
					<li>
						<div class="dash_two dash_common">
							<h3 class="dash_txt">
								Today Live <span>12,345</span>
							</h3>
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
					</li>
					<li>
						<div class="dash_three dash_common">
							<h3 class="dash_txt">
								Today delivered <span>12,345</span>
							</h3>
							<i class="fa fa-check" aria-hidden="true"></i>
						</div>
					</li>
					<li>
						<div class="dash_four dash_common">
							<h3 class="dash_txt">
								Today Cancelled <span>12,345</span>
							</h3>
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</li>
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
				<div class="sec_title">Live Orderes</div>

				<div class="component1">
					<table class="one" width="100%" id="demo2">
						<thead>
							<tr>
								<th class="sorting_desc"><input name="" type="checkbox"
									value=""></th>
								<th class="sorting_desc">Order ID</th>
								<th class="sorting_desc">Billing Name</th>
								<th class="sorting_desc js-sort-date">Date</th>
								<th class="sorting_desc">Total</th>
								<th class="sorting_desc">Payment Status</th>
								<th class="sorting_desc">Payment Method</th>
								<th class="sorting_desc">View Details</th>
							</tr>
						</thead>
						<tbody>
							<!--1 row-->
							<tr>
								<td class="user-name"><input name="" type="checkbox"
									value=""></td>
								<td class="user-name"><strong>#SK2540 1</strong></td>
								<td class="user-name">Neal Matthews 1</td>
								<td class="user-name">22 June 2020 1</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name"><i class="fa fa-cc-mastercard"
									aria-hidden="true"></i> MasterCard</td>
								<td class="user-name"><a href="javascript:void(0)"
									data-toggle="modal" data-target="#orderstep1"
									class="detail_btn">View Details</a></td>

							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><input name="" type="checkbox"
									value=""></td>
								<td class="user-name"><strong>#SK2540 2</strong></td>
								<td class="user-name">Neal Matthews 2</td>
								<td class="user-name">22 June 2020 2</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name"><i class="fa fa-cc-mastercard"
									aria-hidden="true"></i> MasterCard</td>
								<td class="user-name"><a href="#" class="detail_btn">View
										Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><input name="" type="checkbox"
									value=""></td>
								<td class="user-name"><strong>#SK2540 3</strong></td>
								<td class="user-name">Neal Matthews 3</td>
								<td class="user-name">22 June 2020 3</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name"><i class="fa fa-cc-mastercard"
									aria-hidden="true"></i> MasterCard</td>
								<td class="user-name"><a href="#" class="detail_btn">View
										Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><input name="" type="checkbox"
									value=""></td>
								<td class="user-name"><strong>#SK2540 4</strong></td>
								<td class="user-name">Neal Matthews 4</td>
								<td class="user-name">22 June 2020 4</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name"><i class="fa fa-cc-mastercard"
									aria-hidden="true"></i> MasterCard</td>
								<td class="user-name"><a href="#" class="detail_btn">View
										Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><input name="" type="checkbox"
									value=""></td>
								<td class="user-name"><strong>#SK2540 5</strong></td>
								<td class="user-name">Neal Matthews 5</td>
								<td class="user-name">22 June 2020 5</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name"><i class="fa fa-cc-mastercard"
									aria-hidden="true"></i> MasterCard</td>
								<td class="user-name"><a href="#" class="detail_btn">View
										Details</a></td>
							</tr>
							<!--1 row-->
							<tr>
								<td class="user-name"><input name="" type="checkbox"
									value=""></td>
								<td class="user-name"><strong>#SK2540 6</strong></td>
								<td class="user-name">Neal Matthews 6</td>
								<td class="user-name">22 June 2020 6</td>
								<td class="user-name">400.00</td>
								<td class="user-name"><span class="paid">Paid</span></td>
								<td class="user-name"><i class="fa fa-cc-mastercard"
									aria-hidden="true"></i> MasterCard</td>
								<td class="user-name"><a href="#" class="detail_btn">View
										Details</a></td>
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
										<th class="sorting_desc">&nbsp;</th>
										<th class="sorting_desc">Order No</th>
										<th class="sorting_desc">Date</th>
										<th class="sorting_desc">Type</th>
										<th class="sorting_desc">Amount</th>
										<th class="sorting_desc">Status</th>
										<th class="sorting_desc">Name</th>
										<th class="sorting_desc">Action</th>
									</tr>
								</thead>
								<tbody>
									<!--1 row-->
									<tr>
										<td class="user-name"><img
											src="${pageContext.request.contextPath}/resources/assets/img/order_pic.jpg"
											alt=""></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name">Akshay</td>
										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><img
											src="${pageContext.request.contextPath}/resources/assets/img/order_pic.jpg"
											alt=""></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name">Akshay</td>
										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><img
											src="${pageContext.request.contextPath}/resources/assets/img/order_pic.jpg"
											alt=""></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name">Akshay</td>
										<td class="user-name"><a href="#" class="table_icn"><i
												class="fa fa-eye" aria-hidden="true"></i></a> <a href="#"
											class="table_icn"><i class="fa fa-pencil"
												aria-hidden="true"></i></a> <a href="#" class="table_icn"><i
												class="fa fa-repeat" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name"><img
											src="${pageContext.request.contextPath}/resources/assets/img/order_pic.jpg"
											alt=""></td>
										<td class="user-name">xco1234</td>
										<td class="user-name">22-06-20</td>
										<td class="user-name">Online</td>
										<td class="user-name">205.00</td>
										<td class="user-name">Delivered</td>
										<td class="user-name">Akshay</td>
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

	<div class="modal fade kot-popup" id="addCustomer">
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
						alt=""> Customer Registration<a href="#"></a>
				</div>


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
						<div class="pop_frm_one">
							<span>Permanent Address</span>
							<textarea name="" type="text" class="frm_inpt"></textarea>
						</div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Delivery Address</span>
							<textarea name="" type="text" class="frm_inpt"></textarea>
						</div>
					</div>
					<div class="single_row">
						<!-- <div class="single_row_l">

							<div class="pop_frm_one">
								<span>City</span> <input name="" type="text" class="frm_inpt" />
							</div>
						</div> -->
						<div class="pop_frm_one">
							<span>Email</span> <input name="" type="text" class="frm_inpt" />

						</div>
						<div class="clr"></div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select City</span> <select class="form-control">
								<option value="">Select City</option>
								<option value="Shop 1" data-name="">Mumbai</option>
								<option value="Shop 2" data-name="" selected>Nashik</option>
								<option value="Shop 3" data-name="">Pune</option>
							</select>
						</div>
					</div>

					<div class="single_row">
						<div class="pop_frm_one">
							<span>Select Area</span> <select class="form-control">
								<option value="">Select Area</option>
								<option value="Shop 1" data-name="" selected>Nashik
									Road</option>
								<option value="Shop 2" data-name="">Canada Corner</option>
							</select>
						</div>
					</div>
					<div class="single_row">
						<div class="pop_frm_one">
							<span>Language</span> <select class="form-control">
								<option value="" selected>Gujrati</option>
							</select>
						</div>
					</div>
					<div class="pop_btn_row">
						<input name="" type="button" value="Register Customer"
							class="next_btn" />
					</div>
				</form>
			</div>


		</div>
	</div>
	<!--steps popup up-->
	<div class="modal fade kot-popup" id="order-signup">
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

				<div id="step1">
					<div class="progress_row">
						<ul class="progressbar">
							<li class="active">Step 1</li>
							<li>Step 2</li>
							<li>Step 3</li>
							<li>Step 4</li>
						</ul>
					</div>

					<div class="form_one">
						<form action="" method="get">
							<!-- <div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Pincode</span> <input name="" type="text"
									class="frm_inpt" />
							</div>
						</div>
						<div class="pop_btn_row">
							<input name="" type="button" value="Next Step" class="next_btn" />
						</div> -->
							<div class="single_row">
								<div class="pop_frm_one">
									<span>Select City</span> <select class="form-control">
										<option value="">Select City</option>
										<option value="Shop 1" data-name="">Mumbai</option>
										<option value="Shop 2" data-name="" selected>Nashik</option>
										<option value="Shop 3" data-name="">Pune</option>
									</select>
								</div>
							</div>

							<div class="single_row">
								<div class="pop_frm_one">
									<span>Select Area</span> <select class="form-control">
										<option value="">Select Area</option>
										<option value="Shop 1" data-name="" selected>Nashik
											Road</option>
										<option value="Shop 2" data-name="">Canada Corner</option>
									</select>
								</div>
							</div>
							<div class="single_row">
								<div class="pop_frm_one">
									<span>Delivery Address</span>
									<textarea name="" type="text" class="frm_inpt"></textarea>
								</div>
							</div>
							<div class="pop_btn_row">
								<input name="" type="button" value="Next Step" class="next_btn" />
							</div>
						</form>
					</div>
				</div>
				<div id="step2" style="display: none;">
					<!-- pop step 2 start here -->
					<!--4 steps bar-->
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
									<span>Select Shop</span> <select class="form-control">
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
							<div class="pop_btn_row">
								<input name="" type="button" value="Next Step" class="next_btn" />
							</div>
						</form>
					</div>
				</div>
				<div id="step3" style="display: none;">
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
									<span>Delivery Time</span> <select class="form-control">
										<option value="">Select Delivery Time</option>
										<option value="Shop 1" data-name="">12:00 PM</option>
										<option value="Shop 2" data-name="">12:15 PM</option>
										<option value="Shop 3" data-name="">12:30 PM</option>
										<option value="Shop 4" data-name="">12:45 PM</option>
										<option value="Shop 5" data-name="">01:00 PM</option>
										<option value="Shop 6" data-name="">01:15 PM</option>
									</select>
								</div>
							</div>
							<div class="pop_btn_row">
								<input name="" type="button" value="Next Step" class="next_btn" />
							</div>
						</form>
					</div>
				</div>
				<div id="step4" style="display: none;">
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


							<div class="single_row">
								<div class="pop_frm_one">
									<span>Landmark</span> <input name="" type="text"
										class="frm_inpt" />
								</div>
							</div>
							<div class="single_row">
								<div class="pop_frm_one">
									<span>Language</span> <select class="form-control">
										<option value="" selected>Gujrati</option>
									</select>
								</div>
							</div>
							<div class="pop_btn_row">
								<input name="" type="button" value="Go For Order"
									class="next_btn" />
							</div>
						</form>
					</div>
				</div>


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
						alt=""> New Order Signup <span>About our latest
						restaurent and exclusive offers.</span> <a href="#"></a>
				</div>

				<!-- pop step 1 start here -->
				<!--4 steps bar-->
				<div class="progress_row">
					<ul class="progressbar">
						<li class="active">Step 1</li>
						<li>Step 2</li>
						<li>Step 3</li>
						<li>Step 4</li>
					</ul>
				</div>

				<div class="form_one">
					<form action="" method="get">
						<!-- <div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Pincode</span> <input name="" type="text"
									class="frm_inpt" />
							</div>
						</div>
						<div class="pop_btn_row">
							<input name="" type="button" value="Next Step" class="next_btn" />
						</div> -->
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select City</span> <select class="form-control">
									<option value="">Select City</option>
									<option value="Shop 1" data-name="">Mumbai</option>
									<option value="Shop 2" data-name="" selected>Nashik</option>
									<option value="Shop 3" data-name="">Pune</option>
								</select>
							</div>
						</div>

						<div class="single_row">
							<div class="pop_frm_one">
								<span>Select Area</span> <select class="form-control">
									<option value="">Select Area</option>
									<option value="Shop 1" data-name="" selected>Nashik
										Road</option>
									<option value="Shop 2" data-name="">Canada Corner</option>
								</select>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Delivery Address</span>
								<textarea name="" type="text" class="frm_inpt"></textarea>
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Landmark</span> <input name="" type="text"
									class="frm_inpt" />
							</div>
						</div>
						<div class="single_row">
							<div class="pop_frm_one">
								<span>Language</span> <select class="form-control">
									<option value="" selected>Gujrati</option>
								</select>
							</div>
						</div>

						<div class="pop_btn_row">
							<input name="" type="button" value="Next Step" class="next_btn"
								onclick="changeStep(2)" />
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
								<span>Select Shop</span> <select class="form-control">
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
								<span>Delivery Time</span> <select class="form-control">
									<option value="">Select Delivery Time</option>
									<option value="Shop 1" data-name="">12:00 PM</option>
									<option value="Shop 2" data-name="">12:15 PM</option>
									<option value="Shop 3" data-name="">12:30 PM</option>
									<option value="Shop 4" data-name="">12:45 PM</option>
									<option value="Shop 5" data-name="">01:00 PM</option>
									<option value="Shop 6" data-name="">01:15 PM</option>
								</select>
							</div>
						</div>
						<div class="pop_btn_row">
							<input name="" type="button" value="Next Step" class="next_btn"
								onclick="changeStep(4)" />
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
	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
	<script type="text/javascript">
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
		$(document).ready(function() {
			$("#respMenu").aceResponsiveMenu({
				resizeWidth : '768', // Set the same in Media query
				animationSpeed : 'fast', //slow, medium, fast
				accoridonExpAll : false
			//Expands all the accordion menu on click
			});
		});
	</script>

</body>

</html>
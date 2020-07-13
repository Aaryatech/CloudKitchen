<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>

</head>

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<section class="final-order section-padding bg-light-grey">
		<div class="container-fluid">

			<!-- -->
			<div class="row margin_bottom">

				<div class="col-lg-9">
					<div class="main-box padding-20">
						<div class="component1">
							<!-- order history table-->
							<table class="one booking" width="100%">
								<thead>
									<tr>
										<th class="sorting_desc" style="text-align: center;">Order
											Name</th>
										<th class="sorting_desc" style="text-align: center;">Quantity</th>
										<th class="sorting_desc" style="text-align: center;">Rate</th>
										<th class="sorting_desc" style="text-align: center;">Special
											Note</th>
										<th class="sorting_desc" style="text-align: center;">Total</th>
										<th class="sorting_desc" style="text-align: center;">Delete</th>
									</tr>
								</thead>
								<tbody>
									<!--1 row-->
									<tr>
										<td class="user-name menu_nm"><a href="#"
											data-toggle="modal" data-target="#discription"> Bread
												Butter</a></td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt quantity" placeholder="5" /></td>
										<td class="user-name" style="text-align: right;">50.0</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt" placeholder="Extra Butter Souce" /></td>
										<td class="user-name" style="text-align: right;">250.00</td>
										<td class="user-name"><a href="#" class="trash"><i
												class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name menu_nm">Bread Butter</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt quantity" placeholder="5" /></td>
										<td class="user-name" style="text-align: right;">50.0</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt" placeholder="Extra Butter Souce" /></td>
										<td class="user-name" style="text-align: right;">250.00</td>
										<td class="user-name"><a href="#" class="trash"><i
												class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name menu_nm">Bread Butter</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt quantity" placeholder="5" /></td>
										<td class="user-name" style="text-align: right;">50.0</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt" placeholder="Extra Butter Souce" /></td>
										<td class="user-name" style="text-align: right;">250.00</td>
										<td class="user-name"><a href="#" class="trash"><i
												class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name menu_nm">Bread Butter</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt quantity" placeholder="5" /></td>
										<td class="user-name" style="text-align: right;">50.0</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt" placeholder="Extra Butter Souce" /></td>
										<td class="user-name" style="text-align: right;">250.00</td>
										<td class="user-name"><a href="#" class="trash"><i
												class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>
									<!--1 row-->
									<tr>
										<td class="user-name menu_nm">Bread Butter</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt quantity" placeholder="5" /></td>
										<td class="user-name" style="text-align: right;">50.0</td>
										<td class="user-name"><input name="" type="text"
											class="table_inpt" placeholder="Extra Butter Souce" /></td>
										<td class="user-name" style="text-align: right;">250.00</td>
										<td class="user-name"><a href="#" class="trash"><i
												class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>

								</tbody>
							</table>

							<!--checkout total box-->
							<div class="check_total">
								<div class="total-row">
									<div class="total-row_l">Items sub total</div>
									<div class="total-row_r">1500.00</div>
									<div class="clr"></div>
								</div>
								<div class="total-row">
									<div class="total-row_l">Tax</div>
									<div class="total-row_r">50.00</div>
									<div class="clr"></div>
								</div>
								<div class="total-row free">
									<div class="total-row_l">Delivery Charges</div>
									<div class="total-row_r">
										<input name="" type="text" class="table_inpt"
											placeholder=" Delivery Free" value="50"
											style="text-align: right;" />
									</div>
									<div class="clr"></div>

								</div>
								<div class="total-row">
									<div class="total-row_l">Offer Disc AMT</div>
									<div class="total-row_r">00.00</div>
									<div class="clr"></div>
								</div>
								<div class="total_bx">
									<div class="total-row_l">Total</div>
									<div class="total-row_r">1600.00</div>
									<div class="clr"></div>

								</div>
							</div>

						</div>

						<!-- Delivery Instructions box-->
						<div class="instruction_row">
							<div class="row">
								<div class="col-lg-4">
									<div class="instrac_nm">
										<h2>John Doe</h2>
										<h3>Home</h3>
										<p>
											314 79th Canada Corner<br> Near Arham Eye care Hospital<br>
											Sharanpur Road, Nashik<br> (+91) 1234567890
										</p>
									</div>
									<br>
									<div class="instrac_nm">
										<h2>Shop No. 1</h2>
										<h3>8888888888</h3>
										<p>
											314 79th Canada Corner<br> Near Arham Eye care Hospital<br>
											Sharanpur Road, Nashik<br> (+91) 1234567890
										</p>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="a">
										<div class="form-group">
											<label class="text-light-black fw-600 fs-16">Payment
												Option</label><select class="form-control  ">
												<option value="1">COD</option>
												<option value="2">Online Payment Link</option>
											</select><br> <label class="text-light-black fw-600 fs-16">Delivery
												Date & Time :&nbsp;</label> <label
												class="text-light-black fw-600 fs-16">07-07-2020
												12:03 PM, Order Time : 50 MIN</label><br> <label
												class="text-light-black fw-600 fs-16">Delivery
												Option :&nbsp;</label> <label class="text-light-black fw-600 fs-16"><input
												type="radio" id="homeDelivery" name="typeSelect"
												class="option-input radio" checked>Home Delivery
												&nbsp; <input type="radio" class="option-input radio"
												id="takeaway" name="typeSelect">Take Away</label><br> <label
												class="text-light-black fw-600 fs-16">Select
												Delivery Instruction</label><select class="form-control  ">
												<option value="1">Predefined Options</option>
												<option value="2">Other Options</option>
											</select><br> <label class="text-light-black fw-600 fs-16">Delivery
												Instructions</label>
											<textarea name="" cols="" rows="6"
												class="form-control formcheck"
												placeholder="Enter Your Delivery Instructions"></textarea>

										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="three_btn">
							<button type="submit" value="Submit" class="button_place">Place
								Order</button>
							<button type="submit" value="Submit" class="button_park">Park
								Order</button>
							<button type="submit" value="Submit" class="button_back">
								<i class="fa fa-angle-left" aria-hidden="true"></i> Back
							</button>
						</div>


					</div>
				</div>


				<!--related item box-->
				<div class="col-lg-3">
					<div class="main-box ">
						<div class="related_head">Related Item</div>

						<div class="item_bx">
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_2.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_2.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_2.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_2.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>
							<!--item 1-->
							<div class="item_one">
								<div class="item_pic">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg"
										alt="">
								</div>
								<div class="item_cont">
									<h3 class="item_nm">
										Chilli Chicken Pizza <span>small, chilli chicken</span>
									</h3>
									<p class="itm_prc">
										Rs.150.00 <a href="#">Add to Cart</a>
									</p>
								</div>
							</div>

						</div>


					</div>
				</div>

			</div>




		</div>
	</section>

	<div class="modal fade kot-popup" id="discription">
		<div class="modal-dialog modal-lg">
			<!--modal-lg-->
			<div class="modal-content kot_content">
				<button type="button" class="close kot_close" data-dismiss="modal">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
						alt="">
				</button>

				<div class="pop_signup">Item Description</div>


				<div class="disc_pop">
					<div class="disc_pop_l">
						<img src="https://via.placeholder.com/200" alt="">
					</div>
					<div class="disc_pop_r">
						<h3 class="restro-nm">
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
								alt=""> Curry Leaves Barbecuing and Grilling <span>Sharanpur
								Road Nashik Casual Dining - North Indian</span>
						</h3>

						<div class="pop_disc">
							<span>Sort Discription -</span> Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua.
						</div>



					</div>
					<div class="clr"></div>
				</div>




			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
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
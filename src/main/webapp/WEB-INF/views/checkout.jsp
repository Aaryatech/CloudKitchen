<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="appendTableList()">

	<section class="final-order section-padding bg-light-grey">
		<div class="container-fluid">

			<!-- -->
			<div class="row margin_bottom">

				<div class="col-lg-9">
					<div class="main-box padding-20">

						<div class="component1">
							<!-- order history table-->
							<table class="overflow-y" id="printtable1">
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
								</tbody>
							</table>

							<!--checkout total box-->
							<div class="check_total">
								<div class="total-row">
									<div class="total-row_l">Items sub total</div>
									<div class="total-row_r" id="item_sub_total">00.00</div>
									<div class="clr"></div>
								</div>
								<div class="total-row">
									<div class="total-row_l">Tax</div>
									<div class="total-row_r" id="taxAmt">00.00</div>
									<div class="clr"></div>
								</div>

								<div class="total-row">
									<div class="total-row_l" id="discAmt">Offer Disc AMT</div>
									<div class="total-row_r">00.00</div>
									<div class="clr"></div>
								</div>
								<div class="total-row free">
									<div class="total-row_l">Delivery Charges</div>
									<div class="total-row_r">
										<input name="deliveryCharges" id="deliveryCharges" type="text"
											class="table_inpt" placeholder=" Delivery Free" value="50"
											onchange="appendTableList()" style="text-align: right;" />
									</div>
									<div class="clr"></div>

								</div>
								<div class="total_bx">
									<div class="total-row_l">Total</div>
									<div class="total-row_r" id="bill_total">50.00</div>
									<div class="clr"></div>

								</div>
							</div>

						</div>
						<div class="clr"></div>

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
											<label class="text-light-black fw-500 fs-14">Payment
												Option</label><select class="form-control">
												<option value="1">COD</option>
												<option value="2">Online Payment Link</option>
											</select><br> <label class="text-light-black fw-500 fs-14">Delivery
												Date & Time :&nbsp;</label> <label class="chk_txt fw-500 fs-14">07-07-2020
												12:03 PM, Order Time : 50 MIN</label><br> <label
												class="text-light-black fw-500 fs-14">Delivery
												Option :&nbsp;</label> <label class="chk_txt fw-500 fs-14"><input
												type="radio" id="homeDelivery" name="typeSelect"
												class="option-input radio" checked>Home Delivery
												&nbsp; </label><label class="chk_txt fw-500 fs-14"><input
												type="radio" class="option-input radio" id="takeaway"
												name="typeSelect">Take Away</label><br> <label
												class="text-light-black fw-500 fs-14">Select
												Delivery Instruction</label><select class="form-control  ">
												<option value="1">Predefined Options</option>
												<option value="2">Other Options</option>
											</select><br> <label class="text-light-black fw-500 fs-14">Delivery
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
							<a href="${pageContext.request.contextPath}/addOrder"><button
									type="submit" value="Submit" class="button_back">
									<i class="fa fa-angle-left" aria-hidden="true"></i> Back
								</button></a>
						</div>


					</div>
				</div>



				<div class="col-lg-3">

					<div class="sidebar backnone">

						<div class="cart-detail-box">
							<!--Related item-->
							<div class="card marg_bottom">

								<div class="related_row">
									<div class="related_row_l">
										<div class="related_head">Related Item</div>
									</div>
									<div class="related_row_r">
										<i class="fa fa-search" aria-hidden="true"></i> <input name=""
											type="text" class="rel_search" placeholder="Search">
									</div>
									<div class="clr"></div>
								</div>

								<div class="card-body fix_height no-padding" id="scrollstyle-4">
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
								<div class="blnk_div"></div>
							</div>
							<div class="card marg_bottom">
								<div class="related_row">
									<div class="related_row_l">
										<div class="related_head">Favourite Item</div>
									</div>
									<div class="related_row_r">
										<i class="fa fa-search" aria-hidden="true"></i> <input name=""
											type="text" class="rel_search" placeholder="Search">
									</div>
									<div class="clr"></div>
								</div>
								<div class="card-body fix_height no-padding" id="scrollstyle-4">
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
								<div class="blnk_div"></div>
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
							<span>Category -</span> Pizza
						</div>

						<div class="pop_disc">
							<span>Discription -</span> Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua.
						</div>

						<div class="product-list-type hotel_nm pop_disc">
							<span class="text-light-white new strong_fnt">New</span> <span
								class="text-custom-white square-tag"><img
								src="/ck/resources/assets/img/chilli_1.jpg" alt="tag"></span> <span
								class="text-custom-white square-tag"><img
								src="/ck/resources/assets/img/chilli_2.jpg" alt="tag"></span> <span
								class="text-custom-white square-tag"><img
								src="/ck/resources/assets/img/chilli_3.jpg" alt="tag"></span> <span
								class="text-custom-white square-tag"><img
								src="/ck/resources/assets/img/sweet_1.png" alt="tag"></span>
						</div>


						<div class="rating_row_one">
							<div class="ratings rating_l">
								<span class="strong_fnt">Rating -</span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star-half-alt"></i></span>
							</div>

							<div class="rate_ting">
								<span class="strong_fnt">Time -</span> 30-40 mins
							</div>
							<div class="rate_prc">
								<div class="offer_price">
									<span>Rs.250</span> Rs.180/-
								</div>
							</div>

						</div>


						<!--related Causin-->
						<%-- <div class="pop_cousin pop_disc">
							<span class="pop_disc">Related Items </span>
							<ul>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/italian.jpg"
										class="rounded-circle" alt="categories"> Italian
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/thai.jpg"
										class="rounded-circle" alt="categories"> Thai
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/chinese.jpg"
										class="rounded-circle" alt="categories"> Chinese
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/maxican.jpg"
										class="rounded-circle" alt="categories"> Maxican
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/indian.jpg"
										class="rounded-circle" alt="categories"> Indian
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/lebenese.jpg"
										class="rounded-circle" alt="categories"> Lebanese
								</a></li>
							</ul>
						</div> --%>



					</div>
					<div class="clr"></div>
				</div>




			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
	<!--Plugin Initialization-->

	<script type="text/javascript">
		function appendTableList() {

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			$("#printtable1 tbody").empty();
			var subtotal = 0;

			for (var i = 0; i < table.length; i++) {

				var tr_data = '<tr> <td class="user-name menu_nm"><a href="#" data-toggle="modal" data-target="#discription">'
						+ table[i].itemName
						+ '<td class="user-name"><input name="item_qty_table'
						+ i
						+ '" type="text" class="table_inpt quantity numbersOnly" placeholder="0" value="'
						+ table[i].qty
						+ '" onchange="changeQty('
						+ i
						+ ')" id="item_qty_table'
						+ i
						+ '"/></td>'
						+ '<td class="user-name" style="text-align: right;">'
						+ table[i].price
						+ '</td>'
						+ '<td class="user-name"><input name="" type="text" class="table_inpt" placeholder="Special Note" /></td>'
						+ '<td class="user-name" style="text-align: right;">'
						+ (table[i].total).toFixed(2)
						+ '</td>'
						+ '<td class="user-name"><a   class="trash" href="javascript:void(0)" onclick="deleteItemFromTable('
						+ i
						+ ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td> </tr>'
				$('#printtable1').append(tr_data);
				subtotal = parseFloat(subtotal)
						+ parseFloat((table[i].total).toFixed(2));
			}

			$("#item_sub_total").html(subtotal.toFixed(2));
			var deliveryCharges = parseFloat($("#deliveryCharges").val());
			$("#bill_total").html((subtotal + deliveryCharges).toFixed(2));
		}

		function deleteItemFromTable(elem) {

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);
			//console.log(table);

			table.splice(elem, 1);
			sessionStorage.setItem("cartValue", JSON.stringify(table));
			appendTableList();

		}

		function changeQty(index) {

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);
			//console.log(table);
			var qty = parseFloat($("#item_qty_table" + index).val());
			if (isNaN(qty) == true || qty <= 0) {
				qty = 1;
			}

			for (var i = 0; i < table.length; i++) {

				if (index == i) {

					table[i].qty = parseFloat(qty);
					table[i].total = table[i].qty * table[i].price;
				}
			}

			sessionStorage.setItem("cartValue", JSON.stringify(table));
			appendTableList();
		}
	</script>

</body>

</html>
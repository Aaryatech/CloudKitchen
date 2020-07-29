<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="appendTableList();getItemList();"
	data-customvalueone='${jsonList}'>
	<div class="loader" id="loaderimg" style="display: none;">
		<img
			src="${pageContext.request.contextPath}/resources/assets/img/svg/loader.svg"
			alt="">
	</div>
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
									<div class="total-row_r" id="item_tax_total">00.00</div>
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
										<h2>${sessionScope.liveCustomer.custName}</h2>
										<h3>${addressDetail.addressCaption}</h3>
										<p>${addressDetail.address}
											<br> (+91) 1234567890
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
												Date & Time :&nbsp;</label> <label class="chk_txt fw-500 fs-14">${date}
												${time}, Order Time : 50 MIN</label><br> <label
												class="text-light-black fw-500 fs-14">Delivery
												Option :&nbsp;</label> <label class="chk_txt fw-500 fs-14"><input
												type="radio" id="homeDelivery" name="typeSelect"
												class="option-input radio" checked>Home Delivery
												&nbsp; </label><label class="chk_txt fw-500 fs-14"><input
												type="radio" class="option-input radio" id="takeaway"
												name="typeSelect">Take Away</label><br> <label
												class="text-light-black fw-500 fs-14">Select
												Delivery Instruction</label><select class="form-control  ">
												<c:forEach items="${deliveryInstructionList}"
													var="deliveryInstructionList">
													<option value="${deliveryInstructionList.instruId}">${deliveryInstructionList.instructnCaption}</option>
												</c:forEach>

											</select><br> <label class="text-light-black fw-500 fs-14">Delivery
												Instructions</label>
											<textarea name="" cols="" rows="6"
												class="form-control formcheck"
												placeholder="Enter Your Delivery Instructions"></textarea>
											<br> <label class="text-light-black fw-500 fs-14">Billing
												Name</label> <input name="" class="form-control"
												placeholder="Billing Name"
												value="${sessionScope.liveCustomer.custName}" /> <br>
											<label class="text-light-black fw-500 fs-14">Billing
												Address</label>
											<textarea name="" cols="" rows="6"
												class="form-control formcheck" placeholder="Billing Address">${addressDetail.address}</textarea>

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
										<i class="fa fa-search" aria-hidden="true"></i> <input
											name="related_item_text" type="text" class="rel_search"
											placeholder="Search" id="related_item_text"
											onkeyup="searchRelatedItem()">
									</div>
									<div class="clr"></div>
								</div>

								<div class="card-body fix_height no-padding" id="scrollstyle-4">
									<div class="item_bx">

										<c:forEach items="${relatedItemList}" var="relatedItemList">
											<div class="item_one related_item_cls">
												<div class="item_pic">
													<img
														src="${catImageUrl}/${relatedItemList.imageList[0].imageName}"
														alt=""
														onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg';">
												</div>
												<div class="item_cont">
													<h3 class="item_nm related_item_name"
														onclick="itemDetailDesc(${relatedItemList.itemId})">${relatedItemList.itemName}</h3>
													<p class="itm_prc">
														Rs.${relatedItemList.spRateAmt} <a href="#"
															onclick="addToTable(${relatedItemList.itemId})">Add
															to Cart</a>
													</p>
												</div>
											</div>
										</c:forEach>
										<!--item 1-->

										<!--item 1-->
										<%-- <div class="item_one">
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
										</div> --%>
										<!--item 1-->


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
										<i class="fa fa-search" aria-hidden="true"></i> <input
											name="fav_item_text" type="text" class="rel_search"
											placeholder="Search" onkeyup="searchFavItem()"
											id="fav_item_text">
									</div>
									<div class="clr"></div>
								</div>
								<div class="card-body fix_height no-padding" id="scrollstyle-4">
									<div class="item_bx">

										<c:forEach items="${favItemList}" var="favItemList">
											<div class="item_one fav_item_cls">
												<div class="item_pic">
													<img
														src="${catImageUrl}/${favItemList.imageList[0].imageName}"
														alt=""
														onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/related_item_1.jpg';">
												</div>
												<div class="item_cont">
													<h3 class="item_nm fav_item_name"
														onclick="itemDetailDesc(${favItemList.itemId})">${favItemList.itemName}</h3>
													<p class="itm_prc">
														Rs. ${favItemList.spRateAmt} <a href="#"
															onclick="addToTable(${favItemList.itemId})">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</c:forEach>

										<!--item 1-->
										<%-- <div class="item_one">
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
										</div> --%>
										<!--item 1-->

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
						<h3 class="restro-nm" id="discriptionHeading">
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
								alt=""> Curry Leaves Barbecuing and Grilling <span>Sharanpur
								Road Nashik Casual Dining - North Indian</span>
						</h3>

						<div class="pop_disc">
							<span>Category :</span> <span id="discriptionCatName">Pizza</span>
						</div>

						<div class="pop_disc">
							<span>Discription :</span> <span id="discriptionItemShow">Lorem
								ipsum dolor sit amet, consectetur adipiscing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua.</span>
						</div>

						<div class="product-list-type hotel_nm pop_disc"
							id="discriptionTaste">
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
							<div class="ratings rating_l" id="discriptionRating">
								<span class="strong_fnt">Rating : </span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star"></i></span> <span
									class="text-yellow"><i class="fas fa-star-half-alt"></i></span>
							</div>

							<div class="rate_ting">
								<span class="strong_fnt">Time :</span> <span id="discriptionMin">
									30-40 mins</span>
							</div>
							<div class="rate_prc">
								<div class="offer_price" id="discriptionPrice">
									<span>Rs.250</span> Rs.180/-
								</div>
							</div>

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
		function searchRelatedItem() {

			var txt = $('#related_item_text').val();

			$('.related_item_cls').hide();

			$('.related_item_cls')
					.each(
							function(index) {

								var related_item_name = document
										.getElementsByClassName("related_item_name")[index].innerHTML;
								if (related_item_name.toUpperCase().indexOf(
										txt.toUpperCase()) != -1) {
									$(this).show();
								}
							});

		}
		
		function searchFavItem() {

			var txt = $('#fav_item_text').val();

			$('.fav_item_cls').hide(); 
			$('.fav_item_cls')
					.each(
							function(index) {

								var related_item_name = document
										.getElementsByClassName("fav_item_name")[index].innerHTML;
								if (related_item_name.toUpperCase().indexOf(
										txt.toUpperCase()) != -1) {
									$(this).show();
								}
							});

		}
		
		function getItemList() {

			document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/getItemList',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							document.getElementById("loaderimg").style.display = "none";
							//alert(JSON.stringify(response))
							sessionStorage.setItem("allItemList", JSON
									.stringify(response));
						},
					});

		}

		function appendTableList() {

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			$("#printtable1 tbody").empty();
			var subtotal = 0;
			var taxtotal = 0;
			var finaltotal = 0;
			
			for (var i = 0; i < table.length; i++) {

				var tr_data = '<tr> <td class="user-name menu_nm"><a href="javascript:void(0)"  onclick="itemDetailDesc('
						+ table[i].itemId
						+ ')">'
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
						+ '<td class="user-name"><input name="specialRemark'+i+'" type="text" class="table_inpt" placeholder="Special Note" value="'+table[i].specialremark+'" id="specialRemark'+i+'" onchange="changeQty('
						+ i
						+ ')"/></td>'
						+ '<td class="user-name" style="text-align: right;">'
						+ (table[i].total).toFixed(2)
						+ '</td>'
						+ '<td class="user-name"><a   class="trash" href="javascript:void(0)" onclick="deleteItemFromTable('
						+ i
						+ ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td> </tr>'
				$('#printtable1').append(tr_data);
						
				var baseValue = (parseFloat(table[i].total)*100)/(100+parseFloat(table[i].igstPer)).toFixed(2);
				var taxAmt = parseFloat(table[i].total)-parseFloat(baseValue).toFixed(2); 
				subtotal = parseFloat(subtotal)+parseFloat(baseValue);
				taxtotal = parseFloat(taxtotal)+parseFloat(taxAmt); 
				finaltotal = parseFloat(finaltotal)+parseFloat(table[i].total);
			}

			$("#item_sub_total").html(subtotal.toFixed(2));
			$("#item_tax_total").html(taxtotal.toFixed(2));
			var deliveryCharges = parseFloat($("#deliveryCharges").val());
			$("#bill_total").html((finaltotal + deliveryCharges).toFixed(2));
		}

		function addToTable(itemId) {
			
				var qty = 1;
			  
				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue);
				
				 
				var allItemList = sessionStorage.getItem("allItemList");
				var objson = $.parseJSON(allItemList);
				
				for (var j = 0; j < objson.length; j++) {
					 
					if (itemId == objson[j].itemId) { 
						var obj = objson[j]; 
						var findItem=0;
						for(var i = 0 ; i<table.length ; i++){
							
							if(table[i].itemId==itemId){ 
								table[i].qty=parseFloat(table[i].qty)+parseFloat(qty);
								table[i].total=table[i].qty*table[i].price;
								findItem=1;
								break;
							}
						} 
						if(findItem==0){
							var total = obj.spRateAmt*qty;
							 table.push({
								  itemId: obj.itemId,
								  price: obj.spRateAmt,
								  itemName: obj.itemName,
								  qty: qty,
								  total: total,
								  cgstPer : obj.cgstPer,
								  sgstPer : obj.sgstPer,
								  igstPer : obj.igstPer,
								  specialremark : ''
							});
						}
						break;
					}
				}
				  
				 sessionStorage.setItem("cartValue", JSON.stringify(table)); 
				 appendTableList();
			 
			 
				
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
			var splremark = $("#specialRemark" + index).val();
			
			if (isNaN(qty) == true || qty <= 0) {
				qty = 1;
			}

			for (var i = 0; i < table.length; i++) {

				if (index == i) {

					table[i].specialremark = splremark;
					table[i].qty = parseFloat(qty);
					table[i].total = table[i].qty * table[i].price;
				}
			}

			sessionStorage.setItem("cartValue", JSON.stringify(table));
			appendTableList();
		}

		function itemDetailDesc(item) {

			var allItemList = sessionStorage.getItem("allItemList");
			var objson = $.parseJSON(allItemList);

			//console.log(objson);
			document.getElementById("loaderimg").style.display = "block";
			for (var i = 0; i < objson.length; i++) {

				if (item == objson[i].itemId) {
					var obj = objson[i];

					$('#discription').modal('show');

					if (obj.productCategory == 2) {

						$("#discriptionHeading")
								.html(
										'<img src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png" '+
								'alt=""> '
												+ obj.itemName
												+ '<span></span>');
					} else {
						/* $("#discriptionHeading").append('<img src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png" '+
								'alt=""> '+obj.itemName+'<span></span>'); */
						$("#discriptionHeading")
								.html(
										'<img src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png" '+
								'alt=""> '
												+ obj.itemName
												+ '<span></span>');
					}
					$("#discriptionCatName").html(obj.catName);
					$("#discriptionItemShow").html(obj.itemDesc);

					var testIngradiant = '<span class="text-light-white new strong_fnt">New</span>';
					for (var i = 0; i < obj.tasteList.length; i++) {
						testIngradiant += '<span class="text-custom-white square-tag"><img title="'
								+ obj.tasteList[i].ingrediantName
								+ '" '
								+ 'src="${catImageUrl}'
								+ obj.tasteList[i].ingrediantImage
								+ '" alt="tag" onerror="imgErrorJavascript(this,1);"></span>';
					}
					$("#discriptionTaste").html(testIngradiant);
					$("#discriptionRating").html(
							'<span class="strong_fnt">Rating :</span>');

					if (obj.rating == 1) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span>');
					} else if (obj.rating == 1.5) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
					} else if (obj.rating == 2) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
					} else if (obj.rating == 2.5) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
					} else if (obj.rating == 3) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>');
					} else if (obj.rating == 3.5) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
					} else if (obj.rating == 4) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>');
					} else if (obj.rating == 4.5) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
					} else if (obj.rating == 5) {
						$("#discriptionRating")
								.append(
										'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>'
												+ '<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>');
					}
					$("#discriptionMin").html(obj.preperationTime);

					$("#discriptionPrice").html(
							'<span>Rs.' + obj.mrpAmt + '</span> Rs.'
									+ obj.spRateAmt + '/-');

					break;
				}

			}

			document.getElementById("loaderimg").style.display = "none";

		}
	</script>


</body>

</html>
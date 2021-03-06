<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header1.jsp"></jsp:include>
<body>
	<%-- data-customvalueone='${jsonList}' --%>

	<div class="loader" id="loaderimg" style="display: none;">
		<img
			src="${pageContext.request.contextPath}/resources/assets/img/svg/loader.svg"
			alt="">
	</div>


	<!-- Navigation -->
	<section class="final-order  section-padding-bottom  bg-light-grey">

		<!-- NEW  -->

		<!-- Browse by category -->
		<section class="browse-cat u-line category_bx new ipad_marg">
			<div class="container">
				<div class="row">
					<!-- <div class="col-12">
                          <div class="section-header-left">
                              <h3 class="text-light-black header-title new">Browse by Category</h3>
                          </div>
                      </div> -->
					<div class="col-12">
						<div class="category-slider swiper-container">
							<div class="swiper-wrapper">

								<div class="swiper-slide">
									<a href="javascript:void(0)" class="categories active_round"
										id="category0" onclick="changeCategory(0)">
										<div class="icon new text-custom-white bg-light-green">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/chinese.jpg"
												class="rounded-circle" alt="categories"
												onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg';">
										</div> <span class="text-light-black cat-name new fw-500">All</span>
									</a>
								</div>

								<c:forEach items="${catList}" var="catList">

									<div class="swiper-slide">
										<a href="javascript:void(0)" class="categories"
											id="category${catList.catId}"
											onclick="changeCategory(${catList.catId})">
											<div class="icon new text-custom-white bg-light-green">
												<img src="${catImageUrl}/${catList.imageList[0].imageName}"
													class="rounded-circle" alt="categories"
													onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg';">
											</div> <span class="text-light-black cat-name new fw-500">${catList.catName}</span>
										</a>
									</div>
								</c:forEach>



							</div>
							<!-- Add Arrows -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Browse by category -->


		<div class="container-fluid">
			<div class="section-header-left" style="display: none;">
				<h3 class="text-light-black header-title new">Dinner
					Inspirations</h3>
			</div>

			<!--restarurent offer-->
			<div class="row">

				<c:forEach items="${offerList}" var="offerList">

					<div class="col-lg-3" style="margin: 15px 0;">
						<div class="bke1zw-1 feJJpQ">
							<section class="sc-hzOKmB eTLmSe">
								<a href="#" class="sc-fjNYmT cPRXMx">

									<div class="offer_new">
										<div class="offer_new_pic">
											<img src="${catImageUrl}${offerList.imageList[0].imageName}"
												alt="offer image"
												onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/trending_1.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/trending_1.jpg';">
										</div>
										<div class="offer_new_txt">
											${offerList.offerName} <span>Date :
												${offerList.fromDate} to ${offerList.toDate}</span>
										</div>
									</div>


								</a>
							</section>
						</div>
					</div>

				</c:forEach>





			</div>
		</div>



		<!-- ---------------------------------------------------- -->



		<%-- <div class="container-fluid">
			<!--restarurent offer-->

			<div class="row">

				<div class="col-12">
					<div class="featured-partners-slider swiper-container">
						<div class="swiper-wrapper">

							<c:forEach items="${offerList}" var="offerList">
								<div class="swiper-slide">
									<div class="bke1zw-1 feJJpQ">
										<section class="sc-hzOKmB eTLmSe">
											<a href="#" class="sc-fjNYmT cPRXMx">
												<div class="s1isp7-0 gsidZp sc-fQfKYo kjRoqZ">
													<img alt="Trending This Week"
														src="${catImageUrl}${offerList.imageList[0].imageName}"
														loading="lazy" class="s1isp7-4 bBALuk"
														onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/trending_1.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/trending_1.jpg';">
												</div>
												<section class="sc-cOoQYZ eGlRiQ">
													<section class="sc-ddcOto lMfoD">
														<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE offer_txt">
															${offerList.offerName}</p>
														<div class="sc-jrOYZv gkgQzg">
															<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">
																Date : ${offerList.fromDate} to ${offerList.toDate}
																
															</h6>
															<!-- <i class="fa fa-caret-right" aria-hidden="true"></i> -->
														</div>
													</section>
												</section>
											</a>
										</section>
									</div>
								</div>
							</c:forEach>

						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>

			</div>
		</div> --%>

		<!-- Browse by category -->
		<%-- <section class="browse-cat u-line category_bx">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="section-header-left">
							<h3 class="text-light-black header-title title">Browse by
								Category</h3>
						</div>
					</div>
					<div class="col-12">
						<div class="category-slider swiper-container">
							<div class="swiper-wrapper">


								<div class="swiper-slide">
									<a href="javascript:void(0)" class="categories active_round"
										id="category0" onclick="changeCategory(0)">
										<div class="icon icon-parent text-custom-white bg-light-green">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/chinese.jpg"
												class="rounded-circle" alt="categories"
												onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg';">
										</div> <span class="text-light-black cat-name fw-500">All</span>
									</a>
								</div>

								<c:forEach items="${catList}" var="catList">

									<div class="swiper-slide">
										<a href="javascript:void(0)" class="categories"
											id="category${catList.catId}"
											onclick="changeCategory(${catList.catId})">
											<div
												class="icon icon-parent text-custom-white bg-light-green">
												<img src="${catImageUrl}/${catList.imageList[0].imageName}"
													class="rounded-circle" alt="categories"
													onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/chinese.jpg';">
											</div> <span class="text-light-black cat-name fw-500">${catList.catName}</span>
										</a>
									</div>
								</c:forEach>
							</div>
							<!-- Add Arrows -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
			</div>
		</section> --%>
		<!-- Browse by category -->

		<section class="section-padding-bottom">
			<!-- section-padding-top -->
			<div class="container-fluid">
				<div class="row">
					<!--left filter start here-->
					<div class="col-lg-3">
						<div class="filter_bx">
							<h3 class="search_title">Search Filters</h3>
							<!--filter radio -->

							<div class="filter_cont">
								<label class="chk_txt fw-500 fs-14"><input type="radio"
									id="searchByItem" name="searchType" class="option-input radio"
									checked onchange="onchangeSearchBy()">Search By Item
									&nbsp; </label><label class="chk_txt fw-500 fs-14"><input
									type="radio" class="option-input radio" id="searchBySubCat"
									onchange="onchangeSearchBy()" name="searchType">Search
									By Sub Cat</label>
								<div class="search_filt">
									<input name="" type="text" class="filter_inpt"
										placeholder="Search Sub Category Or Item" id="subcatinput"
										onkeyup="sortCategory()" /> <i class="fa fa-search"
										aria-hidden="true"></i>
								</div>


								<c:forEach items="${subcatList}" var="subcatList">
									<div class="subcatclass">
										<label class="custom-checkbox radio_one"> <input
											type="checkbox" name="subcat" class="checkboxclass"
											onchange="myFunction1()" value="${subcatList.subCatName}"><span
											class="checkmark"></span> <span class="subcatdummyclass"
											style="display: none;"> ${subcatList.catName}</span> <span
											class="subcatdummyclass1">${subcatList.subCatName}</span>
										</label>
									</div>
								</c:forEach>

							</div>

							<div class="tags_bx">
								<h3 class="tags_title">Price Range</h3>
								<div class="filter_cont">

									<div id="range">
										<div class="filter_prc">
											Filter by Price Rs. <span id="currentVal">100</span>
										</div>
									</div>

								</div>
							</div>

							<!--popular tags-->
							<div class="tags_bx">
								<h3 class="tags_title">Popular Tags</h3>
								<div class="filter_cont">
									<form action="" method="get">

										<ul class="ks-cboxtags">

											<c:forEach items="${tagList}" var="tagList">
												<li><input type="checkbox"
													id="checkboxOne${tagList.tagId}" name="tagcheckbox"
													value="${tagList.tagName}" onchange="myFunction1()"><label
													for="checkboxOne${tagList.tagId}">${tagList.tagName}</label></li>
											</c:forEach>
										</ul>
									</form>
									<div class="clr"></div>
								</div>


							</div>

							<!--user rating-->
							<%-- <div class="tags_bx">
								<h3 class="tags_title">User Rating</h3>
								<div class="filter_cont">
									<form action="" method="get">
										<label class="radio_one"> <input type="radio"
											class="option-input radio" name="example" checked /> <img
											src="${pageContext.request.contextPath}/resources/assets/img/review_5.png"
											alt="">
										</label> <label class="radio_one"> <input type="radio"
											class="option-input radio" name="example" /> <img
											src="${pageContext.request.contextPath}/resources/assets/img/review_4.png"
											alt="">
										</label> <label class="radio_one"> <input type="radio"
											class="option-input radio" name="example" /> <img
											src="${pageContext.request.contextPath}/resources/assets/img/review_3.png"
											alt="">
										</label> <label class="radio_one"> <input type="radio"
											class="option-input radio" name="example" /> <img
											src="${pageContext.request.contextPath}/resources/assets/img/review_2.png"
											alt="">
										</label>
									</form>
								</div>
							</div> --%>

						</div>
					</div>
					<!--right product boxes -->
					<div class="col-lg-9">


						<div class="inner_scroll" id="itemListDiv">
							<!--1-->

							<c:forEach items="${itemList}" var="itemList">

								<div class="order_row">
									<div class="one_order">
										<!--left-->
										<div class="one_order_l">
											<h3 class="restro-nm">
												<c:choose>
													<c:when test="${itemList.productCategory==2}">
														<img
															src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
															alt="">
													</c:when>
													<c:otherwise>
														<img
															src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
															alt="">
													</c:otherwise>
												</c:choose>
												<!-- data-toggle="modal"
													data-target="#discription" -->
												<a href="javascript:void(0)"
													onclick="itemDetailDesc(
													${itemList.itemId})"
													data-id='${itemList.jsonStr}' id="detail${itemList.itemId}"
													class="curry_pop">${itemList.itemName}</a> <span>${itemList.itemDesc}</span>
											</h3>
											<div class="product-list-type hotel_nm">
												<!-- <span class="text-light-white new">New</span> -->
												<c:forEach items="${itemList.tasteList}" var="tasteList">
													<span class="text-custom-white square-tag grievances_pic"><img
														title="${tasteList.ingrediantName}"
														src="${catImageUrl}/${tasteList.ingrediantImage}"
														alt="tag"
														onerror="if (this.src != '${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg') this.src = '${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg';"></span>
												</c:forEach>

											</div>
										</div>

										<div class="one_order_m">


											<div class="product-list-rating text-center">
												<div class="ratings">
													<c:choose>
														<c:when test="${itemList.rating==1}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==1.5}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i
																class="fas fa-star-half-alt" title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==2}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==2.5}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i
																class="fas fa-star-half-alt" title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==3}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==3.5}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow" title="${itemList.rating}"><i
																class="fas fa-star-half-alt"></i></span>
														</c:when>
														<c:when test="${itemList.rating==4}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==4.5}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i
																class="fas fa-star-half-alt" title="${itemList.rating}"></i></span>
														</c:when>
														<c:when test="${itemList.rating==5}">
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
															<span class="text-yellow"><i class="fas fa-star"
																title="${itemList.rating}"></i></span>
														</c:when>
														<c:otherwise>
															<span class="text-yellow"><i
																class="fas fa-star-half-alt"></i></span>
														</c:otherwise>
													</c:choose>


												</div>
												<div class="rating-text">
													<p class="text-light-white fs-12">${itemList.rating}</p>
												</div>
											</div>

											<div class="product-list-tags text-center">

												<span
													class="rectangle-tag inline bg-gradient-green text-custom-white">${itemList.productStatus}</span>
													<ul class="inline-r">
													<li class="text-light-white">Preparation Time -
														${itemList.preperationTime}</li>
												</ul>
											</div>





											<!--distance-->
											<%-- <div class="product-list-time text-center">

												<ul class="inline-r">
													<li class="text-light-white">Preparation Time -
														${itemList.preperationTime}</li>
												</ul>
											</div> --%>
										</div>

										<div class="one_order_r">

											<!-- <div class="product-list-label text-center">
												<span
													class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
												<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
											</div> -->
											<!--price-->
											<%-- <div class="offer_price">
												<span>Rs.${itemList.mrpAmt}</span>
												Rs.${itemList.spRateAmt}/-
											</div> --%>
											<div class="offer_price">
												<span>Rs.${itemList.mrpAmt}</span>
												Rs.${itemList.mrpDiscAmt}/-
											</div>
											<%-- <div class="hiddenvalue" style="display: none;">${itemList.spRateAmt}</div> --%>
											<div class="hiddenvalue" style="display: none;">${itemList.mrpDiscAmt}</div>
											<div class="hiddencategoryvalue" style="display: none;">${itemList.catName}</div>
											<div class="hiddensubcategoryvalue" style="display: none;">${itemList.subCatName}</div>
											<div class="hiddenItemNamevalue" style="display: none;">${itemList.itemName}</div>
											<div class="hiddenItemTagvalue" style="display: none;">${itemList.tagName}</div>


											<div class="plus_minus_bx" style="display: none;"
												id="numberDiv${itemList.itemId}">
												<div class="input-group">
													<input type="button" value="-" class="button-minus"
														id="minus${itemList.itemId}" data-field="quantity"
														onclick="decrementValue(${itemList.itemId})"> <input
														type="number" step="1" max="" value="1" name="quantity"
														class="quantity-field"
														onchange="addTocart(1,${itemList.itemId})"
														id="quantity${itemList.itemId}"> <input
														type="button" value="+" class="button-plus"
														data-field="quantity" id="plus${itemList.itemId}"
														onclick="incrementValue(${itemList.itemId})">
												</div>
											</div>

											<div class="order_now">
												<div id="order_now_btn${itemList.itemId}">
													<a href="javascript:void(0)"
														onclick="addTocart(2,${itemList.itemId})">Order Now</a>
												</div>
											</div>

										</div>
										<div class="clr"></div>
									</div>



								</div>
							</c:forEach>

							<div id="norecordfound"
								style="display: none; text-align: center; vertical-align: middle;">
								<h4>No Record Found.</h4>
							</div>
						</div>
						<div class="clr"></div>


					</div>

				</div>
			</div>

		</section>




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
					<div class="disc_pop_l" id="itemImageDiv">
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
							<!-- <span class="text-light-white new strong_fnt">New</span> -->
							<span class="text-custom-white square-tag"><img
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

						<div class="button_row bottom">
							<div class="button_row_l">
								<input name="itemQty" type="text"
									class="table_inpt quantity1 numbersOnly" placeholder="Quantity"
									id="itemQty">
							</div>
							<span style="color: red; display: none;" id="qty_error">*
								Enter valid QTY</span>
							<div class="order_now button_row_r" id="descriptionPlaceOrder">
								<a href="#" onclick="addTocart(0)">Place Order</a>
							</div>

						</div>


						<!--related Causin-->
						<div class="pop_cousin pop_disc">
							<span class="pop_disc">Related Items </span>

							<div class="related_pic_row">
								<ul id="discriptionRelatedItem">
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

	<script>
		/* $('#range').click(function(e) {
			myFunction1();
		}); */

		jQuery('.numbersOnly').keyup(function() {
			this.value = this.value.replace(/[^0-9\.]/g, '');
		});
		 
		function addTocart(type,itemId) {
			
			//alert("hi");
		
			var isError = false; 
			$("#qty_error").hide();
			
			var qty = 1;
			
			if(type==0){
				qty = $('#itemQty').val(); 
				if(qty<=0){
					isError = true;
					$("#qty_error").show();
				}else{
					$('#quantity'+itemId).val(qty);
				}
			}else if(type==1){
				
				qty = $('#quantity'+itemId).val();
				
				 if(qty<=0){
					$('#quantity'+itemId).val(0);
					qty=0;
				} 
			}else if(type==2){
				qty=1;
				$('#quantity'+itemId).val(qty);
			}
			  
			
			if (!isError) {
				
				if(qty>0){
					$("#numberDiv"+itemId).show(); 
					$("#order_now_btn"+itemId).hide();
				}else{
					$("#numberDiv"+itemId).hide(); 
					$("#order_now_btn"+itemId).show();
				}
				
				 
				
				$('#discription').modal('hide'); 
				
				
				if(sessionStorage.getItem("cartValue") == null)
				{
					var table =[];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}
				
				
				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue);
				//alert(JSON.stringify(table));
				var findItem=0;
				var findItemPosition="";
				
				
				 
				var data = $("#detail"+itemId).attr("data-id");
				var obj = $.parseJSON(data); 
				
				
				for(var i = 0 ; i<table.length ; i++){
					
					if(table[i].itemId==itemId){
						findItemPosition=i;
						if(qty>0){
							table[i].qty=parseFloat(qty);
							table[i].total=table[i].qty*table[i].price;
						}
						findItem=1;
						break;
					}
				}
				
				if(qty==0 && findItem == 1){
					table.splice(findItemPosition, 1);
				}
				
				
				if(findItem==0){
					/* var total = obj.spRateAmt*qty; */
					var total = obj.mrpDiscAmt*qty;
					 table.push({
						  itemId: obj.itemId,
						  //price: obj.spRateAmt,
						  price: obj.mrpDiscAmt,
						  itemName: obj.itemName,
						  qty: qty,
						  total: total,
						  cgstPer : obj.cgstPer,
						  sgstPer : obj.sgstPer,
						  igstPer : obj.igstPer,
						  specialremark : ''
					});
				}
				
				 sessionStorage.setItem("cartValue", JSON.stringify(table)); 
				 appendCartList();
				 
				var km=0;
				var selectedFrId = $("#hiddenSelectedFrId").val();
				var fr = sessionStorage.getItem("frList");
				var frList = $.parseJSON(fr);
					
				for (var i = 0; i < frList.length; i++) {
					if (selectedFrId == frList[i].frId) {
						km= frList[i].km;
						break;
					}
				}
				sessionStorage.setItem("frKm", km); 
				 
				 
			}
			 
				
		}
		
		function appendCartList() {
			
			 
			if(sessionStorage.getItem("cartValue") == null)
			{
				var table =[];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}
			
			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue); 
			//console.log(table);
			
			//alert(JSON.stringify(table))
				 $("#item_cart_list").html('');
				 
				 var subtotal = 0;
				 
				 try {
					 for(var i = 0 ; i<table.length ; i++){
						 $("#item_cart_list").append('<div class="cat-product-box" id=itemcartdiv'+i+'> <div class="cat-product"> <div class="cat-name">'+
								 '<a href="javascript:void(0)" onclick="itemDetailDesc('+table[i].itemId+')" title="'+table[i].itemName+',Rate : '+table[i].price+'"> <p class="text-light-green"> <span class="text-dark-white">'+table[i].qty+'</span> '
								 +table[i].itemName+'</p> </a> </div> <div class="delete-btn">'+
								 '<a href="javascript:void(0)" class="text-dark-white" onclick="deleteItemFromCart('+i+','+table[i].itemId+')"> <i class="far fa-trash-alt"></i> </a> </div> <div class="price">'+
								 '<a href="javascript:void(0)" class="text-dark-white fw-500">'+(table[i].total).toFixed(2)+'</a> </div> </div> </div>');
						 subtotal=parseFloat(subtotal)+parseFloat((table[i].total).toFixed(2));
					 }
					}
					catch(err) {
						
					}
				 
				 
				 $("#item_cart_list").append('<div class="item-total"> <div class="total-price border-0">'+
						 '<span class="text-dark-white fw-700">Items subtotal:</span> <span class="text-dark-white fw-700">'+(subtotal).toFixed(2)+'</span>'+
						 ' </div> <div class="empty-bag padding-15"> <a href="javascript:void(0)" onclick="clearCartList()">Clear Cart</a> </div> </div>');
				
				 $("#cart_item_count").html(table.length);
				 
		}
		
		function deleteItemFromCart(elem,itemId) {
			 
			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue); 
			//console.log(table);
			 
			table.splice(elem, 1); 
			sessionStorage.setItem("cartValue", JSON.stringify(table)); 
			
			$("#numberDiv"+itemId).hide(); 
			$("#order_now_btn"+itemId).show(); 
			$('#quantity'+itemId).val(0);
			
			appendCartList();
				
		}
		function clearCartList() {
			 $('#popupheading').html("Clear Cart ?"); 
			  $('#confirm')
		        .modal({ backdrop: 'static', keyboard: false });
		              
			  $(".submitmodel").unbind().click(function() {
				  
				  var cartValue = sessionStorage.getItem("cartValue");
					var table = $.parseJSON(cartValue); 
				  
					for(var j=0; j<table.length ; j++){
						 
							$("#numberDiv"+table[j].itemId).hide(); 
							$("#order_now_btn"+table[j].itemId).show();  
							 
					}
				   
				 table =[];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
				appendCartList();
				});
			
				
		}
		
		function itemDetailDesc(item) {
			/* var valuePassedFromJSP = $("body").attr("data-customvalueone");
			 var objson = $.parseJSON(valuePassedFromJSP); 
			console.log(objson);   */
			
			document.getElementById("loaderimg").style.display = "block";
			 var id = $("#detail"+item).attr("data-id");
			 var obj = $.parseJSON(id); 
			
			$('#discription').modal('show'); 
			
			if(obj.productCategory==2){
				 
				$("#discriptionHeading").html('<img src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png" '+
						'alt=""> '+obj.itemName+'<span></span>');
			}else{
				/* $("#discriptionHeading").append('<img src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png" '+
						'alt=""> '+obj.itemName+'<span></span>'); */
				$("#discriptionHeading").html('<img src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png" '+
						'alt=""> '+obj.itemName+'<span></span>');
			}
			$("#discriptionCatName").html(obj.catName);
			$("#discriptionItemShow").html(obj.itemDesc);
			
			var imgPath='${catImageUrl}';
			console.log("list --> "+obj.imageList);
			var img="${pageContext.request.contextPath}/resources/assets/img/dashboard_logo.png";
			var path="${pageContext.request.contextPath}/resources/assets/img/chinese.jpg";
			
			if(obj.imageList!=''){
				img=obj.imageList[0].imageName;
				path=imgPath+""+img;
			}
			//var path=imgPath+""+img;
			
			console.log("IMAGE ----- "+path); 
			
			 	$("#itemImageDiv").html('<img style="width:200px;height:200px;" src="'+path+'" '+
					'alt="">'); 
			
			
			
			
			var testIngradiant=''; 
			for(var i=0 ; i<obj.tasteList.length;i++){
				testIngradiant += '<span class="text-custom-white square-tag"><img title="'+obj.tasteList[i].ingrediantName+'" '+
				'src="${catImageUrl}'+obj.tasteList[i].ingrediantImage+'" alt="tag" onerror="imgErrorJavascript(this,1);"></span>';
			} 
			$("#discriptionTaste").html(testIngradiant);
			$("#discriptionRating").html('<span class="strong_fnt">Rating :</span>');
			
			if(obj.rating==1){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span>');
			}else if(obj.rating==1.5){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
			}else if(obj.rating==2){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
			}else if(obj.rating==2.5){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
			}else if(obj.rating==3){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>');
			}else if(obj.rating==3.5){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
			}else if(obj.rating==4){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>');
			}else if(obj.rating==4.5){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>');
			}else if(obj.rating==5){
				$("#discriptionRating").append('<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>'+
						'<span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span><span class="text-yellow"><i class="fas fa-star"></i></span>');
			}
			$("#discriptionMin").html(obj.preperationTime);
			$("#discriptionRelatedItem").html('');
			var findRelated=0;
			for(var i=0 ; i<obj.relItemList.length;i++){
				$("#discriptionRelatedItem").append('<li><a href="javascript:void(0)" onclick="itemDetailDesc('+obj.relItemList[i].itemId+')" title="'+obj.relItemList[i].itemName+'"> <img src="${catImageUrl}'+obj.relItemList[i].itemName+'"'+
						'class="rounded-circle" alt="categories" onerror="imgErrorJavascript(this,2);"> '+obj.relItemList[i].itemName+' </a></li>'); 
				findRelated=1;
			} 
			if(findRelated==0){
				$("#discriptionRelatedItem").append('-'); 
			}
			/* $("#discriptionPrice").html('<span>Rs.'+obj.mrpAmt+'</span> Rs.'+obj.spRateAmt+'/-');  */
			$("#discriptionPrice").html('<span>Rs.'+obj.mrpAmt+'</span> Rs.'+obj.mrpDiscAmt+'/-'); 
			$("#descriptionPlaceOrder").html('<a href="javascript:void(0)" onclick="addTocart(0,'+obj.itemId+')">Place Order</a>'); 
			$("#itemQty").val(1); 
			document.getElementById("loaderimg").style.display = "none";
			 
		}
		
		function onchangeSearchBy() {
			$('#subcatinput').val('');
			sortCategory();
			myFunction1();
		}
		function allItemSearch() {
		   
			$("input[name='subcat']:checkbox").prop('checked',false); 
			$("input[name='tagcheckbox']:checkbox").prop('checked',false); 
			$('#subcatinput').val('');
			
			document.getElementById("loaderimg").style.display = "block";
			document.getElementById("norecordfound").style.display = "none";

			var find = 0; 
		 
			$('.order_row').hide();
			var txt = $('#myInput1').val();
			//offer_price
			$('.order_row')
					.each(
							function(index) {
 
								if ($(this).text().toUpperCase().indexOf(
										txt.toUpperCase()) != -1) {
									$(this).show(); 
									find=1;
								}
							});

			if (find == 0) {

				document.getElementById("norecordfound").style.display = "block";
			}
			 
			document.getElementById("loaderimg").style.display = "none";
		}
		
		function myFunction1() {
 
			$('#myInput1').val('');
			var list = [];
			
			var catName = $('.active_round').text().trim();
			
			if(catName=="All"){
				catName='';
			}
			
			//alert("CAT NAME - "+catName)
			
			var currentVal = parseFloat(document.getElementById('currentVal').innerHTML);
			 //alert(catName);
			document.getElementById("loaderimg").style.display = "block";
			document.getElementById("norecordfound").style.display = "none";

			var find = 0; 
			
			$("input:checkbox[name=subcat]:checked").each(function() {
				//alert("SUB CAT NAME - "+$(this).val())
				list.push($(this).val());
			});

			$("input:checkbox[name=tagcheckbox]:checked").each(function() {

				list.push($(this).val());
			});

			$('.order_row').hide();
			var txt = $('#subcatinput').val();
			//offer_price
			$('.order_row')
					.each(
							function(index) {

								var price = parseFloat(document
										.getElementsByClassName("hiddenvalue")[index].innerHTML);
								var hiddencategoryvalue = document
										.getElementsByClassName("hiddencategoryvalue")[index].innerHTML ;
								var hiddenItemNamevalue = document.getElementsByClassName("hiddenItemNamevalue")[index].innerHTML ;
								var hiddensubcategoryvalue = document.getElementsByClassName("hiddensubcategoryvalue")[index].innerHTML ;
								var hiddenItemTagvalue = document.getElementsByClassName("hiddenItemTagvalue")[index].innerHTML ;
								
								var combineString = hiddenItemNamevalue+' '+hiddensubcategoryvalue+' '+ hiddenItemTagvalue;
								//alert(combineString);
								
								//alert(hiddencategoryvalue);
								//alert(catName);
								//alert(hiddenItemNamevalue);
								//alert(txt);
								
								if (hiddencategoryvalue.toUpperCase().replace("&AMP;","&").indexOf(
										catName.toUpperCase()) != -1) {
									
									//alert("IF - 1 "+hiddencategoryvalue.toUpperCase())
									
								if (hiddenItemNamevalue.toUpperCase().indexOf(
										txt.toUpperCase()) != -1) {
									
									//alert("IF - 2 "+hiddenItemNamevalue.toUpperCase())
									
									//alert("LIST - "+list)
									
									if (list.length > 0) {
										for (var i = 0; i < list.length; i++) {

											//alert("SUBSTR - "+list[i].toUpperCase());
											
											if (combineString.toUpperCase()
													.indexOf(
															list[i]
																	.toUpperCase()) != -1) {
												
												//alert("IF - 3 "+combineString.toUpperCase())
												
												if (price <= currentVal) {
													$(this).show();
													find = 1;
												}

											}

										}
									} else {
										
										//alert("ELSE - 3 "+hiddenItemNamevalue.toUpperCase())
										if (price <= currentVal) {
											$(this).show();
											find = 1;
										}
									}

								}
								}
							});

			//alert("Find - "+find)
			
			if (find == 0) {

				document.getElementById("norecordfound").style.display = "block";
			}
			 
			document.getElementById("loaderimg").style.display = "none";
		}

		function sortCategory() {

			if(document.getElementById("searchByItem").checked==true){
				var catName = $('.active_round').text().trim();
				
				if(catName=="All"){
					catName="";
				} 
				$('.subcatclass').hide();
				var txt = $('#subcatinput').val();

				$('.subcatclass').each(
						function(index) {

							var catnamehidn =  document.getElementsByClassName("subcatdummyclass")[index].innerHTML; 
							
							if (catnamehidn.toUpperCase().replace("&AMP;","&").indexOf(
									catName.toUpperCase()) != -1 ) {
								$(this).show(); 
							}
						});
				myFunction1();
			}else{
				var catName = $('.active_round').text().trim();
				if(catName=="All"){
					catName="";
				}
			 
				$('.subcatclass').hide();
				var txt = $('#subcatinput').val();

				$('.subcatclass').each(
						function(index) {

							var catnamehidn =  document
									.getElementsByClassName("subcatdummyclass")[index].innerHTML;
							var subcatnamehidn =  document
							.getElementsByClassName("subcatdummyclass1")[index].innerHTML; 
							if (catnamehidn.toUpperCase().replace("&AMP;","&").indexOf(
									catName.toUpperCase()) != -1 && subcatnamehidn.toUpperCase().indexOf(
											txt.toUpperCase()) != -1) {
								$(this).show(); 
							}
						});
			}
			

		}

		function changeCategory(id) {
			$('#subcatinput').val('');
			var active = document.querySelector(".active_round"); 
			active.classList.remove("active_round");   
			$('#category'+id).addClass("active_round");
			$("input[name='subcat']:checkbox").prop('checked',false); 
			sortCategory(); 
			myFunction1();
			//alert(id);
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#respMenu").aceResponsiveMenu({
				resizeWidth : '768', // Set the same in Media query
				animationSpeed : 'fast', //slow, medium, fast
				accoridonExpAll : false
			//Expands all the accordion menu on click
			});
			//$("#currentVal").html(500);
			getFrList();
			//appendCartList();
			getItemList(); 
		});
		 
		function getItemList() {

			//document.getElementById("loaderimg").style.display = "block";
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
						
							//document.getElementById("loaderimg").style.display = "none";
							//alert(JSON.stringify(response))
							sessionStorage.setItem("allItemList", JSON
									.stringify(response));
							
							var cartValue = sessionStorage.getItem("cartValue");
							var table = $.parseJSON(cartValue); 
							
							var newCart=[];
							
							if(table!=null){
								for(var i=0; i<response.length ; i++){
									for(var j=0; j<table.length ; j++){
										if(response[i].itemId==table[j].itemId){
											newCart.push(table[j]);
										}
									}
								}
							}
							
							var max=  Math.max.apply(Math, response.map(function(o) { 
			                    return o.spDiscAmt;  
			                })); 
							//alert(max)
							sessionStorage.setItem("maxAmt", max);
							
							$("#range").slider({
								range : "min",
								max : max,
								value : max,
								slide : function(e, ui) {

									$("#currentVal").html(ui.value);
									myFunction1();
								}
							});
							$("#currentVal").html(max);
							
							
							
							sessionStorage.setItem("cartValue", JSON.stringify(newCart)); 
							appendCartList();

							for(var i=0; i<response.length ; i++){
								
								for(var j=0; j<newCart.length ; j++){
									
									if(response[i].itemId==newCart[j].itemId){
										$("#numberDiv"+newCart[j].itemId).show(); 
										$("#order_now_btn"+newCart[j].itemId).hide(); 
										$('#quantity'+newCart[j].itemId).val(newCart[i].qty);
										break;
									}
								}
								   		
							}
						},
					});

		}
		function getFrList() {

			var selectedFrId = $("#hiddenSelectedFrId").val();

			var fr = sessionStorage.getItem("frList");
			var frList = $.parseJSON(fr);

			var html = '';
			
			for (var i = 0; i < frList.length; i++) {
				
				var frType="";
				if(frList[i].frType == 1) {
					frType="Dairy";
				}else if(frList[i].frType == 2) {
					frType="Cloud Kitchen";
				}else if(frList[i].frType == 3) {
					frType="Dairy & Cloud Kitchen";
				}

				if (selectedFrId == frList[i].frId) {
					html += '<option value="' + frList[i].frId + '" selected>'
					+ frList[i].frName +' ( '+ frList[i].frCode+' - '+ frType+ ') - ' + frList[i].km
					+ ' KM</option>';
				} else {
					html += '<option value="' + frList[i].frId + '" >'
					+ frList[i].frName +' ( '+ frList[i].frCode+' - '+ frType+ ') - ' + frList[i].km
					+ ' KM</option>';
				}
				
				
/* 				html += '<option value="' + frList[i].frId + '" selected>'
				+ frList[i].frName +' ( '+ frList[i].frCode+' - '+ frType+ ') - '+frList[i].frAddress + ' - ' + frList[i].km
				+ ' KM</option>'; */

			}

			$('#headerFrId').html(html);
			//$("#headerFrId").trigger("country:updated");
			$("#headerFrId").trigger("change");

		}
		
		function changeFrId() {

			var headerFrId = $("#headerFrId").val();
			var selectedFrId = $("#hiddenSelectedFrId").val();
			
			if(headerFrId!=selectedFrId){
				
				$('#popupheading').html("You want to change shop?"); 
				  $('#confirm')
			        .modal({ backdrop: 'static', keyboard: false });
				  
				  $(".submitmodel").unbind().click(function() {
				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue); 
				
				document.getElementById("loaderimg").style.display = "block";
				var fd = new FormData();
				fd.append('headerFrId', headerFrId);
				fd.append('cartList', cartValue);
				
				$.ajax({
							url : '${pageContext.request.contextPath}/changeFrId',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {
 
								//document.getElementById("loaderimg").style.display = "none"; 
								//alert(JSON.stringify(response))
								sessionStorage.setItem("cartValue",JSON.stringify(response));  
								window.location.reload();
							},
						});
				  });
				  
				  $("#cancelOrder").unbind().click(function() {
					  $('#headerFrId').val(selectedFrId);
						$("#headerFrId").trigger("change");
				  });
				  
				  $(".kot_close").unbind().click(function() {
					  $('#headerFrId').val(selectedFrId);
						$("#headerFrId").trigger("change");
				  });
			}
			

		}
	</script>

	<!-- range slider js -->

	<script>
		(function() {
			
			//var amt = sessionStorage.getItem("maxAmt");
			//alert(amt)
			
			$("#range").slider({
				range : "min",
				max : 2000,
				value : 2000,
				slide : function(e, ui) {

					$("#currentVal").html(ui.value);
					myFunction1();
				}
			});

		}).call(this);
	</script>


	<script>
	function incrementValue(itemId) {
		  
		  var currentVal = parseFloat($('#quantity'+itemId).val()); 
		
		  if (!isNaN(currentVal)) {
			  $('#quantity'+itemId).val(currentVal + 1);  
		  } else {
			  $('#quantity'+itemId).val(1);   
		  }
		  addTocart(1,itemId);
		}

		function decrementValue(itemId) {
			
		var currentVal = parseFloat($('#quantity'+itemId).val()); 
		  
		  if (!isNaN(currentVal) && currentVal > 0) {
			  if(currentVal == 1){
				  //alert("hi");
				  $('#quantity'+itemId).val(0);  
				  $('#order_now_btn'+itemId).show();  
				  $('#numberDiv'+itemId).hide();  
			  }else{
				  $('#quantity'+itemId).val(currentVal - 1);  
			  }
			    
		  } else {
			 
			  $('#quantity'+itemId).val(0);  
			  $('#order_now_btn'+itemId).show();  
			  $('#numberDiv'+itemId).hide();  
			  //numberDiv
			  //order_now_btn
		  }
		  addTocart(1,itemId);
		}
		
		
	</script>

</body>

</html>
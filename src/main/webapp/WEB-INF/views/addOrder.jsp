<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header1.jsp"></jsp:include>
<body onload="appendCartList()">
	<%-- data-customvalueone='${jsonList}' --%>

	<div class="loader" id="loaderimg" style="display: none;">
		<img
			src="${pageContext.request.contextPath}/resources/assets/img/svg/loader.svg"
			alt="">
	</div>


	<!-- Navigation -->
	<section
		class="final-order section-padding-top section-padding-bottom  bg-light-grey">
		<div class="container-fluid">
			<!--restarurent offer-->

			<div class="row">

				<div class="col-12">
					<div class="featured-partners-slider swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="bke1zw-1 feJJpQ">
									<section class="sc-hzOKmB eTLmSe">
										<a href="#" class="sc-fjNYmT cPRXMx">
											<div class="s1isp7-0 gsidZp sc-fQfKYo kjRoqZ">
												<img alt="Trending This Week"
													src="${pageContext.request.contextPath}/resources/assets/img/trending_1.jpg"
													loading="lazy" class="s1isp7-4 bBALuk">
											</div>
											<section class="sc-cOoQYZ eGlRiQ">
												<section class="sc-ddcOto lMfoD">
													<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE offer_txt">
														Up to <span>40%</span> off
													</p>
													<div class="sc-jrOYZv gkgQzg">
														<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">Good Food
															To make your Mood</h6>
														<!-- <i class="fa fa-caret-right" aria-hidden="true"></i> -->
													</div>
												</section>
											</section>
										</a>
									</section>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="bke1zw-1 feJJpQ">
									<section class="sc-hzOKmB eTLmSe">
										<a href="#" class="sc-fjNYmT cPRXMx">
											<div class="s1isp7-0 gsidZp sc-fQfKYo kjRoqZ">
												<img alt="Trending This Week"
													src="${pageContext.request.contextPath}/resources/assets/img/trending_2.jpg"
													loading="lazy" class="s1isp7-4 bBALuk">
											</div>
											<section class="sc-cOoQYZ eGlRiQ">
												<section class="sc-ddcOto lMfoD">
													<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE offer_txt">
														Up to <span>40%</span> off
													</p>
													<div class="sc-jrOYZv gkgQzg">
														<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">Good Food
															To make your Mood</h6>
														<!-- <i class="fa fa-caret-right" aria-hidden="true"></i> -->
													</div>
												</section>
											</section>
										</a>
									</section>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="bke1zw-1 feJJpQ">
									<section class="sc-hzOKmB eTLmSe">
										<a href="#" class="sc-fjNYmT cPRXMx">
											<div class="s1isp7-0 gsidZp sc-fQfKYo kjRoqZ">
												<img alt="Trending This Week"
													src="${pageContext.request.contextPath}/resources/assets/img/trending_3.jpg"
													loading="lazy" class="s1isp7-4 bBALuk">
											</div>
											<section class="sc-cOoQYZ eGlRiQ">
												<section class="sc-ddcOto lMfoD">
													<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE offer_txt">
														Up to <span>40%</span> off
													</p>
													<div class="sc-jrOYZv gkgQzg">
														<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">Good Food
															To make your Mood</h6>
														<!-- <i class="fa fa-caret-right" aria-hidden="true"></i> -->
													</div>
												</section>
											</section>
										</a>
									</section>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="bke1zw-1 feJJpQ">
									<section class="sc-hzOKmB eTLmSe">
										<a href="#" class="sc-fjNYmT cPRXMx">
											<div class="s1isp7-0 gsidZp sc-fQfKYo kjRoqZ">
												<img alt="Trending This Week"
													src="${pageContext.request.contextPath}/resources/assets/img/trending_4.jpg"
													loading="lazy" class="s1isp7-4 bBALuk">
											</div>
											<section class="sc-cOoQYZ eGlRiQ">
												<section class="sc-ddcOto lMfoD">
													<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE offer_txt">
														Up to <span>40%</span> off
													</p>
													<div class="sc-jrOYZv gkgQzg">
														<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">Good Food
															To make your Mood</h6>
														<!-- <i class="fa fa-caret-right" aria-hidden="true"></i> -->
													</div>
												</section>
											</section>
										</a>
									</section>
								</div>
							</div>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>



			</div>



		</div>

		<!-- Browse by category -->
		<section class="browse-cat u-line category_bx">
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

								<!-- <div class="swiper-slide swiper-slide-active">
									<a href="#" class="categories active_round">
										<div class="icon icon-parent text-custom-white bg-light-green">
											<img src="/ck/resources/assets/img/chinese.jpg"
												class="rounded-circle" alt="categories"
												onerror="imgError(this,'/ck/resources/assets/img/chinese.jpg');">
										</div> <span class="text-light-black cat-name fw-500">Lassi</span>
									</a>
								</div> -->

								<!-- <div class="swiper-slide swiper-slide-active">
									<a href="#" class="categories">
										<div class="icon icon-parent text-custom-white bg-light-green">
											<img src="/ck/resources/assets/img/chinese.jpg"
												class="rounded-circle" alt="categories"
												onerror="imgError(this,'/ck/resources/assets/img/chinese.jpg');">
										</div> <span class="text-light-black cat-name fw-500">Lassi</span>
									</a>
								</div> -->


								<div class="swiper-slide">
									<a href="javascript:void(0)" class="categories active_round"
										id="category0" onclick="changeCategory(0)">
										<div class="icon icon-parent text-custom-white bg-light-green">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/chinese.jpg"
												class="rounded-circle" alt="categories"
												onerror="imgError(this,'${pageContext.request.contextPath}/resources/assets/img/chinese.jpg');">
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
													onerror="imgError(this,'${pageContext.request.contextPath}/resources/assets/img/chinese.jpg');">
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
		</section>
		<!-- Browse by category -->

		<section class="section-padding-top section-padding-bottom">
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



						<div class="inner_scroll">
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
												<span class="text-light-white new">New</span>
												<c:forEach items="${itemList.tasteList}" var="tasteList">
													<span class="text-custom-white square-tag"><img
														title="${tasteList.ingrediantName}"
														src="${catImageUrl}/${tasteList.ingrediantImage}"
														alt="tag"
														onerror="imgError(this,'${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg');"></span>
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
													<p class="text-light-white fs-12">
														<%-- ${itemList.rating} --%>
													</p>
												</div>
											</div>

											<div class="product-list-tags text-center">

												<span
													class="rectangle-tag inline bg-gradient-green text-custom-white">${itemList.productStatus}</span>
											</div>
											<!--distance-->
											<div class="product-list-time text-center">

												<ul class="inline-r">
													<li class="text-light-white">${itemList.preperationTime}</li>
												</ul>
											</div>
										</div>

										<div class="one_order_r">

											<div class="product-list-label text-center">
												<span
													class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
												<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
											</div>
											<!--price-->
											<div class="offer_price">
												<span>Rs.${itemList.mrpAmt}</span>
												Rs.${itemList.spRateAmt}/-
											</div>
											<div class="hiddenvalue" style="display: none;">${itemList.spRateAmt}</div>
											<div class="hiddencategoryvalue" style="display: none;">${itemList.catName}</div>
											<div class="hiddensubcategoryvalue" style="display: none;">${itemList.subCatName}</div>
											<div class="hiddenItemNamevalue" style="display: none;">${itemList.itemName}</div>
											<div class="hiddenItemTagvalue" style="display: none;">${itemList.tagName}</div>
											<div class="order_now">
												<a href="javascript:void(0)"
													onclick="addTocart(1,${itemList.itemId})">Order Now</a>
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
					<div class="clr"></div>
				</div>




			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
	<!--Plugin Initialization-->
	<script>
	function imgErrorJavascript(image,type) {
		//alert(imagepath)
		image.onerror = "";
		if(type==1){
			image.src = '${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg';
		}else if(type==2){
			image.src = '${pageContext.request.contextPath}/resources/assets/img/italian.jpg';
		}
		
		return true;
	}
</script>
	<script>
		/* $('#range').click(function(e) {
			myFunction1();
		}); */

		jQuery('.numbersOnly').keyup(function() {
			this.value = this.value.replace(/[^0-9\.]/g, '');
		});
		
		 
		
		function addTocart(type,itemId) {
			
			var qty = 1;
			
			if(type==0){
				qty = $('#itemQty').val();
			}
			 
			var isError = false;
			
			$("#qty_error").hide();
			
			if(qty<1){
				isError = true;
				$("#qty_error").show();
			}
			
			if (!isError) {
				
				$('#discription').modal('hide'); 
				
				var cartValue = sessionStorage.getItem("cartValue");
				 var table = $.parseJSON(cartValue);
				 
				var data = $("#detail"+itemId).attr("data-id");
				var obj = $.parseJSON(data); 
				var total = obj.spRateAmt*qty;
				 table.push({
					  itemId: obj.itemId,
					  price: obj.spRateAmt,
					  itemName: obj.itemName,
					  qty: qty,
					  total: total
				});
				 sessionStorage.setItem("cartValue", JSON.stringify(table)); 
				 appendCartList();
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
				 for(var i = 0 ; i<table.length ; i++){
					 $("#item_cart_list").append('<div class="cat-product-box" id=itemcartdiv'+i+'> <div class="cat-product"> <div class="cat-name">'+
							 '<a href="javascript:void(0)" title="'+table[i].itemName+'"> <p class="text-light-green"> <span class="text-dark-white">'+table[i].qty+'</span> '
							 +table[i].itemName+'</p> </a> </div> <div class="delete-btn">'+
							 '<a href="javascript:void(0)" class="text-dark-white" onclick="deleteItemFromCart('+i+')"> <i class="far fa-trash-alt"></i> </a> </div> <div class="price">'+
							 '<a href="javascript:void(0)" class="text-dark-white fw-500">'+(table[i].total).toFixed(2)+'</a> </div> </div> </div>');
					 subtotal=parseFloat(subtotal)+parseFloat((table[i].total).toFixed(2));
				 }
				 
				 $("#item_cart_list").append('<div class="item-total"> <div class="total-price border-0">'+
						 '<span class="text-dark-white fw-700">Items subtotal:</span> <span class="text-dark-white fw-700">'+(subtotal).toFixed(2)+'</span>'+
						 ' </div> <div class="empty-bag padding-15"> <a href="javascript:void(0)" onclick="clearCartList()">Empty bag</a> </div> </div>');
				
				 $("#cart_item_count").html(table.length);
				 
		}
		
		function deleteItemFromCart(elem) {
			 
			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue); 
			//console.log(table);
			 
			table.splice(elem, 1); 
			sessionStorage.setItem("cartValue", JSON.stringify(table)); 
			appendCartList();
				
		}
		function clearCartList() {
			 
			var table =[];
			sessionStorage.setItem("cartValue", JSON.stringify(table));
			appendCartList();
				
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
			
			var testIngradiant='<span class="text-light-white new strong_fnt">New</span>'; 
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
			$("#discriptionPrice").html('<span>Rs.'+obj.mrpAmt+'</span> Rs.'+obj.spRateAmt+'/-'); 
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
			 
			var currentVal = parseFloat(document.getElementById('currentVal').innerHTML);
			 //alert(catName);
			document.getElementById("loaderimg").style.display = "block";
			document.getElementById("norecordfound").style.display = "none";

			var find = 0; 
			
			$("input:checkbox[name=subcat]:checked").each(function() {

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
								
								if (hiddencategoryvalue.toUpperCase().indexOf(
										catName.toUpperCase()) != -1) { 
								if (hiddenItemNamevalue.toUpperCase().indexOf(
										txt.toUpperCase()) != -1) {
									if (list.length > 0) {
										for (var i = 0; i < list.length; i++) {

											if (combineString.toUpperCase()
													.indexOf(
															list[i]
																	.toUpperCase()) != -1) {
												if (price <= currentVal) {
													$(this).show();
													find = 1;
												}

											}

										}
									} else {
										if (price <= currentVal) {
											$(this).show();
											find = 1;
										}
									}

								}
								}
							});

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

							var catnamehidn =  document
									.getElementsByClassName("subcatdummyclass")[index].innerHTML; 
							if (catnamehidn.toUpperCase().indexOf(
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
							if (catnamehidn.toUpperCase().indexOf(
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
			$("#currentVal").html(500);
		});
	</script>

	<!-- range slider js -->

	<script>
		(function() {
			$("#range").slider({
				range : "min",
				max : 500,
				value : 500,
				slide : function(e, ui) {

					$("#currentVal").html(ui.value);
					myFunction1();
				}
			});

		}).call(this);
	</script>


</body>

</html>
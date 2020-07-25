<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header1.jsp"></jsp:include>
<body>

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


								<c:forEach items="${catList}" var="catList">

									<div class="swiper-slide">
										<a href="#" class="categories">
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
								<div class="search_filt">
									<input name="" type="text" class="filter_inpt"
										placeholder="Search Sub Category" id="subcatinput"
										onkeyup="sortCategory()" /> <i class="fa fa-search"
										aria-hidden="true"></i>
								</div>

								<c:forEach items="${subcatList}" var="subcatList">
									<div class="subcatclass">
										<label class="custom-checkbox radio_one"> <input
											type="checkbox" name="subcat" class="checkboxclass"
											onchange="myFunction1()" value="${subcatList.subCatName}"><span
											class="checkmark"></span> ${subcatList.subCatName}
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
							<div class="tags_bx">
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
							</div>

						</div>
					</div>
					<!--right product boxes -->
					<div class="col-lg-9">



						<div class="inner_scroll">
							<!--1-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> <a href="javascript:void(0)"
												data-toggle="modal" data-target="#discription"
												class="curry_pop">Curry Leaves Barbecuing and Grilling</a> <span>Sharanpur
												Road Nashik <br> Casual Dining - North Mumbai
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">180</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>

								<!--discription popup up-->

							</div>
							<!-- 2 -->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> <a href="javascript:void(0)"
												data-toggle="modal" data-target="#discription"
												class="curry_pop">Veg Pizza</a> <span>Sharanpur Road
												Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.340/-
										</div>
										<div class="hiddenvalue" style="display: none;">340</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>

								<!--discription popup up-->

							</div>
							<!--3-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
												alt=""> Pav Bhaji <span>Sharanpur Road Nashik <br>
												Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">400</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>
							<!--4-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> Veg Biryani <span>Sharanpur Road Nashik
												<br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">

											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">500</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>
							<!--4-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
												alt=""> Veg Biryani Masala <span>Sharanpur Road
												Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">400</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>
							<!--5-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> Lassi<span>Sharanpur Road Nashik <br>
												Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">400</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>

							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> Veg Biryani Khada <span>Sharanpur Road
												Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">400</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> Chikan Biryani <span>Sharanpur Road
												Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">400</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>
							<div class="order_row">

								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> Soyabean <span>Sharanpur Road Nashik <br>
												Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_1.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_2.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/chilli_3.jpg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/sweet_1.png"
												alt="tag"></span>
										</div>
									</div>
									<!--center-->
									<div class="one_order_m">
										<!--rating-->
										<div class="product-list-rating text-center">
											<div class="ratings">
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i class="fas fa-star"></i></span>
												<span class="text-yellow"><i
													class="fas fa-star-half-alt"></i></span>
											</div>
											<div class="rating-text">
												<p class="text-light-white fs-12">3845 ratings</p>
											</div>
										</div>
										<!--offer percentage -->
										<div class="product-list-tags text-center">
											<span
												class="text-custom-white rectangle-tag inline bg-gradient-red">10%</span>
											<span
												class="rectangle-tag inline bg-gradient-green text-custom-white">Trending</span>
										</div>
										<!--distance-->
										<div class="product-list-time inline">
											<!-- <span class="circle-tag inline"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg" alt="tag"></span> -->
											<ul class="inline-r">
												<!-- <li class="text-light-white">1.18 mi</li> -->
												<li class="text-light-white">30-40 mins</li>
											</ul>
										</div>
									</div>
									<!--right-->
									<div class="one_order_r">
										<!--combo-->
										<div class="product-list-label text-center">
											<span
												class="rectangle-tag inline bg-gradient-red text-custom-white">Label</span>
											<span class="rectangle-tag inline bg-dark text-custom-white">Combo</span>
										</div>
										<!--price-->
										<div class="offer_price">
											<span>Rs.250</span> Rs.180/-
										</div>
										<div class="hiddenvalue" style="display: none;">400</div>
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>

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

						<div class="button_row bottom">
							<div class="button_row_l">
								<input name="" type="text" class="table_inpt quantity1"
									placeholder="Quantity">
							</div>
							<div class="order_now button_row_r">
								<a href="#">Place Order</a>
							</div>
						</div>


						<!--related Causin-->
						<div class="pop_cousin pop_disc">
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

		function myFunction11() {

			/* $(".scrollbar-content").css("top", "0");
			$(".scrollbar-handle").css("top", "0"); */
			var currentVal = parseFloat(document.getElementById('currentVal').innerHTML);
			//alert(currentVal);
			document.getElementById("loaderimg").style.display = "block";
			document.getElementById("norecordfound").style.display = "none";

			var find = 0;

			var list = [];

			$("input:checkbox[name=subcat]:checked").each(function() {

				list.push($(this).val());
			});

			$("input:checkbox[name=tagcheckbox]:checked").each(function() {

				list.push($(this).val());
			});

			$('.order_row').hide();
			var txt = $('#myInput1').val();
			//offer_price
			$('.order_row')
					.each(
							function(index) {

								var price = parseFloat(document
										.getElementsByClassName("hiddenvalue")[index].innerHTML);

								var text = $(this).text();

								if ($(this).text().toUpperCase().indexOf(
										txt.toUpperCase()) != -1) {
									if (list.length > 0) {
										for (var i = 0; i < list.length; i++) {

											if ($(this)
													.text()
													.toUpperCase()
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
							});

			if (find == 0) {

				document.getElementById("norecordfound").style.display = "block";
			}
			/* $('.order_row').each(
					function() {
						if ($(this).text().toUpperCase().indexOf(
								txt.toUpperCase()) != -1) {
							$(this).show();
						}
					}); */

			document.getElementById("loaderimg").style.display = "none";
		}

		function sortCategory() {

			$('.subcatclass').hide();
			var txt = $('#subcatinput').val();

			$('.subcatclass').each(
					function(index) {

						if ($(this).text().toUpperCase().indexOf(
								txt.toUpperCase()) != -1) {
							$(this).show();
						}
					});

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
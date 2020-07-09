<!DOCTYPE html>
<html lang="en">



<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!--banner with search-->
	<div class="add_banner">
		<div class="add_frm">
			<div class="frm_cont">
				<div class="add_place ">
					<input name="" type="text" class="inp_place"
						placeholder="Enter Pincode" /> <i class="fa fa-map-marker"
						aria-hidden="true"></i>
				</div>
				<div class="place_search">
					<!-- <input name="" type="text" class="sear_place" maxlength="10"
						placeholder="Search for restaurant, cuisine or a dish" />  -->
					<select class="form-control">
						<option value="">Select Shop</option>
						<option value="Shop 1" data-name="">Shop 1</option>
						<option value="Shop 2" data-name="">Shop 2</option>
						<option value="Shop 3" data-name="">Shop 3</option>
						<option value="Shop 4" data-name="">Shop 4</option>
						<option value="Shop 5" data-name="">Shop 5</option>
						<option value="Shop 6" data-name="">Shop 6</option>
					</select>
				</div>
				<div class="place_btn">
					<input name="" type="button" value="Search" class="search_res" />
				</div>

			</div>
		</div>
	</div>


	<!-- Navigation -->
	<section
		class="final-order section-padding-top section-padding-bottom  bg-light-grey">
		<div class="container-fluid">
			<!--restarurent offer-->
			<div class="row">
				<div class="col-lg-3">
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
										<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE">Veggie Friendly</p>
										<div class="sc-jrOYZv gkgQzg">
											<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">10 Places</h6>
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</div>
									</section>
								</section>
							</a>
						</section>
					</div>
				</div>
				<div class="col-lg-3">
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
										<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE">Pocket Friendly</p>
										<div class="sc-jrOYZv gkgQzg">
											<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">10 Places</h6>
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</div>
									</section>
								</section>
							</a>
						</section>
					</div>
				</div>
				<div class="col-lg-3">
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
										<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE">Great Food, No
											Bull</p>
										<div class="sc-jrOYZv gkgQzg">
											<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">10 Places</h6>
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</div>
									</section>
								</section>
							</a>
						</section>
					</div>
				</div>
				<div class="col-lg-3">
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
										<p class="sc-1hez2tp-0 sc-dzVpKk eUhPqE">Must-Visit
											Restaurants..</p>
										<div class="sc-jrOYZv gkgQzg">
											<h6 class="sc-1gbvc19-0 sc-gIjDWZ jRoqeo">10 Places</h6>
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</div>
									</section>
								</section>
							</a>
						</section>
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
								cuisine</h3>
						</div>
					</div>
					<div class="col-12">
						<div class="category-slider swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon icon-parent text-custom-white bg-light-green">
											<i class="fas fa-map-marker-alt"></i>
										</div> <span class="text-light-black cat-name fw-500">Brooklyn</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/italian.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Italian
									</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/thai.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Thai </span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/chinese.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Chinese
									</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/maxican.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Mexican
									</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/indian.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Indian
									</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/lebenese.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Lebanese
									</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/japanese.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">Japanese
									</span>
									</a>
								</div>
								<div class="swiper-slide">
									<a href="#" class="categories">
										<div class="icon text-custom-white bg-light-green ">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/american.jpg"
												class="rounded-circle" alt="categories">
										</div> <span class="text-light-black cat-name fw-500">American
									</span>
									</a>
								</div>
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
										placeholder="Search your favorite food" /> <i
										class="fa fa-search" aria-hidden="true"></i>
								</div>


								<form action="" method="get">
									<label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" checked />
										Barbecuing and Grilling
									</label> <label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" /> Soup and Salads
									</label> <label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" /> Chinese
									</label> <label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" /> Streetfood
									</label> <label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" /> Fastfood
									</label> <label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" /> Seafood
									</label> <label class="radio_one"> <input type="radio"
										class="option-input radio" name="example" /> Beverages
									</label>
								</form>


							</div>

							<!--delivery radio-->
							<div class="delivery_radio">
								<ul>
									<li><label class="radio_one"> <input type="radio"
											class="option-input radio" name="example" checked />
											Delivery
									</label></li>
									<li><label class="radio_one"> <input type="radio"
											class="option-input radio" name="example" checked /> Takeout
									</label></li>
								</ul>
								<div class="clr"></div>
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
									<div class="tags_list">
										<a href="#"> Pizza </a> <a href="#"> Sandwich </a> <a href="#">
											Fish </a> <a href="#"> Desert </a> <a href="#"> Salad </a> <a
											href="#"> Italian </a> <a href="#"> Indian </a> <a href="#">
											Fish </a> <a href="#"> Pizza </a> <a href="#"> Sandwich </a> <a
											href="#"> Fish </a> <a href="#"> Desert </a> <a href="#">
											Salad </a> <a href="#"> Italian </a> <a href="#"> Indian </a> <a
											href="#"> Fish </a>
									</div>
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
						<div class="row">
							<!--box-1-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_1.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="type-tag bg-gradient-green text-custom-white">Trending</span>
												<div class="custom-tag ribbonn">
													<span>10% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating yellow_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-2-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_2.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="text-custom-white type-tag bg-gradient-orange">New</span>
												<div class="custom-tag ribbonn">
													<span>20% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating green_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-3-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_3.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="type-tag bg-gradient-green text-custom-white">Trending</span>
												<div class="custom-tag ribbonn">
													<span>10% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating yellow_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-4-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_1.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="type-tag bg-gradient-green text-custom-white">Trending</span>
												<div class="custom-tag ribbonn">
													<span>10% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating yellow_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-5-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_2.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="text-custom-white type-tag bg-gradient-orange">New</span>
												<div class="custom-tag ribbonn">
													<span>20% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating green_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-6-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_3.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="type-tag bg-gradient-green text-custom-white">Trending</span>
												<div class="custom-tag ribbonn">
													<span>10% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating yellow_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-7-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_1.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="type-tag bg-gradient-green text-custom-white">Trending</span>
												<div class="custom-tag ribbonn">
													<span>10% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating yellow_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-8-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_2.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="text-custom-white type-tag bg-gradient-orange">New</span>
												<div class="custom-tag ribbonn">
													<span>20% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating green_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>
							<!--box-9-->
							<div class="col-lg-4">
								<div class="product_bx_one">
									<div class="product-img">
										<a href="#"> <img
											src="${pageContext.request.contextPath}/resources/assets/img/restro_3.jpg"
											class="img-fluid full-width prod_pic" alt="product-img">
										</a>
										<div class="overlay">
											<div class="product-tags padding-10">
												<span class="circle-tag right"> <img
													src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
													alt="tag">
												</span> <span class="type-tag bg-gradient-green text-custom-white">Trending</span>
												<div class="custom-tag ribbonn">
													<span>10% Off</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product_one_caption">
										<div class="product_nm_row">
											<div class="prod_nm_l">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
													alt=""> Curry Leaves Barbecuing and Grilling
											</div>
											<div class="prod_rating yellow_clr">
												<i class="fa fa-star" aria-hidden="true"></i> 3.1
											</div>
											<div class="clr"></div>
										</div>
										<div class="prod_add">
											Sharanpur Road Nashik <br> Casual Dining - North Indian
										</div>
										<div class="prod_rpc_row">
											<div class="prod_prc">
												<span>Rs.100</span> Rs.90
											</div>
											<div class="order_btn_rgt">
												<a href="#">Order Now</a>
											</div>
											<div class="clr"></div>
										</div>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>




	</section>


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

	<!-- range slider js -->
	<link rel="stylesheet"
		href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/themes/smoothness/jquery-ui.css">
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
	<script>
		(function() {
			$("#range").slider({
				range : "min",
				max : 1000,
				value : 100,
				slide : function(e, ui) {
					$("#currentVal").html(ui.value);
				}
			});

		}).call(this);
	</script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<!-- Navigation -->

	<!--banner with search-->
	<div class="add_banner">
		<div class="add_frm">
			<div class="frm_cont">
				<div class="add_place">
					<!-- <input name="" type="text" class="inp_place" placeholder="Enter Pincode" />
            <i class="fa fa-map-marker" aria-hidden="true"></i> -->
					<!-- <select class="form-control form-control-submit delivery custom-select-2 full-width">
                <option value="delivery">Delivery</option>
                <option value="pickup">Pickup</option>
                <option value="delivery_and_pickup">Delivery &amp; Pickup</option>
            </select> -->


					<select class="country " tabindex="-1" style="width: 100%;">
						<option value="">Select Shop</option>
						<option value="1">Shop No. 1</option>
					</select>

				</div>
				<div class="place_search">
					<input name="" type="text" class="sear_place" maxlength="10"
						placeholder="Search for restaurant, cuisine or a dish" />
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
									<label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										Barbecuing and Grilling
									</label> <label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										Soup and Salads
									</label> <label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										chinese
									</label> <label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										Streetfood
									</label> <label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										Fastfood
									</label> <label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										Seafood
									</label> <label class="custom-checkbox radio_one"> <input
										type="checkbox" name="#"><span class="checkmark"></span>
										Beverages
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

						<div class="dummy_row">
							<!-- <div class="left_side">
								<div class="search_multiple">
									<select class="country">
										<option value="">Select Country</option>
										<option value="4">Afghanistan</option>
										<option value="248">Aland Islands</option>
										<option value="8">Albania</option>
										<option value="12">Algeria</option>
										<option value="16">American Samoa</option>
										<option value="20">Andorra</option>
										<option value="24">Angola</option>
										<option value="660">Anguilla</option>
										<option value="10">Antarctica</option>
										<option value="28">Antigua and Barbuda</option>
										<option value="32">Argentina</option>
										<option value="51">Armenia</option>
										<option value="533">Aruba</option>
										<option value="36">Australia</option>
										<option value="40">Austria</option>
										<option value="31">Azerbaijan</option>
										<option value="44">Bahamas</option>
										<option value="48">Bahrain</option>
										<option value="50">Bangladesh</option>
										<option value="52">Barbados</option>
										<option value="112">Belarus</option>
										<option value="56">Belgium</option>
										<option value="84">Belize</option>
										<option value="204">Benin</option>
										<option value="60">Bermuda</option>
										<option value="64">Bhutan</option>
										<option value="68">Bolivia, Plurinational State of</option>
										<option value="535">Bonaire, Sint Eustatius and Saba</option>
										<option value="70">Bosnia and Herzegovina</option>
										<option value="72">Botswana</option>
										<option value="74">Bouvet Island</option>
										<option value="76">Brazil</option>
										<option value="86">British Indian Ocean Territory</option>
										<option value="96">Brunei Darussalam</option>
										<option value="100">Bulgaria</option>
										<option value="854">Burkina Faso</option>
										<option value="108">Burundi</option>
										<option value="116">Cambodia</option>
										<option value="120">Cameroon</option>
										<option value="124">Canada</option>
										<option value="132">Cape Verde</option>
										<option value="136">Cayman Islands</option>
										<option value="140">Central African Republic</option>
										<option value="148">Chad</option>
										<option value="152">Chile</option>
										<option value="156">China</option>
										<option value="162">Christmas Island</option>
										<option value="166">Cocos (Keeling) Islands</option>
										<option value="170">Colombia</option>
										<option value="174">Comoros</option>
										<option value="178">Congo</option>
										<option value="180">Congo, the Democratic Republic of
											the</option>
										<option value="184">Cook Islands</option>
										<option value="188">Costa Rica</option>
										<option value="384">Cote d'Ivoire</option>
										<option value="191">Croatia</option>
										<option value="192">Cuba</option>
										<option value="531">Curaçao</option>
										<option value="196">Cyprus</option>
										<option value="203">Czech Republic</option>
										<option value="208">Denmark</option>
										<option value="262">Djibouti</option>
										<option value="212">Dominica</option>
										<option value="214">Dominican Republic</option>
										<option value="218">Ecuador</option>
										<option value="818">Egypt</option>
										<option value="222">El Salvador</option>
										<option value="226">Equatorial Guinea</option>
										<option value="232">Eritrea</option>
										<option value="233">Estonia</option>
										<option value="231">Ethiopia</option>
										<option value="238">Falkland Islands (Malvinas)</option>
										<option value="234">Faroe Islands</option>
										<option value="242">Fiji</option>
										<option value="246">Finland</option>
										<option value="250">France</option>
										<option value="254">French Guiana</option>
										<option value="258">French Polynesia</option>
										<option value="260">French Southern Territories</option>
										<option value="266">Gabon</option>
										<option value="270">Gambia</option>
										<option value="268">Georgia</option>
										<option value="276">Germany</option>
										<option value="288">Ghana</option>
										<option value="292">Gibraltar</option>
										<option value="300">Greece</option>
										<option value="304">Greenland</option>
										<option value="308">Grenada</option>
										<option value="312">Guadeloupe</option>
										<option value="316">Guam</option>
										<option value="320">Guatemala</option>
										<option value="831">Guernsey</option>
										<option value="324">Guinea</option>
										<option value="624">Guinea-Bissau</option>
										<option value="328">Guyana</option>
										<option value="332">Haiti</option>
										<option value="334">Heard Island and McDonald Islands</option>
										<option value="336">Holy See (Vatican City State)</option>
										<option value="340">Honduras</option>
										<option value="344">Hong Kong</option>
										<option value="348">Hungary</option>
										<option value="352">Iceland</option>
										<option value="356">India</option>
										<option value="360">Indonesia</option>
										<option value="364">Iran, Islamic Republic of</option>
										<option value="368">Iraq</option>
										<option value="372">Ireland</option>
										<option value="833">Isle of Man</option>
										<option value="376">Israel</option>
										<option value="380">Italy</option>
										<option value="388">Jamaica</option>
										<option value="392">Japan</option>
										<option value="832">Jersey</option>
										<option value="400">Jordan</option>
										<option value="398">Kazakhstan</option>
										<option value="404">Kenya</option>
										<option value="296">Kiribati</option>
										<option value="408">Korea, Democratic People's
											Republic of</option>
										<option value="410">Korea, Republic of</option>
										<option value="414">Kuwait</option>
										<option value="417">Kyrgyzstan</option>
										<option value="418">Lao People's Democratic Republic</option>
										<option value="428">Latvia</option>
										<option value="422">Lebanon</option>
										<option value="426">Lesotho</option>
										<option value="430">Liberia</option>
										<option value="434">Libya</option>
										<option value="438">Liechtenstein</option>
										<option value="440">Lithuania</option>
										<option value="442">Luxembourg</option>
										<option value="446">Macao</option>
										<option value="807">Macedonia, the former Yugoslav
											Republic of</option>
										<option value="450">Madagascar</option>
										<option value="454">Malawi</option>
										<option value="458">Malaysia</option>
										<option value="462">Maldives</option>
										<option value="466">Mali</option>
										<option value="470">Malta</option>
										<option value="584">Marshall Islands</option>
										<option value="474">Martinique</option>
										<option value="478">Mauritania</option>
										<option value="480">Mauritius</option>
										<option value="175">Mayotte</option>
										<option value="484">Mexico</option>
										<option value="583">Micronesia, Federated States of</option>
										<option value="498">Moldova, Republic of</option>
										<option value="492">Monaco</option>
										<option value="496">Mongolia</option>
										<option value="499">Montenegro</option>
										<option value="500">Montserrat</option>
										<option value="504">Morocco</option>
										<option value="508">Mozambique</option>
										<option value="104">Myanmar</option>
										<option value="516">Namibia</option>
										<option value="520">Nauru</option>
										<option value="524">Nepal</option>
										<option value="528">Netherlands</option>
										<option value="540">New Caledonia</option>
										<option value="554">New Zealand</option>
										<option value="558">Nicaragua</option>
										<option value="562">Niger</option>
										<option value="566">Nigeria</option>
										<option value="570">Niue</option>
										<option value="574">Norfolk Island</option>
										<option value="580">Northern Mariana Islands</option>
										<option value="578">Norway</option>
										<option value="512">Oman</option>
										<option value="586">Pakistan</option>
										<option value="585">Palau</option>
										<option value="275">Palestinian Territory, Occupied</option>
										<option value="591">Panama</option>
										<option value="598">Papua New Guinea</option>
										<option value="600">Paraguay</option>
										<option value="604">Peru</option>
										<option value="608">Philippines</option>
										<option value="612">Pitcairn</option>
										<option value="616">Poland</option>
										<option value="620">Portugal</option>
										<option value="630">Puerto Rico</option>
										<option value="634">Qatar</option>
										<option value="638">Réunion</option>
										<option value="642">Romania</option>
										<option value="643">Russian Federation</option>
										<option value="646">Rwanda</option>
										<option value="652">Saint Barthélemy</option>
										<option value="654">Saint Helena, Ascension and
											Tristan da Cunha</option>
										<option value="659">Saint Kitts and Nevis</option>
										<option value="662">Saint Lucia</option>
										<option value="663">Saint Martin (French part)</option>
										<option value="666">Saint Pierre and Miquelon</option>
										<option value="670">Saint Vincent and the Grenadines</option>
										<option value="882">Samoa</option>
										<option value="674">San Marino</option>
										<option value="678">Sao Tome and Principe</option>
										<option value="682">Saudi Arabia</option>
										<option value="686">Senegal</option>
										<option value="688">Serbia</option>
										<option value="690">Seychelles</option>
										<option value="694">Sierra Leone</option>
										<option value="702">Singapore</option>
										<option value="534">Sint Maarten (Dutch part)</option>
										<option value="703">Slovakia</option>
										<option value="705">Slovenia</option>
										<option value="90">Solomon Islands</option>
										<option value="706">Somalia</option>
										<option value="710">South Africa</option>
										<option value="239">South Georgia and the South
											Sandwich Islands</option>
										<option value="728">South Sudan</option>
										<option value="724">Spain</option>
										<option value="144">Sri Lanka</option>
										<option value="729">Sudan</option>
										<option value="740">Suriname</option>
										<option value="744">Svalbard and Jan Mayen</option>
										<option value="748">Swaziland</option>
										<option value="752">Sweden</option>
										<option value="756">Switzerland</option>
										<option value="760">Syrian Arab Republic</option>
										<option value="158">Taiwan, Province of China</option>
										<option value="762">Tajikistan</option>
										<option value="834">Tanzania, United Republic of</option>
										<option value="764">Thailand</option>
										<option value="626">Timor-Leste</option>
										<option value="768">Togo</option>
										<option value="772">Tokelau</option>
										<option value="776">Tonga</option>
										<option value="780">Trinidad and Tobago</option>
										<option value="788">Tunisia</option>
										<option value="792">Turkey</option>
										<option value="795">Turkmenistan</option>
										<option value="796">Turks and Caicos Islands</option>
										<option value="798">Tuvalu</option>
										<option value="800">Uganda</option>
										<option value="804">Ukraine</option>
										<option value="784">United Arab Emirates</option>
										<option value="826">United Kingdom</option>
										<option value="840">United States</option>
										<option value="581">United States Minor Outlying
											Islands</option>
										<option value="858">Uruguay</option>
										<option value="860">Uzbekistan</option>
										<option value="548">Vanuatu</option>
										<option value="862">Venezuela, Bolivarian Republic of</option>
										<option value="704">Viet Nam</option>
										<option value="92">Virgin Islands, British</option>
										<option value="850">Virgin Islands, U.S.</option>
										<option value="876">Wallis and Futuna</option>
										<option value="732">Western Sahara</option>
										<option value="887">Yemen</option>
										<option value="894">Zambia</option>
										<option value="716">Zimbabwe</option>
									</select>
								</div>
							</div >-->
							<!-- <div class="right_side">
								<ul>
									<li><a href="javascript:void(0)" data-toggle="modal"
										data-target="#grievences">Feedback popup</a></li>
									<li><a href="#">Grievences</a></li>
								</ul>
							</div> -->

							<!--Feedback popup up-->
							<div class="modal fade kot-popup" id="grievences">
								<div class="modal-dialog modal-md">
									<!--modal-lg-->
									<div class="modal-content kot_content">
										<button type="button" class="close kot_close"
											data-dismiss="modal">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
												alt="">
										</button>

										<div class="pop_signup">Feedback Popup</div>
										<div class="grievences_tab">
											<ul>
												<li><label class="radio_one"> <input
														type="radio" class="option-input radio" name="example"
														checked /> Feedback
												</label></li>
												<li><label class="radio_one"> <input
														type="radio" class="option-input radio" name="example"
														checked /> Grievences
												</label></li>
											</ul>
										</div>

										<div class="view_order_list">
											<!-- <h3 class="order_head">View Order Details</h3> -->
											<ul>
												<li><span>Order ID</span> #SK2540 1</li>
												<li><span>Billing Name</span> Neal Matthews 1</li>
												<li><span>Order Name</span> Veg Biryani</li>
												<li><span>Total</span> 400.00</li>
											</ul>
										</div>

										<!--form-->
										<div class="form_one extra_marg">
											<form action="" method="get">
												<div class="single_row">
													<div class="pop_frm_one">
														<span>Delivery Pincode</span>
														<div class="search_multiple">
															<select class="country">
																<option value="">Select Country</option>
																<option value="4">Afghanistan</option>
																<option value="248">Aland Islands</option>
																<option value="8">Albania</option>
																<option value="12">Algeria</option>
																<option value="16">American Samoa</option>
															</select>
														</div>
													</div>
												</div>
												<div class="single_row">
													<div class="pop_frm_one">
														<span>Textarea</span>
														<textarea name="" cols="" rows="" class="frm_inpt"
															placeholder="Textarea Placeholder"></textarea>
													</div>
												</div>
												<div>
													<input name="" type="button" value="Submit"
														class="next_btn" />
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

						</div>

						<div class="a">
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
												Road Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/004-leaf.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/006-chili.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/005-chef.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/008-protein.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/009-lemon.svg"
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
											<span class="circle-tag inline"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
												alt="tag"></span>
											<ul class="inline-r">
												<li class="text-light-white">1.18 mi</li>
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
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>

								<!--discription popup up-->
								<div class="modal fade kot-popup" id="discription">
									<div class="modal-dialog modal-lg">
										<!--modal-lg-->
										<div class="modal-content kot_content">
											<button type="button" class="close kot_close"
												data-dismiss="modal">
												<img
													src="${pageContext.request.contextPath}/resources/assets/img/popup_close.png"
													alt="">
											</button>

											<div class="pop_signup">Discription Popup</div>


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
													<!--kathy order-->
													<div class="review-box pop">
														<span
															class="text-light-white fs-12 food-order pop_ordered">Kathy
															ordered</span>
														<ul class="food">
															<li>
																<button class="add-pro bg-gradient-red">
																	Coffee <span class="close">+</span>
																</button>
															</li>
															<li>
																<button class="add-pro bg-dark">
																	Pizza <span class="close">+</span>
																</button>
															</li>
															<li>
																<button class="add-pro bg-gradient-green">
																	Noodles <span class="close">+</span>
																</button>
															</li>
															<li>
																<button class="add-pro bg-gradient-orange">
																	Burger <span class="close">+</span>
																</button>
															</li>
														</ul>
													</div>

													<div class="pop_disc">
														<span>Sort Discription -</span> Lorem ipsum dolor sit
														amet, consectetur adipiscing elit, sed do eiusmod tempor
														incididunt ut labore et dolore magna aliqua.
													</div>

													<!--related Causin-->
													<div class="pop_cousin pop_disc">
														<span class="pop_disc">Related cuisine
															</h3>
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
																		class="rounded-circle" alt="categories">
																		Lebanese
																</a></li>
															</ul>
													</div>

													<div class="order_now pop_order">
														<a href="#">Place Order</a>
													</div>

													<!-- <div class="product-list-type hotel_nm">
                                    <span class="text-light-white new pop_ordered">New</span>
                                    <span class="text-custom-white square-tag"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/004-leaf.svg" alt="tag"></span>
                                    <span class="text-custom-white square-tag"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/006-chili.svg" alt="tag"></span>
                                    <span class="text-custom-white square-tag"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/005-chef.svg" alt="tag"></span>
                                    <span class="text-custom-white square-tag"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/008-protein.svg" alt="tag"></span>
                                    <span class="text-custom-white square-tag"><img src="${pageContext.request.contextPath}/resources/assets/img/svg/009-lemon.svg" alt="tag"></span>
                                  </div> -->
												</div>
												<div class="clr"></div>
											</div>




										</div>
									</div>
								</div>


							</div>
							<!--2-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/non_veg_symbol.png"
												alt=""> Curry Leaves Barbecuing and Grilling <span>Sharanpur
												Road Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/004-leaf.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/006-chili.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/005-chef.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/008-protein.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/009-lemon.svg"
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
											<span class="circle-tag inline"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
												alt="tag"></span>
											<ul class="inline-r">
												<li class="text-light-white">1.18 mi</li>
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
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>
							<!--3-->
							<div class="order_row">
								<div class="one_order">
									<!--left-->
									<div class="one_order_l">
										<h3 class="restro-nm">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/veg_symbol.png"
												alt=""> Curry Leaves Barbecuing and Grilling <span>Sharanpur
												Road Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/004-leaf.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/006-chili.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/005-chef.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/008-protein.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/009-lemon.svg"
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
											<span class="circle-tag inline"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
												alt="tag"></span>
											<ul class="inline-r">
												<li class="text-light-white">1.18 mi</li>
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
												alt=""> Curry Leaves Barbecuing and Grilling <span>Sharanpur
												Road Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/004-leaf.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/006-chili.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/005-chef.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/008-protein.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/009-lemon.svg"
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
											<span class="circle-tag inline"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
												alt="tag"></span>
											<ul class="inline-r">
												<li class="text-light-white">1.18 mi</li>
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
												alt=""> Curry Leaves Barbecuing and Grilling <span>Sharanpur
												Road Nashik <br> Casual Dining - North Indian
											</span>
										</h3>
										<div class="product-list-type hotel_nm">
											<span class="text-light-white new">New</span> <span
												class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/004-leaf.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/006-chili.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/005-chef.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/008-protein.svg"
												alt="tag"></span> <span class="text-custom-white square-tag"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/009-lemon.svg"
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
											<span class="circle-tag inline"><img
												src="${pageContext.request.contextPath}/resources/assets/img/svg/013-heart-1.svg"
												alt="tag"></span>
											<ul class="inline-r">
												<li class="text-light-white">1.18 mi</li>
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
										<div class="order_now">
											<a href="#">Order Now</a>
										</div>

									</div>
									<div class="clr"></div>
								</div>
							</div>




						</div>
						<div class="clr"></div>


					</div>
				</div>
			</div>
		</section>

	</section>
	<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

	<!-- jQuery -->

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

	<!--select box with search js & css here-->




</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="form_one">
	<form id="repeatOrderProcess"
		action="${pageContext.request.contextPath}/repeatOrderProcess"
		method="get">

		<div class="single_row">
			<div class="pop_frm_one">
				<span>Select Address* </span>
				<div class="search_multiple">
					<select class="country" id="addressListForRepeatOrder"
						name="addressListForRepeatOrder"
						onchange="getShopBySelectedAddress()">

						<c:forEach items="${addressList}" var="addressList">
							<c:choose>
								<c:when test="${addressList.custAddressId==addressId}">
									<option value="${addressList.custAddressId}"
										id="repeatAddressData${addressList.custAddressId}"
										data-iscity="${addressList.exInt1}"
										data-latitude="${addressList.latitude}"
										data-cityid="${addressList.cityId}"
										data-longitude="${addressList.longitude}" selected>${addressList.addressCaption}
										- ${addressList.address}</option>
								</c:when>
								<c:otherwise>
									<option value="${addressList.custAddressId}"
										id="repeatAddressData${addressList.custAddressId}"
										data-iscity="${addressList.exInt1}"
										data-latitude="${addressList.latitude}"
										data-cityid="${addressList.cityId}"
										data-longitude="${addressList.longitude}">${addressList.addressCaption}
										- ${addressList.address}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</select>
				</div>
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_addressListForRepeatOrder">* This field required.</span>
		</div>
		<input value="${frId}" type="hidden" name="selectedFrId"
			id="selectedFrId">

		<div class="single_row">
			<div class="pop_frm_one">
				<span>Select Shop</span>
				<div class="search_multiple">
					<select class="country" id="frIdForRepeatOrder"
						name="frIdForRepeatOrder"
						onchange="getAgetListByShopIdRepeatOrderProcess(this.value)">
						<c:forEach items="${franchiseList}" var="franchiseList">

							<c:choose>
								<c:when test="${franchiseList.frId==frId}">
									<option value="${franchiseList.frId}" selected>${franchiseList.frName}</option>
								</c:when>
								<c:otherwise>
									<option value="${franchiseList.frId}">${franchiseList.frName}</option>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</select>
				</div>
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_frIdForRepeatOrder">* This field required.</span>
		</div>
		<div id="agentDivForRepeatOrder">
			<div class="single_row">
				<div class="pop_frm_one">
					<span>Select Agent *</span>
					<div class="search_multiple">
						<select class="country" id="repeatOrderAgent"
							name="repeatOrderAgent">
							<!-- <option value="">Select Area</option>
									<option value="1" data-name="">Nashik Road</option>
									<option value="2" data-name="">Canada Corner</option> -->
						</select>
					</div>
				</div>
				<span style="color: red; display: none;" class="model_error_class"
					id="error_repeatOrderAgent">* This field required.</span>
			</div>
		</div>
		<div class="single_row">
			<div class="pop_frm_one">
				<span>Delivery Date</span> <input type="text" id="orderRepeatDate" value="${currDate}"
					name="orderRepeatDate" class="frm_inpt datepicker"
					autocomplete="off">
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_orderRepeatDate">* This field required.</span>
		</div>

		<div class="single_row">
			<div class="pop_frm_one">
				<input name="orderRepeatTime" id="orderRepeatTime" type="text" value="${currTime}"
					class="frm_inpt timepicker" autocomplete="off" />
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_orderRepeatTime">* This field required.</span>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_orderRepeatTime2">* Delivery Date Time should be greater than current date time.</span>
		</div>

		<div class="pop_btn_row">
			<input name="repeat_order_btn" id="repeat_order_btn" type="submit"
				value="Go for Order" class="next_btn" />
		</div>
	</form>
</div>
<script>
	$(document).ready(function() {
		getShopBySelectedAddress();
	});

	function getShopBySelectedAddress() {

		var addressId = $("#addressListForRepeatOrder").val();
		var selectedFrId = $("#selectedFrId").val();

		document.getElementById("loaderimg").style.display = "block";
		var cityId = $("#repeatAddressData" + addressId).data("cityid");
		var iscity = $("#repeatAddressData" + addressId).data("iscity");

		var fd = new FormData();
		fd.append('cityId', cityId);
		fd.append('iscity', iscity);
		$
				.ajax({
					url : '${pageContext.request.contextPath}/getShopByCityId',
					type : 'post',
					dataType : 'json',
					data : fd,
					contentType : false,
					processData : false,
					success : function(response) {

						sessionStorage.setItem("frList", JSON
								.stringify(response.franchise));

						// will return the number 123
						if (iscity == 1) {
							var html = '<option value="0" selected>Select Shop</option>';

							for (var i = 0; i < response.franchise.length; i++) {

								if (selectedFrId == response.franchise[i].frId) {
									html += '<option value="' + response.franchise[i].frId + '" selected>'
											+ response.franchise[i].frName + ' ('+response.franchise[i].frCode+')'
											+ '</option>';
								} else {
									html += '<option value="' + response.franchise[i].frId + '">'
											+ response.franchise[i].frName + ' ('+response.franchise[i].frCode+')'
											+ '</option>';
								}

							}

							$('#frIdForRepeatOrder').html(html);
							$("#frIdForRepeatOrder").trigger("change");
							$("#agentDivForRepeatOrder").show();
						} else {

							var lat = $("#repeatAddressData" + addressId).data(
									"latitude");
							var longi = $("#repeatAddressData" + addressId)
									.data("longitude");
							calculateDistance(lat, longi, 3);
							$("#agentDivForRepeatOrder").hide();
						}
						document.getElementById("loaderimg").style.display = "none";
					},
				});
	}

	function getAgetListByShopIdRepeatOrderProcess(shopId) {

		var addressId = $("#addressListForRepeatOrder").val();
		var cityId = $("#repeatAddressData" + addressId).data("cityid");
		var iscity = $("#repeatAddressData" + addressId).data("iscity");

		if (iscity == 1) {
			document.getElementById("loaderimg").style.display = "block";

			var fd = new FormData();
			fd.append('cityId', cityId);
			fd.append('shopId', shopId);
			$
					.ajax({
						url : '${pageContext.request.contextPath}/getAgetListByShopId',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							var html = '<option value="0" selected>Select Agent</option>';

							for (var i = 0; i < response.length; i++) {

								html += '<option value="' + response[i].agentId + '">'
										+ response[i].agentName + '</option>';

							}

							$('#repeatOrderAgent').html(html);
							$("#repeatOrderAgent").trigger("change");
							document.getElementById("loaderimg").style.display = "none";

						},
					});
		}
	}

	$(function() {
		var date = new Date();
		date.setDate(date.getDate());

		$('.datepicker').datepicker({
			startDate : date,
			format : 'dd-mm-yyyy',
			weekStart : 1,
			daysOfWeekHighlighted : "6,0",
			autoclose : true,
			todayHighlight : true,
		});
		$('.datepicker').datepicker("setDate", new Date());

		$('.timepicker').datetimepicker({
			defaultDate : 'now',
			ignoreReadonly : true,
			format : 'LT'
		});
	});
	$(".country").select2({
		placeholder : "Select Option",
		allowClear : false
	});

	$(document)
			.ready(
					function($) {

						$("#repeatOrderProcess")
								.submit(
										function(e) {

											var isError = false;

											var addressId = $(
													"#addressListForRepeatOrder")
													.val();
											var iscity = $(
													"#repeatAddressData"
															+ addressId).data(
													"iscity");

											$(
													"#error_addressListForRepeatOrder")
													.hide();
											$("#error_frIdForRepeatOrder")
													.hide();
											$("#error_orderRepeatTime").hide();
											$("#error_orderRepeatTime2").hide();
											$("#error_orderRepeatDate").hide();
											$("#error_repeatOrderAgent").hide();

											if (iscity == 1 && ($("#repeatOrderAgent").val() == 0 || $("#repeatOrderAgent").val() == "")) {
												isError = true;
												$("#error_repeatOrderAgent").show();
											}
											if (!$("#addressListForRepeatOrder").val() || $("#addressListForRepeatOrder").val() == 0) {
												isError = true;
												$("#error_addressListForRepeatOrder").show();
											}
											if (!$("#frIdForRepeatOrder").val()
													|| $("#frIdForRepeatOrder")
															.val() == 0) {
												isError = true;
												$("#error_frIdForRepeatOrder")
														.show();
											}
											
											if (!$("#orderRepeatDate").val()) {
												isError = true;
												$("#error_orderRepeatDate")
														.show();
											}
											
											var diff = dateTimeValidation($("#orderRepeatDate").val(), $(
											"#orderRepeatTime").val());
											
											if (!$("#orderRepeatTime").val()) {
												isError = true;
												$("#error_orderRepeatTime").show();
											}
											if(diff < 0){
												isError = true;
												$("#error_orderRepeatTime2").show();
											}
											

											if (!isError) {

												document
														.getElementById("loaderimg").style.display = "block";
												var fd = new FormData();
												fd
														.append(
																'addressListForRepeatOrder',
																$(
																		"#addressListForRepeatOrder")
																		.val());
												fd
														.append(
																'frIdForRepeatOrder',
																$(
																		"#frIdForRepeatOrder")
																		.val());
												fd.append('orderRepeatTime', $(
														"#orderRepeatTime")
														.val());
												fd.append('orderRepeatDate', $(
														"#orderRepeatDate")
														.val());
												fd.append('iscity', iscity);
												fd.append('repeatOrderAgent',
														$("#repeatOrderAgent")
																.val());
												$
														.ajax({
															url : '${pageContext.request.contextPath}/orderProcessgetList',
															type : 'post',
															dataType : 'json',
															data : fd,
															contentType : false,
															processData : false,
															success : function(
																	response) {
																sessionStorage
																		.setItem(
																				"cartValue",
																				JSON
																						.stringify(response));
																var url = '${pageContext.request.contextPath}/addOrder';
																window.location = url;
																return false;
															},
														});
												return false;
											}
											return false;

										});

					});

	
	

	function dateTimeValidation(date, time) {
		var start = time
		var date = date;
		var parts = date.split('-');
		var timeStart = new Date();
		var timeEnd = new Date(parts[2] + "-" + parts[1] + "-" + parts[0]
				+ " " + start);

		var diff = (timeEnd - timeStart) / 60000;
		return diff;
	}
	
	
</script>



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
						name="addressListForRepeatOrder">

						<c:forEach items="${addressList}" var="addressList">
							<c:choose>
								<c:when test="${addressList.custAddressId==addressId}">
									<option value="${addressList.custAddressId}" selected>${addressList.addressCaption}</option>
								</c:when>
								<c:otherwise>
									<option value="${addressList.custAddressId}">${addressList.addressCaption}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</select>
				</div>
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_addressListForRepeatOrder">* This field required.</span>
		</div>
		<div class="single_row">
			<div class="pop_frm_one">
				<span>Select Shop</span>
				<div class="search_multiple">
					<select class="country" id="frIdForRepeatOrder"
						name="frIdForRepeatOrder">
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
		<div class="single_row">
			<div class="pop_frm_one">
				<span>Delivery Date</span> <input type="text" id="orderRepeatDate"
					name="orderRepeatDate" class="frm_inpt datepicker">
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_orderRepeatDate">* This field required.</span>
		</div>

		<div class="single_row">
			<div class="pop_frm_one">
				<input name="orderRepeatTime" id="orderRepeatTime" type="time"
					class="frm_inpt" />
			</div>
			<span style="color: red; display: none;" class="model_error_class"
				id="error_orderRepeatTime">* This field required.</span>
		</div>

		<div class="pop_btn_row">
			<input name="repeat_order_btn" id="repeat_order_btn" type="submit"
				value="Go for Order" class="next_btn" />
		</div>
	</form>
</div>
<script>
	$(function() {
		$('.datepicker').datepicker({
			dateFormat : 'dd-mm-yy'
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

											$(
													"#error_addressListForRepeatOrder")
													.hide();
											$("#error_frIdForRepeatOrder")
													.hide();
											$("#error_orderRepeatTime").hide();
											$("#error_orderRepeatDate").hide();

											if (!$("#addressListForRepeatOrder")
													.val()
													|| $(
															"#addressListForRepeatOrder")
															.val() == 0) {
												isError = true;
												$(
														"#error_addressListForRepeatOrder")
														.show();
											}
											if (!$("#frIdForRepeatOrder").val()
													|| $("#frIdForRepeatOrder")
															.val() == 0) {
												isError = true;
												$("#error_frIdForRepeatOrder")
														.show();
											}
											if (!$("#orderRepeatTime").val()) {
												isError = true;
												$("#error_orderRepeatTime")
														.show();
											}
											if (!$("#orderRepeatDate").val()) {
												isError = true;
												$("#error_orderRepeatDate")
														.show();
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
																sessionStorage.setItem("cartValue", JSON.stringify(response)); 
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
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="grievences_tab">
	<ul>
		<li><label class="radio_one"> <input type="radio"
				class="option-input radio" name="grievanceType" id="complent"
				checked onchange="changeFeedBack()" /> Grievance
		</label></li>
		<li><label class="radio_one"> <input type="radio"
				class="option-input radio" name="grievanceType" id="feedback"
				onchange="changeFeedBack()" /> Appreciation
		</label></li>

	</ul>
</div>


<div class="view_order_list">

	<ul>
		<li>
			<div class="pop_txt_l">Order No.</div>
			<div class="pop_txt_r">: ${getOrderHeaderList.orderNo}</div>
		</li>
		<li>
			<div class="pop_txt_l">Customer Name</div>
			<div class="pop_txt_r">: ${getOrderHeaderList.custName}</div>
		</li>
		<li>
			<div class="pop_txt_l">Shop Name</div>
			<div class="pop_txt_r">: ${getOrderHeaderList.frName}</div>
		</li>

		<c:set var="orderStatus" value="PARK ORDER"></c:set>
		<c:choose>
			<c:when test="${getOrderHeaderList.orderStatus==1}">
				<c:set var="orderStatus" value="Shop Confirmation Pending"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==2}">
				<c:set var="orderStatus" value="Accept by shop"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==3}">
				<c:set var="orderStatus" value="Processing"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==4}">
				<c:set var="orderStatus" value="Delivery Pending"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==5}">
				<c:set var="orderStatus" value="Delivered"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==6}">
				<c:set var="orderStatus" value="Reject By shop"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==7}">
				<c:set var="orderStatus" value="Return"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderStatus==8}">
				<c:set var="orderStatus" value="Cancelled"></c:set>
			</c:when>
		</c:choose>


		<c:set var="platform" value="Web"></c:set>
		<c:choose>

			<c:when test="${getOrderHeaderList.orderPlatform==2}">
				<c:set var="platform" value="Mobile App"></c:set>
			</c:when>
			<c:when test="${getOrderHeaderList.orderPlatform==3}">
				<c:set var="platform" value="Website"></c:set>
			</c:when>
		</c:choose>

		<c:set var="paymentSts" value="PENDING"></c:set>
		<c:choose>

			<c:when test="${getOrderHeaderList.paidStatus==1}">
				<c:set var="paymentSts" value="PAID"></c:set>
			</c:when>

		</c:choose>
		<c:set var="paymentMethod" value="COD"></c:set>
		<c:choose>

			<c:when test="${getOrderHeaderList.paidStatus==1}">
				<c:set var="paymentMethod" value="Online"></c:set>
			</c:when>

		</c:choose>

		<li>
			<div class="pop_txt_l">Order Status</div>
			<div class="pop_txt_r">${orderStatus}</div>
		</li>
		<li>
			<div class="pop_txt_l">Date & Time</div>
			<div class="pop_txt_r">: ${getOrderHeaderList.deliveryDate}
				${getOrderHeaderList.deliveryTime}</div>
		</li>
		<li class="total">
			<div class="pop_txt_l">Total</div>
			<div class="pop_txt_r">: ${getOrderHeaderList.totalAmt} /-</div>
		</li>
		<li>
			<div class="pop_txt_l">Payment Status</div>
			<div class="pop_txt_r">
				: <span class="paid">${paymentSts}</span>
			</div>
		</li>
		<li>
			<div class="pop_txt_l">Payment Method</div>
			<div class="pop_txt_r">: ${paymentMethod}</div>
		</li>
		<li>
			<div class="pop_txt_l">Order Type</div>
			<div class="pop_txt_r">: ${platform}</div>
		</li>
	</ul>
</div>
<br>


<div class="component">
	<table class="overflow-y">
		<thead>
			<tr>
				<th class="sorting_desc">Name</th>
				<th class="sorting_desc">Special Note</th>
				<th class="sorting_desc">Rate</th>
				<th class="sorting_desc js-sort-date">Quantity</th>
				<th class="sorting_desc">Total</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${getOrderHeaderList.detailList}" var="detailList">
				<tr>
					<td class="user-name">${detailList.itemName}</td>
					<td class="user-name">${detailList.remark}</td>
					<td class="user-name" style="text-align: right;">${detailList.rate}</td>
					<td class="user-name" style="text-align: right;">${detailList.qty}</td>
					<td class="user-name" style="text-align: right;"><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							groupingUsed="false" value="${detailList.totalAmt}" /></td>
				</tr>
			</c:forEach>
			<!--1 row-->

		</tbody>
	</table>


</div>

<div class="view_order_list">
	<!-- <h3 class="order_head">View Order Details</h3> -->
	<ul>
		<li></li>
		<li>
			<div class="pop_txt_l">Item Total</div>
			<div class="pop_txt_r">
				: <span style="float: right;"><fmt:formatNumber type="number"
						minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"
						value="${getOrderHeaderList.taxableAmt}" /></span>
			</div>
		</li>
		<li></li>
		<li>
			<div class="pop_txt_l">Tax</div>
			<div class="pop_txt_r">
				: <span style="float: right;"><fmt:formatNumber type="number"
						minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"
						value="${getOrderHeaderList.taxAmt}" /></span>
			</div>
		</li>
		<li></li>
		<li>
			<div class="pop_txt_l">Offer Disc AMT</div>
			<div class="pop_txt_r">
				: <span style="float: right;"><fmt:formatNumber type="number"
						minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"
						value="${getOrderHeaderList.discAmt}" /></span>
			</div>
		</li>
		<li></li>
		<li>
			<div class="pop_txt_l">Delivery Charges</div>
			<div class="pop_txt_r">
				: <span style="float: right;"><fmt:formatNumber type="number"
						minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"
						value="${getOrderHeaderList.deliveryCharges}" /></span>
			</div>
		</li>
		<li></li>
		<li class="total">
			<div class="pop_txt_l">Total</div>
			<div class="pop_txt_r">
				: <span style="float: right;"><fmt:formatNumber type="number"
						minFractionDigits="2" maxFractionDigits="2" groupingUsed="false"
						value="${getOrderHeaderList.totalAmt}" /></span>
			</div>
		</li>
	</ul>
</div>
<div class="form_one extra_marg">

	<input name="orderIdGrievences" id="orderIdGrievences" type="hidden"
		value="${getOrderHeaderList.orderId}" />

	<div id="grivience_div">
		<form id="grivienceForm">
			<div class="single_row">
				<div class="pop_frm_one">
					<span>Select Grievance Type</span>
					<div class="search_multiple">
						<select class="country" name="grievencesInstructionId"
							id="grievencesInstructionId">
							<option value="0">Select Option</option>
							<c:forEach items="${grievencesInstructionList}"
								var="grievencesInstructionList">
								<option value="${grievencesInstructionList.grievanceId}">${grievencesInstructionList.caption}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<span style="color: red; display: none;"
					id="error_grievencesInstructionId">* This field is required.</span>
			</div>
			<div class="single_row">
				<div class="pop_frm_one">
					<span>Remark *</span>
					<textarea name="grivience_remark" id="grivience_remark" cols=""
						rows="" class="frm_inpt" placeholder="Remark"
						onchange="trim(this)"></textarea>
				</div>
				<span style="color: red; display: none;" id="error_grivience_remark">*
					This field is required.</span>
			</div>
			<div>
				<input name="grivnceSbmtbtn" type="submit" value="Submit"
					class="next_btn" />
			</div>
		</form>
	</div>
	<div id="feedback_div" style="display: none;">
		<form id="feedbackForm">

			<div class="single_row">
				<div class="pop_frm_one">
					<span>Remark *</span>
					<textarea name="feedback_remark" id="feedback_remark" cols=""
						rows="" class="frm_inpt" placeholder="Remark"
						onchange="trim(this)"></textarea>
				</div>
				<span style="color: red; display: none;" id="error_feedback_remark">*
					This field is required.</span>
			</div>
			<div>
				<input name="grivnceSbmtbtn" type="submit" value="Submit"
					class="next_btn" />
			</div>
		</form>
	</div>
	<!-- class="pop_btn_row"-->

</div>
<script>
	function trim(el) {
		el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
		replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
		replace(/\n +/, "\n"); // Removes spaces after newlines

		return;
	}
	function changeFeedBack() {

		if (document.getElementById("feedback").checked == true) {
			$("#feedback_div").show();
			$("#grivience_div").hide();
		} else {
			$("#feedback_div").hide();
			$("#grivience_div").show();
		}

	}
	$(".country").select2({
		placeholder : "Select Option",
		allowClear : false
	});

	$(document)
			.ready(
					function($) {

						$("#grivienceForm")
								.submit(
										function(e) {

											$('#error_grivience_remark').hide();
											$('#error_grievencesInstructionId')
													.hide();

											var isError = false;
											if (!$("#grivience_remark").val()) {
												isError = true;
												$("#error_grivience_remark")
														.show();
											}
											if ($("#grievencesInstructionId")
													.val() == 0) {
												isError = true;
												$(
														"#error_grievencesInstructionId")
														.show();
											}

											if (!isError) {
												document
														.getElementById("loaderimg").style.display = "block";
												var fd = new FormData();
												fd.append("grivience_remark",
														$("#grivience_remark")
																.val());
												fd.append("orderIdGrievences",
														$("#orderIdGrievences")
																.val());
												fd
														.append(
																"grievencesInstructionId",
																$(
																		"#grievencesInstructionId")
																		.val());
												$
														.ajax({
															url : '${pageContext.request.contextPath}/submitGrievince',
															type : 'post',
															dataType : 'json',
															data : fd,
															contentType : false,
															processData : false,
															success : function(
																	response) {

																$(
																		'#finalFailedMsg')
																		.hide();
																$(
																		'#finalSuccessMsg')
																		.hide();

																if (response.error == true) {
																	document
																			.getElementById("finalerrormsgcontent").innerHTML = "Error while Apply Grievance.";

																	$(
																			'#finalFailedMsg')
																			.show();
																} else {
																	document
																			.getElementById("finalsuccessmsgcontent").innerHTML = "Grievance Successfully Submitted.";
																	$(
																			'#finalSuccessMsg')
																			.show();

																}
																document
																		.getElementById("loaderimg").style.display = "none";
																$('#grievences')
																		.modal(
																				'hide');
																return false;
															},
														});
												return false;
											}
											return false;

										});

						$("#feedbackForm")
								.submit(
										function(e) {

											$('#error_feedback_remark').hide();
											var feedback_remark = $(
													"#feedback_remark").val();
											var isError = false;
											if (!$("#feedback_remark").val()) {
												isError = true;
												$("#error_feedback_remark")
														.show();
											}

											if (!isError) {
												document
														.getElementById("loaderimg").style.display = "block";
												var fd = new FormData();
												fd.append("feedback_remark",
														feedback_remark);
												fd.append("orderIdGrievences",
														$("#orderIdGrievences")
																.val());

												$
														.ajax({
															url : '${pageContext.request.contextPath}/submitFeedback',
															type : 'post',
															dataType : 'json',
															data : fd,
															contentType : false,
															processData : false,
															success : function(
																	response) {

																$(
																		'#finalFailedMsg')
																		.hide();
																$(
																		'#finalSuccessMsg')
																		.hide();

																if (response.error == true) {
																	document
																			.getElementById("finalerrormsgcontent").innerHTML = "Error while Apply Feedback.";

																	$(
																			'#finalFailedMsg')
																			.show();
																} else {
																	document
																			.getElementById("finalsuccessmsgcontent").innerHTML = "Feedback Successfully Submitted.";
																	$(
																			'#finalSuccessMsg')
																			.show();

																}
																document
																		.getElementById("loaderimg").style.display = "none";
																$('#grievences')
																		.modal(
																				'hide');
																return false;
															},
														});
												return false;
											}
											return false;

										});

					});
</script>
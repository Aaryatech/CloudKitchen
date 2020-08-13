<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="view_order_list">
	<!-- <h3 class="order_head">View Order Details</h3> -->
	<ul>
		<li>
			<div class="pop_txt_l">Grievence No.</div>
			<div class="pop_txt_r">: ${getGrvHeaderList.grievencceNo}</div>
		</li>
		<li>
			<div class="pop_txt_l">Order No.</div>
			<div class="pop_txt_r">: ${getGrvHeaderList.orderNo}</div>
		</li>

		<li>
			<div class="pop_txt_l">Current Status</div>
			<div class="pop_txt_r">
				<span class="paid">: <c:choose>
						<c:when test="${getGrvHeaderList.currentStatus==0}">Pending</c:when>
						<c:when test="${getGrvHeaderList.currentStatus==1}">Resolved</c:when>
						<c:otherwise>Damage</c:otherwise>
					</c:choose></span>
			</div>
		</li>
		<li>
			<div class="pop_txt_l">Date & Time</div>
			<div class="pop_txt_r">: ${getGrvHeaderList.insertDateTime}</div>
		</li>

		<li>
			<div class="pop_txt_l">Grievences Instruction</div>
			<div class="pop_txt_r">: ${getGrvHeaderList.grvInstrustion}</div>
		</li>

	</ul>
</div>
<br>


<div class="component">
	<table class="overflow-y" id="grn_detail_tabl">
		<thead>
			<tr>
				<th class="sorting_desc" style="text-align: center;">Action</th>
				<th class="sorting_desc" style="text-align: center;">Action By</th>
				<th class="sorting_desc" style="text-align: center;">Date Time</th>
				<th class="sorting_desc js-sort-date" style="text-align: center;">Remark</th>
				<th class="sorting_desc js-sort-date" style="text-align: center;">Detail</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${getGrvHeaderList.getGrievienceTailList}"
				var="getGrievienceTailList">
				<tr>
					<td class="user-name"><c:choose>
							<c:when test="${getGrievienceTailList.status==0}">Pending</c:when>
							<c:when test="${getGrievienceTailList.status==1}">Resolved</c:when>
							<c:otherwise>Damage</c:otherwise>
						</c:choose></td>
					<td class="user-name">${getGrievienceTailList.actionUserName}</td>
					<td class="user-name" style="text-align: center;">${getGrievienceTailList.actionDateTime}</td>
					<td class="user-name">${getGrievienceTailList.remark}</td>
					<td class="user-name">Root cause <br> Action Taken
						:${getGrievienceTailList.grivActionText} <br> Resposibility
						Detail <br> Repay AMT <br> Repay Status
					</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>


</div>
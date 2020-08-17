<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="redirectForm" method="post"
		action="https://test.cashfree.com/billpay/checkout/post/submit">
		<input type="hidden" name="appId"
			value="27027a6652b91619aa1a8ad8172072" /> <input type="hidden"
			name="orderId" value="${uuid}" /> <input type="text"
			name="orderAmount" value="2" /> <input type="text"
			name="orderCurrency" value="INR" /> <input type="text"
			name="orderNote" value="OK" /> <input type="text"
			name="customerName" value="akshay kasar" /> <input type="text"
			name="customerEmail" value="akshaykasar72@gmail.com" /> <input
			type="text" name="customerPhone" value="7588519473" /> <input
			type="text" name="returnUrl"
			value="http://localhost:8086/ck/returnUrl" /> <input type="text"
			name="notifyUrl" value="http://localhost:8086/ck/notifyUrl" /> <input
			type="hidden" name="signature" value="${signature}" /> <input
			type="submit" value="Pay" target="_blank">
	</form>
</body>
</html>
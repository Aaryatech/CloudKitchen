package com.ats.ck.model;

import java.util.List;

public class showCustomerInfo {
	
	private CustomerDisplay customerInfo;
	private List<GetOrderHeaderList> orderListByStatus;
	
	public CustomerDisplay getCustomerInfo() {
		return customerInfo;
	}

	public void setCustomerInfo(CustomerDisplay customerInfo) {
		this.customerInfo = customerInfo;
	}

	public List<GetOrderHeaderList> getOrderListByStatus() {
		return orderListByStatus;
	}

	public void setOrderListByStatus(List<GetOrderHeaderList> orderListByStatus) {
		this.orderListByStatus = orderListByStatus;
	}

	@Override
	public String toString() {
		return "showCustomerInfo [customerInfo=" + customerInfo + ", orderListByStatus=" + orderListByStatus + "]";
	}
	
	

}

package com.ats.ck.model;

import java.util.List;

public class showCustomerInfo {

	private CustomerDisplay customerInfo;
	private List<GetOrderHeaderList> orderListByStatus;
	private List<GetGrievienceList> grievienceList;
	private float walletAmt;

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

	public List<GetGrievienceList> getGrievienceList() {
		return grievienceList;
	}

	public void setGrievienceList(List<GetGrievienceList> grievienceList) {
		this.grievienceList = grievienceList;
	}

	public float getWalletAmt() {
		return walletAmt;
	}

	public void setWalletAmt(float walletAmt) {
		this.walletAmt = walletAmt;
	}

	@Override
	public String toString() {
		return "showCustomerInfo [customerInfo=" + customerInfo + ", orderListByStatus=" + orderListByStatus
				+ ", grievienceList=" + grievienceList + ", walletAmt=" + walletAmt + "]";
	}

}

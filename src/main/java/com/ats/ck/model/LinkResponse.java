package com.ats.ck.model;

public class LinkResponse {

	private String status;
	private String paymentLink;
	private String reason;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentLink() {
		return paymentLink;
	}
	public void setPaymentLink(String paymentLink) {
		this.paymentLink = paymentLink;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "LinkResponse [status=" + status + ", paymentLink=" + paymentLink + ", reason=" + reason + "]";
	}
	
	

}

package com.ats.ck.model.gatwaymodel;

public class Body {

	private String status;
	private String paymentLink;

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

	@Override
	public String toString() {
		return "Body [status=" + status + ", paymentLink=" + paymentLink + "]";
	}

}

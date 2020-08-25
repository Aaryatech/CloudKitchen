package com.ats.ck.model;


public class CustWalletTotal {

	private int custId;
	private float total;

	private float walletLimitRs;
	private float walletPercent;
	private float walletMinAmt;

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public float getWalletLimitRs() {
		return walletLimitRs;
	}

	public void setWalletLimitRs(float walletLimitRs) {
		this.walletLimitRs = walletLimitRs;
	}

	public float getWalletPercent() {
		return walletPercent;
	}

	public void setWalletPercent(float walletPercent) {
		this.walletPercent = walletPercent;
	}

	public float getWalletMinAmt() {
		return walletMinAmt;
	}

	public void setWalletMinAmt(float walletMinAmt) {
		this.walletMinAmt = walletMinAmt;
	}

	@Override
	public String toString() {
		return "CustWalletTotal [custId=" + custId + ", total=" + total + ", walletLimitRs=" + walletLimitRs
				+ ", walletPercent=" + walletPercent + ", walletMinAmt=" + walletMinAmt + "]";
	}

}

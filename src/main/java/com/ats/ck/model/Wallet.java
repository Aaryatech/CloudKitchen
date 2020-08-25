package com.ats.ck.model;


public class Wallet {

	private int walletId;
	private int orderId;
	private int sellBillNo;
	private int frId;
	private int payMode;
	private int isFrAffected;
	private int frTranscType;
	private float amount;
	private int walletTranscType;
	private int userId;
	private String walletDate;
	private String walletDatetime;
	private int exInt1;
	private int exInt2;
	private String exVar1;
	private String exVar2;
	private float exFloat1;
	private float exFloat2;
	
	

	public Wallet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Wallet(int walletId, int orderId, int sellBillNo, int frId, int payMode, int isFrAffected, int frTranscType,
			float amount, int walletTranscType, int userId, String walletDate, String walletDatetime, int exInt1,
			int exInt2, String exVar1, String exVar2, float exFloat1, float exFloat2) {
		super();
		this.walletId = walletId;
		this.orderId = orderId;
		this.sellBillNo = sellBillNo;
		this.frId = frId;
		this.payMode = payMode;
		this.isFrAffected = isFrAffected;
		this.frTranscType = frTranscType;
		this.amount = amount;
		this.walletTranscType = walletTranscType;
		this.userId = userId;
		this.walletDate = walletDate;
		this.walletDatetime = walletDatetime;
		this.exInt1 = exInt1;
		this.exInt2 = exInt2;
		this.exVar1 = exVar1;
		this.exVar2 = exVar2;
		this.exFloat1 = exFloat1;
		this.exFloat2 = exFloat2;
	}



	public int getWalletId() {
		return walletId;
	}

	public void setWalletId(int walletId) {
		this.walletId = walletId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getSellBillNo() {
		return sellBillNo;
	}

	public void setSellBillNo(int sellBillNo) {
		this.sellBillNo = sellBillNo;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	public int getPayMode() {
		return payMode;
	}

	public void setPayMode(int payMode) {
		this.payMode = payMode;
	}

	public int getIsFrAffected() {
		return isFrAffected;
	}

	public void setIsFrAffected(int isFrAffected) {
		this.isFrAffected = isFrAffected;
	}

	public int getFrTranscType() {
		return frTranscType;
	}

	public void setFrTranscType(int frTranscType) {
		this.frTranscType = frTranscType;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getWalletTranscType() {
		return walletTranscType;
	}

	public void setWalletTranscType(int walletTranscType) {
		this.walletTranscType = walletTranscType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getWalletDate() {
		return walletDate;
	}

	public void setWalletDate(String walletDate) {
		this.walletDate = walletDate;
	}

	public String getWalletDatetime() {
		return walletDatetime;
	}

	public void setWalletDatetime(String walletDatetime) {
		this.walletDatetime = walletDatetime;
	}

	public int getExInt1() {
		return exInt1;
	}

	public void setExInt1(int exInt1) {
		this.exInt1 = exInt1;
	}

	public int getExInt2() {
		return exInt2;
	}

	public void setExInt2(int exInt2) {
		this.exInt2 = exInt2;
	}

	public String getExVar1() {
		return exVar1;
	}

	public void setExVar1(String exVar1) {
		this.exVar1 = exVar1;
	}

	public String getExVar2() {
		return exVar2;
	}

	public void setExVar2(String exVar2) {
		this.exVar2 = exVar2;
	}

	public float getExFloat1() {
		return exFloat1;
	}

	public void setExFloat1(float exFloat1) {
		this.exFloat1 = exFloat1;
	}

	public float getExFloat2() {
		return exFloat2;
	}

	public void setExFloat2(float exFloat2) {
		this.exFloat2 = exFloat2;
	}

	@Override
	public String toString() {
		return "Wallet [walletId=" + walletId + ", orderId=" + orderId + ", sellBillNo=" + sellBillNo + ", frId=" + frId
				+ ", payMode=" + payMode + ", isFrAffected=" + isFrAffected + ", frTranscType=" + frTranscType
				+ ", amount=" + amount + ", walletTranscType=" + walletTranscType + ", userId=" + userId
				+ ", walletDate=" + walletDate + ", walletDatetime=" + walletDatetime + ", exInt1=" + exInt1
				+ ", exInt2=" + exInt2 + ", exVar1=" + exVar1 + ", exVar2=" + exVar2 + ", exFloat1=" + exFloat1
				+ ", exFloat2=" + exFloat2 + "]";
	}

	
}

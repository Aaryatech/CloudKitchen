package com.ats.ck.model;
 
public class OrderFeedback {
	 
	private int feedbackId; 
	private int orderId; 
	private String remark; 
	private String insertDatetime; 
	private int insertUserId;
	private int platform;
	
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getInsertDatetime() {
		return insertDatetime;
	}
	public void setInsertDatetime(String insertDatetime) {
		this.insertDatetime = insertDatetime;
	}
	public int getInsertUserId() {
		return insertUserId;
	}
	public void setInsertUserId(int insertUserId) {
		this.insertUserId = insertUserId;
	}
	public int getPlatform() {
		return platform;
	}
	public void setPlatform(int platform) {
		this.platform = platform;
	}
	@Override
	public String toString() {
		return "OrderFeedback [feedbackId=" + feedbackId + ", orderId=" + orderId + ", remark=" + remark
				+ ", insertDatetime=" + insertDatetime + ", insertUserId=" + insertUserId + ", platform=" + platform
				+ "]";
	}
	
	

}

package com.ats.ck.model;

public class OrderResponse {
	
	private String message; 
    private Boolean error;
    private int frId;
    private int userId;
    private String insertDateTime;
    private int orderId;
    
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Boolean getError() {
		return error;
	}
	public void setError(Boolean error) {
		this.error = error;
	}
	public int getFrId() {
		return frId;
	}
	public void setFrId(int frId) {
		this.frId = frId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getInsertDateTime() {
		return insertDateTime;
	}
	public void setInsertDateTime(String insertDateTime) {
		this.insertDateTime = insertDateTime;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	@Override
	public String toString() {
		return "OrderResponse [message=" + message + ", error=" + error + ", frId=" + frId + ", userId=" + userId
				+ ", insertDateTime=" + insertDateTime + ", orderId=" + orderId + "]";
	}
    
    
}

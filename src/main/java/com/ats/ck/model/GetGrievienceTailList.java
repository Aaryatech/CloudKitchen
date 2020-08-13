package com.ats.ck.model;
 

public class GetGrievienceTailList {
	 
	private int trailId; 
	private int grievencesId; 
	private String remark; 
	private int status; 
	private int actionByUserId; 
	private String actionDateTime; 
	private int extraInt1; 
	private int extraInt2; 
	private String extraVar1; 
	private String extraVar2; 
	private String identifiedRootCause; 
	private int grievenceResType; 
	private String resolutionDetail; 
	private float repayAmt; 
	private String repayDetails; 
	private int grivActionValue; 
	private String grivActionText;
	private String actionUserName;
	
	public int getTrailId() {
		return trailId;
	}
	public void setTrailId(int trailId) {
		this.trailId = trailId;
	}
	public int getGrievencesId() {
		return grievencesId;
	}
	public void setGrievencesId(int grievencesId) {
		this.grievencesId = grievencesId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getActionByUserId() {
		return actionByUserId;
	}
	public void setActionByUserId(int actionByUserId) {
		this.actionByUserId = actionByUserId;
	}
	public String getActionDateTime() {
		return actionDateTime;
	}
	public void setActionDateTime(String actionDateTime) {
		this.actionDateTime = actionDateTime;
	}
	public int getExtraInt1() {
		return extraInt1;
	}
	public void setExtraInt1(int extraInt1) {
		this.extraInt1 = extraInt1;
	}
	public int getExtraInt2() {
		return extraInt2;
	}
	public void setExtraInt2(int extraInt2) {
		this.extraInt2 = extraInt2;
	}
	public String getExtraVar1() {
		return extraVar1;
	}
	public void setExtraVar1(String extraVar1) {
		this.extraVar1 = extraVar1;
	}
	public String getExtraVar2() {
		return extraVar2;
	}
	public void setExtraVar2(String extraVar2) {
		this.extraVar2 = extraVar2;
	}
	public String getIdentifiedRootCause() {
		return identifiedRootCause;
	}
	public void setIdentifiedRootCause(String identifiedRootCause) {
		this.identifiedRootCause = identifiedRootCause;
	}
	public int getGrievenceResType() {
		return grievenceResType;
	}
	public void setGrievenceResType(int grievenceResType) {
		this.grievenceResType = grievenceResType;
	}
	public String getResolutionDetail() {
		return resolutionDetail;
	}
	public void setResolutionDetail(String resolutionDetail) {
		this.resolutionDetail = resolutionDetail;
	}
	public float getRepayAmt() {
		return repayAmt;
	}
	public void setRepayAmt(float repayAmt) {
		this.repayAmt = repayAmt;
	}
	public String getRepayDetails() {
		return repayDetails;
	}
	public void setRepayDetails(String repayDetails) {
		this.repayDetails = repayDetails;
	}
	public int getGrivActionValue() {
		return grivActionValue;
	}
	public void setGrivActionValue(int grivActionValue) {
		this.grivActionValue = grivActionValue;
	}
	public String getGrivActionText() {
		return grivActionText;
	}
	public void setGrivActionText(String grivActionText) {
		this.grivActionText = grivActionText;
	}
	public String getActionUserName() {
		return actionUserName;
	}
	public void setActionUserName(String actionUserName) {
		this.actionUserName = actionUserName;
	}
	@Override
	public String toString() {
		return "GetGrievienceTailList [trailId=" + trailId + ", grievencesId=" + grievencesId + ", remark=" + remark
				+ ", status=" + status + ", actionByUserId=" + actionByUserId + ", actionDateTime=" + actionDateTime
				+ ", extraInt1=" + extraInt1 + ", extraInt2=" + extraInt2 + ", extraVar1=" + extraVar1 + ", extraVar2="
				+ extraVar2 + ", identifiedRootCause=" + identifiedRootCause + ", grievenceResType=" + grievenceResType
				+ ", resolutionDetail=" + resolutionDetail + ", repayAmt=" + repayAmt + ", repayDetails=" + repayDetails
				+ ", grivActionValue=" + grivActionValue + ", grivActionText=" + grivActionText + ", actionUserName="
				+ actionUserName + "]";
	}
	
	
	
	

}

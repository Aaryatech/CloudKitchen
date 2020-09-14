package com.ats.ck.model;

public class ItemWiseOfferDetailDisplay {

	private int offerDetailId;
	private int primaryItemId;
	private int secondaryItemId;
	private float secondaryItemQty;
	private String secondaryItemName;

	public int getOfferDetailId() {
		return offerDetailId;
	}

	public void setOfferDetailId(int offerDetailId) {
		this.offerDetailId = offerDetailId;
	}

	public int getPrimaryItemId() {
		return primaryItemId;
	}

	public void setPrimaryItemId(int primaryItemId) {
		this.primaryItemId = primaryItemId;
	}

	public int getSecondaryItemId() {
		return secondaryItemId;
	}

	public void setSecondaryItemId(int secondaryItemId) {
		this.secondaryItemId = secondaryItemId;
	}

	public float getSecondaryItemQty() {
		return secondaryItemQty;
	}

	public void setSecondaryItemQty(float secondaryItemQty) {
		this.secondaryItemQty = secondaryItemQty;
	}

	public String getSecondaryItemName() {
		return secondaryItemName;
	}

	public void setSecondaryItemName(String secondaryItemName) {
		this.secondaryItemName = secondaryItemName;
	}

	@Override
	public String toString() {
		return "ItemWiseOfferDetailDisplay [offerDetailId=" + offerDetailId + ", primaryItemId=" + primaryItemId
				+ ", secondaryItemId=" + secondaryItemId + ", secondaryItemQty=" + secondaryItemQty
				+ ", secondaryItemName=" + secondaryItemName + "]";
	}

}

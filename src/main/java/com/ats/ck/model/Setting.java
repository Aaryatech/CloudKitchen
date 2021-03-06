package com.ats.ck.model;

public class Setting {

	private int settingId;
	private String settingKey;
	private int settingValue;
	public int getSettingId() {
		return settingId;
	}
	public void setSettingId(int settingId) {
		this.settingId = settingId;
	}
	public String getSettingKey() {
		return settingKey;
	}
	public void setSettingKey(String settingKey) {
		this.settingKey = settingKey;
	}
	public int getSettingValue() {
		return settingValue;
	}
	public void setSettingValue(int settingValue) {
		this.settingValue = settingValue;
	}
	@Override
	public String toString() {
		return "Setting [settingId=" + settingId + ", settingKey=" + settingKey + ", settingValue=" + settingValue
				+ "]";
	}
	
	
	

}

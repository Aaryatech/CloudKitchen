package com.ats.ck.model.gatwaymodel;

public class Formdata {

	private String key; 
	private String value; 
	private String description; 
	private String type;
	private String disabled;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	@Override
	public String toString() {
		return "Formdata [key=" + key + ", value=" + value + ", description=" + description + ", type=" + type
				+ ", disabled=" + disabled + "]";
	}
	
	

}

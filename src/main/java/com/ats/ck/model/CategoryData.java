package com.ats.ck.model;

import java.util.List;
 
public class CategoryData {
	
	private int catId;
	private String catName;
	List<Images> imageList;
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	@Override
	public String toString() {
		return "CategoryData [catId=" + catId + ", catName=" + catName + "]";
	}
	
	

}

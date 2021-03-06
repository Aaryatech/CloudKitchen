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
	public List<Images> getImageList() {
		return imageList;
	}
	public void setImageList(List<Images> imageList) {
		this.imageList = imageList;
	}
	@Override
	public String toString() {
		return "CategoryData [catId=" + catId + ", catName=" + catName + ", imageList=" + imageList + "]";
	}
	
	

}

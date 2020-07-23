package com.ats.ck.model;

import java.util.List;

public class SubCategoryData {

	private int subCatId;
	private int catId;
	private String catName;
	private String subCatName;

	List<Images> imageList;

	public int getSubCatId() {
		return subCatId;
	}

	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}

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

	public String getSubCatName() {
		return subCatName;
	}

	public void setSubCatName(String subCatName) {
		this.subCatName = subCatName;
	}

	public List<Images> getImageList() {
		return imageList;
	}

	public void setImageList(List<Images> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "SubCategoryData [subCatId=" + subCatId + ", catId=" + catId + ", catName=" + catName + ", subCatName="
				+ subCatName + ", imageList=" + imageList + "]";
	}
	
	

}

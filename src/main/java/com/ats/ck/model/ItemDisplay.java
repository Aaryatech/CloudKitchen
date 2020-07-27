package com.ats.ck.model;

import java.util.List;
 
public class ItemDisplay {
	
	private int itemId;
	private String itemName;
	private int catId;
	private String catName;
	private int subCatId;
	private String subCatName;
	private float itemSortId;
	private int isDecimal;
	private String itemUom;
	private int uomId;
	private String itemDesc;
	private int productType;
	private String productStatus;
	private int productCategory;
	private String productCategoryName;
	private String preperationTime;
	private int showInOrder;
	private float rating;
	private String tagIds;
	private String tasteTypeIds;
	private String tagName;
	private String tasteName;
	private float rateAmt;
	private float mrpAmt;
	private float spRateAmt;
	private float cgstPer;
	private float sgstPer;
	private float igstPer;
	private String hsncd;
	private String relItemIds;
	private String jsonStr;
	List<Tags> tagList; 
	List<Ingrediant> tasteList; 
	List<Images> imageList; 
	List<ItemDisplay> relItemList;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
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
	public float getItemSortId() {
		return itemSortId;
	}
	public void setItemSortId(float itemSortId) {
		this.itemSortId = itemSortId;
	}
	public int getIsDecimal() {
		return isDecimal;
	}
	public void setIsDecimal(int isDecimal) {
		this.isDecimal = isDecimal;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	public int getUomId() {
		return uomId;
	}
	public void setUomId(int uomId) {
		this.uomId = uomId;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public int getProductType() {
		return productType;
	}
	public void setProductType(int productType) {
		this.productType = productType;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public int getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductCategoryName() {
		return productCategoryName;
	}
	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	public String getPreperationTime() {
		return preperationTime;
	}
	public void setPreperationTime(String preperationTime) {
		this.preperationTime = preperationTime;
	}
	public int getShowInOrder() {
		return showInOrder;
	}
	public void setShowInOrder(int showInOrder) {
		this.showInOrder = showInOrder;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getTagIds() {
		return tagIds;
	}
	public void setTagIds(String tagIds) {
		this.tagIds = tagIds;
	}
	public String getTasteTypeIds() {
		return tasteTypeIds;
	}
	public void setTasteTypeIds(String tasteTypeIds) {
		this.tasteTypeIds = tasteTypeIds;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getTasteName() {
		return tasteName;
	}
	public void setTasteName(String tasteName) {
		this.tasteName = tasteName;
	}
	public float getRateAmt() {
		return rateAmt;
	}
	public void setRateAmt(float rateAmt) {
		this.rateAmt = rateAmt;
	}
	public float getMrpAmt() {
		return mrpAmt;
	}
	public void setMrpAmt(float mrpAmt) {
		this.mrpAmt = mrpAmt;
	}
	public float getSpRateAmt() {
		return spRateAmt;
	}
	public void setSpRateAmt(float spRateAmt) {
		this.spRateAmt = spRateAmt;
	}
	public float getCgstPer() {
		return cgstPer;
	}
	public void setCgstPer(float cgstPer) {
		this.cgstPer = cgstPer;
	}
	public float getSgstPer() {
		return sgstPer;
	}
	public void setSgstPer(float sgstPer) {
		this.sgstPer = sgstPer;
	}
	public float getIgstPer() {
		return igstPer;
	}
	public void setIgstPer(float igstPer) {
		this.igstPer = igstPer;
	}
	public String getHsncd() {
		return hsncd;
	}
	public void setHsncd(String hsncd) {
		this.hsncd = hsncd;
	}
	public String getRelItemIds() {
		return relItemIds;
	}
	public void setRelItemIds(String relItemIds) {
		this.relItemIds = relItemIds;
	}
	public List<Tags> getTagList() {
		return tagList;
	}
	public void setTagList(List<Tags> tagList) {
		this.tagList = tagList;
	}
	public List<Ingrediant> getTasteList() {
		return tasteList;
	}
	public void setTasteList(List<Ingrediant> tasteList) {
		this.tasteList = tasteList;
	}
	public List<Images> getImageList() {
		return imageList;
	}
	public void setImageList(List<Images> imageList) {
		this.imageList = imageList;
	}
	public List<ItemDisplay> getRelItemList() {
		return relItemList;
	}
	public void setRelItemList(List<ItemDisplay> relItemList) {
		this.relItemList = relItemList;
	}
	public int getSubCatId() {
		return subCatId;
	}
	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}
	public String getSubCatName() {
		return subCatName;
	}
	public void setSubCatName(String subCatName) {
		this.subCatName = subCatName;
	}
	public String getJsonStr() {
		return jsonStr;
	}
	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}
	@Override
	public String toString() {
		return "ItemDisplay [itemId=" + itemId + ", itemName=" + itemName + ", catId=" + catId + ", catName=" + catName
				+ ", subCatId=" + subCatId + ", subCatName=" + subCatName + ", itemSortId=" + itemSortId
				+ ", isDecimal=" + isDecimal + ", itemUom=" + itemUom + ", uomId=" + uomId + ", itemDesc=" + itemDesc
				+ ", productType=" + productType + ", productStatus=" + productStatus + ", productCategory="
				+ productCategory + ", productCategoryName=" + productCategoryName + ", preperationTime="
				+ preperationTime + ", showInOrder=" + showInOrder + ", rating=" + rating + ", tagIds=" + tagIds
				+ ", tasteTypeIds=" + tasteTypeIds + ", tagName=" + tagName + ", tasteName=" + tasteName + ", rateAmt="
				+ rateAmt + ", mrpAmt=" + mrpAmt + ", spRateAmt=" + spRateAmt + ", cgstPer=" + cgstPer + ", sgstPer="
				+ sgstPer + ", igstPer=" + igstPer + ", hsncd=" + hsncd + ", relItemIds=" + relItemIds + ", jsonStr="
				+ jsonStr + ", tagList=" + tagList + ", tasteList=" + tasteList + ", imageList=" + imageList
				+ ", relItemList=" + relItemList + "]";
	}
	
	

}

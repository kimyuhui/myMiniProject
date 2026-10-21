package com.dto;

import java.io.Serializable;

public class Snack implements Serializable {
		
	private String snackId; // 과자아이디
	private String snackName; // 과자이름
	private String snackCompany; // 과자회사
	private int snackKcal; // 칼로리
	private String snackIngredients; // 재료
	private String snackImg;
	private String snackImg2;
	public String getSnackImg2() {
		return snackImg2;
	}
	public void setSnackImg2(String snackImg2) {
		this.snackImg2 = snackImg2;
	}
	private String snackDescription;
	
	public String getSnackDescription() {
		return snackDescription;
	}
	public void setSnackDescription(String snackDescription) {
		this.snackDescription = snackDescription;
	}
	public String getSnackImg() {
		return snackImg;
	}
	public void setSnackImg(String snackImg) {
		this.snackImg = snackImg;
	}
	private int snackPrice;
	
	public int getSnackPrice() {
		return snackPrice;
	}
	public void setSnackPrice(int snackPrice) {
		this.snackPrice = snackPrice;
	}
	private int quantity; // 장바구니에 담은 개수

	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSnackId() {
		return snackId;
	}
	public void setSnackId(String snackId) {
		this.snackId = snackId;
	}
	public String getSnackName() {
		return snackName;
	}
	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}
	public String getSnackCompany() {
		return snackCompany;
	}
	public void setSnackCompany(String snackCompany) {
		this.snackCompany = snackCompany;
	}
	public int getSnackKcal() {
		return snackKcal;
	}
	public void setSnackKcal(int i) {
		this.snackKcal = i;
	}
	public String getSnackIngredients() {
		return snackIngredients;
	}
	public void setSnackIngredients(String snackIngredients) {
		this.snackIngredients = snackIngredients;
	}
	
}

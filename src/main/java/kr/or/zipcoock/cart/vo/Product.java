package kr.or.zipcoock.cart.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int productNo;
	private int memberNo;
	private String tradeName;
	private String productName;
	private String price;
	private String filepath;
	private String discountRate;
	private String discountedPrice;
	private int stock;
	private int limit;
	private int quantity;
	private int shippingPeriod;
	private String shippingFee;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getTradeName() {
		return tradeName;
	}
	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}
	public String getDiscountedPrice() {
		return discountedPrice;
	}
	public void setDiscountedPrice(String discountedPrice) {
		this.discountedPrice = discountedPrice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getShippingPeriod() {
		return shippingPeriod;
	}
	public void setShippingPeriod(int shippingPeriod) {
		this.shippingPeriod = shippingPeriod;
	}
	public String getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(String shippingFee) {
		this.shippingFee = shippingFee;
	}
	
	

}

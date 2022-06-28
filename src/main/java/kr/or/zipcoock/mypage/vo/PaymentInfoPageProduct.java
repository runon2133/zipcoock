package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class PaymentInfoPageProduct {
	private String productNo;
	private String paymentInfoCode;
	private String orderedProductNo;
	private String quantity;
	private String productName;
	private String tradeName;
	private String filepath;
	private String price;
	private String shippingFee;
	private String totalPrice;
	private String totalPrice2;
	private int isReviewed;

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getPaymentInfoCode() {
		return paymentInfoCode;
	}

	public void setPaymentInfoCode(String paymentInfoCode) {
		this.paymentInfoCode = paymentInfoCode;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getTradeName() {
		return tradeName;
	}

	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(String shippingFee) {
		this.shippingFee = shippingFee;
	}

	public String getTotalPrice2() {
		return totalPrice2;
	}

	public void setTotalPrice2(String totalPrice2) {
		this.totalPrice2 = totalPrice2;
	}

	public String getOrderedProductNo() {
		return orderedProductNo;
	}

	public void setOrderedProductNo(String orderedProductNo) {
		this.orderedProductNo = orderedProductNo;
	}

	public int getIsReviewed() {
		return isReviewed;
	}

	public void setIsReviewed(int isReviewed) {
		this.isReviewed = isReviewed;
	}

}

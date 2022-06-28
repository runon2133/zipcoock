package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class PaymentInfoPage {
	private String receiverName;
	private String receiverPhone;
	private String receiverAddr;
	private String isDelivered;
	private String paymentInfoCode;
	private String orderDate;
	private String total;
	private String paymentMethod;
	private String price;
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getReceiverAddr() {
		return receiverAddr;
	}
	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}
	public String getIsDelivered() {
		return isDelivered;
	}
	public void setIsDelivered(String isDelivered) {
		this.isDelivered = isDelivered;
	}
	public String getPaymentInfoCode() {
		return paymentInfoCode;
	}
	public void setPaymentInfoCode(String paymentInfoCode) {
		this.paymentInfoCode = paymentInfoCode;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	
	
}

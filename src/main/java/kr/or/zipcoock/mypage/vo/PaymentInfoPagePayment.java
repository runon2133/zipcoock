package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class PaymentInfoPagePayment {
	private String paymentInfoCode;
	private String rname;
	private String rphone;
	private String addr;
	private String orderDate;
	private String isDelivered;
	private String paymentMethod;
	private String total;

	
	
	public String getPaymentInfoCode() {
		return paymentInfoCode;
	}
	public void setPaymentInfoCode(String paymentInfoCode) {
		this.paymentInfoCode = paymentInfoCode;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getIsDelivered() {
		return isDelivered;
	}
	public void setIsDelivered(String isDelivered) {
		this.isDelivered = isDelivered;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	
	 
}

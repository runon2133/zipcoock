package kr.or.seller.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderedProduct {
	private int paymentInfoCode;
	private int orderdProductNo;
	private int quantity;
	private String paymentMethod;
	private String productName;
	private String price;
	private String orderDate;
	private String receiverName;
	private String receiverPhone;
	private String receiverAddr;
	private String isDelivered;
	private String shippingCampany;
	private int totalPrice;
	
}

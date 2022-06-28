package kr.or.seller.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellerSaleManage {
	private int paymentInfoCode;
	private String paymentMethod;
	private String price;
	private String orderDate;
	private String receiverName;
	private String isDelivered;
	
}

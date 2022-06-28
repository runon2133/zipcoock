package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentInfo {
	private int paymentInfoCode;
	private int memberNo;
	private String receiverName;
	private String receiverPhone;
	private String receiverAddr;
	private String orderDate;
	private String isDelivered;
	private String paymentMethod;
	
}

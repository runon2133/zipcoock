package kr.or.delivery.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdDelivery {
	private int deliveryNo;
	private int orderNo;
	private int riderNo;
	private int sellerNo;
	private String deliveryState;
	private int buyerNo;
	private String deliveryLocation;
	private Date deliveryTime;
}

package kr.or.delivery.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdOrder {
	private int orderNo;
	private int sellerNo;
	private int cartNo;
	private int orderMenuNo;
	private String orderState;
	private int buyerNo;
	private String orderAddress;
	private Date orderTime;
}

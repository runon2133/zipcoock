package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuOrder {

	private int orderNo;
	private int memberNo;
	private int storeNo;
	private String orderRequest;
	private String orderState;
	private String orderTime;
	private String orderAddress;
	private String orderAddress2;
	
}

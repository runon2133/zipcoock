package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private int payNo;
	private int orderNo;
	private String payType;
	private String payTime;
	private int payPrice;
	private String payStatus;
	private int payDiscount;
}

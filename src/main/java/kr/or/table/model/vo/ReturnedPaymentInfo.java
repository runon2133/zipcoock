package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReturnedPaymentInfo 
{
	private int paymentInfoCode;
	private String isReurned;
	private int returnNo;
}

package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AdminDeal 
{
	private int dealNo;
	
	private int productNo;
	private String productName;
	
	private int discountRate;
	private String discountDate;
	private String discountendDate;
}

package kr.or.table.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShippingInfo {

	private int shippingInfoNo;
	private int productNo;
	private String shippingMethod;
	private String shippingCompany;
	private String shippingFee;
	private String shippingPeriod;
	
}

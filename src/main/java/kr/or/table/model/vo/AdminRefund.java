package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminRefund 
{
	private int returnPolicyNo;
	private int productNo;
	private String productName;
	private String returnShipping;
	private String retrunLength;
	private String policyContent;
}

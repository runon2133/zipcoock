package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdCoupon {
	private int couponNo;
	private int payNo;
	private String counponName;
	private String couponContent;
	private String couponKinds;
	private String couponTerm;
	private String couponState;
}

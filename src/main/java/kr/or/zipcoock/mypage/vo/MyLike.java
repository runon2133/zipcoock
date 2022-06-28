package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyLike {
	private int likeNo;
	private String productName;
	private String productNo;
	private String filepath;
	private String tradeName;
	private String price;
	private String discountedPrice;
	private String discountRate;

}

package kr.or.zipcoock.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductCard {
	private int productNo;
	private int memberNo;
	private String productName;
	private String price;
	private int categoryNo;
	private String tradeName;
	private String filepath;
	private int reviewCount;
	private String starAvg;
	private String discountRate;
	private String discountedPrice;
	private String orderPrice;
	private String starClass;

	
}

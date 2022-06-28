package kr.or.zipcoock.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductPageReview {
	private int reviewNo;
	private int memberNo;
	private String memberName;
	private String memberId;
	private int productNo;
	private String reviewContent;
	private int star;
	private String trimedStar;
	private String starClass;
	private String writeDate;
	

}

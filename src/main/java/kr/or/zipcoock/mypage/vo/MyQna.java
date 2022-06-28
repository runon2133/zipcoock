package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyQna {
	private int qnaNo;
	private String qnaTitle;
	private int isAnswered;
	private String qnaContent;
	private int productNo;
	private String writeDate;
	private String productName;
	private String filepath;
	private String tradeName;
	private String price;
	private String discountedPrice;
	private String discountRate;

}

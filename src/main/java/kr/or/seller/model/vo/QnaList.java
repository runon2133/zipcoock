package kr.or.seller.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaList {
	private int qnaNo;
	private int memberNo;
	private int productRefNo;
	private String qnaTitle;
	private String qnaContent;
	private String writeDate;
	private int qnaAnswerer;
	private int qnaAnswerNo;
	private String qnaAnswerTitle;
	private String qnaAnswerContent;
	private String writeAnswerDate;
	private int qnaLevel;
	private int qnaRefNo;
	

}

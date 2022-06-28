package kr.or.zipcoock.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductPageQna {
	private String memberName;
	private String memberId;
	private String memberNo;
	private int qnaNo;
	private int productRefNo;
	private int qnaRefNo;
	private int qnaLevel;
	private String qnaTitle;
	private String qnaContent;
	private String writeDate;
	private String aTitle;
	private String aContent;
	private String aWriteDate;


}

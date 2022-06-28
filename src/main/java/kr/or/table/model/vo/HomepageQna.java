package kr.or.table.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomepageQna {
	private int qnaNo;
	private int memberNo;
	private int qnaRefNo;
	private int qnaLevel;
	private String qnaTitle;
	private String qnaContent;
	private String writeDate;

}

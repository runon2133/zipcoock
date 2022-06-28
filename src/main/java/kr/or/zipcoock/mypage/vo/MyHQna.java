package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyHQna {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String writeDate;
	private int isAnswered;
}

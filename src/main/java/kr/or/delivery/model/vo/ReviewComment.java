package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewComment {
	
	private int commentNo;
	private int reviewNo;
	private int memberNo;
	private String commentDate;
	private String commentContent;
	
}

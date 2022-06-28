package kr.or.zipcoock.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewImg 
{
	private int reviewImgNo;
	private int reviewNo;
	private String filename;
	private String filepath;
}


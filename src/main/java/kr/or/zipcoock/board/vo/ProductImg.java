package kr.or.zipcoock.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductImg 
{
	private int productImgNo;
	private int productNo;
	private String filename;
	private String filepath;
	private String mainImg;
}

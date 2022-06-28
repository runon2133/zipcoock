package kr.or.table.model.vo;

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
	private String fileName;
	private String filePath;
}

package kr.or.table.model.vo;

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
	private String fileName;
	private String filePath;
	private String mainImg;
}

package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductReview 
{
	private int reviewNo;
	private int memberNo;
	private int productNo;
	private String reviewContent;
	private int star;
	private String writeDate;
}
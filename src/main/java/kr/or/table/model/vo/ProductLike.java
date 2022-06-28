package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductLike 
{
	private int likeNo;
	private int memberNo;
	private int productNo;
}

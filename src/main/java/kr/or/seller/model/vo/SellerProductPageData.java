package kr.or.seller.model.vo;

import java.util.ArrayList;


import kr.or.table.model.vo.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellerProductPageData {

	private ArrayList<Product> list;
	private String pageNavi;
	private int start;
	
}

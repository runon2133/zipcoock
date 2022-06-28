package kr.or.seller.model.vo;

import java.util.ArrayList;

import kr.or.table.model.vo.PaymentInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderPageData {
	private ArrayList<SellerSaleManage> list;
	private String pageNavi;
	private int start;
}
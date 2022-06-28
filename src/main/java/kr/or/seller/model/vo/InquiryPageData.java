package kr.or.seller.model.vo;

import java.util.ArrayList;

import kr.or.table.model.vo.PaymentInfo;
import kr.or.table.model.vo.Product;
import kr.or.table.model.vo.Qna;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryPageData {

	private ArrayList<QnaList> list;
	private String pageNavi;
	private int start;
	
}

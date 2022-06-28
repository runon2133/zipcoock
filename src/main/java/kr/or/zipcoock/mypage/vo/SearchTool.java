package kr.or.zipcoock.mypage.vo;

import java.util.Arrays;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchTool {

	private int show = 5;
	private int memberNo;
	private int isAnswered = 0;
	private int start = 0;
	private int end = 10;
	private String productName = "";
	private String tradeName = "";
	private String title = "";
	private String content = "";
	private String isDelivered = "";
	private String period = "모두";
	private String order = "최신순";
//	private String table = "table";
	private List<String> orderList = Arrays.asList("최신순", "가나다순", "가나다역순", "높은가격순", "낮은가격순", "오래된 순");
	private List<String> periodList = Arrays.asList("모두","하루","한달", "6개월", "1년 ");
//	private List<String> tableList = Arrays.asList("address","qna","homepage_qna", "review", "product_like");
	private List<String> showList = Arrays.asList("5", "10", "15", "20", "25");
	private int p = 1; // 현재 페이지
	private int totalP = 0;
	private String pageNavi = "";
	private int totalPost = 0;
	private int filteredPost = 0;
	private String url;
	private String basic;
	
	public String getURL() {
		url =basic+"memberNo="+memberNo+"&isAnswered="+isAnswered+"&productName="+productName+"&tradeName="+tradeName+"&title="+title
				+"&order="+order+"&content="+content+"&period="+period+"&p="+p;
		return url;
	};
}
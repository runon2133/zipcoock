package kr.or.zipcoock.board.vo;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchTool {
	private String b = "전체 상품"; // board
	private String c = "전체"; // category
	private String k = ""; // keyword
	private String by = "상품"; // searchBy
	private String order = "최신순";
	private String star = "모든 별점";
	private int show = 6;
	private int min = 0;
	private int max = 9999999;
	private int start = 0;
	private int end = 10;
	private List<String> byList =  Arrays.asList("상품","상호");
	private List<String> orderList = Arrays.asList("최신순","가나다순","가나다역순","높은가격순","낮은가격순","오래된 순","인기순");
	private List<String> starList = Arrays.asList("모든 별점","4점 이상","3점 이상","2점 이상","1점 이상");
	private List<String> showList = Arrays.asList("6","9","12","15","18","21");
	private String[] cArr = {"전체","생활용품","뷰티","헬스/건강식품","주방용품","식품","완구/취미","문구/오피스","반려동물"};
	private HashMap<String,Integer> categoryMap = new HashMap<String, Integer>();

	private int p = 1; // 현재 페이지
	private int totalP = 0;
	private String pageNavi = "";
	private int totalProduct = 0;
	private int filteredProduct = 0;
	
	public String getURL() {
		String url ="mainboard.do?b="+b+"&c="+c+"&p="+p+"&k="+k+"&by="+by
				+"&order="+order+"&star="+star+"&show="+show
				+"&min"+min+"&max"+max;
		return url;
	};
}
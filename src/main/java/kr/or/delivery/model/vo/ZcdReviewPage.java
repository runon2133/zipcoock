package kr.or.delivery.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdReviewPage {

	private ArrayList<ZcdReview> list;
	private String pageNavi;
	private int start;
	
}

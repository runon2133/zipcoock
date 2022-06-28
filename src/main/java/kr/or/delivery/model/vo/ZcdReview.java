package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdReview {
	
	private int reviewNo;
	private int storeNo;
	private int memberNo;
	private int orderNo;
	private String storeName;
	private String reviewDate;
	private String reviewContent;
	private String reviewState;

}

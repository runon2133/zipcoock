package kr.or.zipcoock.mypage.vo;

import kr.or.zipcoock.cart.vo.Address;


import kr.or.table.model.vo.HomepageQna;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.ProductLike;
import kr.or.zipcoock.mypage.vo.ProductReview;
import kr.or.table.model.vo.Qna;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeleteObj1 {
	private Member m;
	private Address addr;
	private Qna q;
	private HomepageQna hq;
	private ProductReview r;
	private ProductLike like;
	private String url;	
	
}

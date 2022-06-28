package kr.or.zipcoock.mypage.service;

import java.util.ArrayList;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.table.model.vo.PwChangeVO;
import kr.or.zipcoock.mypage.dao.MypageDao;
import kr.or.zipcoock.mypage.vo.ProductReview;
import kr.or.zipcoock.mypage.vo.DeleteObj1;
import kr.or.zipcoock.mypage.vo.HQnaPage;
import kr.or.zipcoock.mypage.vo.InsertObj;
import kr.or.zipcoock.mypage.vo.MyAddr;
import kr.or.zipcoock.mypage.vo.MyHQna;
import kr.or.zipcoock.mypage.vo.MyLike;
import kr.or.zipcoock.mypage.vo.MyPaymentList;
import kr.or.zipcoock.mypage.vo.MyQna;
import kr.or.zipcoock.mypage.vo.MyReview;
import kr.or.zipcoock.mypage.vo.PaymentInfoPagePayment;
import kr.or.zipcoock.mypage.vo.PaymentInfoPageProduct;
import kr.or.zipcoock.mypage.vo.QnaPage;
import kr.or.zipcoock.mypage.vo.SearchTool;
import kr.or.zipcoock.mypage.vo.UpdateObj1;

@Service
public class MypageService {
	@Autowired
	private MypageDao dao;

	@Transactional
	public int insert(InsertObj obj) {
		return dao.insert(obj);
	}

	@Transactional
	public int update(UpdateObj1 obj) {
		return dao.update(obj);
	}

	// @Pointcut(value="execution(* kr.or..*Service.*Enc(..))")
	// kr.or.. 클래스파일 Service로 끝나고 메소드명 Enc로 끝나는것
	@Transactional
	public int updatePWEnc(UpdateObj1 obj) {
		return dao.update(obj);
	}

	// @Pointcut(value="execution(* kr.or..*Service.*Enc(..))")
	// kr.or.. 클래스파일 Service로 끝나고 메소드명 Enc로 끝나는것
	@Transactional
	public int delete(DeleteObj1 obj) {
		return dao.delete(obj);

	}
	
	
	public void test(SearchTool tool) {
		selectTotal(tool, "address");
		selectTotal(tool, "product_like");
		selectTotal(tool, "homepage_qna");
		selectTotal(tool, "product_review");
		tool.setFilteredPost(dao.selectMyAddrCnt(tool));		
		tool.setFilteredPost(dao.selectMyHQnaCnt(tool));
		tool.setFilteredPost(dao.selectMyLikeCnt(tool));
		tool.setFilteredPost(dao.selectMyQnaCnt(tool));
		tool.setFilteredPost(dao.selectMyReviewCnt(tool));
	}

	public ArrayList<MyAddr> selectMyAddr(SearchTool tool) {
		tool.setFilteredPost(dao.selectMyAddrCnt(tool));
		selectTotal(tool, "address");
		selectList(tool);
		return dao.selectMyAddr(tool);
	}

	public ArrayList<MyHQna> selectMyHQna(SearchTool tool) {
		tool.setFilteredPost(dao.selectMyHQnaCnt(tool));
		selectTotal(tool, "homepage_qna");
		selectList(tool);
		return dao.selectMyHQna(tool);
	}

	public ArrayList<MyLike> selectMyLike(SearchTool tool) {
		tool.setFilteredPost(dao.selectMyLikeCnt(tool));
		selectTotal(tool, "product_like");
		selectList(tool);
		return dao.selectMyLike(tool);

	}
	public ArrayList<MyQna> selectMyQna(SearchTool tool) {
		tool.setFilteredPost(dao.selectMyQnaCnt(tool));
		selectTotal(tool, "qna");
		selectList(tool);
		return dao.selectMyQna(tool);

	}
	public ArrayList<MyReview> selectMyReview(SearchTool tool) {
		tool.setFilteredPost(dao.selectMyReviewCnt(tool));
		selectTotal(tool, "product_review");
		selectList(tool);
		return dao.selectMyReview(tool);

	}
	public ArrayList<MyPaymentList> selectMyPaymentList(SearchTool tool) {
		tool.setFilteredPost(dao.selectMyPaymentListCnt(tool));
		selectTotal(tool, "payment_info");
		selectList(tool);
		return dao.selectMyPaymentList(tool);
		
	}

	public void selectTotal(SearchTool tool,String table) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("table", table);
		map.put("memberNo", tool.getMemberNo()+"");
		tool.setTotalPost(dao.selectCnt(map));
		
	}
	public void selectList(SearchTool tool) {

		// pagination
		int reqPage = tool.getP();
		int postPerPage = tool.getShow();
		int end = reqPage * postPerPage;
		int start = end - postPerPage + 1;

		tool.setStart(start);
		tool.setEnd(end);

		int total = tool.getFilteredPost();
		

		int totalPage = total % postPerPage == 0 ? total / postPerPage : total / postPerPage + 1;
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		tool.setTotalP(totalPage);

		StringBuffer pageNavi = new StringBuffer();

		if (pageNo != 1) {
			tool.setP(pageNo - 1);
			pageNavi.append("<li class='page-item'><a class='page-link' href='" + tool.getURL()
					+ "' tabindex=-1 >Previous</a></li>");
		}
		;

		for (int i = 0; i < pageNaviSize; i++) {
			tool.setP(pageNo);
			if (pageNo == reqPage) {
				pageNavi.append("<li class='page-item active'><a class='page-link' href='" + tool.getURL() + "'>"
						+ tool.getP() + "</a></li>");

			} else {
				pageNavi.append("<li class='page-item'><a class='page-link' href='" + tool.getURL() + "'>" + tool.getP()
						+ "</a></li>");
			}
			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			tool.setP(pageNo);
			pageNavi.append("<li class='page-item'><a class='page-link' href='" + tool.getURL() + "'>Next</a></li>");
		}

		tool.setPageNavi(pageNavi.toString());
		tool.setP(reqPage);

	}

	@Transactional
	public String ChangePw(PwChangeVO pwchangeVo) {
		if(dao.selectPw(pwchangeVo) > 0) {			
			if(dao.changePw(pwchangeVo) > 0) {			
				return "비밀번호 변경 완료";
			}else {
				return "비밀번호 변경 실패";
			}
		}else {
			return "잘못된 비밀번호입니다.";
		}
	}

	public HQnaPage selecHQnaPage(int hqnaNo) {
		return dao.selectHQnaPage(hqnaNo);
	}
	public QnaPage selecQnaPage(int qnaNo) {
		return dao.selectQnaPage(qnaNo);
	}
	public PaymentInfoPagePayment selectPaymentInfoPagePayment(int paymentInfoCode) {
		return dao.selectPaymentInfoPagePayment(paymentInfoCode);
	}
	public ArrayList<PaymentInfoPageProduct> selectPaymentInfoPageProduct(int paymentInfoCode) {
		return dao.selectPaymentInfoPageProduct(paymentInfoCode);
	}

	public ProductReview selectReviewByReviewNo(int reviewNo) {
		return dao.selectReviewByReviewNo(reviewNo);
	}

	public ProductReview  selectReviewByOrderNo(int orderedProductNo) {
		return dao.selectReviewByOrderNo(orderedProductNo);
	}
	
}

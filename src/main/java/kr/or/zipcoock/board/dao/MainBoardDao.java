package kr.or.zipcoock.board.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.zipcoock.board.vo.ProductImg;
import kr.or.zipcoock.board.vo.ReviewImg;
import kr.or.zipcoock.board.vo.ProductCard;
import kr.or.zipcoock.board.vo.ProductPage;
import kr.or.zipcoock.board.vo.ProductPageArgs;
import kr.or.zipcoock.board.vo.ProductPageQna;
import kr.or.zipcoock.board.vo.ProductPageReview;
import kr.or.zipcoock.board.vo.SearchTool;

@Controller
public class MainBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectCnt(HashMap<String, String> map) {
		return sqlSession.selectOne("mainboard.selectCnt", map);

	}

	@SuppressWarnings("unchecked")
	public ArrayList<ProductCard> selectProductCard(SearchTool tool) {
		List<ProductCard> cards = sqlSession.selectList("mainboard.selectProductCard", tool);
		return (ArrayList<ProductCard>) cards;

	}

	public int selectTotalProduct(SearchTool tool) {
		return sqlSession.selectOne("mainboard.selectTotalProduct", tool);
	}

	public ProductPage selectProductPage(ProductPageArgs args) {
		return sqlSession.selectOne("mainboard.selectProductPage", args);
	}

	public ArrayList<ProductPageQna> selectQna(ProductPageArgs args) {
		List<ProductPageQna> qnas = sqlSession.selectList("mainboard.selectQna", args);
		return (ArrayList<ProductPageQna>) qnas;
	}

	public ArrayList<ProductPageReview> selectReview(ProductPageArgs args) {
		List<ProductPageReview> reviews = sqlSession.selectList("mainboard.selectReview", args);
		return (ArrayList<ProductPageReview>) reviews;
	}

	public ArrayList<ProductImg> selectProductImg(ProductPageArgs args) {
		List<ProductImg> imgs = sqlSession.selectList("mainboard.selectProductImg", args);
		return (ArrayList<ProductImg>) imgs;
	}

	public ArrayList<ReviewImg> selectReviewImg(int reviewNo) {
		List<ReviewImg> imgs = sqlSession.selectList("mainboard.selectReviewImg", reviewNo);
		return (ArrayList<ReviewImg>) imgs;
	}

}

package kr.or.delivery.purchase.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.delivery.model.vo.Menu;
import kr.or.delivery.model.vo.MenuGroup;
import kr.or.delivery.model.vo.ReviewComment;
import kr.or.delivery.model.vo.ZcdCartVo;
import kr.or.delivery.model.vo.ZcdMain;
import kr.or.delivery.model.vo.ZcdReview;
import kr.or.delivery.model.vo.ZcdStore;
import kr.or.table.model.vo.Address;
import kr.or.table.model.vo.Member;

@Repository
public class DeliveryBuyerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member m) {
		return (Member)sqlSession.selectOne("member.selectOneMember",m);
	}

	public int updatePwMember(Member m) {
		return sqlSession.update("member.updateSmemberPW",m);
	}

	public int updatePhone(Member m) {
		return sqlSession.update("zcdBuyer.updatePhone",m);
	}

	public ArrayList<ZcdCartVo> selectOneCart(int memberNo) {
		List<ZcdCartVo> list=sqlSession.selectList("zcdBuyer.selectOneCart",memberNo);
		return (ArrayList<ZcdCartVo>) list;
	}

	public int deleteOneCart(ZcdCartVo zcv) {
		return sqlSession.delete("zcdBuyer.deleteOneCart",zcv);
	}

	public ArrayList<ZcdStore> selectStoreList() {
		List<ZcdStore> list=sqlSession.selectList("zcdBuyer.selectStoreList");
		return (ArrayList<ZcdStore>) list;
	}

	public ArrayList<Address> selectAddrList(int memberNo) {
		List<Address> list=sqlSession.selectList("zcdBuyer.selectAddrList");
		return (ArrayList<Address>) list;
	}

	public ArrayList<ZcdMain> selectMainList() {
		List<ZcdMain> list=sqlSession.selectList("zcdBuyer.selectMainList");
		return (ArrayList<ZcdMain>) list;
	}

	public ZcdStore selectOneMarket(int storeNo) {
		return sqlSession.selectOne("zcdseller.selectOneMarket", storeNo);
	}

	public ArrayList<MenuGroup> selectGroupList(int storeNo) {
		List<MenuGroup> list = sqlSession.selectList("zcdseller.selectGroupList", storeNo);
		return (ArrayList<MenuGroup>) list;
	}

	public ArrayList<Menu> selectAllMenuList() {
		List<Menu> list = sqlSession.selectList("zcdseller.selectAllMenuList");
		return (ArrayList<Menu>) list;
	}

	public int zcdChangeNum(ZcdCartVo cart) {
		return sqlSession.update("zcdBuyer.changeNum",cart);
	}

	public ArrayList<ZcdReview> selectReviewList(int memberNo) {
		List<ZcdReview> list=sqlSession.selectList("zcdBuyer.selectReviewList",memberNo);
		return (ArrayList<ZcdReview>) list;
	}

	public ArrayList<ZcdReview> selectZcdReviewList(int storeNo) {
		List<ZcdReview> list = sqlSession.selectList("zcdseller.selectZcdReviewList", storeNo);
		return (ArrayList<ZcdReview>)list;
	}

	public ArrayList<ReviewComment> selectReviewCommentList(int memberNo) {
		List<ReviewComment> list = sqlSession.selectList("zcdseller.selectReviewCommentList", memberNo);
		return (ArrayList<ReviewComment>)list;
	}
	
	
}

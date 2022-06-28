package kr.or.delivery.seller.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.delivery.model.vo.AddMenu;
import kr.or.delivery.model.vo.Menu;
import kr.or.delivery.model.vo.MenuGroup;
import kr.or.delivery.model.vo.MenuOrder;
import kr.or.delivery.model.vo.ReviewComment;
import kr.or.delivery.model.vo.StoreLogo;
import kr.or.delivery.model.vo.ZcdCart;
import kr.or.delivery.model.vo.ZcdReview;
import kr.or.delivery.model.vo.ZcdStore;
import kr.or.table.model.vo.Member;

@Repository
public class DeliverySellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member member) {
		return (Member)sqlSession.selectOne("zcdseller.selectOneMember", member);
	}

	public String selectOneStoreName(String storeName) {
		return sqlSession.selectOne("zcdseller.selectOneStoreName", storeName);
	}
	
	public String selectOneStoreName2(int storeNo) {
		return sqlSession.selectOne("zcdseller.selectOneStoreName2", storeNo);
	}

	public String selectOneStorePhone(String storePhone) {
		return sqlSession.selectOne("zcdseller.selectOneStorePhone", storePhone);
	}
	
	public String selectOneStorePhone2(int storeNo) {
		return sqlSession.selectOne("zcdseller.selectOneStorePhone2", storeNo);
	}

	public int addMarket(ZcdStore zs) {
		return sqlSession.insert("zcdseller.addMarket", zs);
	}

	public int insertStoreLogo(StoreLogo sl) {
		return sqlSession.insert("zcdseller.insertStoreLogo", sl);
	}

	public ArrayList<ZcdStore> selectZcdStoreList(int memberNo) {
		List<ZcdStore> list = sqlSession.selectList("zcdseller.selectZcdStoreList", memberNo);
		return (ArrayList<ZcdStore>) list;
	}

	public int changeState(ZcdStore zs) {
		return sqlSession.update("zcdseller.changeState", zs);
	}

	public ZcdStore selectOneMarket(int storeNo) {
		return sqlSession.selectOne("zcdseller.selectOneMarket", storeNo);
	}

	public int modifyMarket(ZcdStore zs) {
		return sqlSession.update("zcdseller.modifyMarket", zs);
	}

	public int modifyStoreLogo(StoreLogo sl) {
		return sqlSession.update("zcdseller.modifyStoreLogo", sl);
	}

	public int deleteOneMarket(int storeNo) {
		return sqlSession.delete("zcdseller.deleteOneMarket", storeNo);
	}

	public int addMenuGroup(MenuGroup mg) {
		return sqlSession.insert("zcdseller.addMenuGroup", mg);
	}

	public ArrayList<MenuGroup> selectMenuGroupList(int storeNo) {
		List<MenuGroup> list = sqlSession.selectList("zcdseller.selectMenuGroupList", storeNo);
		return (ArrayList<MenuGroup>) list;
	}

	public int modifyMenuGroup(MenuGroup mg) {
		return sqlSession.update("zcdseller.modifyMenuGroup", mg);
	}

	public int deleteMenuGroup(int groupNo) {
		return sqlSession.delete("zcdseller.deleteMenuGroup", groupNo);
	}

	public ArrayList<Menu> selectMenuList(int groupNo) {
		List<Menu> list = sqlSession.selectList("zcdseller.selectMenuList", groupNo);
		return (ArrayList<Menu>) list;
	}

	public String selectOneMenuName(String menuName) {
		return sqlSession.selectOne("zcdseller.selectOneMenuName", menuName);
	}

	public int addMenu(Menu menu) {
		return sqlSession.insert("zcdseller.addMenu", menu);
	}

	public String selectGroupName(int groupNo) {
		return sqlSession.selectOne("zcdseller.selectGroupName", groupNo);
	}

	public Menu selectOneMenu(int menuNo) {
		return sqlSession.selectOne("zcdseller.selectOneMenu", menuNo);
	}

	public int modifyMenu(Menu menu) {
		return sqlSession.update("zcdseller.modifyMenu", menu);
	}

	public int modifyMenu2(Menu menu) {
		return sqlSession.update("zcdseller.modifyMenu2", menu);
	}

	public int deleteMenu(int menuNo) {
		return sqlSession.delete("zcdseller.deleteMenu", menuNo);
	}

	public ArrayList<AddMenu> selectAddMenuList(int menuNo) {
		List<AddMenu> list = sqlSession.selectList("zcdseller.selectAddMenuList", menuNo);
		return (ArrayList<AddMenu>) list;
	}

	public int deleteOption(int addmenuNo) {
		return sqlSession.delete("zcdseller.deleteOption", addmenuNo);
	}

	public int addMenuOption(AddMenu addmenu) {
		return sqlSession.insert("zcdseller.addMenuOption", addmenu);
	}

	public String selectBusinessNo(int memberNo) {
		return sqlSession.selectOne("zcdseller.selectBusinessNo", memberNo);
	}

	public String selectSellerName(int memberNo) {
		return sqlSession.selectOne("zcdseller.selectSellerName", memberNo);
	}

	public ArrayList<MenuGroup> selectGroupList(int storeNo) {
		List<MenuGroup> list = sqlSession.selectList("zcdseller.selectGroupList", storeNo);
		return (ArrayList<MenuGroup>) list;
	}

	public ArrayList<Menu> selectAllMenuList() {
		List<Menu> list = sqlSession.selectList("zcdseller.selectAllMenuList");
		return (ArrayList<Menu>) list;
	}

	public ArrayList<AddMenu> selectAddMenuList1(int menuNo) {
		List<AddMenu> list = sqlSession.selectList("zcdseller.selectAddMenuList1", menuNo);
		return (ArrayList<AddMenu>) list;
	}

	public ArrayList<AddMenu> selectAdMenuList2(int menuNo) {
		List<AddMenu> list = sqlSession.selectList("zcdseller.selectAddMenuList2", menuNo);
		return (ArrayList<AddMenu>) list;
	}

	public int selectAddMenuPrice(AddMenu addmenu) {
		return sqlSession.selectOne("zcdseller.selectAddMenuPrice", addmenu);
	}

	public int addCart(ZcdCart zc) {
		return sqlSession.insert("zcdseller.addCart", zc);
	}

	public ArrayList<MenuOrder> selectOrderList(Map<Object, Object> pagedata) {
		List<MenuOrder> list = sqlSession.selectList("zcdseller.selectOrderList", pagedata);
		return (ArrayList<MenuOrder>)list;
	}

	public int selectOrderTotalCount(Map<Object, Object> pagedata) {
		int result = sqlSession.selectOne("zcdseller.selectOrderTotalCount",pagedata);
		return result;
	}

	public MenuOrder selectMenuOrder(int orderNo) {
		return sqlSession.selectOne("zcdseller.selectMenuOrder", orderNo);
	}

	public String selectMemberPhone(int memberNo) {
		return sqlSession.selectOne("zcdseller.selectMemberPhone", memberNo);
	}

	public ArrayList<ZcdCart> selectZcdCartList(MenuOrder mo) {
		List<ZcdCart> list = sqlSession.selectList("zcdseller.selectZcdCartList", mo);
		return (ArrayList<ZcdCart>)list;
	}

	public int zcdOrderX(int orderNo) {
		return sqlSession.delete("zcdseller.zcdOrderX", orderNo);
	}

	public int zcdOrderO(int orderNo) {
		return sqlSession.update("zcdseller.zcdOrderO", orderNo);
	}

	public ArrayList<ZcdReview> selectReviewList(Map<Object, Object> pagedata) {
		List<ZcdReview> list = sqlSession.selectList("zcdseller.selectReviewList", pagedata);
		return (ArrayList<ZcdReview>)list;
	}

	public int selectReviewTotalCount(Map<Object, Object> pagedata) {
		int result = sqlSession.selectOne("zcdseller.selectReviewTotalCount",pagedata);
		return result;
	}

	public ZcdReview selectOneReview(int reviewNo) {
		return sqlSession.selectOne("zcdseller.selectOneReview", reviewNo);
	}

	public String selectMemberId(int memberNo) {
		return sqlSession.selectOne("zcdseller.selectMemberId", memberNo);
	}

	public int reviewWrite(ReviewComment rc) {
		return sqlSession.insert("zcdseller.reviewWrite", rc);
	}

	public int updateReviewState(int reviewNo) {
		return sqlSession.update("zcdseller.updateReviewState", reviewNo);
	}

	public ReviewComment selectOneComment(int reviewNo) {
		return sqlSession.selectOne("zcdseller.selectOneComment", reviewNo);
	}

	public int commentModify(ReviewComment rc) {
		return sqlSession.update("zcdseller.commentModify", rc);
	}

	public ArrayList<ZcdReview> selectZcdReviewList(int storeNo) {
		List<ZcdReview> list = sqlSession.selectList("zcdseller.selectZcdReviewList", storeNo);
		return (ArrayList<ZcdReview>)list;
	}

	public ArrayList<ReviewComment> selectReviewCommentList(int memberNo) {
		List<ReviewComment> list = sqlSession.selectList("zcdseller.selectReviewCommentList", memberNo);
		return (ArrayList<ReviewComment>)list;
	}

	public ArrayList<ZcdStore> selectZcdStoreList2() {
		List<ZcdStore> list = sqlSession.selectList("zcdseller.selectZcdStoreList2");
		return (ArrayList<ZcdStore>) list;
	}

	public int zcdOrderStart(int orderNo) {
		return sqlSession.update("zcdseller.zcdOrderStart", orderNo);
	}

	public int zcdOrderEnd(int orderNo) {
		return sqlSession.update("zcdseller.zcdOrderEnd", orderNo);
	}

	public int zcdOrderO2(int orderNo) {
		return sqlSession.update("zcdseller.zcdOrderO2", orderNo);
	}

}

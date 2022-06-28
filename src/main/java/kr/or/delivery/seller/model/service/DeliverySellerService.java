package kr.or.delivery.seller.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.delivery.model.vo.AddMenu;
import kr.or.delivery.model.vo.Menu;
import kr.or.delivery.model.vo.MenuGroup;
import kr.or.delivery.model.vo.MenuOrder;
import kr.or.delivery.model.vo.ReviewComment;
import kr.or.delivery.model.vo.StoreLogo;
import kr.or.delivery.model.vo.ZcdCart;
import kr.or.delivery.model.vo.ZcdOrderPage;
import kr.or.delivery.model.vo.ZcdReview;
import kr.or.delivery.model.vo.ZcdReviewPage;
import kr.or.delivery.model.vo.ZcdStore;
import kr.or.delivery.seller.model.dao.DeliverySellerDao;
import kr.or.table.model.vo.Member;

@Service
public class DeliverySellerService {

	@Autowired
	private DeliverySellerDao dao;
	
	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}

	public String selectOneStoreName(String storeName) {
		String sn = dao.selectOneStoreName(storeName);
		return sn;
	}
	
	public String selectOneStoreName2(int storeNo) {
		String sn2 = dao.selectOneStoreName2(storeNo);
		return sn2;
	}

	public String selectOneStorePhone(String storePhone) {
		String sp = dao.selectOneStorePhone(storePhone);
		return sp;
	}
	
	public String selectOneStorePhone2(int storeNo) {
		String sp2 = dao.selectOneStorePhone2(storeNo);
		return sp2;
	}

	@Transactional
	public int addMarket(ZcdStore zs, ArrayList<StoreLogo> list) {
		int result1 = dao.addMarket(zs);
		System.out.println("result1: " + result1);
		int result = 0;
		if (result1 > 0) {
			for (StoreLogo sl : list) {
				System.out.println("zs.getStoreNo: " + zs.getStoreNo());
				sl.setStoreNo(zs.getStoreNo());
				result += dao.insertStoreLogo(sl);
			}
		} else {
			return -1;
		}
		return result;
	}

	public ArrayList<ZcdStore> selectZcdStoreList(int memberNo) {
		ArrayList<ZcdStore> list = dao.selectZcdStoreList(memberNo);
		return list;
	}

	@Transactional
	public int changeState(ZcdStore zs) {
		int result = dao.changeState(zs);
		return result;
	}

	public ZcdStore selectOneMarket(int storeNo) {
		ZcdStore zs = dao.selectOneMarket(storeNo);
		return zs;
	}

	@Transactional
	public int modifyMarket(ZcdStore zs) {
		int result = dao.modifyMarket(zs);
		return result;
	}
	
	@Transactional
	public int modifyMarket(ZcdStore zs, ArrayList<StoreLogo> list) {
		int result1 = dao.modifyMarket(zs);
		int result = 0;
		if (result1 > 0) {
			for (StoreLogo sl : list) {
				System.out.println("zs.getStoreNo: " + zs.getStoreNo());
				sl.setStoreNo(zs.getStoreNo());
				result += dao.modifyStoreLogo(sl);
			}
		} else {
			return -1;
		}
		return result;
	}

	@Transactional
	public int deleteOneMarket(int storeNo) {
		int result = dao.deleteOneMarket(storeNo);
		return result;
	}

	@Transactional
	public int addMenuGroup(MenuGroup mg) {
		int result = dao.addMenuGroup(mg);
		return result;
	}

	public ArrayList<MenuGroup> selectMenuGroupList(int storeNo) {
		ArrayList<MenuGroup> list = dao.selectMenuGroupList(storeNo);
		return list;
	}

	@Transactional
	public int modifyMenuGroup(MenuGroup mg) {
		int result = dao.modifyMenuGroup(mg);
		return result;
	}

	@Transactional
	public int deleteMenuGroup(int groupNo) {
		int result = dao.deleteMenuGroup(groupNo);
		return result;
	}

	public ArrayList<Menu> selectMenuList(int groupNo) {
		ArrayList<Menu> list = dao.selectMenuList(groupNo);
		return list;
	}

	public String selectOneMenuName(String menuName) {
		String mn = dao.selectOneMenuName(menuName);
		return mn;
	}

	@Transactional
	public int addMenu(Menu menu) {
		int result = dao.addMenu(menu);
		System.out.println("result: " + result);
		if (result > 0) {
			return result;
		} else {
			return -1;
		}
	}

	public String selectGroupName(int groupNo) {
		String groupName = dao.selectGroupName(groupNo);
		return groupName;
	}

	public Menu selectOneMenu(int menuNo) {
		Menu menu = dao.selectOneMenu(menuNo);
		return menu;
	}

	@Transactional
	public int modifyMenu(Menu menu) {
		int result = dao.modifyMenu(menu);
		return result;
	}

	@Transactional
	public int modifyMenu2(Menu menu) {
		int result = dao.modifyMenu2(menu);
		return result;
	}

	@Transactional
	public int deleteMenu(int menuNo) {
		int result = dao.deleteMenu(menuNo);
		return result;
	}

	public ArrayList<AddMenu> selectAddMenuList(int menuNo) {
		ArrayList<AddMenu> list = dao.selectAddMenuList(menuNo);
		return list;
	}

	@Transactional
	public int deleteOption(int addmenuNo) {
		int result = dao.deleteOption(addmenuNo);
		return result;
	}

	@Transactional
	public int addMenuOption(AddMenu addmenu) {
		int result = dao.addMenuOption(addmenu);
		return result;
	}

	public String selectBusinessNo(int memberNo) {
		String businessNo = dao.selectBusinessNo(memberNo);
		return businessNo;
	}

	public String selectSellerName(int memberNo) {
		String sellerName = dao.selectSellerName(memberNo);
		return sellerName;
	}

	public ArrayList<MenuGroup> selectGroupList(int storeNo) {
		ArrayList<MenuGroup> list = dao.selectGroupList(storeNo);
		return list;
	}

	public ArrayList<Menu> selectAllMenuList() {
		ArrayList<Menu> list = dao.selectAllMenuList();
		return list;
	}

	public ArrayList<AddMenu> selectAddMenuList1(int menuNo) {
		ArrayList<AddMenu> list = dao.selectAddMenuList1(menuNo);
		return list;
	}

	public ArrayList<AddMenu> selectAddMenuList2(int menuNo) {
		ArrayList<AddMenu> list = dao.selectAdMenuList2(menuNo);
		return list;
	}
	
	// 추가 선택 메뉴 가격 조회
	public int selectAddMenuPrice(AddMenu addmenu) {
		int addMenuPrice = dao.selectAddMenuPrice(addmenu);
		return addMenuPrice;
	}

	@Transactional
	public int addCart(ZcdCart zc) {
		int result = dao.addCart(zc);
		return result;
	}

	public ZcdOrderPage selectOrderList(int reqPage, int storeNo, String orderState) {
		int numPerPage = 5;
		int totalPage = 0;
		int totalCount = 0;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<Object, Object> pagedata = new HashMap<Object, Object>();
		pagedata.put("start", start);
		pagedata.put("end", end);
		pagedata.put("storeNo", storeNo);
		pagedata.put("orderState", orderState);
		ArrayList<MenuOrder> list = new ArrayList<MenuOrder>();
		
		list = dao.selectOrderList(pagedata);
		totalCount = dao.selectOrderTotalCount(pagedata);
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		
		if (pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += "<a class='page-link' href='/manageZcdOrder.do?reqPage="+(pageNo-1)+"&storeNo="+storeNo+"&orderState="+orderState+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		for (int i=0; i<pageNaviSize;i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' style='color:#fff;' href='/manageZcdOrder.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderState="+orderState+"'>";
				pageNavi += pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/manageZcdOrder.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderState="+orderState+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if (pageNo>totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item next'>";
			pageNavi += "<a class='page-link' href='/manageZcdOrder.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderStatus="+orderState+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ZcdOrderPage zop = new ZcdOrderPage(list, pageNavi, start);
		
		return zop;
	}
	
	public ZcdOrderPage selectOrderList2(int reqPage, int storeNo, String orderState) {
		int numPerPage = 5;
		int totalPage = 0;
		int totalCount = 0;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<Object, Object> pagedata = new HashMap<Object, Object>();
		pagedata.put("start", start);
		pagedata.put("end", end);
		pagedata.put("storeNo", storeNo);
		pagedata.put("orderState", orderState);
		ArrayList<MenuOrder> list = new ArrayList<MenuOrder>();
		
		list = dao.selectOrderList(pagedata);
		totalCount = dao.selectOrderTotalCount(pagedata);
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		
		if (pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += "<a class='page-link' href='/manageDeliveryOrder.do?reqPage="+(pageNo-1)+"&storeNo="+storeNo+"&orderState="+orderState+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		for (int i=0; i<pageNaviSize;i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' style='color:#fff;' href='/manageDeliveryOrder.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderState="+orderState+"'>";
				pageNavi += pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/manageDeliveryOrder.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderState="+orderState+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if (pageNo>totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item next'>";
			pageNavi += "<a class='page-link' href='/manageDeliveryOrder.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderStatus="+orderState+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ZcdOrderPage zop = new ZcdOrderPage(list, pageNavi, start);
		
		return zop;
	}

	public MenuOrder selectMenuOrder(int orderNo) {
		MenuOrder mo = dao.selectMenuOrder(orderNo);
		return mo;
	}

	public String selectMemberPhone(int memberNo) {
		String memberPhone = dao.selectMemberPhone(memberNo);
		return memberPhone;
	}

	public ArrayList<ZcdCart> selectZcdCartList(MenuOrder mo) {
		ArrayList<ZcdCart> list = dao.selectZcdCartList(mo);
		return list;
	}

	@Transactional
	public int zcdOrderX(int orderNo) {
		int result = dao.zcdOrderX(orderNo);
		return result;
	}

	@Transactional
	public int zcdOrderO(int orderNo) {
		int result = dao.zcdOrderO(orderNo);
		return result;
	}

	public ZcdReviewPage selectReviewList(int reqPage, int storeNo, String reviewState) {
		int numPerPage = 5;
		int totalPage = 0;
		int totalCount = 0;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<Object, Object> pagedata = new HashMap<Object, Object>();
		pagedata.put("start", start);
		pagedata.put("end", end);
		pagedata.put("storeNo", storeNo);
		pagedata.put("reviewState", reviewState);
		ArrayList<ZcdReview> list = new ArrayList<ZcdReview>();
		
		list = dao.selectReviewList(pagedata);
		totalCount = dao.selectReviewTotalCount(pagedata);
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		
		if (pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += "<a class='page-link' href='/manageZcdReview.do?reqPage="+(pageNo-1)+"&storeNo="+storeNo+"&orderState="+reviewState+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		for (int i=0; i<pageNaviSize;i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' style='color:#fff;' href='manageZcdReview.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderState="+reviewState+"'>";
				pageNavi += pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/manageZcdReview.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderState="+reviewState+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if (pageNo>totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item next'>";
			pageNavi += "<a class='page-link' href='/manageZcdReview.do?reqPage="+pageNo+"&storeNo="+storeNo+"&orderStatus="+reviewState+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ZcdReviewPage zrp = new ZcdReviewPage(list, pageNavi, start);
		
		return zrp;
	}

	public ZcdReview selectOneReview(int reviewNo) {
		ZcdReview zr = dao.selectOneReview(reviewNo);
		return zr;
	}
	
	public String selectMemberId(int memberNo) {
		String memberId = dao.selectMemberId(memberNo);
		return memberId;
	}

	@Transactional
	public int reviewWrite(ReviewComment rc) {
		int result = dao.reviewWrite(rc);
		return result;
	}

	@Transactional
	public int updateReviewState(int reviewNo) {
		int result = dao.updateReviewState(reviewNo);
		return result;
	}

	public ReviewComment selectOneComment(int reviewNo) {
		ReviewComment rc = dao.selectOneComment(reviewNo);
		return rc;
	}

	@Transactional
	public int commentModify(ReviewComment rc) {
		int result = dao.commentModify(rc);
		return result;
	}

	public ArrayList<ZcdReview> selectZcdReviewList(int storeNo) {
		ArrayList<ZcdReview> zrlist = dao.selectZcdReviewList(storeNo);
		return zrlist;
	}

	public ArrayList<ReviewComment> selectReviewCommentList(int memberNo) {
		ArrayList<ReviewComment> rclist = dao.selectReviewCommentList(memberNo);
		return rclist;
	}

	public ArrayList<ZcdStore> selectZcdStoreList2() {
		ArrayList<ZcdStore> list = dao.selectZcdStoreList2();
		return list;
	}

	@Transactional
	public int zcdOrderStart(int orderNo) {
		int result = dao.zcdOrderStart(orderNo);
		return result;
	}

	@Transactional
	public int zcdOrderEnd(int orderNo) {
		int result = dao.zcdOrderEnd(orderNo);
		return result;
	}

	@Transactional
	public int zcdOrderO2(int orderNo) {
		int result = dao.zcdOrderO2(orderNo);
		return result;
	}
	
}

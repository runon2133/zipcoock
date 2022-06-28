package kr.or.delivery.purchase.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.delivery.model.vo.Menu;
import kr.or.delivery.model.vo.MenuGroup;
import kr.or.delivery.model.vo.ReviewComment;
import kr.or.delivery.model.vo.ZcdCartVo;
import kr.or.delivery.model.vo.ZcdMain;
import kr.or.delivery.model.vo.ZcdReview;
import kr.or.delivery.model.vo.ZcdStore;
import kr.or.delivery.model.vo.updatePw;
import kr.or.delivery.purchase.service.DeliveryBuyerService;
import kr.or.table.model.vo.Address;
import kr.or.table.model.vo.Member;

@Controller
public class DeliveryBuyerController {
	@Autowired
	private DeliveryBuyerService service;
	
	@RequestMapping(value="zcdMain.do")
	public String zcdMain(HttpSession session, Model model) {
		Member m=(Member)session.getAttribute("m");
		//ArrayList<Address> addr=service.selectAddrList(m.getMemberNo());
		ArrayList<ZcdMain> main=service.selectMainList();
		model.addAttribute("main",main);
		//model.addAttribute("addr",addr);
		return "delivery/buyer/zcdMain";
	}
	
	@RequestMapping(value="zcdMypage.do")
	public String zcdMypage() {
		return "delivery/buyer/mypage";
	}
	
	@RequestMapping(value="zcdMyReview.do")
	public String zcdMyReview(HttpSession session, Model model) {
		Member m=(Member)session.getAttribute("m");
		ArrayList<ZcdReview> zr=service.selectReviewList(m.getMemberNo());
		model.addAttribute("zr",zr);
		return "delivery/buyer/mypage/myReview";
	}
	
	@RequestMapping(value="/storeView.do")
	public String marketView(int storeNo, HttpSession session, Model model) {
		ZcdStore zs = service.selectOneMarket(storeNo);
		ArrayList<MenuGroup> menuGrouplist = service.selectGroupList(storeNo);
		ArrayList<Menu> menulist = service.selectAllMenuList();
		ArrayList<ZcdReview> zrlist = service.selectZcdReviewList(zs.getStoreNo());
		ArrayList<ReviewComment> rclist = service.selectReviewCommentList(zs.getMemberNo());
		model.addAttribute("zs", zs);
		model.addAttribute("menuGrouplist", menuGrouplist);
		model.addAttribute("menulist", menulist);
		model.addAttribute("zrlist", zrlist);
		model.addAttribute("rclist", rclist);
		return "delivery/seller/marketView";
	}
	
	@RequestMapping(value="addrList.do")
	public String addrList(HttpSession session, Model model) {
		Member m=(Member)session.getAttribute("m");
		ArrayList<Address> addr=service.selectAddrList(m.getMemberNo());
		model.addAttribute("addr",addr);
		return "delivery/buyer/mypage/myAddr";
	}
	
	@RequestMapping(value="zcdFindResult.do")
	public String zcdFindResult() {
		return "delivery/buyer/findResult";
	}
	
	@RequestMapping(value="zcdCart.do")
	public String zcdCart(HttpSession session, Model model) {
		Member m=(Member)session.getAttribute("m");
		ArrayList<ZcdCartVo> zcv=service.selectOneCart(m.getMemberNo());
		int deliFee=zcv.get(0).getMinPrice();
		int totalPrice=zcv.get(0).getTotalPrice();
		int finalPrice=zcv.get(0).getFinalPrice();
		System.out.println(deliFee);
		model.addAttribute("zcv", zcv);
		model.addAttribute("deliFee",deliFee);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("finalPrice",finalPrice);
		return "delivery/buyer/zcdCart";
	}
	
	@ResponseBody
	@RequestMapping(value = "zcdDeleteCart.do")
	public int zcdDeleteCart (HttpSession session, @RequestParam(value = "chkbox[]") List<String> checkArr, ZcdCartVo cart) {
		Member m=(Member)session.getAttribute("m");
		int memberNo=m.getMemberNo();
		int result=0;
		int menuNo=0;
		if(m!=null) {
			cart.setMemberNo(memberNo);
			for(String i:checkArr) {
				menuNo=Integer.parseInt(i);
				cart.setMenuNo(menuNo);
				service.deleteOneCart(cart);
			}
			result=1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "zcdChangeNum.do")
	public int zcdChangeNum (HttpSession session, ZcdCartVo cart, int amount, int menuNo) {
		Member m=(Member)session.getAttribute("m");
		System.out.println(amount);
		System.out.println(menuNo);
		cart.setAmount(amount);
		cart.setMenuNo(menuNo);
		cart.setMemberNo(m.getMemberNo());
		int result=service.zcdChangeNum(cart);
		return result;
	}
	
	@RequestMapping(value="zcdOrderList.do")
	public String zcdOrderList(Model model, HttpSession session) {
		Member m=(Member)session.getAttribute("m");
		ArrayList<ZcdCartVo> zcv=service.selectOneCart(m.getMemberNo());
		ArrayList<Address> addr=service.selectAddrList(m.getMemberNo());
		int deliFee=zcv.get(0).getMinPrice();
		int totalPrice=zcv.get(0).getTotalPrice();
		int finalPrice=zcv.get(0).getFinalPrice();
		System.out.println(deliFee);
		model.addAttribute("zcv", zcv);
		model.addAttribute("deliFee",deliFee);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("finalPrice",finalPrice);
		model.addAttribute("addr",addr);
		return "delivery/buyer/orderList";
	}

	@RequestMapping(value = "updatePhone.do")
	public String updatePhone(Member m, Model model) {
		int result=service.updatePhone(m);
		if(result>0) {
			model.addAttribute("msg", "전화번호 변경 완료");
		}else {
			model.addAttribute("msg", "전화번호 변경 실패");
		}
		model.addAttribute("loc", "/zcdMypage.do");
		return "common/msg";
	}
	
	@RequestMapping(value = "updatePw.do") 
	public String updatePw(updatePw up, Model model) {
		int result=service.updatePw(up);
		if(result==-1) {
			model.addAttribute("msg", "기존 비밀번호를 확인하세요.");
		}else if(result==1) {
			model.addAttribute("msg","비밀번호 변경 완료");
		}else {
			model.addAttribute("msg","비밀번호 변경 실패");
		}
		model.addAttribute("loc", "/zcdMypage.do");
		return "common/msg";
	}
}

package kr.or.delivery.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.delivery.member.service.ZcdMemberService;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.PwChangeVO;

@Controller
public class ZcdMemberController {
	
	@Autowired
	private ZcdMemberService service;
	
	@RequestMapping (value = "/checkZcdSeller.do")
	public String checkZcdSeller() {
		return "/delivery/member/checkZcdSeller";
	}
	
	@RequestMapping (value = "/deliveryJoinFrm.do")
	public String deliveryJoinFrm() {
		return "/delivery/member/deliveryJoinFrm";
	}
	
	@RequestMapping(value = "/zcdSellerJoinFrm.do")
	public String zcdSellerJoinFrm(Model model, String businessNo) {
		model.addAttribute("Bno", businessNo);
		return "delivery/member/zcdSellerJoin";
	}
	
	@RequestMapping(value = "/zcdSellerJoin.do")
	public String zcdSellerJoin(Member member, String businessNo, Model model) {
		int result = service.insertMemberEnc(member, businessNo);
		if(result>0) {
			model.addAttribute("msg", "회원가입 성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
	}
	
	@RequestMapping(value = "/deliveryJoin.do")
	public String deliveryJoin(Member member, Model model) {
		int result = service.insertDeliveryMemberEnc(member);
		if(result>0) {
			model.addAttribute("msg", "회원가입 성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
	}
	
	@RequestMapping(value = "/zcdAdminChangePw.do")
	public String zcdAdminChangePw(PwChangeVO pv, Model model) {
		int result = service.zcdAdminChangePw(pv);
		if(result==-1) {
			model.addAttribute("msg", "비밀번호가 틀립니다.");
		}else if(result==0) {
			model.addAttribute("msg", "비밀번호 변경 실패");
		}else {
			model.addAttribute("msg", "비밀번호 변경 성공");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
}

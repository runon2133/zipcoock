package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MailSender;
import kr.or.member.model.service.MemberService;
import kr.or.table.model.vo.BusinessSellerInfo;
import kr.or.table.model.vo.Member;


@Controller
public class MemberController {
	// 스프링이 서버 시작시 자동으로 생성한 객체 중 아래 변수와 일치하는 데이터타입의 객체를 찾아서 변수에저장
	// 의존성 주입(DI)
	@Autowired  
	private MemberService service;
	@Autowired  
	private MailSender mailsender;
	
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "zipcoock/member/loginFrm";
	}
	 @RequestMapping(value="/logout.do")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 //String return 시 redirect:컨트롤러 매핑값 -> view resolver가 앞뒤에 붙이는 기능 수행하지 않음
		 return "redirect:/";
	 }
	
	
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model) {
		//Model -> request영역에 데이터를 등록하기 위한 객체
		//request.setAttribute("key",value) -> model.addAttribute("key",value);
		System.out.println("사용자 입력 비밀번호 : " + member.getMemberPw());
		Member m = service.selectOneMemberEnc(member);
		if(m != null) {
			session.setAttribute("m", m);
			model.addAttribute("msg","로그인 성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인하세요");
			model.addAttribute("loc", "/");
		}
		return "zipcoock/common/msg";
	}
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "zipcoock/member/joinFrm";
	}
	
	@RequestMapping(value="/bjoinFrm.do")
	public String bjoinFrm() {
		return "zipcoock/member/bjoin";
	}
	@RequestMapping(value="/kjoin.do")
	public String kjoin(String memberId, Model model) {
		model.addAttribute("id",memberId);
		return "zipcoock/member/kjoin";
	}
	@RequestMapping(value="/ajaxLogin.do")
	@ResponseBody
	public int ajaxLogin(String id,Member member, HttpSession session, Model model) {
		member.setMemberId(id);
		member.setMemberPw(id);
		System.out.println(id);
		Member m = service.selectOneMemberEnc(member);
		
		if(m != null) {
			session.setAttribute("m", m);
			model.addAttribute("msg","로그인 성공");
			model.addAttribute("loc", "/");
			return 1;
		}else {
			return 0;
		}
		
		}	
	
	@RequestMapping(value="/CheckSnum.do") // 사업자 번호 조회 페이지 이동
	public String checkSnum() {
		return "zipcoock/member/CheckSnum";
	}
	@RequestMapping(value="/ajaxbNoCheck.do") //입력한 사업자 번호 DB와 조회하는 AJAX 
	@ResponseBody
	public int ajaxbNoCheck(BusinessSellerInfo BusinessSellerInfo) {
		BusinessSellerInfo bsi = service.selectOneBusinessNo(BusinessSellerInfo);
		if(bsi != null) {
			return 1;
		}else {
			return 0;
		}
		
		
	}
	@RequestMapping(value="sjoinFrm.do") // 판매자 가입 페이지 이동
	public String sjoinFrm(Model model, String businessNo) {
		System.out.println(businessNo);
		model.addAttribute("Bno",businessNo);
		return "zipcoock/member/sjoin";
	}
	@RequestMapping(value="ajaxTradeNameCheck.do")// 상호명 조회 ajax
	@ResponseBody
	public int ajaxTradeNameCheck(BusinessSellerInfo BusinessSellerInfo) {
		BusinessSellerInfo bsi = service.selectOneTradeNameCheck(BusinessSellerInfo);
		if (bsi == null) {
			// 사용가능한 상호명
			return 0;
		} else {
			// 사용중인 상호명
			return 1;
		}
		
		
	}
	@RequestMapping(value="/ajaxIdCheck.do")
	@ResponseBody
	public int ajaxIdcheck(String memberId ) {
		Member m = service.selectOneMemberId(memberId);
		if (m == null) {
			// 사용가능한 아이디
			return 0;
		} else {
			// 사용중인 아이디
			return 1;
		}
		
	}
	
	@RequestMapping(value="/bjoin.do")
	public String bjoin(Member member, Model model) {
		
		int result = service.insertOneMemberEnc(member);
		if(result > 0) {
			model.addAttribute("msg","회원가입 성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg","회원가입 실패");
			model.addAttribute("loc", "/");
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/sjoin.do")

	public String sjoin(BusinessSellerInfo businessSellerInfo,Model model) {
		System.out.println("핸드폰"+businessSellerInfo.getMemberPhone());
		System.out.println("비즈니스loc"+businessSellerInfo.getBusinessLoc());
		int result = service.insertOneSmemberEnc(businessSellerInfo);		
		if(result > 0 ) {
			model.addAttribute("msg","회원가입 성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg","회원가입 실패");
			model.addAttribute("loc", "/");
		}
		return "zipcoock/common/msg";
	

	}
	@RequestMapping(value="/ajaxEmailCheck.do")
	@ResponseBody
	public int ajaxEmailcheck(BusinessSellerInfo businessSellerInfo) {
		System.out.println(businessSellerInfo);
		BusinessSellerInfo bsi = service.selectOneEmail(businessSellerInfo);
		System.out.println(bsi);
		if (bsi == null) {
			return 0;	
		}else {
			return 1;
		}
		
	}
	@RequestMapping(value="/sendMail.do")
	@ResponseBody
	public String sendMail(BusinessSellerInfo businessSellerInfo) {
		String result = mailsender.mailSend(businessSellerInfo.getEmail());
		return result;

	}
	
	

	}
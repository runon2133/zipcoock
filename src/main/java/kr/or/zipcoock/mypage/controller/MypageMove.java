package kr.or.zipcoock.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageMove {
	
	@RequestMapping(value="/mypageReceiptFrm.do")
	public String callReceiptFrm()
	{
		return "zipcoock/mypage/receiptFrm";
	}

	@RequestMapping(value="/mypageMembershipFrm.do")
	public String callMembershipFrm()
	{
		return "zipcoock/mypage/membershipFrm";
	}

	@RequestMapping(value="/mypageQnAFrm.do")
    public String callQnAFrm()
    {
    	return "zipcoock/mypage/qnaFrm";
    }

	@RequestMapping(value="/mypageReviewFrm.do")
    public String callReviewFrm()
    {
    	return "zipcoock/mypage/reviewFrm";
    }
	@RequestMapping(value="/mypageHelpFrm.do")
	public String callHelpFrm()
	{
		return "zipcoock/mypage/helpFrm";
	}

	@RequestMapping(value="/mypageLikeFrm.do")
    public String callLikeFrm()
    {
    	return "zipcoock/mypage/likeFrm";
    }

	@RequestMapping(value="/mypageMyInfoFrm.do")
    public String callMyInfoFrm()
    {
    	return "zipcoock/mypage/myInfoFrm";
    }

	@RequestMapping(value="/mypagePwFrm.do")
    public String callPwFrm()
    {
    	return "zipcoock/mypage/pwFrm";
    }

	@RequestMapping(value="/mypageAddrFrm.do")
    public String callAddrFrm()
    {
    	return "zipcoock/mypage/addrFrm";
    }
	
	@RequestMapping(value="/mypageReceiptView.do")
	public String callReceiptView()
	{
		return "zipcoock/mypage/receiptView";
	}
	@RequestMapping(value="/mypageQnAView.do")
	public String callQnAView()
	{
		return "zipcoock/mypage/qnaView";
	}
	@RequestMapping(value="/mypageReviewView.do")
	public String callReviewView()
	{
		return "zipcoock/mypage/reviewView";
	}

	@RequestMapping(value="/mypageHelpView.do")
	public String callHelpView()
	{
		return "zipcoock/mypage/helpView";
	}

	@RequestMapping(value="/mypageAddrView.do")
	public String callAddrView()
	{
		return "zipcoock/mypage/addrView";
	}

}

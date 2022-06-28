package kr.or.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MainPageController 
{
	@RequestMapping(value = "/call_MainPage.do")
	public String call_MainPage()
	{
		return "common/main";
	}
	
	@RequestMapping(value = "/call_AdminPage.do")
	public String call_AdminMain()
	{
		return "admin/admin_main";
	}
	
	@RequestMapping(value = "/admin_qna.do")
	public String call_adminQna()
	{
		return "admin/allQnaList";
	}

	
	@RequestMapping(value = "/admin_allMember.do")
	public String call_AllMemberPage()
	{
		return "admin/allMemberList";
	}
	
	@RequestMapping(value = "/admin_homecookDeal.do")
	public String call_adminhomecookDeal()
	{
		return "admin/adminHomecookDeal";
	}
	
	@RequestMapping(value = "/admin_returnPolicy.do")
	public String call_adminReturnPolicy()
	{
		return "admin/adminReturnPolicy";
	}
}

package kr.or.zipcoock.admin.controller;

import java.io.Console;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.table.model.vo.AdminDeal;
import kr.or.table.model.vo.AdminQna;
import kr.or.table.model.vo.AdminRefund;
import kr.or.table.model.vo.HomecookDeal;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.Product;
import kr.or.table.model.vo.Qna;
import kr.or.zipcoock.admin.model.service.AdminService;



@Controller
public class AdminController 
{
	@Autowired
	private AdminService service;
	

	@RequestMapping(value = "/getAllMemberList.do")
	@ResponseBody
	public ArrayList<Member> get_AllMemberList()
	{		
		return service.selectAllMember();
	}
	
	@RequestMapping(value = "/getAllQnaList.do")
	@ResponseBody
	public ArrayList<AdminQna> get_AllQnaList()
	{		
		return service.selectAllQna();
	}
	
	@RequestMapping(value = "/getAllHomecookDeal.do")
	@ResponseBody
	public ArrayList<AdminDeal> get_AllHomecookDeal()
	{		
		return service.selectAllHomecookDeal();
	}
	
	@RequestMapping(value = "/getAllRefund.do")
	@ResponseBody
	public ArrayList<AdminRefund> get_AllRefund()
	{		
		return service.selectAllRefund();
	}
	
	
	@RequestMapping(value = "/admin_MemberInfo.do")
	public String call_MemberInfo(int memberNo, Model model)
	{		
		Member m = service.selectOneMemberInfo(memberNo);
		model.addAttribute("m", m);
		
		return "admin/adminMemberInfo";
	}
	
	@RequestMapping(value = "/Fix_MemberInfo.do")
	@ResponseBody
	public int fix_MemberInfo(int memberNo, String memberName, String memberLevel, String memberDLevel, String memberPhone)
	{		
		
		Member m = new Member();
		
		m.setMemberNo(memberNo);
		m.setMemberName(memberName);
		m.setMemberLevel(memberLevel);
		m.setDeliveryLevel(memberDLevel);
		m.setMemberPhone(memberPhone);
		
		return service.updateMemberInfo(m);
	}	
	
	@RequestMapping(value = "/admin_QnaInfo.do")
	public String call_QnaInfo(int qnaNum, Model model)
	{		
		AdminQna q = service.selectOneQnaInfo(qnaNum);
		model.addAttribute("q", q);		
		
		return "admin/adminQnaInfo";
	}
	
	@RequestMapping(value = "/get_SelectOneQna.do")
	@ResponseBody
	public AdminQna get_SelectOneQna(int refQnaNo)
	{
		AdminQna q = service.selectOneRefNo(refQnaNo);			
		return q;
	}
	
	@RequestMapping(value = "/fix_reQna.do")
	@ResponseBody
	public int fix_reQna(int qna_no, String reContent)
	{
		AdminQna q = new AdminQna();
		q.setQnaNo(qna_no);
		q.setQnaContent(reContent);
		int result = service.updateOneQna(q);			
		return result;
	}
	
	@RequestMapping(value = "/insert_reQna.do")
	@ResponseBody
	public int insert_reQna(int myNo, int qnaNo, String content, String title)
	{
		AdminQna q = new AdminQna();
		
		q.setMemberNo(myNo);
		q.setQnaRefNo(qnaNo);
		q.setQnaContent(content);
		q.setQnaTitle(title);
		
		int result = service.insertOneQna(q);			
		return result;
	}
	
	@RequestMapping(value = "/admin_HomecookDeal.do")
	public String call_HomecookDeal(int dealNo, Model model)
	{		
		AdminDeal d = service.selectOneDeal(dealNo);
		model.addAttribute("d", d);	
		
		System.out.println("point of homecooklist_click : ");		
		return "admin/adminDealInfo";
	}
	
	@RequestMapping(value = "/fix_HomeDeal.do")
	@ResponseBody
	public int fix_HomeDeal(int dealNo, int productNo, String productName,
			int discountRate, String discountDate, String discountendDate)
	{
		AdminDeal d = new AdminDeal();
		d.setDealNo(dealNo);
		d.setProductNo(productNo);
		d.setProductName(productName);
		d.setDiscountRate(discountRate);
		
		d.setDiscountDate(discountDate);
		d.setDiscountendDate(discountendDate);
		
		System.out.println(d.getProductName().replaceAll("\n", "1"));
		
		int result = service.updateOneDeal(d);			
		return result;
	}
	
	@RequestMapping(value = "/admin_ReturnPolicy.do")
	public String call_ReturnPolicy(int policyNo, Model model)
	{		
		AdminRefund r = service.selectOneReturnPolicyInfo(policyNo);		
		model.addAttribute("r", r);				
		return "admin/adminPolicyInfo";
	}	
	
	@RequestMapping(value = "/Fix_RePolicyData.do")
	@ResponseBody
	public int fix_RePolicyData(int rePolicyNo, String returnShipping, String retrunLength, String policyContent)
	{
		AdminRefund r = new AdminRefund();
		r.setReturnPolicyNo(rePolicyNo);
		r.setReturnShipping(returnShipping);
		r.setRetrunLength(retrunLength);
		r.setPolicyContent(policyContent);	
		
		int result = service.updateOnePolicy(r);
		return result;
	}
	
	
	@RequestMapping(value = "/get_ProductList.do")
	@ResponseBody
	public ArrayList<Product> get_ProductList(int iCategory)
	{
		return service.selectSomeProudct(iCategory);
	}	
}

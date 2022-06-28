package kr.or.zipcoock.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.table.model.vo.AdminDeal;
import kr.or.table.model.vo.AdminQna;
import kr.or.table.model.vo.AdminRefund;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.Product;
import kr.or.table.model.vo.Qna;

@Repository
public class AdminDao 
{
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() 
	{
		List<Member> list = sqlSession.selectList("admin.get_memberList");
		return (ArrayList<Member>)list;
	}

	public ArrayList<AdminQna> selectAllQna() 
	{
		List<AdminQna> list = sqlSession.selectList("admin.get_QnaList");
		return (ArrayList<AdminQna>)list;
	}

	public ArrayList<AdminDeal> selectAllHomecookDeal() 
	{		
		List<AdminDeal> list = sqlSession.selectList("admin.get_DealList");
		return (ArrayList<AdminDeal>)list;
	}

	public ArrayList<AdminRefund> selectAllRefund() 
	{
		List<AdminRefund> list = sqlSession.selectList("admin.get_RefundList");
		return (ArrayList<AdminRefund>)list;
	}

	public Member selectOneMemberInfo(int memberNo) 
	{		
		return sqlSession.selectOne("admin.selectOneMemberInfo",memberNo);
	}

	public int updateMemberInfo(Member m) 
	{
		return sqlSession.update("admin.updateOneMemberInfo",m);
	}

	public AdminQna selectOneQnaInfo(int qnaNum) 
	{
		
		return sqlSession.selectOne("admin.selectOneQnaInfo",qnaNum);
	}

	public AdminQna selectOneRefNo(int refQnaNo) 
	{		
		return sqlSession.selectOne("admin.selectOneRefNo",refQnaNo);
	}
	

	public int updateOneQna(AdminQna q) 
	{
		return sqlSession.update("admin.updateOneQna",q);
	}

	public int insertOneQna(AdminQna q) 
	{		
		return sqlSession.insert("admin.insertOneQna_Re",q);
	}

	public AdminDeal selectOneDeal(int dealNo) 
	{		
		return sqlSession.selectOne("admin.get_OneDeal",dealNo);
	}

	public int updateOneDeal(AdminDeal d) 
	{	
		return sqlSession.update("admin.update_OneDeal",d);
	}

	public AdminRefund selectOneReturnPolicyInfo(int policyNo) 
	{		
		return sqlSession.selectOne("admin.get_OneReturnPolicy",policyNo);
	}

	public int updateOnePolicy(AdminRefund r) 
	{
		return sqlSession.update("admin.update_OnePolicy",r);
	}

	public ArrayList<Product> selectSomeProudct(int iCategory) 
	{		
		List<Product> list =  sqlSession.selectList("admin.main_ProductList",iCategory);
		return (ArrayList<Product>)list;
	}

}

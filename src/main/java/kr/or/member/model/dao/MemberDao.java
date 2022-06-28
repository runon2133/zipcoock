package kr.or.member.model.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import kr.or.table.model.vo.BusinessSellerInfo;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.PwChangeVO;


@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member member) {
		
		return (Member)sqlSession.selectOne("member.selectOneMember",member);
		}

	public BusinessSellerInfo selectOneBusinessNo(BusinessSellerInfo businessSellerInfo) {
		
		return (BusinessSellerInfo)sqlSession.selectOne("businessSellerInfo.selectOneBusinessNo",businessSellerInfo);
	}

	public BusinessSellerInfo selectOneTradename(BusinessSellerInfo businessSellerInfo) {
		
		return (BusinessSellerInfo)sqlSession.selectOne("businessSellerInfo.selectOneTardeName",businessSellerInfo);
	}

	public Member selectOneMemberId(String memberId) {

		return (Member)sqlSession.selectOne("member.selectOneMemberId",memberId);
	}

	public int insertOneMember(Member member) {
		
		return sqlSession.insert("member.insertOneMember",member);
	}

	public int insertOneSmember(Member member) {
		
		return sqlSession.insert("member.insertOneSmember",member);
	}

	public int insertOneSmember2(BusinessSellerInfo businessSellerInfo) {
		

		return sqlSession.insert("businessSellerInfo.insertOneSmember",businessSellerInfo);
	}

	public BusinessSellerInfo selectOneEmail(BusinessSellerInfo businessSellerInfo) {

		return sqlSession.selectOne("businessSellerInfo.selectOneEmail",businessSellerInfo);
	}



	public Member selectOneMemberPW(Member m) {
		return  (Member)sqlSession.selectOne("member.selectOneMemberPW",m);
	}

	public int updatePW(Member m) {

		return sqlSession.update("member.updateSmemberPW",m);
	}


	
}
package kr.or.delivery.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.table.model.vo.Member;

@Repository
public class ZcdMemberDao {
	
	@Autowired
	private SqlSessionTemplate sessoin;

	public int insertMember(Member member) {
		return sessoin.insert("zcdMember.insertMember",member);
	}

	public int insertMember2(String businessNo) {
		return sessoin.insert("zcdMember.insertMember2",businessNo);
	}

	public int insertDeliveryMember(Member member) {
		return sessoin.insert("zcdMember.insertDeliveryMember",member);
	}

	public Member selectOneAdmin(Member member) {
		return (Member)sessoin.selectOne("zcdMember.selectOneAdmin",member);
	}

	public int updateAdminPw(Member m) {
		return sessoin.update("zcdMember.updateAdminPw",m);
	}

}

package kr.or.delivery.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.delivery.member.dao.ZcdMemberDao;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.PwChangeVO;

@Service
public class ZcdMemberService {

	@Autowired
	private ZcdMemberDao dao;

	public int insertMemberEnc(Member member, String businessNo) {
		int result = dao.insertMember(member);
		if(result>0) {
			result = dao.insertMember2(businessNo);
		}else {
			return -1;
		}
		return result;
	}

	public int insertDeliveryMemberEnc(Member member) {
		return dao.insertDeliveryMember(member);
	}

	public int zcdAdminChangePw(PwChangeVO pv) {
		Member m = new Member();
		m.setMemberId(pv.getMemberId());
		m.setMemberPw(pv.getOldPassword());
		Member member = dao.selectOneAdmin(m);
		if(member == null) {
			return -1;
		}else {
			m.setMemberPw(pv.getNewPassword());			
			return dao.updateAdminPw(m);
		}
	}
}

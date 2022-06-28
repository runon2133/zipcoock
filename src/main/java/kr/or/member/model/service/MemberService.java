package kr.or.member.model.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.table.model.vo.BusinessSellerInfo;
import kr.or.table.model.vo.Member;


@Service
public class MemberService {

		@Autowired
		private MemberDao dao;
		
		/*
		 * public Member login2(String memberId, String memberPw) { Member m =
		 * dao.login2(memberId,memberPw); return m; }
		 */
		
		public Member selectOneMemberEnc(Member member) {
			Member m = dao.selectOneMember(member);
			return m;
		}

		public BusinessSellerInfo selectOneBusinessNo(BusinessSellerInfo businessSellerInfo) {
			BusinessSellerInfo bsi = dao.selectOneBusinessNo(businessSellerInfo);
			return bsi;
		}

		public BusinessSellerInfo selectOneTradeNameCheck(BusinessSellerInfo businessSellerInfo) {
			BusinessSellerInfo bsi = dao.selectOneTradename(businessSellerInfo);
			return bsi;
		}

		public Member selectOneMemberId(String memberId) {
			Member m = dao.selectOneMemberId(memberId);
			return m;
		}
		@Transactional
		public int insertOneMemberEnc(Member member) {
			int result = dao.insertOneMember(member);
			
			return result;
		}
		@Transactional
		public int insertOneSmemberEnc(BusinessSellerInfo member) {
			int result = dao.insertOneSmember(member);
			if(result>0) {				
				result = dao.insertOneSmember2(member);
			}else {
				return -1;
			}
			return result;
		}

		public BusinessSellerInfo selectOneEmail(BusinessSellerInfo businessSellerInfo) {
			BusinessSellerInfo bsi = dao.selectOneEmail(businessSellerInfo);
			
			
			return bsi;
		}

	


		
}

package kr.or.member.model.service;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.PwChangeVO;



@Component
@Aspect
public class PasswordEncAdvice {
	@Autowired
	private SHA256Enc enc;
	@Pointcut(value="execution(* kr.or..*Service.*Enc(..))")
	//kr.or.. 클래스파일 Service로 끝나고 메소드명 Enc로 끝나는것
	
	public void encPointcut() {}
	
	@Before(value="encPointcut()")
	public void encPassword(JoinPoint jp) throws Exception{
		String methodName = jp.getSignature().getName(); //확인하기위해 선언
		Object[] args = jp.getArgs(); //매개변수들 저장하기위한 object객체
		Member m = (Member)args[0]; //포인트컷한 메소드에서 매개변수인 멤버를 가져오기
		String inputPass = m.getMemberPw(); //가져온 멤버 객체에서 비밀번호를 꺼내서 저장
		String encPass = enc.encData(inputPass); // 저장 비밀번호를 enc안에있는 data변수로 저장
		m.setMemberPw(encPass);
		System.out.println("메소드명 : "+methodName);
		System.out.println("변경 전 비밀번호 : "+inputPass);
		System.out.println("암호화 비밀번호 : "+encPass);
	}
	
	@Pointcut(value="execution(* kr.or..*Service.*ChangePw(..))")//매개변수 중에 타입이 Member인것
	public void changePwPointcut() {}
	
	@Before(value="changePwPointcut()")
	public void changePw(JoinPoint jp) throws Exception{
		Object[] args = jp.getArgs();
		PwChangeVO pc = (PwChangeVO)args[0];
		String oldPw = pc.getOldPassword();
		String newPw = pc.getNewPassword();
		pc.setOldPassword(enc.encData(oldPw));
		pc.setNewPassword(enc.encData(newPw));
	}
	
}

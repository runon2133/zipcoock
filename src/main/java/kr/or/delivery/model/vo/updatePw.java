package kr.or.delivery.model.vo;

import lombok.Data;

@Data
public class updatePw {
	private String memberId;
	private String oldPw;
	private String newPw;
}

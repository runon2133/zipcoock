package kr.or.table.model.vo;

import lombok.Data;

@Data
public class PwChangeVO {
	private String memberId;
	private String oldPassword;
	private String newPassword;
}

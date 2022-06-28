package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPw;
	private String memberPhone;
	private String memberLevel;
	private String deliveryLevel;
}

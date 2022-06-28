package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyAddr {
	private int addrNo;
	private int memberNo;
	private String receiverName;
	private String receiverPhone;
	private String addr;
}

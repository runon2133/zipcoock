package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BusinessSellerInfo extends Member {
	private String businessNo;
	private String tradeName;
	private String representative;
	private String businessLoc;
	private String contact;
	private String email;

};

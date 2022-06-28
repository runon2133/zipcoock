package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rider {
	private int riderNo;
	private String riderName;
	private String riderPhone;
	private String riderAccount;
	private String riderGrade;
}

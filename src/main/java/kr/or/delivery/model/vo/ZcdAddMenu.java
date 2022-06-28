package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdAddMenu {
	private int addMenuNo;
	private int menuNo;
	private String addMenuName;
	private String addMenuContent;
	private String addMenuPrice;
}

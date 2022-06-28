package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdMenu {
	private int menuNo;
	private String menuGroup;
	private String menuName;
	private String menuContent;
	private int menuPrice;
	private String filename;
	private String filepath;
	private String menuaddStatus;
}

package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddMenu {

	private int addmenuNo;
	private int menuNo;
	private String addmenuName;
	private String addmenuPrice;
	private String addmenuStatus;
	
}

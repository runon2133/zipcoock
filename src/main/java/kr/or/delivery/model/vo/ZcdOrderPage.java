package kr.or.delivery.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdOrderPage {
	
	private ArrayList<MenuOrder> list;
	private String pageNavi;
	private int start;

}

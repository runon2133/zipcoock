package kr.or.delivery.model.vo;

import kr.or.table.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreCategory extends Member {
	private int ctNo;
	private String ct1;
	private String ct2;
	private String filename;
	private String filepath;
}

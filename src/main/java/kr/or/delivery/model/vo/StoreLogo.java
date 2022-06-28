package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreLogo {
	private int logoNo;
	private int storeNo;
	private String filename;
	private String filepath;
}

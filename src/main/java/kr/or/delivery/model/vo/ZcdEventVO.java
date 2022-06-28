package kr.or.delivery.model.vo;

import lombok.Data;

@Data
public class ZcdEventVO {
	private int eventNo;
	private int memberNo;
	private String eventName;
	private String eventContent;
	private String regDate;
	private String eventFinishdate;
	private int fileNo;
	private String filename;
	private String filepath;
}

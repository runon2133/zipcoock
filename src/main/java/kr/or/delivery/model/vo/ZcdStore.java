package kr.or.delivery.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdStore {
	private int storeNo;
	private int memberNo;
	private String storeName;
	private String storeTime;
	private String storePhone;
	private String storeInfo;
	private String storeNotice;
	private String storeTip;
	private String postcode;
	private String address1;
	private String address2;
	private int minPrice;
	private String storeState;
	private String originInfo;
	private String category1;
	private String category2;
	private String x;
	private String y;
	
	ArrayList<StoreLogo> list;
	private String storeLogo;
}

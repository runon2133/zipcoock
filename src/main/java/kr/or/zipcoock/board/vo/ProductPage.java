package kr.or.zipcoock.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductPage {	
	//basic product info
	private String productName;
	private String productDetail;
	private int productNo;
	private int stock;
	private String origin;//country of origin 
	private String managerContact;
	private String ccContact; //consumer Counseling Contact
	private String howToUse;
	private String precautions;
	private String expirationDate;
	private String capacity;
	private String manufacturer;
	private String manufactureDate;
	private String price;
	private String limit;

	//seller info
	private String businessNo;
	private String tradeName;
	private String representative;
	private String businessLoc;
	private String contact;
	private String email;

	//shipping info
	private String shippingMethod;
	private String shippingCompany;
	private String shippingFee;
	private String shippingPeriod;
	
	//return info
	private String returnShipping;
	private String returnLength;
	private String policyContent;
	
	//additional info
	private String starClass;
	private String discountedPrice;
	private String dRate;
	private String filepath;
	private String isLiked;
	private String reviewCount;
	private String qnaCount;
	private String starAvg;
	
	//total
	private int qTotal; //qna
	private int rTotal; //review

}

package kr.or.table.model.vo;

import java.util.ArrayList;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int productNo;
	private int memberNo;
	private String ProductName;
	private String productDetail;
	private String manufactureDate;
	private int stock;
	private String origin;//country of origin 
	private String manufacturer;
	private String managerContact;
	private String ccContact; //consumer Counseling Contact
	private String howToUse;
	private String precautions;
	private String expirationDate;
	private String capacity;
	private String price;
	private int limit;
	private int categoryNo;
	private int boardCategory;
	private String filepath;
}

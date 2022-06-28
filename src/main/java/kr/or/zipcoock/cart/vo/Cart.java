package kr.or.zipcoock.cart.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private ArrayList<ItemInCart> items; 
	private Address addr;
	private int total;
	private String paymentInfoCode;
	private int memberNo;
	private String bank;
}

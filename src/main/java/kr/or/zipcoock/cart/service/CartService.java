package kr.or.zipcoock.cart.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.zipcoock.cart.dao.CartDao;
import kr.or.zipcoock.cart.vo.Address;
import kr.or.zipcoock.cart.vo.Cart;
import kr.or.zipcoock.cart.vo.ItemInCart;
import kr.or.zipcoock.cart.vo.Product;

@Service
public class CartService {
	@Autowired
	CartDao dao;

	public HashMap<String, ArrayList<Product>> selectItems(ArrayList<ItemInCart> cart) {
		HashMap<String, Object[]> map = new HashMap<String, Object[]>();
		ArrayList<Integer> productNos = new ArrayList<Integer>();

		if(cart == null) {
			return null;
		}
		for (ItemInCart item : cart) {
			productNos.add(item.getProductNo());
		}
		
		map.put("arr", productNos.toArray());
		
		ArrayList<Product> products = dao.selectProduct(map);
		HashMap<String, ArrayList<Product>> hashmap = new HashMap<String, ArrayList<Product>>();
		
		for (int i = 0; i < products.size(); i++) {
			Product p = products.get(i);
			for (ItemInCart item : cart) {
				if (item.getProductNo() == p.getProductNo()) {
					p.setQuantity(item.getQuantity());
				}
			}
			ArrayList<Product> pArr = hashmap.get(p.getTradeName());
			if(pArr != null) {
				pArr.add(p);
			}else {
				ArrayList<Product> pArrToPut = new ArrayList<Product>();
				pArrToPut.add(p);
				hashmap.put(p.getTradeName(), pArrToPut);
			}
			
		}
		

		return hashmap;
	}
	
	public ArrayList<Address> selectAddress(int memberNo){
		return dao.selectAddress(memberNo);
	}

	public int insertCart(Cart cart) {
		if(dao.insertPaymentInfo(cart) > 0) {			
			return dao.insertOrderedProduct(cart);
		};
		return -1;
	}

	
}

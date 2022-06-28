package kr.or.zipcoock.cart.controller;

import java.nio.channels.SeekableByteChannel;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.PwChangeVO;
import kr.or.zipcoock.cart.service.CartService;
import kr.or.zipcoock.cart.vo.Cart;
import kr.or.zipcoock.cart.vo.ItemInCart;


@Controller
public class CartController {
	@Autowired
	CartService service;

	@RequestMapping(value = "/cart.do")
	public String callCartFrm(HttpSession session, Model model) {
		ArrayList<ItemInCart> cart = (ArrayList<ItemInCart>) session.getAttribute("cart");
		Member m = (Member) session.getAttribute("m");

		model.addAttribute("map", service.selectItems(cart));
		model.addAttribute("addr", service.selectAddress(m.getMemberNo()));
		return "zipcoock/cart/cartFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/deleteProduct.do")
	public String deleteProduct(ItemInCart item, HttpSession session) {
		ArrayList<ItemInCart> cart = (ArrayList<ItemInCart>) session.getAttribute("cart");

		for (ItemInCart i : cart) {
			if (i.getProductNo() == item.getProductNo()) {
				cart.remove(i);
			}
		}

		if(cart.size()==0) {
			session.setAttribute("cart", null);				
		}


		return "zipcoock/cart/cartFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/up.do")
	public void up(ItemInCart item, HttpSession session) {
		ArrayList<ItemInCart> cart = (ArrayList<ItemInCart>) session.getAttribute("cart");

		for (ItemInCart i : cart) {
			i.setQuantity(i.getProductNo() == item.getProductNo() ? item.getQuantity() : i.getQuantity());
		}

	}

	@ResponseBody
	@RequestMapping(value = "/down.do")
	public void down(ItemInCart item, HttpSession session) {
		ArrayList<ItemInCart> cart = (ArrayList<ItemInCart>) session.getAttribute("cart");

		for (ItemInCart i : cart) {
			i.setQuantity(i.getProductNo() == item.getProductNo() ? item.getQuantity() : i.getQuantity());
		}

	}

	@ResponseBody
	@RequestMapping(value = "/addToCart.do", produces = "application/json;charset=utf-8")
	public String addToCart(ItemInCart item, HttpSession session) {
		ArrayList<ItemInCart> cart = (ArrayList<ItemInCart>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<ItemInCart>();
			session.setAttribute("cart", cart);
		}

		for (ItemInCart i : cart) {
			if (i.getProductNo() == item.getProductNo()) {
				return new Gson().toJson("이미 담긴 상품입니다.");
			}


		}
		cart.add(item);
		return new Gson().toJson("장바구니 담기 완료");
	}
	
	
	@RequestMapping(value = "/EXAMPLE.do")
	public String cart(Cart cart, int[] quantities, int[] productNos, HttpServletRequest req, HttpSession session, Model model) {
		cart.setItems(new ArrayList<ItemInCart>());
		for(int i=0; i<productNos.length;i++) {
			cart.getItems().add(new ItemInCart(quantities[i],productNos[i]));
		}
		Member m = (Member)session.getAttribute("m");		
		
        String uniqueId = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyHHmmss");
        Calendar dateTime = Calendar.getInstance();
        uniqueId = sdf.format(dateTime.getTime());
                
        int n = 2;
        char[] chs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}; 
      
        Random rd = new Random();
    	StringBuilder sb = new StringBuilder();
    	for (int i = 0; i < n; i++) {
    		char ch = chs[rd.nextInt(chs.length)];
    		sb.append(ch);
    	}
    	
    	 Random rand = new Random();
         String numStr = ""; //난수가 저장될 변수
        
         int len = 10;
         int dupCd = 1;
         for(int i=0;i<len;i++) {
             
             //0~9 까지 난수 생성
             String ran = Integer.toString(rand.nextInt(10));
             
             if(dupCd==1) {
                 //중복 허용시 numStr에 append
                 numStr += ran;
             }else if(dupCd==2) {
                 //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
                 if(!numStr.contains(ran)) {
                     //중복된 값이 없으면 numStr에 append
                     numStr += ran;
                 }else {
                     //생성된 난수가 중복되면 루틴을 다시 실행한다
                     i-=1;
                 }
             }
         }
    	
    	String r = uniqueId+sb.toString();
//    	long code = Long.parseLong(r);
   	
    	System.out.println(r);
	
    	cart.setPaymentInfoCode(r);
		cart.setMemberNo(m.getMemberNo());
		
		if(service.insertCart(cart)<=0) {
			model.addAttribute("msg","결제 실패 관리자에게 문의해주세요.");
			model.addAttribute("loc","/");

			return "zipcoock/cart/msg";
			
		}else{
			
			
			ArrayList<ItemInCart> sessionCart = (ArrayList<ItemInCart>) session.getAttribute("cart");
			ArrayList<ItemInCart> cart2 = cart.getItems();

			for (ItemInCart b: cart2) {
				for (ItemInCart a : sessionCart) {
					if (a.getProductNo() == b.getProductNo()) {
						sessionCart.remove(a);
						break;
					}
				}

			}
			if(sessionCart.size()==0) {
				session.setAttribute("cart", null);

				
			}

			return "redirect:/myPaymentInfoPage.do?paymentInfoCode="+cart.getPaymentInfoCode();
		}

		
	}


		
//		req.setAttribute("cart", cart);
//		return "forward:/EXAMPLE2.do";
//	@RequestMapping(value = "/EXAMPLE2.do")
//	public String cart(HttpServletRequest req) {
//		Cart cart = (Cart)req.getAttribute("cart");
//		System.out.println(cart);
//		return "redirect:/";
//	}
//


}

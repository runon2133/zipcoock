package kr.or.seller.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.seller.model.vo.OrderedProduct;
import kr.or.seller.model.vo.QnaList;
import kr.or.seller.model.vo.SellerSaleManage;
import kr.or.table.model.vo.BusinessSellerInfo;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.PaymentInfo;
import kr.or.table.model.vo.Product;
import kr.or.table.model.vo.ProductImg;
import kr.or.table.model.vo.Qna;
import kr.or.table.model.vo.ReturnPolicy;
import kr.or.table.model.vo.ShippingInfo;

@Repository
public class SellerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public BusinessSellerInfo selectOneSmember(int memberNo) {
		return sqlSession.selectOne("businessSellerInfo.selectOneSmember", memberNo);

	}

	public int updateSellerMember(BusinessSellerInfo businessSellerInfo) {

		return sqlSession.update("businessSellerInfo.updateSellerMember", businessSellerInfo);
	}

	public ArrayList<Product> selectProductList(Map<Object, Object> pagedata) {
		System.out.println(pagedata+"dao");
		List<Product> list = sqlSession.selectList("product.selectProductList", pagedata);
		System.out.println(list + "셀렉트 리스트 결과");
		return (ArrayList<Product>) list;

	}

	public int selectTotalCount(Member m) {
		return sqlSession.selectOne("product.selectTotalCount", m);

	}

	public int insertProduct(Product product) {

		return sqlSession.insert("product.insertProduct", product);
	}
	public int updateProduct(Product product) {

		return sqlSession.update("product.updateProduct", product);
	}


	public int insertShippingInfo(ShippingInfo si) {
		return sqlSession.insert("shippingInfo.insertShippingInfo", si);
	}

	public int insertProductMainImg(ProductImg pi) {
		System.out.println(pi);
		return sqlSession.insert("productImg.insertProductMainImg", pi);
	}

	public int insertProductImg(ProductImg pi) {
		System.out.println(pi);
		return sqlSession.insert("productImg.insertProductImg", pi);
	}

	public int insertReturnPolicy(ReturnPolicy returnPolicy) {
		System.out.println(returnPolicy);
		return sqlSession.insert("returnPolicy.insertReturnPolicy", returnPolicy);
	}

	public HashMap<Object, Object> selectOneproductInfo(Product product) {
		System.out.println(product);
		return sqlSession.selectOne("product.selectOneProductInfo", product);
	}

	public int updateProductMainImg(ProductImg pi) {
		return sqlSession.update("productImg.updateProductMainImg", pi);
	}

	public int updateProductImg(ProductImg fv) {
		return sqlSession.update("productImg.updateProductImg", fv);
		
	}

	public int updateShippingInfo(ShippingInfo shippingInfo) {
		return sqlSession.update("shippingInfo.updateShippingInfo", shippingInfo);
	}

	public int updateReturnPolicy(ReturnPolicy returnPolicy) {
		return sqlSession.update("returnPolicy.updateReturnPolicy", returnPolicy);
		
	}

	public ArrayList<ProductImg> selectProductImg(ProductImg productImg) {
		List<ProductImg> list= sqlSession.selectList("productImg.selectProductImg", productImg);
		return (ArrayList<ProductImg>)list; 
		
	}

	public int deleteProductImg(ProductImg pimg) {
		
		return sqlSession.delete("productImg.deleteProductImg",pimg);
	}

	public int deleteChoiceProduct(Product p) {
		// TODO Auto-generated method stub
		return sqlSession.delete("product.deleteChoiceProduct",p);
	}

	public ArrayList<Integer> selectShippingInfomation(Member member) {
		List<Integer> list = sqlSession.selectList("shippingInfo.selectShippingInfomation",member);
		return (ArrayList<Integer>)list ;
	}

	public ArrayList<Integer> ajaxWeekSaleCount(Member member) {
		List<Integer> list = sqlSession.selectList("shippingInfo.selectWeekSaleCount",member);
		return (ArrayList<Integer>)list;
	}

	public ArrayList<Integer> ajaxWeekSalePriceCount(Member member) {
		List<Integer> list = sqlSession.selectList("shippingInfo.selectWeekSalePriceCount",member);
		return (ArrayList<Integer>)list;
	}


	public int selectTotalCount(Map<Object, Object> pagedata) {
		int result = sqlSession.selectOne("shippingInfo.selectOrderTotalCountSearch",pagedata);
		return result;
	}

	public ArrayList<SellerSaleManage> selectOrderList(Map<Object, Object> pagedata) {
		System.out.println(pagedata+"dao까지는 옴");
		List<SellerSaleManage> list = sqlSession.selectList("shippingInfo.selectOrderList",pagedata);
		return (ArrayList<SellerSaleManage>)list;
	}

	public ArrayList<SellerSaleManage> selectOrderSelectList(Map<Object, Object> pagedata) {
		List<SellerSaleManage> list = sqlSession.selectList("shippingInfo.selectOrderSelectList",pagedata);
		System.out.println(pagedata+"dao pagedata값");
		System.out.println(list+"dao list값");
		return (ArrayList<SellerSaleManage>)list;
	}

	public int selectOrderTotalCount(Member member) {
		return sqlSession.selectOne("shippingInfo.selectOrderTotalCount", member);
		
	}

	

	public PaymentInfo selectpaymentInfo(int paymentInfoCode) {
		
		return sqlSession.selectOne("paymentInfo.selectOnePaymentInfo", paymentInfoCode);
	}

	public ArrayList<OrderedProduct> orderProductList(Map<Object, Object> productList) {
		System.out.println(productList+"daoProductList값");
		List<OrderedProduct> list = sqlSession.selectList("paymentInfo.selectOderProductList",productList);
		System.out.println("dao에서 출력된 list"+list);
		return (ArrayList<OrderedProduct>)list;
	}

	public int selectOrderCount(int paymentInfoCode) {
		int result = sqlSession.selectOne("paymentInfo.selectOderProductListTotalCount",paymentInfoCode);
		System.out.println(result);
		return result;
	}

	public int updateIsDelivered(PaymentInfo paymentInfo) {
		return sqlSession.update("paymentInfo.updateIsDelivered",paymentInfo);
		
	}

	public ArrayList<QnaList> selectInquiryList(Map<Object, Object> qnaList) {
		List<QnaList> list = sqlSession.selectList("q.selectInquiryList",qnaList);
		return (ArrayList<QnaList>)list;
	}

	public int selectInquiryCount(int memberNo) {
		// TODO Auto-generated method stub
		System.out.println(memberNo);
		return sqlSession.selectOne("product.selectInquiryCount",memberNo);
	}

	public QnaList selectOneQna(QnaList qnaList) {
		
		return sqlSession.selectOne("q.selectOneQna",qnaList);
	}

	public int insertQna(QnaList qnaList) {
		
		return sqlSession.insert("q.insertOneQna",qnaList);
	}

	public int updateQna(QnaList qnaList) {
		// TODO Auto-generated method stub
		return sqlSession.update("q.updateOneQna",qnaList);
	}




	/*
	 * public ArrayList<Product> selectProductList(Member m) { List<Product> list =
	 * sqlSession.selectList("product.selectProductList",m); return
	 * (ArrayList<Product>)list; }
	 */

}

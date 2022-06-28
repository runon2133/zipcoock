<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<h1>final project</h1>
<a href = "/call_MainPage.do">main</a>
<fieldset>옥승엽
<a href = "/zipsellerMypage.do">판매자 마이페이지</a>
<a href = "/productList.do?reqPage=1">판매자 상품 리스트 페이지</a>
<a href = "/insertProductFrm.do">판매자 상품등록 페이지</a>
<a href = "/loginFrm.do">로그인</a>
<a href = "/joinFrm.do">회원가입</a>
<a href = "/shippingInfomation.do">배송정보</a>
<a href = "/searchOrder.do?reqPage=1&isDelivered=A&memberNo=${m.memberNo }">판매 조회</a> 
<a href = "/orderManage.do?reqPage=1&paymentInfoCode=9">배송정보</a>
<a href = "/zipcoockSellerQNA.do"></a>
</fieldset>
<hr>
<br>
<a href = "/mainboard.do">집쿠욱메인보드</a>
<a href = "/mainboardView.do?memberNo=1&productNo=1">메인상세</a>
<a href = "/cart.do">cart</a>
<hr>

<h1>delivery</h1>
<a href="/zcdMain.do">딜리버리 메인페이지</a>

<a href = "/manageMarketFrm.do">딜리버리 매장관리(판매자 로그인)</a>

<hr>
<a href="/eventList.do">이벤트 페이지</a>
<a href="/coupon.do">쿠폰관리</a>
<a href="/zcdStatistics.do">통계</a>
</body>
<script>
$(function()
{
	location.href = "/call_MainPage.do";
});
</script>
</html>
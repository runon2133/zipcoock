<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.content_div_info:first-child {
	margin-bottom: 0;
	border-bottom: 0;
}

.btn-area {
	text-align: center;
	display: flex;
}

.btn-area>button:first-child {
	margin-right: 10px;
}

#text-emp {
	color: #333;
	font-weight: 600;
}

.side_nav_div:hover {
	background: rgba(51, 51, 51, 0.05);
	cursor: pointer;
	font-weight: 700;
}

.side_nav_div:hover span {
	font-weight: 700;
}

.side_nav_content a {
	text-decoration: none;
}

.container {
	margin-top: 100px;
	margin-bottom: 50px;
}

.pagination {
	height: 60px;
}

#pageNavi {
	display: flex;
	width: 420px;
	margin: 0 auto;
	justify-content: center;
}

.table {
	font-size: 12px;
	overflow: hidden;
	text-align: center;
}

.btn {
	background-color: #9ac6e8;
	color: #ffffff;
}

.btn:hover {
	color: #fff;
	background-color: #7abaff;
}

.well {
	min-height: 20px;
	padding: 19px;
	margin-bottom: 20px;
	background-color: #f5f5f5;
	border: 1px solid #e3e3e3;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgb(0 0 0/ 5%);
	box-shadow: inset 0 1px 1px rgb(0 0 0/ 5%);
}
</style>
</head>
<body>
	<div class="s-wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main_field">
			<div class="main_content2">
				<div class="side_nav" style="padding-top: 50px; margin-left: 30px;">
					<div class="my_info">
						<div class="my_info_div">
							<span class="my_info_span">환영합니다</span>

						</div>
						<div class="user_div">

							<div class="user_div_div">

								<div class="user_div_content">
									<span class="user_div_name">${sessionScope.m.memberId}<span
										class="user_div_nim">님</span></span>
								</div>

							</div>

						</div>
					</div>

					<div class="side_nav_content">
						<a href="/zipsellerMypage.do"
							class="side_nav_div side_nav_div_selected"><span
							class="side_nav_span side_nav_span_selected">정보 확인/수정</span></a> <a
							href="/productList.do?reqPage=1" class="side_nav_div"><span
							class="side_nav_span">상품 관리</span></a> <a
							href="/shippingInfomation.do "
							class="side_nav_div"><span class="side_nav_span">매출 정보</span></a>
						<a href="/sellerQNA.do?reqPage=1" class="side_nav_div"><span class="side_nav_span">문의내역</span></a>
					</div>
				</div>


				<div class="content_div">
					<div class="content_div_area">

						<div class="content_div_content"
							style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221); overflow: hidden;">
							<div id="title">
								<h2>주문 정보 조회 관리</h2>
							</div>

							<div class="well well-lg" style="background-color: white;">
								<fieldset>
									<legend>주문정보</legend>
									<table class="table table-bordered" id="orderyView"
										style="width: 100%;">
										<tr>
											<th style="width: 15%;">주문번호</th>
											<td style="width: 35%;">${ovd.pi.paymentInfoCode }</td>
											<th style="width: 15%;">주문일자</th>
											<td style="width: 35%;">${ovd.pi.orderDate }</td>
										</tr>
										<tr>
											<th>주문금액(원)</th>

											<c:set var="total" value="0" />

											<c:forEach var="result" items="${ovd.list}"
												varStatus="status">


												<c:set var="total"
													value="${total + (result.price*result.quantity)}" />

											</c:forEach>

											<td><c:out value="${total }" /></td>

											<th>주문상태</th>
											<c:choose>
												<c:when test="${ovd.pi.isDelivered eq 'N'}">
													<td>결제완료(배송전)</td>
												</c:when>
												<c:when test="${ovd.pi.isDelivered eq 'E'}">
													<td>배송중</td>
												</c:when>
												<c:when test="${ovd.pi.isDelivered eq 'Y'}">
													<td>배송완료</td>
												</c:when>
											</c:choose>
										</tr>
										<tr>
											<th style="width: 15%;">주문자</th>
											<td style="width: 35%;">${ovd.pi.receiverName }</td>
											<th style="width: 15%;">연락처</th>
											<td style="width: 35%;">${ovd.pi.receiverPhone }</td>
										</tr>
										<tr>
											<th style="width: 15%;">주소</th>
											<td colspan="3">${ovd.pi.receiverAddr }</td>
										</tr>


									</table>
								</fieldset>
							</div>
							<div class="well well-lg" style="background-color: white;">
								<legend>주문상품</legend>
								<fieldset>
									<table class="table table-bordered" style="width: 100%;">
										<tr class="table-primary" id="orderProductList">
											<th style="width: 15%;">상품주문번호</th>
											<th style="width: 45%;">상품명</th>
											<th style="width: 10%;">가격</th>
											<th style="width: 10%;">수량</th>
											<th>배송 회사</th>
										</tr>
										<c:forEach items="${ovd.list }" var="p">
											<tr class="table-light" id="orderProductList">
												<td style="border: 1px solid rgb(221, 221, 221)">${p.orderdProductNo }</td>
												<td style="border: 1px solid rgb(221, 221, 221)">${p.productName }</td>
												<td style="border: 1px solid rgb(221, 221, 221)">${p.price }</td>
												<td style="border: 1px solid rgb(221, 221, 221)">${p.quantity }</td>
												<td style="border: 1px solid rgb(221, 221, 221)">${p.shippingCampany }</td>
											</tr>
										</c:forEach>
									</table>
									<div id="pageNavi">${ovd.pageNavi }</div>
								</fieldset>
							</div>
							<div class="well well-lg" style="background-color: white;">
								<legend>배송정보</legend>

								<table class="table table-bordered" style="width: 100%;">
									<tr id="deliveryView">
										<th style="width: 50%;background-color: #b8daff;COLOR: WHITE;">배송상태</th>
										<c:choose>
											<c:when test="${ ovd.pi.isDelivered eq 'Y' }">
												<th style="width: 50%;">배송 완료</th>
											</c:when>
											<c:when test="${ ovd.pi.isDelivered eq 'E' }">
												<th style="width: 50%;">배송 중</th>
											</c:when>
											<c:when test="${ ovd.pi.isDelivered eq 'N' }">
												<th style="width: 50%;">배송 전</th>
											</c:when>
										</c:choose>
									</tr>
							
									
								</table>
								<c:if test="${ovd.pi.isDelivered eq 'E' }">
									<form action="/updateIsDelivered.do" method="post">
										<input type="hidden" name="paymentInfoCode"	value="${ovd.pi.paymentInfoCode }"> 
										<input type="hidden" name="isDelivered" value="Y"> 
										<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
										<button type="submit" style="border : none;" class="btn btn-primary btn-block">배송 완료 </button>
									</form>
								</c:if>
								<c:if test="${ovd.pi.isDelivered eq 'N' }">
									<form action="/updateIsDelivered.do" method="post">
										<input type="hidden" name="paymentInfoCode"	value="${ovd.pi.paymentInfoCode }"> 
										<input type="hidden" name="isDelivered" value="E"> 
										<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
										<button type="submit" style="border : none;" class="btn btn-primary btn-block">배송	시작</button>
									</form>
								</c:if>
								<c:if test="${ovd.pi.isDelivered eq 'Y' }">
									<form action="/updateIsDelivered.do" method="post">
										<input type="hidden" name="paymentInfoCode"	value="${ovd.pi.paymentInfoCode }"> 
										<input type="hidden" name="isDelivered" value="E"> 
										<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
										<button type="submit" style="background-color:gray; border : none;" class="btn btn-primary btn-block" disabled>배송	완료</button>
									</form>
								</c:if>
							</div>
						
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- main content -->
	<input type="hidden" name=memberNo value="${sessionScope.m.memberNo}">
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>

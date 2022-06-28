<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.card_info {
		font-size: 15px;
		margin-bottom: 5px;
	}
</style>
<link rel="stylesheet" href="/resources/css/deliverySeller/enrollMenu.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="s-wrapper">
	<jsp:include page="/WEB-INF/views/common/deliveryHeader.jsp" />
	<div class="main_field">
			<div class="main_content2" >
			<div class="side_nav">
	        		<div class="my_info">
	        			<div class="my_info_div">
	        				<span class="my_info_span">환영합니다</span>
	        			</div>
	        			<div class="user_div">
	        				<div class="user_div_div">
	        					<div class="user_div_content">
	        						<span class="user_div_name">${sessionScope.m.memberName }<span class="user_div_nim">님</span></span>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
        			<div class="side_nav_content">
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageMarketFrm.do">매장관리</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageMenuFrm.do">메뉴관리</a></span></div>
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">주문접수</div>
        			<div class="content_div_area">
        				<div class="content_div_div">
        					<div class="content_div_content">
        						<div class="content_div_div_content">
        							<div class="content_div_info">
        								<div class="content_div_title" style="font-weight: bold">주문정보</div>
        								<div class="content_div_end"></div>
        								<br>
        								
        								
				        				<div class="card" style="width: 100%;">
										  <h6 class="card-header" style="font-weight: 600;">배달지</h6>
										  <div class="card-body">
										  	<div class="card_info">주문번호 : ${mo.orderNo }</div>
										  	<div class="card_info">주문시간 : ${mo.orderTime }</div>
										    <div class="card_info">배달지 : ${mo.orderAddress } ${mo.orderAddress2 }</div>
										    <div class="card_info">고객 연락처 : ${memberPhone }</div>
										    <div class="card_info">요청사항 : ${mo.orderRequest }</div>
										  </div>		  
										</div>
										
										<div class="card" style="width: 100%;">
										  <h6 class="card-header" style="font-weight: 600;">주문내역</h6>
										  	<c:if test="${not empty list }">
										  		<c:forEach items="${list }" var="zc">
												    <div class="card-body">
												  	   <div class="card_info">메뉴번호 : ${zc.menuNo }</div>
												  	   <div class="card_info">메뉴가격 : ${zc.menuAllprice }</div>
												       <div class="card_info">수량 : ${zc.amount }</div>
												       <div class="card_info">
												       		<c:choose>
													       		<c:when test="${empty zc.addmenuInfo1 }">
													       			필수 선택 : 없음
													       		</c:when>
													       		<c:otherwise>
													       			필수 선택 : ${zc.addmenuInfo1 }
													       		</c:otherwise>
												       		</c:choose>
												       </div>
												       <div class="card_info">
												       		<c:choose>
													       		<c:when test="${empty zc.addmenuInfo2 }">
													       			추가 선택 : 없음
													       		</c:when>
													       		<c:otherwise>
													       			추가 선택 : ${zc.addmenuInfo2 }
													       		</c:otherwise>
												       		</c:choose>
												       </div>
												       <div class="content_div_end" style="padding: 0;"></div>
												   </div>
												</c:forEach>
											</c:if>	  
										</div>
										 <br><br>
										 <div class="row">
        									<a class="cart_btn" style="font-weight: 400; margin-left:200px;" href="/zcdOrderX.do?orderNo=${mo.orderNo }">주문 취소</a>
        									<div class="col-md-auto"> </div>
        									<a class="buy_btn" style="font-weight: 400; margin-right:200px;" href="/zcdOrderO.do?orderNo=${mo.orderNo }">주문 접수</a>								
       									</div>
										 <br>
        								<div class="content_div_end"></div>
									</div>
								</div>
							</div>
						</div>
        			</div>
        		</div>
    		</div> <!-- main content -->
        </div> <!-- main field -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>
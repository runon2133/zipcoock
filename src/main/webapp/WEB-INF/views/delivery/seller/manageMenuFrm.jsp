<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/manageMenu.css">

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
        	<div class="main_content2">
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
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageMenuFrm.do">메뉴관리</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">메뉴관리</div>
        			<div class="content_div_area">
        				<div class="content_div_content">
        					<div class="content_div_info">
        						<div class="content_div_opt1 overflow-text">상호명</div>
        						<div class="content_div_opt2">매장 전화번호</div>
        						<div class="content_div_opt3">메뉴편집</div>
        					</div>
        					<c:if test="${not empty list }">
        						<table class="content_div_table">
	        						<c:forEach items="${list }" var="zs">
										<tr class="table_tr_height">
											<td><div class="content_div_opt1" style="color: #333">${zs.storeName }</div></td>
											<td><div class="content_div_opt2" style="color: #333">${zs.storePhone }</div></td>
											<td>
												<div class="content_div_opt3">
													<a href="/addMenuGroupFrm.do?storeNo=${zs.storeNo }" style="color: #9ac6e8;">편집</a>
													<input type="hidden" name="storeNo" value="${zs.storeNo }">
												</div>
											</td>
										</tr>
									</c:forEach>        						
        						</table>
        					</c:if>
        					
        					
        					
        				</div>
        			</div>
        		</div>
        	</div> <!-- main content -->
        </div> <!-- main field -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>
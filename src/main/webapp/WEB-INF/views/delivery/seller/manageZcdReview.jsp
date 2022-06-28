<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pageNavi {
		display:flex;
		margin: 0 auto;
		justify-content: center;
	}
	.pageNavi li {
		margin-top: 20px;
		width: 40px;
	}
	.pageNavi a {
		text-align: center;
	}

</style>

<link rel="stylesheet" href="/resources/css/deliverySeller/manageZcdOrder.css">

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
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">리뷰관리</div>
        			<div class="content_div_area">
        				<div class="content_div_content">
        					<div class="nav nav-tabs" style="border-bottom: 1px solid rgb(221, 221, 221); margin-bottom: 10px;">
        						<c:choose>
        							<c:when test="${reviewState eq '미답변' }">
        								<div class="nav-item"><a class="nav-link active" href="/manageZcdReview.do?reqPage=1&storeNo=${storeNo }&reviewState=미답변">미답변</a></div>
        								<div class="nav-item"><a class="nav-link" href="/manageZcdReview.do?reqPage=1&storeNo=${storeNo }&reviewState=답변완료">답변완료</a></div>
        							</c:when>
        							<c:when test="${reviewState eq '답변완료' }">
        								<div class="nav-item"><a class="nav-link" href="/manageZcdReview.do?reqPage=1&storeNo=${storeNo }&reviewState=미답변">미답변</a></div>
        								<div class="nav-item"><a class="nav-link active" href="/manageZcdReview.do?reqPage=1&storeNo=${storeNo }&reviewState=답변완료">답변완료</a></div>
        							</c:when>
        						</c:choose>
        					</div>
        				
        					<div class="content_div_info">
        						<div class="content_div_opt1 overflow-text">리뷰번호</div>
        						<div class="content_div_opt2">작성일</div>
        						<div class="content_div_opt3">작성회원번호</div>
        						<div class="content_div_opt4">관리</div>
        					</div>
        					
							<c:if test="${not empty zrp.list }">
	       						<table class="content_div_table">
									<c:forEach items="${zrp.list }" var="zr">
										<c:choose>
											<c:when test="${zr.reviewState eq '미답변' }">
												<tr class="table_tr_height">
													<td><div class="content_div_opt1">${zr.reviewNo }</div></td>
													<td><div class="content_div_opt2">${zr.reviewDate }</div></td>
													<td><div class="content_div_opt3">${zr.memberNo }</div></td>
													<td><div class="content_div_opt4"><a href="/reviewView.do?reviewNo=${zr.reviewNo }" style="color: #9ac6e8;">답변작성</a></div></td>
												</tr>
											</c:when>
											<c:when test="${zr.reviewState eq '답변완료' }">
												<tr class="table_tr_height">
													<td><div class="content_div_opt1">${zr.reviewNo }</div></td>
													<td><div class="content_div_opt2">${zr.reviewDate }</div></td>
													<td><div class="content_div_opt3">${zr.memberNo }</div></td>
													<td><div class="content_div_opt4"><a href="/commentView.do?reviewNo=${zr.reviewNo }" style="color: #9ac6e8;">답변수정</a></div></td>
												</tr>
											</c:when>
										</c:choose>
										
									</c:forEach>
								</table>
								<div class="pageNavi">${zrp.pageNavi }</div>
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
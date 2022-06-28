<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/enrollMenu.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<style>
	.table th {
		height: 40px;
		line-height: 40px;
	}
	.table_div {
		border: 1px solid rgb(221, 221, 221);
		padding: 24px 24px 20px;
}
	}
</style>
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
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageMenuFrm.do">메뉴관리</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">리뷰관리</div>
        			<div class="content_div_area">
        				<div class="content_div_div">
        					<div class="content_div_content">
        						<div class="content_div_div_content">
        							<div class="content_div_info">
        								<div class="content_div_title" style="font-weight: bold">리뷰 정보</div>
        								<div class="content_div_end"></div>
        								<br>
        								<div class="container2">
        									<span class="info_span">리뷰 정보</span>
        									<hr>
        									<div class="table_div">
	        									<table class="table">
													<tr>
														<th style="width: 20%;">리뷰번호</th>
														<th style="font-weight: 500; width: 30%;">${zr.reviewNo }</th>
														<th>작성상태</th>
														<th style="font-weight: 500;">${zr.reviewState }</th>
													</tr>
													<tr>
														<th style="width: 20%;">작성자</th>
														<th style="font-weight: 500; width: 30%;">${memberId }</th>
														<th>작성일</th>
														<th style="font-weight: 500;">${zr.reviewDate }</th>
														
													</tr>
													<tr>
														<th style="width:20%;">내용</th>
														<th style="font-weight: 500; width: 30%; height: 200px;" colspan="3">${zr.reviewContent }</th>
													</tr>
												</table>
        									</div>
        									<br><br>
        									
        									<span class="info_span">답변 내용</span>
        									<hr>
	        								<form action="/commentModify.do" method="post">
	        									<fieldset>
		        									<textarea class="form-control" name="commentContent" id="commentContent" rows="6" placeholder="내용을 입력하세요.">${rc.commentContent }</textarea>
	        									</fieldset>
	        									<br><br>
	        									
	        									<div class="row">
		        									<a class="cart_btn" style="font-weight: 400; margin-left:200px;" href="/manageZcdReview.do?reqPage=1&storeNo=${zr.storeNo }&reviewState=답변완료">취소</a>
		        									<div class="col-md-auto"> </div>
		        									<input type="submit" style="font-weight: 400; margin-right:200px;" class="buy_btn" id="submit" value="등록">
		        									<input type="hidden" name="reviewNo" value="${zr.reviewNo }">
		        									<input type="hidden" name="storeNo" value="${zr.storeNo }">								
	        									</div>
	        								</form>
        								
        								</div>
        							</div>
        							<br>
        							<div class="content_div_end"></div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div> <!-- main content -->
        </div> <!-- main field -->
    	<script>
    	
	    	$("#submit").on("click", function() {
				return checkComment();
			});
	    	
	    	function checkComment() {
	    		var commentContent = $("#commentContent").val();
	    		
	    		if (commentContent == "") {
    				alert("답변 내용을 확인하세요.");
    				return false;
    			} else {
    				return true;
    			}
	    	}
    	
    	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>
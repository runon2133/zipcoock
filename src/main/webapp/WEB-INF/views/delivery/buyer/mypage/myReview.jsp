<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content_div_question{
		padding: 20px;
	}
	span{
		margin-right:10px;
	}
	.no-answer {
		background-color: #c4ddf1;
		padding: 3px 5px;
		border-radius: 3px;
	}
	.complete-answer{
		background-color: #7e7266;
		padding: 3px 5px;
		border-radius: 3px;
		color: white !important; 
	}
	table{
		width: 100%;
		background-color: #eee;
		margin-top: 20px;
	}
	.a-seller-info{
		padding-top: 20px;
	}
	.acontent{
		padding-bottom: 20px;
	}
	.icon {
		width: 50px;
		text-align: center;
	}
</style>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel="stylesheet" href="/resources/css/deliveryBuyer/zcdCart.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<style>
	.side_nav_div:hover{
		background: rgba(51, 51, 51, 0.05);
		cursor: pointer;
		font-weight: 700;
	}
	.side_nav_div:hover span{
		font-weight: 700;
	}
	.side_nav_content a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class = "main_field">        	
        	<div class = "main_content2">
        		<div class = "side_nav">
	        		<div class = "my_info">
	        			<div class = "my_info_div">
	        				<span class = "my_info_span">환영합니다</span>
	        			</div>
	        			<div class = "user_div">
	        				<div class = "user_div_div">
	        					<div class= "user_div_content">
	        						<span class = "user_div_name">${sessionScope.m.memberName }<span class = "user_div_nim">님</span></span>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
        			<div class = "side_nav_content">
	        			<a href="zcdMypage.do" class = "side_nav_div"><span class = "side_nav_span">정보 확인/수정</span></a>
	        			<a href="zcdMyReview.do" class = "side_nav_div side_nav_div_selected"><span class = "side_nav_span side_nav_span_selected">리뷰내역</span></a>
        			</div>
        		</div>
	<div class = "content_div">
       	<div class = "content_title">리뷰 내역</div>
       	<div class = "content_div_area">
       		<div class = "content_div_content">
       			<div class = "content_div_question">
      			<c:forEach items="${zr }" var="zr" varStatus="status">
       				<div class="q-member-info">
       					<span id="text-emp">${sessionScope.m.memberName }</span><span>${zr.reviewDate }</span><button class="abutton">삭제</button>
       				</div>
       				<div class="q-order-info">
       					<span>${zr.storeName }</span>
       				</div>
       				<div class="qcontent">
       					${zr.reviewContent }
       				</div>
       			</c:forEach>
       			</div>

       		</div>	
       	</div>
    </div>

  </div> <!-- main field -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>
</html>
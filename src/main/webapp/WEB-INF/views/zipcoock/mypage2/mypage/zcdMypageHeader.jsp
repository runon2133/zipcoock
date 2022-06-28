<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
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
	        			<a href="mypageGoGo.do" class = "side_nav_div"><span class = "side_nav_span">정보 확인/수정</span></a>
	        			<a href="myPaymentInfoList.do" class = "side_nav_div"><span class = "side_nav_span">주문목록</span></a>
	        			<a href="myLikeList.do" class = "side_nav_div"><span class = "side_nav_span">즐겨찾기 목록</span></a>
	        			<a href="myReviewList.do" class = "side_nav_div"><span class = "side_nav_span">리뷰내역</span></a>
	        			<a href="myQnaList.do" class = "side_nav_div"><span class = "side_nav_span">Q&A 내역</span></a>
	        			<a href="myHQnaList.do" class = "side_nav_div"><span class = "side_nav_span">문의내역</span></a>
	        			<a href="myAddrList.do" class = "side_nav_div"><span class = "side_nav_span">배송지 관리</span></a>
        			</div>
        		</div>
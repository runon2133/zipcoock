<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.adminHead
{
	height: 50px;	
	
	display: flex;
	justify-content: space-around;
	border-bottom: 2px solid gray;
}

.adminHead>div>a
{
	font-family: ns_bold;
	font-size: 12px;
	font-weight: bold;
	
	line-height: 50px;
	color: gray;
}
</style>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="resources/js/admin/jquery-3.3.1.js"></script>

<div class = "adminHead">
    <div><a href = "/call_AdminPage.do">관리자 메인</a></div> 
    <div><a href = "/admin_qna.do">사이트 문의 현황</a></div>    
    <div><a href = "/admin_allMember.do">전체 회원 관리</a></div>     
    <div><a href = "/admin_homecookDeal.do">할인 상품 관리</a></div>  
    <div><a href = "/admin_returnPolicy.do">환불 정채 관리</a></div>
</div>
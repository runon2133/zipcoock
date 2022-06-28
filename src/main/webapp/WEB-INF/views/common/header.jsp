<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="/resources/css/common/default2.css">
<link rel="stylesheet" href="/resources/css/common/default.css">
<link rel="stylesheet" href="/resources/css/common/font.css">
        <header class="header">
         <div class="header-top">  
         	<div class = "header-top-content">
         		<ul>
         			<li><a href = "/call_MainPage.do">집쿠욱 메인</a></li>    
         			<li><a href = "/zcdMain.do">집쿠욱 배달 메인</a></li> 
         		</ul>
	         	<ul>
  					<c:choose>
						<c:when test="${sessionScope.m.memberLevel eq '관리자'}">
							<li><a href = "/call_AdminPage.do">관리자 메뉴로 이동</a></li> 
						</c:when>		
						<c:when test="${empty sessionScope.m}">
							<li></li>
						</c:when>			
								
						<c:otherwise> 
							<li><div class = "memberName">[${sessionScope.m.memberName}]님 환영 합니다.</div></li>
						 </c:otherwise>						
					</c:choose>
	         	</ul>          	
         	</div> 
         </div>
         <div class = "header-main">
         	<div class = "header-main-content">
         		<ul class = "header-first">
         			<li><a href = "/mainboard.do">전체상품</a></li>
         			<li><a href = "/mainboard.do?b=전체%20상품&c=식품">집쿠욱 식품</a></li>
         			<li><a href = "/mainboard.do?b=전체%20상품&c=생활용품">집쿠욱 생활</a></li>
         			<li><a href = "/mainboard.do?b=전체%20상품&c=뷰티">집쿠욱 뷰티</a></li>
         		</ul>
         		<div>
         			<div>
         				<img style ="height : 50px;" src="/resources/img/common/logo_00.png" class="sc-eWnToP fEDxD">			
         			</div>
         		</div>
         		
         		<c:choose>
					<c:when test = "${empty sessionScope.m }">
						<ul class = "header-last">
		         			<li><a href = "/loginFrm.do"><i class="fas fa-sign-in-alt"></i>  로그인</a></li>
		         			<li><a href = "/joinFrm.do"><i class="fas fa-user-plus"></i>  회원 가입</a></li>
		         		</ul>	
					</c:when>
					<c:otherwise>
						<ul class = "header-last">		
		         			<li><a href = "/mypageGoGo.do"><i class="fas fa-bookmark"></i>  마이 페이지</a></li>	
		         			<li><a href = "/zcdCart.do"><i class="fas fa-shopping-cart"></i> 장바구니</a></li>	         			
		         			<li><a href = "/logout.do"><i class="fas fa-sign-in-alt"></i>  로그아웃</a></li>   
		         		</ul>
					</c:otherwise>
				</c:choose>
         		
         	</div>
         </div>         
        </header>
        
        <!-- <li><a href = "/"><i class="fas fa-book-reader"></i>  고객 센터</a></li> -->

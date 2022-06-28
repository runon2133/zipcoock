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
	.content_div_info:first-child{
		margin-bottom: 0;
		border-bottom: 0;
	}
	.btn-area{
		text-align: center;
		display: flex;
	}
	.btn-area>button:first-child {
		margin-right: 10px;
	}
	#text-emp{
		color:#333; 
		font-weight:600;
	}
	
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
<div class="s-wrapper">
<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class = "main_field"> 
		<div class="main_content2" >
			<div class="side_nav" style="padding-top: 50px; margin-left: 30px;">
				<div class="my_info">
					<div class="my_info_div">
						<span class="my_info_span">환영합니다</span>
						
					</div>
					<div class="user_div">
					
						<div class="user_div_div">
						
							<div class="user_div_content">
								<span class="user_div_name">${sessionScope.m.memberId}<span class="user_div_nim">님</span></span>
							</div>
							
						</div>
						
					</div>
				</div>
				
				<div class="side_nav_content">
						<a href="/zipsellerMypage.do" class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected">정보 확인/수정</span></a> 
						<a href="/productList.do?reqPage=1" class="side_nav_div"><span	class="side_nav_span">상품 관리</span></a>
						<a href="/shippingInfomation.do "class="side_nav_div"><span class="side_nav_span">매출 정보</span></a> 
						<a href="/sellerQNA.do?reqPage=1" class="side_nav_div"><span class="side_nav_span">문의내역</span></a>
					</div>
			</div>


        <div class = "content_div">
        	<div class = "content_div_area">
        	
        	
        			
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
        			
        			<form action="/updateSellerMember.do" id="bsiFrm">
        			<div class = "content_title" style="margin-top:20px; margin-bottom: 15px;">정보 확인/수정</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">상호명</div>
	        			<div class="content_div_opt2"><input type="text" class="input" name="tradeName" value="${requestScope.bsi.tradeName }" readonly></div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">사업자 번호</div>
	        			<div class="content_div_opt2"><input type="text" class="input" name="businessNo" value="${requestScope.bsi.businessNo }" readonly></div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">아이디</div>
	        			<div class="content_div_opt2"><input type="text" class="input" name="memberId" value="${requestScope.bsi.memberId }" readonly ></div>
	        		</div>
	        		
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">대표 번호</div>
	        			<div class="content_div_opt2"><input type="text" class="input" name="contact" value="${requestScope.bsi.contact }"></div>	
	        		</div>
	        		
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">이메일</div>
	        			<div class="content_div_opt2"><input type="text" class="input" id="email1" name="email1" value="${requestScope.email1 }" style="width: 180px;">@
	        			       			   <select name="emailSelect" id="emailSelect" onchange="mailSelect(this);">
										<option value="${requestScope.email2 }">${requestScope.email2 }</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
								</select>	</div>
	        		</div>
	        		<input type="hidden" name="memberNo" value="${requestScope.bsi.memberNo }">
	        		</form>
	        		<form action="PwChange.do" id="PwChgFrm">
	        		<div class = "content_div_info" style="border-top:1px solid gray;">
	        			<div class="content_div_opt1">현재 비밀번호</div>
	        			<div class="content_div_opt2"><input type="password" class="input" name="oldPassword"></div>
	        		</div>
	        		<div class = "content_div_info" style="border-bottom: 1px solid gray; margin-bottom: 50px;">
	        			<div class="content_div_opt1">새로운 비밀번호</div>
	        			<div class="content_div_opt2"><input type="password" class="input" name="newPassword"></div>
	        			<input type="hidden"name="memberId" value="${requestScope.bsi.memberId }">
	        		<button onclick="document.getElementById('PwChgFrm').submit()" class="buy_btn" style="width: 200px; height: 30px; margin-left: 40px; border-radius: 10px; padding: 5px;">비밀번호 수정</button>
	        		</div>
	        		</form>
	        		<div class="btn-area" style="padding-top: 30px">
		        		<button type="button" class="buy_btn" onclick="document.getElementById('bsiFrm').submit();">변경</button>
		        		<button type="reset" class="cart_btn">취소</button>	        		
	        		</div>
        		</div>	
        	</div>
        </div>
        	</div>
        </div>
    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
<style>
	.input{
			height: 30px;
		}
	.content_div_info {
	margin: 0px;
	height : 80px;
	border : unset;
		}
</style>
      </body>
      </html>
      
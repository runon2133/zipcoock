<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<div class="s-wrapper">
	<%@include file="/WEB-INF/views/zipcoock/mypage2/mypage/zcdMypageHeader.jsp"%>
        <div class = "content_div"> 
        <!-- 
         //m
//<form action="/update.do">
//	<input type="text" name="m.memberNo" value="4"/>
//	<input type="text" name="m.memberId" value="rmemberId"/>
//	<input type="text" name="m.memberName" value="member_name"/>
//	<input type="text" name="m.memberPhone" value="memberPhone"/>
//	<button type="submit">제출</button>
//</form>
//pwM
//<form action="/update.do">
//	<input type="text" name="pwM.memberNo" value="4"/>
//	<input type="text" name="pwM.memberPw" value="pwM"/>
//	<button type="submit">제출</button>
//</form>
         
         -->
         <!-- 
          -->
	        		<form action="/update.do" method="post">
        			<div class = "content_title" style="margin-top:20px; margin-bottom: 15px;">정보 확인/수정</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">이름</div>
	        			<div class="content_div_opt2" id="text-emp">${sessionScope.m.memberName }</div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">아이디</div>
	        			<div class="content_div_opt2" id="text-emp">${sessionScope.m.memberId }</div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">전화번호</div>
	        			<div class="content_div_opt2"><input type="text" class="input" id="phone" name="m.memberPhone" value="${sessionScope.m.memberPhone }"></div>
	        		</div>
	        		<!-- 
	        		<input type="text" class="input" name="m.memberNo" value="${sessionScope.m.memberNo }">
	        		 -->
	        		<input type="hidden" class="input" name="m.memberNo" value="4">
	        		<input type="hidden" class="input" name="url" value="/mypageGoGo.do">
	        		<div class="btn-area">
		        		<button type="submit" id="mbtn" class="buy_btn">변경</button>
		        		<button type="reset" class="cart_btn">취소</button>	        		
	        		</div>
	        		</form>
	        		
	        		<div class = "content_title" style="margin-top:20px; margin-bottom: 15px;">비밀번호 수정</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">현재 비밀번호</div>
	        			<div class="content_div_opt2"><input type="text" id="currPw" name="pwM.memberPw" class="input"></div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">새로운 비밀번호</div>
	        			<div class="content_div_opt2"><input type="password" id="newPw" name="pwM.memberPw" class="input"></div>
	        		</div>
	        		<div class="btn-area">
		        		<button type="submit" id="phonebtn" class="buy_btn">변경</button>
		        		<button type="reset" class="cart_btn">취소</button>	        		
	        		</div>
	        		
	        		
 
        		</div>	
	    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/zipcoock/mypage2/mypage/zcdMypageFooter.jsp"%>
	</div>
</body>
<style>
	.input{
		height: 24px;
	}
</style>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
memberNo = 4;

var pw = /[a-zA-Z0-9]{8,12}/;

var phone = /^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/
$("#mbtn").click(function () {
    if(!phone.test($("#phone").val())){
    	$("#phone").val("");
    	alert("숫자로만 12자리로 입력해주세요. ex) 01012341234")
        return false;
    }
    return true;

})
	
	
	$("#phonebtn").click(function() {
	    if(!pw.test($("#newPw").val())){
	    	$("#newPw").val("");
	    	alert("8~12자 이내 영대소문,숫자. 특수문자 제외  ex) 12345678")
	        return;
	    }
		$.ajax({
			type:"POST",
			url:"/changePw.do",
			data:{newPassword:$("#newPw").val(), oldPassword:$("#currPw").val(), memberId:memberNo},
			success:function(data){
				alert(data);
				location.reload();
			}
		})
	});

 $("a[href='mypageGoGo.do']").toggleClass("side_nav_div_selected");
 $("a[href='mypageGoGo.do']").find("span").toggleClass("side_nav_span_selected");
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yy/MM/dd");
%>    
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
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>        	
	<%@include file="/WEB-INF/views/zipcoock/mypage2/mypage/zcdMypageHeader.jsp"%>
	<div class = "content_div">
       	<div class = "content_title">상품 Q 등록</div>
       	<div class = "content_div_area">
       		<div class = "content_div_content">
        	
        			
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
				<table class="table" style="margin-top:70px">				
					<tr>
					<th>제목</th>
					<td colspan="4">
						<input type="text" maxlength="60" id="qnaTitle" class="form-control" value=""> 
					</td>
					</tr>
					<tr>
					<th>이름</th>
					<td colspan="4">
						<input disabled type="text" class="form-control" style="width:200px; float:left" value="${sessionScope.m.memberName }">
					</td>
					</tr>
					<tr>
					<th>날짜</th>
					<td colspan="4">
						<input disabled type="text" class="form-control" style="width:200px" value="<%= sf.format(nowTime) %>">
					</td>
					</tr>					
					<tr>
						<th>내용</th>
						<td colspan="4">
							<textarea maxlength="650" id="qnaContent" class="form-control" style="height:300px"></textarea>
						</td>
					</tr>
					
					
					<tr>
						<th></th>
						<td colspan="4">
							<div class="btn-area">
								<button class="buy_btn" id="insertQna">작성하기</button>
								<button class="cart_btn" id="resetQna">취소</button>
							</div>
						</td>
					</tr>
				</table>

				<%--나중에 session으로 받아서 memberNo 추가로 보내주기 --%>
				<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" id="productRefNo" value="${productRefNo }">        		
        		</div>	
        	</div>
        </div>
        
        
        
        
        
        

        
        
        
        
        
        
        
        
        	</div>
    </div>
    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/zipcoock/mypage2/zcdMypageFooter.jsp"%>
</body>
<style>
	.input{
			height: 30px;
		}
		th{
		 vertical-align: middle;text-align: center;
		}
	.content_div_info {
	margin: 0px;
	height : 80px;
	border : unset;
		}
		#a{
		margin-top:30px;}
</style>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
	$("#insertQna").click(function() {
		if($("#qnaTitle").val() == "" || $("#qnaContent").val() == "" || $("#productRefNo").val() == ""){
			alert("제목 및 내용을 작성해주셔야 합니다.");
			return;
		}
		var url = "/myQnaList.do";
		var newForm = $('<form></form>'); 
		newForm.attr("name","newForm"); 
		newForm.attr("method","post"); 
		newForm.attr("action","/insert.do");
		newForm.append($('<input/>', {type: 'hidden', name: 'q.memberNo', value:memberNo})); 
		newForm.append($('<input/>', {type: 'hidden', name: 'q.qnaTitle', value:$("#qnaTitle").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'q.qnaContent', value:$("#qnaContent").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'q.productRefNo', value:$("#productRefNo").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
		newForm.appendTo('body');
		newForm.submit();
	});
	$("#resetQna").click(function() {
		$("#qnaTitle").val("");
		$("#qnaContent").val("");
	});
	
	resetQna
</script>
<script>
 $("a[href='myQnaList.do']").toggleClass("side_nav_div_selected");
 $("a[href='myQnaList.do']").find("span").toggleClass("side_nav_span_selected");

</script>


</html>
      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function insert() {
	var memberContact = $("#managerContact1").val() + $("#managerContact2").val() + $("#managerContact3").val();
	$("#managerContact").val(memberContact);
	
	return true;
}
</script>
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
       	<div class = "content_title">문의</div>
       	<div class = "content_div_area">
       		<div class = "content_div_content">
        	
        			
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
				<table class="table" style="margin-top:70px">
					<tr>
					<th>제목</th>
					<td colspan="4">
						<input <c:if test="${not empty qna.aQnaTitle}">disabled="disabled"</c:if> type="text" maxlength="60" id="qnaTitle" class="form-control" value="${qna.qnaTitle }"> 
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
						<input disabled type="text" class="form-control" style="width:200px" value="${qna.writeDate }">
					</td>
					</tr>					
					<tr>
						<th>내용</th>
						<td colspan="4">
							<textarea <c:if test="${not empty qna.aQnaTitle}">disabled="disabled"</c:if> maxlength="650" id="qnaContent" class="form-control" style="height:300px">${qna.qnaContent }</textarea>
						</td>
					</tr>
					
					
					<tr>
						<th></th>
						<td colspan="4">
							<div class="btn-area">
								<c:if test="${empty qna.aQnaTitle}">
								<button class="buy_btn" id="updateQna">Q 수정하기</button>
								</c:if>
								<button class="cart_btn" id="deleteQna" >Q 삭제하기</button>
							</div>
						</td>
					</tr>
				</table>

				<%--나중에 session으로 받아서 memberNo 추가로 보내주기 --%>
				<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" id="qnaNo" value=${qna.qnaNo }>
        	
        		
        		</div>	
        	</div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        	<c:if test="${not empty qna.aQnaTitle}">
               	<div class = "content_title" id="a">답변</div>
               	<div class = "content_div_area">
        
               		<div class = "content_div_content">
        	
        			
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
        			   <form action="/productInsert.do" method="post" enctype="multipart/form-data">
				<table class="table" style="margin-top:70px">
					<tr>
					<th>제목</th>
					<td colspan="4">
						<div>${qna.aQnaTitle }</div>
					</td>
					</tr>
					<tr>
					<th>이름</th>
					<td colspan="4">
						<div>관리자</div>
					</td>
					</tr>
					<tr>
					<th>날짜</th>
					<td colspan="4">
						<div>${qna.aWriteDate }</div>
					</td>
					</tr>					
					<tr>
						<th>내용</th>
						<td colspan="4">
							<div>${qna.aQnaContent }</div>
						</td>
					</tr>					
					<tr>
					</tr>
				</table>
			</form>
        	
        		
        		</div>	
        	</div>
        </div>
        
        
        
        
        </div>
                	</c:if>
        
        
        
        
        
        
        
        
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
	$("#updateQna").click(function() {
		if($("#qnaTitle").val() == "" || $("#qnaContent").val() == ""){
			alert("제목 및 내용을 작성해주셔야 합니다.");
			return;
		}
		var url = "/myHQnaList.do";
		var newForm = $('<form></form>'); 
		newForm.attr("name","newForm"); 
		newForm.attr("method","post"); 
		newForm.attr("action","/update.do");
		newForm.append($('<input/>', {type: 'hidden', name: 'hq.memberNo', value:memberNo})); 
		newForm.append($('<input/>', {type: 'hidden', name: 'hq.qnaNo', value:$("#qnaNo").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'hq.qnaTitle', value:$("#qnaTitle").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'hq.qnaContent', value:$("#qnaContent").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
		newForm.appendTo('body');
		newForm.submit();
	});
	
	$("#deleteQna").click(function() {
		var url = "/myHQnaList.do";
		var newForm = $('<form></form>'); 
		newForm.attr("name","newForm"); 
		newForm.attr("method","post"); 
		newForm.attr("action","/delete.do");
		newForm.append($('<input/>', {type: 'hidden', name: 'hq.memberNo', value:memberNo})); 
		newForm.append($('<input/>', {type: 'hidden', name: 'hq.qnaNo', value:$("#qnaNo").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
		newForm.appendTo('body');
		newForm.submit();
	});


</script>
<script>
 $("a[href='myHQnaList.do']").toggleClass("side_nav_div_selected");
 $("a[href='myHQnaList.do']").find("span").toggleClass("side_nav_span_selected");

</script>


</html>
      
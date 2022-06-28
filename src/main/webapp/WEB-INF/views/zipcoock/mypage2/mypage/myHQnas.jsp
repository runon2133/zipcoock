<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content_div_info img{
		width: 300px;
	}
	#text-emp{
		color:#333; 
		font-weight:600;
	}
</style>
</head>
<link rel="stylesheet" href="/resources/css/mypage/like.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body>

	<%@include file="/WEB-INF/views/zipcoock/mypage2/mypage/zcdMypageHeader.jsp"%>
		<div class = "content_div">
       	<div class = "content_title">문의 내역
					<button id="reset" class="btn btn-outline-secondary btn-block btn" type="button">
						<i class="fas fa-sync-alt"></i>
					</button>
       	</div>

		
		<div class="mt input-group">
			<input type="text" id="keyword" class="form-control" placeholder="검색"
			<c:if test="${tool.title ne ''}">value="${tool.title }"</c:if>
			<c:if test="${tool.content ne ''}">value="${tool.content }"</c:if>/>
			<select id="searchBy" class="form-control rounded-0">								
				<option value="title" <c:if test="${tool.title ne '' }"> selected = "selected" </c:if>>제목</option>
				<option value="content" <c:if test="${tool.content ne '' }"> selected = "selected" </c:if>>내용</option>
			</select>							
			<div class="input-group-append">
				<button id="link" class="btn btn-outline-secondary" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	



		<div class="mt row">		
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">답변여부</span>
					</div>
					<select class="selectBox form-control" id="isAnswered" name="">
					<c:if test="${tool.isAnswered eq 1 }">
						<option value="0" >모두</option>
						<option value="1" selected>답변완료</option>
					</c:if>
					<c:if test="${tool.isAnswered eq 0 }">
						<option value="0" selected>모두</option>
						<option value="1" >답변완료</option>
					</c:if>
					</select>
				</div>
			</div>		
			<!-- 
			 -->	
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">글기간:</span>
					</div>
					<select class="selectBox form-control" id="period" name="">
					<c:forEach items="${tool.periodList }" var="v">
						<option value="${v }" <c:if test="${v eq tool.period}">selected = "selected"</c:if>>${v }</option>
					</c:forEach>
					</select>
				</div>
			</div>			
			<div class="col-md-4">
				<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">보기:</span>
				</div>
					<select class="selectBox form-control" id="show" name="">
					<c:forEach items="${tool.showList }" var="v">
						<option value="${v }" <c:if test="${v eq tool.show}">selected = "selected"</c:if>>${v }</option>
					</c:forEach>
				</select>
				</div>
			</div>
		</div>

   				<div class="insert-btn-wrap">
		   			<button class="top_btn insert-btn">문의하기</button>
   				</div>

       	<div class = "content_div_area">
       		<div class = "content_div_content">
       		<c:forEach items="${list}" var="v" >
   			<div class ="content_div_info coupon-tbl" style="height: 110px;">
 				<div class = "content_div_opt1">
 				 <p class="qna-title">
 					${v.qnaTitle }
 				 </p>
 				</div>
   				<div class = "content_div_opt2" id="text-emp">
	   				<p>
   					<c:if test="${v.isAnswered eq 0}">
   					답변중
   					</c:if>
   					<c:if test="${v.isAnswered eq 1}">
   					답변완료
   					</c:if>
 					</p>					
   					<span class="qna-content">
	   					${v.qnaContent }
   					<!-- 
   					 -->
   					 </span>
   					 <p><span class="qna-writedate">${v.writeDate }</span></p>
   				</div>
   				<div class = "content_div_opt3" id="text-emp">
		   			<button class="buy_btn update-btn" id =${v.qnaNo }>상세보기</button>
   					<button class="cart_btn delete-btn" id =${v.qnaNo }>삭제하기</button>
   				</div>
       		</div>
       		 </c:forEach>
       		        		 
       		 
	<div class="row">
		<div class="col-md-6">
			<ul class="pagination m-0">${tool.pageNavi }</ul>
		</div>
		<div class="col-md-6"><p class="text-right mb-0 mt-1">총 ${tool.totalPost }개 Q 중 ${tool.filteredPost}개 Q가 검색되었습니다. ${tool.p } of ${tool.totalP }</p>
		</div>
	</div>

   		 
       		 
       		 
       		</div>	
       	</div>
    </div>
    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/zipcoock/mypage2/mypage/zcdMypageFooter.jsp"%>
	<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo }">
	
</body>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
var basic,show,productName,tradeName,title,content,period,order;

function initVar() {
    keyword = "&"+$("#searchBy").val()+"="+$("#keyword").val();   	
	basic = "/myHQnaList.do?";
    order = "&order="+$("#order").val();
   	/*
    period = "";
   	*/
    period = "&period="+$("#period").val();
    show = "&show="+$("#show").val();
    isAnswered = "&isAnswered="+$("#isAnswered").val();
    url = basic+order+period+show+keyword+isAnswered;
}

function clickURL() {
    initVar();
    
    $("<a href='"+url+"'></a>")[0].click();
};

$(function() {
    $(".selectBox").change(clickURL)
	$("#link").on("click", function(event) {
		initVar();
	url = basic+keyword;
    $("<a href='"+url+"'></a>")[0].click();
	 
  });
    
    $("#reset").on("click",function(){
    	initVar();
	    url = basic;
	    $("<a href='"+url+"'></a>")[0].click();
    	
    })
    

})




$(".delete-btn").click(function() {
	var id = $(this).attr("id")
	initVar();
    p = "&p="+${tool.p};
    url += p;
    
	var newForm = $('<form></form>'); 
	newForm.attr("name","newForm"); 
	newForm.attr("method","post"); 
	newForm.attr("action","/delete.do");
	newForm.append($('<input/>', {type: 'hidden', name: 'q.memberNo', value:memberNo})); 
	newForm.append($('<input/>', {type: 'hidden', name: 'q.qnaNo', value:id })); 
	newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
	newForm.appendTo('body');
	newForm.submit();
});

$(".update-btn").click(function() {
	var id = $(this).attr("id")
    $("<a href='/hqnaPage.do?qnaNo="+id+"'></a>")[0].click();
});
$(".insert-btn").on("click",function() {
    $("<a href='/insertHQnaPage.do'></a>")[0].click();
});



</script>
<style>
.form-control{
	width:50px !important;
}

/*
.help-content{
	display:inline-block;
	width:430px;
	white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
}
.help-title{
}
*/
.qna-title{
	overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}
.qna-writedate{
	clear:left;
	float:right;
	margin-right:10px;
}

.qna-content{
	overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
	float:left;
}
.content_div_opt1, .content_div_opt2{
	width:280px;
	margin-right:10px;

}
.insert-btn{
	float:right;
	width:100%;
	height:90%;
	font-size:20px;
	font-weight:600;
}
.insert-btn-wrap{
/*
*/
	width:100%;
	height:70px;
}
</style>
<script>

$("a[href='myHQnaList.do']").toggleClass("side_nav_div_selected");
$("a[href='myHQnaList.do']").find("span").toggleClass("side_nav_span_selected");

</script>

</html>
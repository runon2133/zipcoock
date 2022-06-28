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
       	<div class = "content_title">주문 내역
					<button id="reset" class="btn btn-outline-secondary btn-block btn" type="button">
						<i class="fas fa-sync-alt"></i>
					</button>
       	</div>
	



		<div class="mt row">		
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">배송여부</span>
					</div>
					<select class="selectBox form-control" id="isDelivered" name="">
					<c:if test="${tool.isDelivered eq '' }">
						<option value="" selected>모두</option>
						<option value="N" >배송전</option>
						<option value="Y" >배송완료</option>
					</c:if>
					<c:if test="${tool.isDelivered eq 'N' }">
						<option value="" >모두</option>
						<option value="N" selected>배송전</option>
						<option value="Y" >배송완료</option>
					</c:if>
					<c:if test="${tool.isDelivered eq 'Y' }">
						<option value="" >모두</option>
						<option value="N" >배송전</option>
						<option value="Y" selected>배송완료</option>
					</c:if>
					</select>
				</div>
			</div>		
			<!-- 
			 -->	
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">주문기간:</span>
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

       	<div class = "content_div_area">
       		<div class = "content_div_content">
       		<c:forEach items="${list}" var="v" >
   			<div class ="content_div_info coupon-tbl" style="height: 110px;">
 				<div class = "content_div_opt1">
 				 <p class="qna-title">
 					${v.paymentInfoCode }
 				 </p>
 				</div>
   				<div class = "content_div_opt2" id="text-emp">
	   				<p>
   					<c:if test="${v.isDelivered eq 'N'}">
   					배송전
   					</c:if>
   					<c:if test="${v.isDelivered eq 'Y'}">
   					배송완료
   					</c:if>
 					</p>					
   					<span class="qna-content">
	   					${v.receiverName }님이 총 ${v.total }개 상품 구매
   					 </span>
   					 <p><span class="qna-writedate">${v.orderDate }</span></p>
   				</div>
   				<div class = "content_div_opt3" id="text-emp">
		   			<button class="buy_btn move-btn" id =${v.paymentInfoCode }>상세보기</button>
   				</div>
       		</div>
       		 </c:forEach>
       		        		 
       		 
	<div class="row">
		<div class="col-md-6">
			<ul class="pagination m-0">${tool.pageNavi }</ul>
		</div>
		<div class="col-md-6"><p class="text-right mb-0 mt-1">총 ${tool.totalPost }개 영수증 중 ${tool.filteredPost}개 영수증이 검색되었습니다. ${tool.p } of ${tool.totalP }</p>
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
 $("a[href='myPaymentInfoList.do']").toggleClass("side_nav_div_selected");
 $("a[href='myPaymentInfoList.do']").find("span").toggleClass("side_nav_span_selected");

</script>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
var basic,show,productName,tradeName,title,content,period,order;

function initVar() {
    keyword = "&"+$("#searchBy").val()+"="+$("#keyword").val();   	
	basic = "/myPaymentInfoList.do?";
    order = "&order="+$("#order").val();
    period = "&period="+$("#period").val();
    show = "&show="+$("#show").val();
    isAnswered = "&isDelivered="+$("#isDelivered").val();
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


$(".move-btn").click(function() {
	var id = $(this).attr("id")
    $("<a href='/myPaymentInfoPage.do?paymentInfoCode="+id+"'></a>")[0].click();
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
</html>
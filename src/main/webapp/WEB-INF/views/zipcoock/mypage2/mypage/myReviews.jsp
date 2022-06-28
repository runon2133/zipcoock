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
       	<div class = "content_title">리뷰내역
					<button id="reset" class="btn btn-outline-secondary btn-block btn" type="button">
						<i class="fas fa-sync-alt"></i>
					</button>
       	</div>

		
		<div class="mt input-group">
			<input type="text" id="keyword" class="form-control" placeholder="검색"
			<c:if test="${tool.productName ne ''}">value="${tool.productName }"</c:if>
			<c:if test="${tool.title ne ''}">value="${tool.title }"</c:if>
			<c:if test="${tool.content ne ''}">value="${tool.content }"</c:if>
			<c:if test="${tool.tradeName ne ''}">value="${tool.tradeName }"</c:if>/>
			<select id="searchBy" class="form-control rounded-0">								
				<option value="productName" <c:if test="${tool.productName ne '' }"> selected = "selected" </c:if>>상품명</option>
				<option value="tradeName" <c:if test="${tool.tradeName ne '' }"> selected = "selected" </c:if>>상호</option>
				<option value="tradeName" <c:if test="${tool.title ne '' }"> selected = "selected" </c:if>>제목</option>
				<option value="tradeName" <c:if test="${tool.content ne '' }"> selected = "selected" </c:if>>내용</option>
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
						<span class="input-group-text">정렬:</span>
					</div>
					<select class="selectBox form-control" id="order" name="">
					<c:forEach items="${tool.orderList }" var="v">
						<option value="${v }" <c:if test="${v eq tool.order}">selected = "selected"</c:if>>${v }</option>
					</c:forEach>
					</select>
				</div>
			</div>			
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


       	<div class = "content_div_area">
       		<div class = "content_div_content">
       		<c:forEach items="${list}" var="v" >
   			<div class ="content_div_info coupon-tbl" style="height: 110px;">
   			<!-- 
 				<div class = "content_div_opt1"><div style="background:url(${v.filepath});"></div></div>
   			 -->
 				<div class = "content_div_opt1"><div class="card-img-top" style="background:url(/resources/upload/product/${v.filepath});"></div></div>
   				<div class = "content_div_opt2" id="text-emp">
   				
	   				<a href="/mainboardView.do?memberNo=${sessionScope.m.memberNo }&productNo=${v.productNo }">   				   					   				
   					<span class="goods_detail">${v.tradeName }</span>
   					${v.productName }
   					</a>
   					<c:if test="${v.price eq v.discountedPrice}">
   					<p>${v.price }원</p>
   					</c:if>
   					<c:if test="${v.price ne v.discountedPrice}">
   					<p class="discount_price"><span class="goods_detail lowest-price">${v.discountRate }% off</span>${v.discountedPrice }원<span class="original_price">${v.price }원</span></p>   					
   					</c:if>
   				</div>
   				<div class = "content_div_opt3" id="text-emp">
		   			<button class="buy_btn update-btn" id =${v.reviewNo }>수정하기</button>
   					<button class="cart_btn delete-btn" id =${v.reviewNo }>삭제하기</button>
   				</div>
       		</div>
       		 </c:forEach>
       		 
       		 
       		 
	<div class="row">
		<div class="col-md-6">
			<ul class="pagination m-0">${tool.pageNavi }</ul>
		</div>
		<div class="col-md-6"><p class="text-right mb-0 mt-1">총 ${tool.totalPost }개 리뷰중 ${tool.filteredPost}개 리뷰가 검색되었습니다. ${tool.p } of ${tool.totalP }</p>
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
$("a[href='myReviewList.do']").toggleClass("side_nav_div_selected");
$("a[href='myReviewList.do']").find("span").toggleClass("side_nav_span_selected");
</script>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
var basic,show,productName,tradeName,title,content,period,order;

function initVar() {
    keyword = "&"+$("#searchBy").val()+"="+$("#keyword").val();   	
	basic = "/myReviewList.do?";
    order = "&order="+$("#order").val();
    period = "&period="+$("#period").val();
    show = "&show="+$("#show").val();
    url = basic+order+period+show+keyword;    
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
	newForm.append($('<input/>', {type: 'hidden', name: 'r.memberNo', value:memberNo})); 
	newForm.append($('<input/>', {type: 'hidden', name: 'r.reviewNo', value:id })); 
	newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
	newForm.appendTo('body');
	newForm.submit();
});

$(".update-btn").click(function() {
	var id = $(this).attr("id")
    $("<a href='/updateMyReview.do?reviewNo="+id+"'></a>")[0].click();
});




</script>
</html>
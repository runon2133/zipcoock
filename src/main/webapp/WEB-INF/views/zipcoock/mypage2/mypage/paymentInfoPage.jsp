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
		height:150px;
	}
	.card-img-top{
		width: 300px;
		height:100px;
	}
	#text-emp{
		color:#333; 
		font-weight:600;
	}
</style>

<style>
	.btn-area{
		text-align: center;
		display: flex;
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
       	<div class = "content_title">영수증</div>
  
         	<div class = "content_div_area">
       		<c:forEach items="${products}" var="v" >
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
   					<p>(개당) ${v.price }원 <br>
   					(배송비) ${v.shippingFee }원</p>
   				</div>
   				<div class = "content_div_opt3" id="text-emp">
   					${v.price } x ${v.quantity } (구매 갯수)<br/>
   					${v.totalPrice }+${v.shippingFee }<br/>
   					${v.totalPrice2 }원
   				</div>
   				<div class="content_div_opt3" id="text-emp">
   				<c:if test="${v.isReviewed >= 1}">
   					<button class="buy_btn" onclick="updateMyReview(${v.orderedProductNo},${v.paymentInfoCode },${v.productNo })">리뷰수정</button>
   				</c:if>
   				<c:if test="${v.isReviewed == 0}">
   					<button class="buy_btn" onclick="move(${v.orderedProductNo},${v.paymentInfoCode },${v.productNo })">리뷰쓰기</button>
   				</c:if>
   				</div>
       		</div>
       		 </c:forEach>

		<div class = "content_div_content">        			
       			<div class = "content_title" style="margin-top:20px; margin-bottom: 15px;">결제정보</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">주문번호</div>
	        			<div class="content_div_opt2" id="text-emp">${pi.paymentInfoCode }</div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">주문날짜</div>
	        			<div class="content_div_opt2" id="text-emp">${pi.orderDate}</div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">배송여부</div>
	        			<div class="content_div_opt2" id="text-emp">${pi.isDelivered }</div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">결제방식</div>
	        			<div class="content_div_opt2" id="text-emp">${pi.paymentMethod }</div>
	        		</div>
	        		<div class = "content_div_info">
	        			<div class="content_div_opt1">결제 금액</div>
	        			<div class="content_div_opt2" id="text-emp">${pi.total }</div>
	        		</div>
        		
      		<div class = "content_title" style="margin-top:20px; margin-bottom: 15px;">구매자 정보</div>
       		<div class = "content_div_info">
       			<div class="content_div_opt1">받는이</div>
       			<div class="content_div_opt2" id="text-emp">${pi.rname }</div>
       		</div>
       		<div class = "content_div_info">
       			<div class="content_div_opt1">주소</div>
       			<div class="content_div_opt2" id="text-emp">${pi.addr }</div>
       		</div>
       		<div class = "content_div_info">
       			<div class="content_div_opt1">전화번호</div>
       			<div class="content_div_opt2" id="text-emp">${pi.rphone}</div>
       		</div>
        </div>
    </div>
    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/zipcoock/mypage2/zcdMypageFooter.jsp"%>
</body>
<script>
 $("a[href='myPaymentInfoList.do']").toggleClass("side_nav_div_selected");
 $("a[href='myPaymentInfoList.do']").find("span").toggleClass("side_nav_span_selected");

</script>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
function move(orderedProductNo,paymentInfoCode,productNo) {
    $("<a href='/insertReview.do?orderedProductNo="+orderedProductNo+"&paymentInfoCode="+paymentInfoCode+"&productNo="+productNo+"'></a>")[0].click();
};
function updateMyReview(orderedProductNo,paymentInfoCode,productNo) {
    $("<a href='/updateMyReview1.do?orderedProductNo="+orderedProductNo+"&paymentInfoCode="+paymentInfoCode+"&productNo="+productNo+"'></a>")[0].click();
};


</script>
<style>
.content_div_content{
	height:100px !important;
	margin:0px;
}
</style>
</html>
      
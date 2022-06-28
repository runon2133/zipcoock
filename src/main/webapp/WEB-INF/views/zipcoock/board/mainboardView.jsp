<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<!-- partial -->
<script src='https://code.jquery.com/jquery-3.4.1.slim.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js'></script>

<link rel="stylesheet" href="/resources/css/mypage/like.css">
<link rel="stylesheet" href="/resources/css/mainboard/staticStar.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
<div class="s-wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>	



<div class="container">       
<div class="container">
	<c:if test="${empty pp }">
		<h2 style="margin:auto auto;display:inline-block;">해당 상품은 현재 찾을 수 없는 상품 입니다. 관리자에게 문의해주세요.</h2>
	</c:if>
	<c:if test="${not empty pp }">
	<div class="row mb-4">
		<!-- 
		<div class="col-md-2">
      <a href="#"><img src="" class="img-thumbnail p-0 border-0" /></a>
    	</div>
		<div class="col-md-6">
			<div class="input-group input-group-lg">
				<input type="text" id="" name="" class="form-control" placeholder="상품을 검색해보세요" />
				<select id="searchBy" class="form-control form-control-lg rounded-0">
				<c:forEach items="${tool.byList }" var="v">
					<option value="${v }" <c:if test="${v eq tool.by}"> selected = "selected" </c:if>>${v }</option>
				</c:forEach>
				</select>
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"><i class="fas fa-search"></i></button>
				</div>
			</div>
		</div>
		<div class="col-md-1">
			<button class="btn btn-outline-secondary btn-block btn-lg" type="button">
				<i class="fas fa-sync-alt"></i>
			</button>
		</div>
		 -->
	</div>
	
		<div class="row mb-5">
		<div class="col-md-12">
		<!--
		
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
					<c:forEach items="${tool.categoryMap }" var="v">
						<li class="nav-item <c:if test="${v.key eq tool.c}">active</c:if>">
							<a class="nav-link" href="/mainboard.do?b=${tool.b }&c=${v.key }">${v.key } (${v.value })</a>
						</li>					
					</c:forEach>
					</ul>
				</div>
			</nav>
		 -->
		</div>
	</div>
	
	<div class="row mb-5">
		<div class="col-md-8">
			<div class="row">
				


				<div class="col-md-12 mb-4">
					<img alt="" class="img-thumbnail p-0 border-0" src="/resources/upload/product/${pp.filepath }" />
<!-- 
					<img alt="" class="img-thumbnail p-0 border-0" src="${pp.filepath }" />
 -->
				</div>
				<c:forEach items="${pi }" var="v">
				<div class="col-md-3 mb-4">
					<img alt="" class="img-thumbnail p-0 border-0" src="/resources/upload/product/${v.filepath }" />
				<!-- 
					<img alt="" class="img-thumbnail p-0 border-0" src="${v.filepath }" />
				 -->
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-body">

					<ul class="list-group list-group-flush mb-4">
						<li class="list-group-item pl-0 pr-0 pt-2 pb-2">
							<h1 class="title">${pp.productName }</h1>
							<div class="star-rating js-star-rating">
								  <input class="star-rating__input" type="radio" name="rating" value="1"><i class="star-rating__star"></i>
								  <input class="star-rating__input" type="radio" name="rating" value="2"><i class="star-rating__star"></i>
								  <input class="star-rating__input" type="radio" name="rating" value="3"><i class="star-rating__star"></i>
								  <input class="star-rating__input" type="radio" name="rating" value="4"><i class="star-rating__star"></i>
								  <input class="star-rating__input" type="radio" name="rating" value="5"><i class="star-rating__star"></i>
								  <div class="current-rating current-rating--${pp.starClass } js-current-rating"><i class="star-rating__star">AAA</i></div>
							</div>
							<span class="review-count goods_detail star-avg">(${pp.starAvg })</span>						
						</li>
						<!-- 
						<li class="list-group-item pl-0 pr-0 pt-2 pb-2">Brand: ${pp.tradeName }<a href="#"></a></li>
						 -->
						<li class="list-group-item pl-0 pr-0 pt-2 pb-2">Brand: ${pp.tradeName }</li>
						<li class="list-group-item pl-0 pr-0 pt-2 pb-2">제조국 : ${pp.origin }</li>
						<li class="list-group-item pl-0 pr-0 pt-2 pb-2">제조일자 : ${pp.manufactureDate }</li>
						<li class="list-group-item pl-0 pr-0 pt-2 pb-2">재고 : ${pp.stock }</li>
						<!--
							<li class="list-group-item pl-0 pr-0 pt-2 pb-2">Price in reward points: 400</li>
						-->
						<li class="list-group-item pl-0 pr-0">
						
						<c:if test="${not empty pp.discountedPrice }">
							<p class="m-0 h2"><span class="mainboard-view-price">${pp.discountedPrice }원</span><small><s class="original_price">${pp.price }원</s></small></p>
						</c:if>
						
						<c:if test="${empty pp.discountedPrice }">
						<p class="m-0 h2"><span class="mainboard-view-price">${pp.price }원</span></p>
						</c:if>
						
						</li>
						<!--
							<li class="list-group-item pl-0 pr-0 pt-2 pb-2">Market Price: $1.134,82</li>
						-->
					</ul>
					<div class="input-group input-group-lg mb-4">
						<input type="number" class="form-control text-center" oninput="setQuantity()"placeholder="Quantity" id="quantity" name="" value="1" min="1" max="${pp.limit}" />
						<div class="input-group-append">
							<span class="input-group-text">수량</span>
						</div>
					</div>
					<div>
						<div class="likeButton-div-wrap">
							<span class="likeButton">♥</span>
						</div>
						<button id="addToCart" class="top_btn float-right">장바구니 담기</button>	
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12 mt-4">
			<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link lead active" role="tab" data-toggle="tab" href="#tabDescription">상품 상세</a>
				</li>
				<li class="nav-item">
					<a class="nav-link lead" role="tab" data-toggle="tab" href="#tabReview">상품후기 (${pp.reviewCount })</a>
				</li>
				<li class="nav-item">
					<a class="nav-link lead" role="tab" data-toggle="tab" href="#tabQnA">Q&A (${pp.qnaCount })</a>
				</li>
				<li class="nav-item">
					<a class="nav-link lead" role="tab" data-toggle="tab" href="#tapShippingReturn">배송/환불 안내</a>
				</li>
				<li class="nav-item">
					<a class="nav-link lead" role="tab" data-toggle="tab" href="#tapSellerInfo">판매자 정보</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane pt-4 active" role="tabpanel" id="tabDescription">
						<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="2"><strong>판매자 상세 정보</strong></td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty pp.howToUse }">
							<tr>
								<td>사용법</td>
								<td>${pp.howToUse}</td>
							</tr>
							</c:if>
							<c:if test="${not empty pp.precautions }">
							<tr>
								<td>주의사항</td>
								<td>${pp.precautions }</td>
							</tr>
							</c:if>
							<c:if test="${not empty pp.expirationDate }">
							<tr>
								<td>유통기한</td>
								<td>${pp.expirationDate}</td>
							</tr>
							</c:if>
							<c:if test="${not empty pp.capacity }">
							<tr>
								<td>용량</td>
								<td>${pp.capacity}</td>
							</tr>
							</c:if>
							<tr>
								<td>1인당 구매제한</td>
								<td>${pp.limit}</td>
							</tr>
						</tbody>
					</table>
					<p>${pp.productDetail }</p>
				</div>
				<div class="tab-pane pt-4" role="tabpanel" id="tapShippingReturn">
					<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="2"><strong>배송정보</strong></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>배송방법</td>
								<td>${pp.shippingMethod }</td>
							</tr>
							<tr>
								<td>배송사</td>
								<td>${pp.shippingCompany }</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>${pp.shippingFee }원</td>
							</tr>
							<tr>
								<td>배송기간</td>
								<td>${pp.shippingPeriod }일</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered">					
						<thead>
							<tr>
								<td colspan="2"><strong>환불 정책</strong></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>환불 비용</td>
								<td>${pp.returnShipping}원</td>
							</tr>
							<tr>
								<td>환불 신청 기간</td>
								<td>${pp.returnLength}일내</td>
							</tr>
							<tr>
								<td>환불 제한 기준</td>
								<td>${pp.policyContent}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="tab-pane pt-4" role="tabpanel" id="tapSellerInfo">
					<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="2"><strong>판매자 상세 정보</strong></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>상호</td>
								<td>${pp.tradeName}</td>
							</tr>
							<tr>
								<td>대표자</td>
								<td>${pp.representative}</td>
							</tr>
							<tr>
								<td>사업장 소매지</td>
								<td>${pp.businessLoc}</td>
							</tr>
							<tr>
								<td>판매처 전화번호</td>
								<td>${pp.contact}</td>
							</tr>
							<tr>
								<td>판매처 이메일</td>
								<td>${pp.email}</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered">						
						<thead>
							<tr>
								<td colspan="2"><strong>해당 상품 관련 연락처</strong></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>a/s 책임자 번호</td>
								<td>${pp.managerContact}</td>
							</tr>
							<tr>
								<td>소비자 상담 관련 번호</td>
								<td>${pp.ccContact}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane pt-4" role="tabpanel" id="tabQnA">
				<c:if test="${not empty sessionScope.m }">
					<button class="top_btn insert-qna-btn">Q 작성하러 가기</button>
				</c:if>					
					<div class="card" id="qna-wrap">
						<div class="card-header">상품관련 Q&A를 볼 수 있습니다. </div>
						
						
						
						
						
						
						
					</div>
					<button id="qna-btn" class="top_btn">더 보기</button>
				</div>
				<div class="tab-pane pt-4" role="tabpanel" id="tabReview">
					
					<div class="card" id="review-wrap">
						<div class="card-header">상품관련 후기를 볼 수 있습니다. </div>
						
						
						
					</div>
					<button id="review-btn" class="top_btn">더 보기</button>
				</div>



			</div>
		</div>
	</div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row mb-5">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-3">
							<i class="float-left mr-3 fa-3x fas fa-shipping-fast"></i>
							<p class="h5">안전/스피드 배송 <br/><small class="text-muted">안전하고 빠른 배송</small></p>
						</div>
						<div class="col-md-3">
							<i class="float-left mr-3 fa-3x fas fa-thumbs-up"></i>
							<p class="h5">소비자 보호<br/><small class="text-muted">품질검증부터 배송까지 확인합니다.</small></p>
						</div>
						<div class="col-md-3">
							<i class="float-left mr-3 fa-3x fas fa-umbrella"></i>
							<p class="h5">안전 결제<br/><small class="text-muted">소비자의 개인정보를 안전하게 보호합니다.</small></p>
						</div>
						<div class="col-md-3">
							<i class="float-left mr-3 fa-3x fas fa-life-ring"></i>
							<p class="h5">24/7 서비스<br/><small class="text-muted">24/7 쉼없이 운영됩니다.</small></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-md-12">
	
		</div>
	</div>
	</c:if>
</div>
<div class="container">
	<div class="row mb-5">
		<div class="col-md-12 mb-5">
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-4">
		</div>
		<div class="col-md-12 mt-5 mb-4">
		</div>
		<div class="col-md-12">
		</div>
		<div class="col-md-12">
		</div>
	</div>
</div>







</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo }">
</body>
<style>
.star-rating {
	margin-left:0px;
    box-sizing: border-box;
}
</style>
<script>
var rStar=0;
var rEnd=0;
var qStart=0;
var qEnd = 0;
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
var rTotal = "${pp.reviewCount}";
var qTotal = "${pp.qnaCount}";
var productNo = "${pp.productNo}";
var stock = "${pp.stock}";
rTotal = rTotal=""? 0:Number(rTotal);
qTotal = qTotal =""? 0:Number(qTotal);
productNo = productNo=""? 0:Number(productNo);
stock = stock=""? 0:Number(stock);








$(document).ready(function () {
	var like = ${pp.isLiked};
 	Number(like)==1	&& $(".likeButton").toggleClass("liked");
 	
	qEnd>=qTotal && $("#qna-btn").hide();
	rEnd>=rTotal && $("#review-btn").hide();	
	
	qEnd<qTotal && $("#qna-btn").click();
	rEnd<rTotal && $("#review-btn").click();	
	
	
	
});



function setQuantity() {
    var quantity = $("#quantity").val();
    quantity = quantity>stock?stock:quantity;
    $("#quantity").val(quantity);
}


$("#addToCart").click(function(){
	if(memberNo==0){
		alert("로그인해주세요.");
		return;
	};

	var quantity = $("#quantity").val();

	$.ajax({
		type:"GET",
		url:"/addToCart.do",		
		data:{quantity:quantity,productNo:productNo},
		contentType : "application/json;charset=UTF-8",
		success:function(data){			
			alert(data);
			console.log(data);
		}
	})
	
})



$(".likeButton").click(function() {
	if(memberNo==0){
		alert("로그인해주세요.")
		return;
	};
	var isLiked = $(".likeButton").hasClass("liked");
	var url = isLiked? "/deleteLike.do":"/insertLike.do";
	$.ajax({
		type:"GET",
		url:url,		
		data:{memberNo:memberNo,productNo:productNo},
		contentType : "application/json;charset=UTF-8",
		success:function(){			
			$(".likeButton").toggleClass("liked");
			}
		})

});



$("#qna-btn").on("click",function(){
	qStart = qEnd+1;
	qEnd += 3;
	$.ajax({
		type:"GET",
		url:"/getQna.do",
		data:{start:qStart, end:qEnd, productNo:productNo},
		contentType : "application/json;charset=UTF-8",
		success:function(data){
			data.forEach(q => {
				var card = "<div class='card-body'><table class='table table-bordered'><tbody>";
				if(memberNo == Number(q.memberNo)){
					card += "<button class='top_btn index-btn' onClick='qnaUpdate("+q.qnaNo+")'>수정하러 가기</button>";					
				}
				card +="<tr><td colspan='2'><strong>("+q.memberName+") "+q.qnaTitle+"</strong></td></tr>";
				card +="<tr><td colspan='2'><p>"+q.qnaContent+"</p><p class='m-0'>"+q.writeDate+"</p>";
				
				card += "</td></tr>";
				

				if(q.hasOwnProperty("aTitle")){
					card +="<tr><td colspan='2'><strong>"+q.aTitle+"</strong></td></tr>";
					card +="<tr><td colspan='2'><p>"+q.aContent+"</p><p class='m-0'>"+q.aWriteDate+"</p></td></tr>";					
				}
				
				card += "</tbody></table></div>";
				
				qEnd>=qTotal && $("#qna-btn").hide();
				$("#qna-wrap").append(card);
				
			})
		}
	})
	
})
$("#review-btn").on("click",function(){
	rStart = rEnd+1;
	rEnd += 3;
	$.ajax({
		type:"GET",
		url:"/getReview.do",
		data:{start:rStart, end:rEnd, productNo:productNo},
		contentType : "application/json;charset=UTF-8",
		success:function(data){
				
			data.forEach(obj=> {
				var r = obj.r;
				var imgs = obj.img;
				
				var card = "<div class='card-body'><table class='table table-bordered'><tbody>";
				if(memberNo == Number(r.memberNo)){
					card += "<button class='top_btn index-btn' onClick='reviewUpdate("+r.reviewNo+")'>수정하러 가기</button>";					
				}
				card += "<tr><td colspan='2'><strong>"+r.memberName+"</strong>";
				card += "</td></tr>";
				card += "<tr><td colspan='2'><p>"+r.reviewContent+"</p>"
				card += "<div class='row'>";											

				imgs.forEach(img=> {
					
//					card += "<div class='col-md-3 mb-4'><img alt='' class='img-thumbnail p-0 border-0' src='"+img.filepath+"' /></div>";			
					card += "<div class='col-md-3 mb-4'><img alt='' class='img-thumbnail p-0 border-0' src='https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=49ed3252c0b2ffb49cf8b508892e452d' /></div>";			
				})
	 				
				card += "</div>";
				card += "<p class='m-0'>"+r.writeDate+"</p>";
				card += "</td></tr><tr><td colspan='2'><strong class='float-left'>"+r.memberName+"님의 별점 : </strong>";
				card += "<div class='star-rating js-star-rating mainboard-review-star-rating float-left margin-top'>";
				card += "<input class='star-rating__input' type='radio' name='rating' value='1'><i class='star-rating__star'></i>";
				card += "<input class='star-rating__input' type='radio' name='rating' value='2'><i class='star-rating__star'></i>";
				card += "<input class='star-rating__input' type='radio' name='rating' value='3'><i class='star-rating__star'></i>";
				card += "<input class='star-rating__input' type='radio' name='rating' value='4'><i class='star-rating__star'></i>";
				card += "<input class='star-rating__input' type='radio' name='rating' value='5'><i class='star-rating__star'></i>";
				card += "<div class='current-rating current-rating--"+r.starClass+" js-current-rating'><i class='star-rating__star'>AAA</i></div>";
				card += "</div></td></tr></tbody></table></div>";

				
				rEnd>=rTotal && $("#review-btn").hide();
				$("#review-wrap").append(card);

			})
				
				
					
  			}
				

	})
	
})



function reviewUpdate(no) {
    $("<a href='/updateMyReview.do?reviewNo="+no+"'></a>")[0].click();
};
function qnaUpdate(no) {
    $("<a href='/qnaPage.do?qnaNo="+no+"'></a>")[0].click();
};

$(".insert-qna-btn").on("click",function(){
    $("<a href='/insertQnaPage.do?productRefNo="+productNo+"'></a>")[0].click();	
})

</script>
<style>
.star-avg{
	margin-top:-18px;
	margin-left:95px;		
}
.title{
	font-size:30px;
}
#qna-btn, #review-btn{
	width:100%;
	height:50px;
	font-size:25px;
}
button:focus {
    outline: 0;
}
.float-left{
	float:left;
}
.margin-top{
	margin-top: 2px;
	margin-left:5px;
}
/*
.abs{
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	margin-top: 0px;
	margin:0px;
	border:none;

}

.rel{
	position: relative;
	height: 50px;
}

.qna-btn{
	float:right;
	height: 40px;
	width: 140px;
	margin-top: -40px;
}
*/
.index-btn{
	float:right;
	height: 40px;
	width: 140px;
	margin-top: 7px;
}

.likeButton-div-wrap{

	height:50px;
}
.float-right{
	margin-top:50px;
	width:100%;
	float:right;
	height:50px;
	font-size:20px;
}



/*
	.nav-link{
		margin-left:25px;
		margin-right:25px;
	}
	
	
.likeButton-div-wrap{
	margin-top:0px;
	margin-left: 5px;
	width:50px;
	height:80px;
}
.likeButton-div-wrap > div{
	height:50px;

}
.cart_btn-pos{
	margin-top: -70px;
	margin-left: 100px;
	width:130px;
}

.container{
	width:900px;
}
.start{
	margin-left:0;
	
}
.star-rating{
	margin-left:0;

}
.star-rating {
	width: 141.5px;
	height: 28px;
}
.review-count{
	font-size:22px;
	display:block;
	margin-top:-30px;
	margin-left:150px;
};
.mainboard-view-price{
	font-size:20px;	
}
.mainboard-review-star-rating{
	width: 91.5px;
	height: 18px;
	display:inline-block;
}
*/
/*
<div class='card-body'><table class='table table-bordered'><tbody>
<tr><td colspan='2'><strong>(**덕) QNA 제목</strong></td></tr>
<tr><td colspan='2'><p>QNA 내용 내용</p><p class='m-0'>18/03/2013</p></td></tr>
<tr><td colspan='2'><strong>답변완료</strong></td></tr>
<tr><td colspan='2'><p>QNA 답변 답변</p><p class='m-0'>18/03/2013</p></td></tr>
</tbody></table></div>
*/
.insert-qna-btn{
	width:100px;
	width:100%;
	height:50px;
	margin-bottom:10px;
}
.insert-qna-btn+*{
	clear:both;
}
</style>
</html>

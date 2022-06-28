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
<!-- partial -->
<script src='https://code.jquery.com/jquery-3.4.1.slim.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js'></script>

<link rel="stylesheet" href="/resources/css/mainboard/staticStar.css">
</head>
<body>
<div class="s-wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>	

<div class="container-fluid position-relative" style="z-index: 99999;">
	<div class="row">
		<div class="col-md-12 shadow-sm">
			<div class="container">
				<div class="row mb-4"></div>
				<div class="row mb-4">
					<div class="col-md-2">
				</div>
					<div class="col-md-6">
						<div class="input-group input-group-lg">
							<input type="text" id="keyword" class="form-control" placeholder="${tool.c }에서 검색" value="${tool.k }"/>
							<select id="searchBy" class="form-control form-control-lg rounded-0">								
							<c:forEach items="${tool.byList }" var="v">
								<option value="${v }" <c:if test="${v eq tool.by}"> selected = "selected" </c:if>>${v }</option>
							</c:forEach>
							</select>							
							<div class="input-group-append">
								<button id="link" class="btn btn-outline-secondary" type="button">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<button id="reset" class="btn btn-outline-secondary btn-block btn-lg" type="button">
							<i class="fas fa-sync-alt"></i>
						</button>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-12"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid mb-3">
	<div class="row">
		<div class="col-md-12 bg-light border-bottom pt-5 pb-5">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2>${tool.c }</h2>
						<!-- 
						<ol class="breadcrumb p-0 m-0 bg-transparent">
							<li class="breadcrumb-item"><a href="#">${tool.b }</a></li>
							<li class="breadcrumb-item"><a href="#">${tool.c }</a></li>
							<c:if test="${not empty tool.k }">
							<li class="breadcrumb-item active">${tool.k }</li>
							</c:if>
						</ol>
						 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>















<div class="container">
	<div class="row mb-5">
		<div class="col-md-3">
			<div class="card mb-4">
				<div class="card-header">카테고리</div>
				<div class="list-group list-group-flush">
				
				<c:forEach items="${tool.categoryMap }" var="v">
					<a href="/mainboard.do?b=${tool.b }&c=${v.key }" 
						class="list-group-item list-group-item-action 
						<c:if test="${v.key eq tool.c}">active</c:if>">
						${v.key } (${v.value })</a>
				</c:forEach>
				
				
				
				
				</div>
			</div>


			<div class="card">
				<div class="card-header">검색하기</div>
				<div class="card-body p-1">

					<div class="card border-0 b-3">
						<div class="card-header p-2 bg-white" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false">
							<p class="m-0 h6">가격</p>
						</div>
						<div class="card-body p collapse show" id="collapseExample4">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Min</label>
									<input id="min" oninput="setMin()" class="form-control" placeholder="${tool.min }" type="number" min="0" max="9999999">
								</div>
								<div class="form-group text-right col-md-6">
									<label>Max</label>
									<input id="max" oninput="setMax()" class="form-control" placeholder="${tool.max }" type="number" min="0" max="9999999">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button id="price-btn" type="button" class="btn btn-block btn-primary">검색</button>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-header">
					<div class="row">
						<div class="col-md-4">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">정렬:</span>
								</div>
								<select class="selectBox form-control" id="orderBy">
								<c:forEach items="${tool.orderList }" var="v">
									<option value="${v }" <c:if test="${v eq tool.order}">selected = "selected"</c:if>>${v }</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">별점:</span>
								</div>
								<select class="selectBox form-control" id="star" name="">
								<c:forEach items="${tool.starList }" var="v">
									<option value="${v }" <c:if test="${v eq tool.star}">selected = "selected"</c:if>>${v }</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">상품 보기:</span>
								</div>
								<select class="selectBox form-control" id="show" name="">
								<c:forEach items="${tool.showList }" var="v">
									<option value="${v }" <c:if test="${v eq tool.show}">selected = "selected"</c:if>>${v }</option>
								</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
	<div class="row">
	
		<c:forEach items="${cards }" var="c">
		<div class="col-md-4 mb-4">
			<div class="card">
						
				<c:if test="${ not empty sessionScopse.m.memberNo }">
				<a href="/mainboardView.do?memberNo=${sessionScope.m.memberNo }&productNo=${c.productNo }"><img class="card-img-top" src="/resources/upload/product/${c.filepath }"  alt="" /></a>
				</c:if>
				<c:if test="${ empty sessionScopse.m.memberNo }">
				<a href="/mainboardView.do?memberNo=0&productNo=${c.productNo }"><img class="card-img-top" src="/resources/upload/product/${c.filepath }" alt="" /></a>
				</c:if>
<!--  
		<img class="card-img-top" src=${c.filepath } alt="" />
-->		
				<div class="card-body">
					<c:if test="${ not empty sessionScopse.m.memberNo }">
					<a href="/mainboardView.do?memberNo=${sessionScope.m.memberNo }&productNo=${c.productNo }"><p class="h6 goods_name product-name"><small class="text-muted">${c.tradeName }</small></br>${c.productName}</p></a>
					</c:if>
					<c:if test="${ empty sessionScopse.m.memberNo }">
					<a href="/mainboardView.do?memberNo=0&productNo=${c.productNo }"><p class="h6 goods_name product-name"><small class="text-muted">${c.tradeName }</small></br>${c.productName}</p></a>
					</c:if>
					<div class="m-0">
						<div class="star-rating js-star-rating">
							<input class="star-rating__input" type="radio" name="rating" value="1"><i class="star-rating__star"></i>
							<input class="star-rating__input" type="radio" name="rating" value="2"><i class="star-rating__star"></i>
							<input class="star-rating__input" type="radio" name="rating" value="3"><i class="star-rating__star"></i>
							<input class="star-rating__input" type="radio" name="rating" value="4"><i class="star-rating__star"></i>
							<input class="star-rating__input" type="radio" name="rating" value="5"><i class="star-rating__star"></i>
							<div class="current-rating current-rating--${c.starClass } js-current-rating"><i class="star-rating__star"></i></div>
<!-- 
							<div class="current-rating current-rating--${c.starClass } js-current-rating"><i class="star-rating__star"></i></div>
 -->
						</div>
					</div>
					<p class="review-count goods_detail">( ${c.reviewCount } ) 개의 후기</p>
					<c:if test="${c.price eq c.orderPrice }">
					<p class="m-0 discount_price product-price"><span class="present_price">${c.price }원</span></p>
					</c:if>
					<c:if test="${c.price ne c.orderPrice}">
					<p class="m-0 discount_price product-price"><span class="goods_detail lowest-price">${c.discountRate }% off</span><span class="goods_detail lowest-price"></span>${c.discountedPrice }원<span class="original_price">${c.price }원</span></p>
					</c:if>
				</div>
				<div class="card-footer p-0">
				</div>
			</div>			
		</div>
		</c:forEach>
			

			
			
			
			
	</div>
				</div>
				<div class="card-footer p-3">
					<div class="row">
						<div class="col-md-6">
							<ul class="pagination m-0">${tool.pageNavi }</ul>
						</div>
						<div class="col-md-6">
							<p class="text-right mb-0 mt-1">총 ${tool.totalProduct }개 상품중 ${tool.filteredProduct }개 상품이 검색되었습니다. ${tool.p } of ${tool.totalP }</p>
						</div>
					</div>
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
	</div>



















</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>




</body>
<script>
    var min = document.getElementById("min");
    min.addEventListener("input",function () {
        var min = Number($("#min").val()); 
        var max = Number($("#max").val()); 
        $("#max").attr("value",min>max?min:max);
    });
    
    function setMin(e) {
        var min = Number($("#min").val()); 
       var max = Number($("#max").val()); 
       min = min>9999999?9999999:min;
        $("#min").val(min);
       $("#max").val(min>max?min:max);
    }
    function setMax() {
        var min = Number($("#min").val());
        var max = Number($("#max").val()); 
        max = max>9999999?9999999:max;
        $("#max").val(max);
       $("#min").val(min>max?max:min);
    }

</script>
 <script>

	var basic,b,c,k,by,order,shart,show,min,max,url;
	
	function initVar() {
		 basic = "/mainboard.do?";
	    b = "&b=${tool.b}";
	    c = "&c=${tool.c}";
	    k = "&k="+$("#keyword").val();
	    by = "&by="+$("#searchBy").val();
	    order = "&order="+$("#orderBy").val();
	    star = "&star="+$("#star").val();
	    show = "&show="+$("#show").val();
	    var minVal = $("#min").val()==""? $("#min").attr("placeholder"):$("#min").val();
	    var maxVal = $("#max").val()==""? $("#max").attr("placeholder"):$("#max").val();
	    min = "&min="+minVal;
	    max = "&max="+maxVal;
	    url = basic+b+c+k+by+order+star+show+min+max;
	    
	}
	
	function clickURL() {
	    initVar();
	    $("<a href='"+url+"'></a>")[0].click();
	};

	$(function() {
	    $("#price-btn").click(clickURL)
	    $(".selectBox").change(clickURL)
 		$("#link").on("click", function(event) {
 			initVar();
		    url = basic+b+c+k+by;
		    $("<a href='"+url+"'></a>")[0].click();
		 
	  });
	    $("#reset").on("click",function(){
	    	initVar();
		    url = basic;
		    $("<a href='"+url+"'></a>")[0].click();
	    	
	    })
	    

  })
</script>
<style>
.lowest-price {
	color: red;
	font-weight: 600;
}

.original_price {
	display: block;
}

.review-count {
	display: inline-block;
	vertical-align: middle;
	margin-bottom: 5px;
}


.product-price {
	border: 0px;
	padding: 0px;
	margin: 12px 0px 0px;
	font-size: 20px;
	font-weight: bold;
}


.product-img {
	width: 100%;
	height: 170px;
}

/* 상품 이미지 */
.product-img {
	background:
		url("https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
/*상품명 2줄 이상 ... 처리*/
.product-name {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	white-space: normal;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

/* hover 그림자 처리
    .shadow:hover{
        box-shadow: 0px 0px 5px rgb(0, 0, 0, 15%);      
    }
    */
.product-name {
	text-decoration-line: none;
}

.shadow:hover .product-name {
	text-decoration-line: underline;
}

/* 이미지 확대*/
.img-container {
	overflow: hidden;
}

.shadow:hover>.img-container>.product-img {
	transform: scale(1.1);
}

.product-img:hover {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
}

.product-img:not(:hover) {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
}
</style>
<style>
.star-rating {
	margin-left:0px;
    box-sizing: border-box;
}

/*
.active{
   background: #9ac6e8 !important;
 }
 
 	.page-link {
  	 	color: #9ac6e8;
	   border:#c4ddf1 !important;
	}
	.page-link:hover{
  	 	color: #9ac6e8;
	   border:#c4ddf1 !important;
	}
	li.active > *{
		color:fff;
	   background-color: #c4ddf1 !important;
	   border:#c4ddf1 !important;
	}
	a{
  	 	color: #9ac6e8;
	}
	
	.btn-primary {
	   border:#c4ddf1 !important;
	   background-color: #c4ddf1 !important;
	}	
*/ 
</style>
</html>
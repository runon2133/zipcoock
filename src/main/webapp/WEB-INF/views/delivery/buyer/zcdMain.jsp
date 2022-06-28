<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<style>
	.eventImage{
		height: 300px;
		background-color: rgba(0, 0, 0, 0.2);
	}
	.main-copy{
		text-align: center;
	}
	.main-copy>img{
		width: 300px;
	}
	.copy{
		font-weight: 600;
		font-size: 20px;
		padding: 20px;
	}
	.main-color{
		color: #9ac6e8;
		font-weight: 900;
		font-size: 25px;
	}
	.sub-container{
		margin-top: 30px;
	}
	.category-img, .category-title{
		text-align: center;
	}
	.category-img img{
		width: 60px;
	}
	.star{
		color: #ffa500;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="container">
		<a href="zcdMypage.do">마이페이지</a>
		<a href="zcdCart.do">장바구니</a>
		<a href="/admin.do">관리자마이페이지</a>
		<a href="/eventList.do">이벤트</a>
		<div class="eventImage"></div>
		<div class="main-copy">
			<img src="/resources/img/zcdBuyer/sofancoock.png">
			<div class="copy"><span class="main-color">집</span>에서 <span class="main-color">쿠-욱</span><br>
			누르기만 해도 찾아올 음식을 원하신다면,</div>
			<div class="row mb-4">
				<div class="col-md-3">
					<a href="#"><img src="" class="img-thumbnail p-0 border-0"></a>
				</div>
				<div class="col-md-6">
					<form action="/zcdFindResult.do" method="post">
						<div class="input-group input-group-lg">
							<input type="text" id="keyword" name="keyword" class="form-control" placeholder="음식을 검색해보세요" />
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"><i class="fas fa-search"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="sub-container">
			<h3>집쿡 맛집을 찾고 있다면</h3>
			<div class="store-wrap">
				<div class="row category-img">
				  	<div class="col-md-2"><a href="/searchCg?category1="><img src="/resources/img/zcdBuyer/icon/1.png"></a></div>
				  	<div class="col-md-2"><a href="/searchCg?category1="><img src="/resources/img/zcdBuyer/icon/2.png"></a></div>
				  	<div class="col-md-2"><a href="/searchCg?category1="><img src="/resources/img/zcdBuyer/icon/3.png"></a></div>
				  	<div class="col-md-2"><a href="/searchCg?category1="><img src="/resources/img/zcdBuyer/icon/4.png"></a></div>
				  	<div class="col-md-2"><a href="/searchCg?category1="><img src="/resources/img/zcdBuyer/icon/5.png"></a></div>
				  	<div class="col-md-2"><a href="/searchCg?category1="><img src="/resources/img/zcdBuyer/icon/6.png"></a></div>
				 	
				</div>
			</div>
		</div>
		<div class="sub-container">
			<h3>전체 음식점</h3>
			<div class="store-wrap">
				<div class="row">
				<c:forEach items="${main }" var="m">
					<div class="col-md-2 mb-4">
						<div class="card">
							<img class="card-img-top" src="/resources/upload/zcdSeller/${m.filename }" alt="" />
							<div class="card-body">
								<a class="h6 goods_name product-name" href="/storeView.do?storeNo=${m.storeNo }">${m.storeName }</a>
							</div>
						<div class="card-footer p-0"></div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
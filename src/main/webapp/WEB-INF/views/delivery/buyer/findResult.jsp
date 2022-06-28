<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<style>
	.selectBox{
		text-align: center;
		margin-bottom: 30px;
	}
	.search-category{
		width: 100px;
		padding: 15px 15px;
		border: 1px solid #c4ddf1;
		font-family: inherit;
		border-radius: 0px;
		appearance: none;
		background-color: #fff;
	}
	select {
		width: 150px;
		padding: 15px 15px;
		border: 1px solid #c4ddf1;
		font-family: inherit;
		background: url('/resources/img/zcdBuyer/icon/arrow.png') no-repeat 95% 50%;
		border-radius: 0px;
		appearance: none;
	}
	select:focus, option:focus, button:focus{
		outline: none;
		border-color: #8ab2d2;
	}
	.star{
		color: #ffa500;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="container">
		<div class="selectBox">
			<select class="search-select" name="">
				<option value="recommend">추천순</option>
				<option value="popular">주문많은순</option>
				<option value="topRated">별점높은순</option>
				<option value="newest">신규매장순</option>
			</select>
			<select class="search-select" name="">
				<option value="recommend">배달비</option>
				<option value="popular">전체</option>
				<option value="topRated">무료배달</option>
				<option value="newest">2,000원 이하</option>
			</select>
			<select class="search-select" name="">
				<option value="recommend">최소주문</option>
				<option value="popular">전체</option>
				<option value="topRated">5,000원 이하</option>
				<option value="newest">10,000원 이하</option>
			</select>
			<button class="search-category">빠른배달</button>
			<button class="search-category">포장</button>
			<button class="search-category">할인쿠폰</button>
		</div>
		
		<div class="store-wrap">
			<div class="row">
				<div class="col-md-3 mb-4">
					<div class="card">
						<img class="card-img-top" src="https://via.placeholder.com/200x200" alt="" />
						<div class="card-body">
							<p class="h6 goods_name product-name"><small class="text-muted">Apple</small><br>다우니 초고농축섬유유연제aaaaaaaa aaaa aa a aa aaa aaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
							<p class="m-0"><small><span class="star">★</span> 4.5(612) · 18-28분 · 배달비 무료</small></p>
						</div>
					<div class="card-footer p-0"></div>
					</div>
				</div>
				<div class="col-md-3 mb-4">
					<div class="card">
						<img class="card-img-top" src="https://via.placeholder.com/200x200" alt="" />
						<div class="card-body">
							<p class="h6 goods_name product-name"><small class="text-muted">Apple</small><br>다우니 초고농축섬유유연제aaaaaaaa aaaa aa a aa aaa aaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
							<p class="m-0"><small><span class="star">★</span> 4.5(612) · 18-28분 · 배달비 무료</small></p>
						</div>
					<div class="card-footer p-0"></div>
					</div>
				</div>
				<div class="col-md-3 mb-4">
					<div class="card">
						<img class="card-img-top" src="https://via.placeholder.com/200x200" alt="" />
						<div class="card-body">
							<p class="h6 goods_name product-name"><small class="text-muted">Apple</small><br>다우니 초고농축섬유유연제aaaaaaaa aaaa aa a aa aaa aaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
							<p class="m-0"><small><span class="star">★</span> 4.5(612) · 18-28분 · 배달비 무료</small></p>
						</div>
					<div class="card-footer p-0"></div>
					</div>
				</div>
				<div class="col-md-3 mb-4">
					<div class="card">
						<img class="card-img-top" src="https://via.placeholder.com/200x200" alt="" />
						<div class="card-body">
							<p class="h6 goods_name product-name"><small class="text-muted">Apple</small><br>다우니 초고농축섬유유연제aaaaaaaa aaaa aa a aa aaa aaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
							<p class="m-0"><small><span class="star">★</span> 4.5(612) · 18-28분 · 배달비 무료</small></p>
						</div>
					<div class="card-footer p-0"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.mainImg{
		margin : o auto;
	}
	.goodsWrap{
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between
	}
	.goodsLink{
		position: relative;
		width: 349px;
		height: 155px;
		background: rgb(238,238,238);
		margin-top: 16px;
	}
	.goods{
		display: flex;
		position: relative;
		overflow: hidden;
		width: 100%;
		height: 100%;
		border-radius: 0px;
	}
	.goods img{
		width: 100%;
		height: 100%;
	}
	.goodsTime{
		position: absolute;
		width : 20%;
		right: 10px;
		bottom: 8px;
		color: black;
		background-color: rgba(255,255,255,0.8);
		font-weight: normal;
		line-height: 18px;
		border-radius: 18px;
		pointer-events:none;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="container" style="width: 1080px;">
		<div class="mainImg">
			<img src="/resources/img/event/이벤트메인이미지.jpg">
		</div>
		<div class="containerMain">
			<h2>이벤트</h2>
			<div class="goodsWrap">
				<c:forEach items="${list }" var="map" varStatus="status">
					<a class="goodsLink" href="eventView.do?eventNo=${map.eventNo }">
						<div class="goods">
							<img src="/resources/img/event/${map.filename }">
						</div>
					</a>
				</c:forEach>
			</div>
		<div style="text-align: center; margin: 0 auto; padding-bottom: 16px;">
		<c:if test="${sessionScope.m.memberLevel eq '관리자'}">
		<a class="buy_btn" style="margin-top: 16px; text-align: right; margin: 0 auto;" href="/eventWriteFrm.do">글쓰기</a>
		</c:if>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
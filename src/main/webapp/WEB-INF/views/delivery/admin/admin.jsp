<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.content_div_info:first-child {
	margin-bottom: 0;
	border-bottom: 0;
}

.btn-area {
	text-align: center;
	display: flex;
}

.btn-area>button:first-child {
	margin-right: 10px;
}

.content_div_info img {
	width: 300px;
}

.side_nav_div:hover {
	background: rgba(51, 51, 51, 0.05);
	cursor: pointer;
	font-weight: 700;
}

.side_nav_div:hover span {
	font-weight: 700;
}

.side_nav_content a {
	text-decoration: none;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="main_field">
		<div class="main_content2">
			<div class="side_nav">
				<div class="my_info">
					<div class="my_info_div">
						<span class="my_info_span">환영합니다</span>
					</div>
					<div class="user_div">
						<div class="user_div_div">
							<div class="user_div_content">
								<span class="user_div_name">${sessionScope.m.memberName }<span
									class="user_div_nim">님</span></span>
							</div>
						</div>
					</div>
				</div>
				<div class="side_nav_content">
					<a href="/admin.do" class="side_nav_div side_nav_div_selected"><span
						class="side_nav_span side_nav_span_selected">정보 확인/수정</span></a> <a
						href="/zcdStatistics.do" class="side_nav_div"><span
						class="side_nav_span">통계</span></a>
				</div>
			</div>
			<div class="content_div">
				<div class="content_title">나의 집쿠욱</div>
				<div class="content_div_area">
					<div class="content_div_content">
						<div class="content_div_info">
							<div class="content_div_opt1">집쿠욱 레벨</div>
							<div class="content_div_opt2">배달 주소</div>
							<div class="content_div_opt3">주문내역</div>
						</div>
						<div class="content_div_info">
							<div class="content_div_opt2" id="text-emp">${sessionScope.m.deliveryLevel }</div>
							<div class="content_div_opt1">
								<a href="/addrList.do" id="text-emp">-</a>
							</div>
							<div class="content_div_opt3">
								<a href="#" id="text-emp">-</a>
							</div>
						</div>
						<div class="content_title"
							style="margin-top: 20px; margin-bottom: 15px;">정보 확인/수정</div>
						<div class="content_div_info">
							<div class="content_div_opt1">이름</div>
							<div class="content_div_opt2" id="text-emp"
								style="text-align: left; margin-left: 20px;">${sessionScope.m.memberName }</div>
							<div class="content_div_opt3"></div>
						</div>
						<form action="/updatePhone.do" method="post">
							<div class="content_div_info">
								<div class="content_div_opt1">전화번호</div>
								<input type="hidden" name="memberId"
									value="${sessionScope.m.memberId }">
								<div class="content_div_opt2">
									<input type="text" name="memberPhone" class="input"
										value=${sessionScope.m.memberPhone }>
								</div>
								<div class="content_div_opt3">
									<input type="submit" class="default_Btn" value="전화번호 변경">
								</div>
							</div>
						</form>
						<form action="/zcdAdminChangePw.do" method="post">
							<div class="content_div_info">
								<div class="content_div_opt1">현재 비밀번호</div>
								<div class="content_div_opt2">
									<input type="hidden" name="memberId"
										value="${sessionScope.m.memberId }"> <input
										type="password" class="input" name="oldPassword">
								</div>
							</div>
							<div class="content_div_info">
								<div class="content_div_opt1">새로운 비밀번호</div>
								<div class="content_div_opt2">
									<input type="password" class="input" name="newPassword">
								</div>
								<div class="content_div_opt3">
									<input type="submit" class="default_Btn" value="비밀번호 변경">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- main field -->
		<%@include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	<style>
.input {
	height: 24px;
}
</style>
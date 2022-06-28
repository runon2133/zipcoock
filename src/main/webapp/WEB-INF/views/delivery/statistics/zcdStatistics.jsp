<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

.zcdStatistics_search {
	color: #000;
	background: #f5f5f5;
	border: 1px solid #e6e6e6;
	overflow: hidden;
	border-left: #9ac6e8;
	border-bottom: 0px;
}

.zcdStatistics_ul {
	display: inline-block;
	vertical-align: top;
	list-style: none;
}

.zcdStatistics_ul li {
	display: inline-block;
	vertical-align: top;
	padding-right: 2px;
	list-style: none;
}

.zcdStatistics_submit {
	padding: 0 13px;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	font-size: 0.9em;
	background: #616b7d;
	color: #fff;
	border-color: #616b7d;
}

.zcdStatistics_chart {
	margin-bottom: 30px;
	border: 1px solid #dcdcdc;
}

.zcdChart_title {
	padding: 20px;
	border-bottom: 1xp solid #dcdcdc;
}

.zcdChart_content {
	padding: 20px;
}

.zcdChart_content img {
	width: 100%;
	border: 0;
}
</style>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
								<span class="user_div_name">${sessionScope.m.memberName}<span class="user_div_nim">님</span></span>
							</div>
						</div>
					</div>
				</div>
				<div class="side_nav_content">
					<a href="/admin.do" class="side_nav_div"><span class="side_nav_span">정보 확인/수정</span></a> 
					<a href="/zcdStatistics.do" class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected">통계</span></a>
				</div>
			</div>
			<div class="content_div" style="width: 100%;">
				<h3>통계관리</h3>
				<hr>
				<div class="zcdStatistics_search content_div" style="width: 100%; margin: 0;">
					<div style="width: 100%; float: left;">
						<input type="text" id="datepicker1"> - <input type="text" id="datepicker2">
						<ul class="zcdStatistics_ul" style="padding-top:5px;">
							<li><a href="#" class="zcdStatistics_submit">이번주</a></li>
							<li><a href="#" class="zcdStatistics_submit">지난주</a></li>
							<li><a href="#" class="zcdStatistics_submit">이번달</a></li>
							<li><a href="#" class="zcdStatistics_submit">전체</a></li>
						</ul>
					</div>
					<div class="zcdStatistics_chart">
						<div class="zcdChart_title">
							<h3>결제금액 통계</h3>
							<p>결제금액을 일별로 살펴볼수 있으며, 기간을 정해서도 확인할 수 있습니다.</p>
						</div>
						<div class="zcdChart_content">
							<img src="/resources/img/statistics/통계테스트이미지.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main field -->

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="styleshceet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		$(function() {
			$("#datepicker1,#datepicker2").datepicker({
				minDate : 0
			});
		});
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd', //날짜 포맷이다.
			prevText : '이전 달', // 마우스 오버시 이전달 텍스트
			nextText : '다음 달', // 마우스 오버시 다음달 텍스트
			closeText : '닫기', // 닫기 버튼 텍스트 변경
			currentText : '오늘', // 오늘 텍스트 변경
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ], //한글 캘린더중 월 표시를 위한 부분
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ], //한글 캘린더 중 월 표시를 위한 부분
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ], //한글 캘린더 요일 표시 부분
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ], //한글 요일 표시 부분
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], // 한글 요일 표시 부분
			showMonthAfterYear : true, // true : 년 월  false : 월 년 순으로 보여줌
			yearSuffix : '년', //
			showButtonPanel : true, // 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
			showOn : "button",
			buttonImage : "/resources/img/coupon/Calendar.png",
			buttonImageOnly : true,
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/coupon/coupon.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="container" style="width: 1080px;">
		<h3>쿠폰관리</h3>
		<hr>
		<div class="zcdcoupon_search">
			<h3 class="zcdsearch">발급쿠폰검색</h3>
			<table class="zcdsearch_table">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>쿠폰명</th>
						<td><input type="text" >
						<th>혜택구분</th>
						<td>
							<select name="zcdBenefits_select">
								<option value selected>전체</option>
								<option value="A">할인금액</option>
								<option value="B">할인율</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>발급구분</th>
						<td>
							<select id="issueType" name="zcdIssued_select">
								<option value selected>전체</option>
								<option value="C">고객 다운로드 발급</option>
								<option value="D">조건부 자동 발급</option>
							</select>
						</td>
						<th>적용범위</th>
						<td>
							<select name="zcdUsedLevel_select">
								<option value selected>전체</option>
								<option value="E">가격 할인</option>
								<option value="F">배달비 할인</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>생성일자</th>
						<td>
							<select id="createDate" name="zcdCreateDate_select">
								<option value selected>전체</option>
								<option value="G">생성일자</option>
								<option value="H">생성기간</option>
							</select>
						</td>
						<th>삭제여부</th>
						<td>
							<select name="zcdDeleted_select">
								<option value selected>전체</option>
								<option value="I">삭제</option>
								<option value="J">미삭제</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="zcdSearch_btn">
			<button type="button" class="zcdSearch_btn2">검색</button>
		</div>
		<div class="zcdCoupon_info">
			<div class="zcdCouponInfo">
				<select class="zcdCouponInfo_select">
					<option value>10개씩보기</option>
					<option value>20개씩보기</option>
					<option value>30개씩보기</option>
				</select>
			</div>
			<div class="zcdCoupon_management">
				<div class="zcdManagement_btn1">
					<a href="#" class="zcdBtn_submit">수정</a>
					<a href="#" class="zcdBtn_submit2">삭제</a>
				</div>
				<div class="zcdManagement_btn2">
					<ul class="tar">
						<li>
							<a href="#" class="zcdBtn_submit2">쿠폰생성</a>
						</li>
					</ul>
				</div>
			</div>
			<table class="zcdManagement_table">
				<tr>
					<th>
						<input type="checkbox" value>
					</th>
					<th>쿠폰번호</th>
					<th>쿠폰명</th>
					<th>혜택</th>
					<th>사용기간</th>
					<th>발급수</th>
					<th>발급구분</th>
					<th>상태</th>
					<th>발급여부</th>
					<th>조회</th>
				</tr>
				<tr>
					<td>
						<input type="checkbox" value>
					</td>
					<td>202112080001</td>
					<td>
						<a href="#" alt="쿠폰상세정보로이동">3만원이상 구매시 5천원 할인</a>
					</td>
					<td>할인금액 5000원 할인</td>
					<td>21-12-08 00:00 ~ 21-12-08 23:59</td>
					<td>1</td>
					<td>고객다운로드</td>
					<td>발급불가</td>
					<td>완료</td>
					<td>
						<a href="#" class="zcdBtn_submit">조회</a>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" value>
					</td>
					<td>202112080002</td>
					<td>
						<a href="#" alt="쿠폰상세정보로이동">배달료 3000원 할인</a>
					</td>
					<td>배달료 3000원 할인</td>
					<td>21-12-08 00:00 ~ 21-12-14 23:59</td>
					<td>1</td>
					<td>고객다운로드</td>
					<td>발급중</td>
					<td>
						<ul class="tarLi">
							<li>
								<a href="#" class="zcdBtn_submit">발급</a>
							</li>
							<li>
								<a href="#" class="zcdBtn_submit">중지</a>
							</li>
						</ul>
					</td>
					<td>
						<a href="#" class="zcdBtn_submit">조회</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="zcdCoupon_write">
			<h4>쿠폰등록</h4>
			<table class="zcdWrite_table">
				<colgroup>
					<col width="180px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>쿠폰이름<span class="zcdNece">*</span></th>
						<td><input type="text" style="width: 60%;"></td>
					</tr>
					<tr>
						<th>쿠폰설명</th>
						<td><input type="text" style="width: 80%;"></td>
					</tr>
					<tr>
						<th>혜택 구분<span class="zcdNece">*</span></th>
						<td><input type="text">원 할인</td>
					</tr>
					<tr>
						<th>발급구분<span class="zcdNece">*</span></th>
						<td>
							<select style="width: 15%">
								<option value selected>대상자지정발급</option>
								<option value="1">조건부자동발급</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>발급시점<span class="zcdNece">*</span></th>
						<td>
							<div style="line-height: 28px;">
								<label style="width: 10%">
									<input type="radio">즉시발급
								</label>
								<label style="width: 10%">
									<input type="radio">지정한 시점에 발급
									<input type="text">
									<input id="datepicker">
									<select class="fSelect" name="start_hour" id="start_hour">
										<option value="0" selected="selected">00</option>
										<option value="1">01</option>
										<option value="2">02</option>
										<option value="3">03</option>
										<option value="4">04</option>
										<option value="5">05</option>
										<option value="6">06</option>
										<option value="7">07</option>
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
									</select>
									시
									<select class="fSelect" name="start_min" id="start_min">
										<option value="0" selected="selected">00</option>
										<option value="5">05</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
										<option value="55">55</option>
									</select>
									분 ~
									<input type="text">
									<input id="datepicker">
									<select class="fSelect" name="start_hour" id="start_hour">
										<option value="0" selected="selected">00</option>
										<option value="1">01</option>
										<option value="2">02</option>
										<option value="3">03</option>
										<option value="4">04</option>
										<option value="5">05</option>
										<option value="6">06</option>
										<option value="7">07</option>
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
									</select>
									시
									<select class="fSelect" name="start_min" id="start_min">
										<option value="0" selected="selected">00</option>
										<option value="5">05</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
										<option value="55">55</option>
									</select>
									분
								</label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="zcdCoupon_info">
			<h4>사용정보</h4>
			<table class="zcdInfo_table">
				<colgroup>
					<col width="180px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>사용기간<span class="zcdNece">*</span></th>
						<td>
							<input type="text">
							<input id="datepicker">
							<select class="fSelect" name="start_hour" id="start_hour">
								<option value="0" selected="selected">00</option>
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
							</select>
							시
							<select class="fSelect" name="start_min" id="start_min">
								<option value="0" selected="selected">00</option>
								<option value="5">05</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
							</select>
							분 ~
							<input type="text">
							<input id="datepicker">
							<select class="fSelect" name="start_hour" id="start_hour">
								<option value="0" selected="selected">00</option>
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
							</select>
							시
							<select class="fSelect" name="start_min" id="start_min">
								<option value="0" selected="selected">00</option>
								<option value="5">05</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
							</select>
							분
							<ul class="zcdInfo_ul">
								<li>
									<a href="#" class="zcdBtn_submit">오늘</a>
								</li>
								<li>
									<a href="#" class="zcdBtn_submit">3일</a>
								</li>
								<li>
									<a href="#" class="zcdBtn_submit">7일</a>
								</li>
								<li>
									<a href="#" class="zcdBtn_submit">1개월</a>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>사용가능 기준금액<span class="zcdNece">*</span></th>
						<td>
							<input type="text">
							원 이상 구매시
						</td>
					</tr>
					<tr>
						<th>동일쿠폰사용설정<span class="zcdNece">*</span></th>
						<td>
							주문서 당
							<input type="text" style="width: 50px">
							개 까지 사용가능
						</td>
					</tr>
					<tr>
						<th>중복쿠폰사용설정<span class="zcdNece">*</span></th>
						<td>
							<div style="line-height: 28px;">
								<label style="margin-right: 10px">
									<input type="radio">사용가능
								</label>
								<label style="margin-right: 10px">
									<input type="radio">사용불가
								</label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="zcdCoupon_btn">
				<ul>
					<li>
						<button type="button" class="zcdBtn_submit2">쿠폰생성</button>
					</li>
					<li>
						<a class="zcdBtn_submit">목록</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		$(function() {
			$("#datepicker").datepicker({ minDate: 0});
		});
		$.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
	        prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
	        nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
	        closeText: '닫기', // 닫기 버튼 텍스트 변경
	        currentText: '오늘', // 오늘 텍스트 변경
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
	        showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
	        yearSuffix: '년',	//
	        showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
            showOn:"button",
            buttonImage:"/resources/img/coupon/Calendar.png",
            buttonImageOnly:true,
	    });
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
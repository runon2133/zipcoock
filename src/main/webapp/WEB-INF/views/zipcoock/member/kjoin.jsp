<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="resources/css/member/bjoin.css">
<link rel="stylesheet" href="resources/css/member/modal.css">
<title>Document</title>


<script>
	function join() {
		var agree = document.getElementById('privacyAgreement');
		var mailcode;
		var phoneNumber = '010' + $("#memberPhone2").val() + $("#memberPhone3").val();
		$("#memberPhone").val(phoneNumber);
		//이용약관 동의가 체크 되었을경우1
		if (agree.checked) {
			
						//이름값 입력했을경우 3
						if ($("#memberName").val() != '') {
						
							//휴대폰 값 입력했을경우4
							if ($("#memberPhone2").val() && $("#memberPhone3").val() != '') {
								
									//주소 입력 했을경우5
									if ($("#postCode1").val() && $("#addressRoad1").val() != '') {
																			
										//상세주소 입력했을경우6
										if ($("#addressDetail1").val() != '') {
																							
												//회원가입 확인버튼 버튼 눌렀을경우 7
												if (confirm("회원가입 하시겠습니까?")) {
													alert("회원가입이 완료되었습니다.");
													
													return true;
													//회원가입 확인버튼 취소했을경우7
												} else {
													return false;
												
											} 	//상세주소 입력안했을경우6
										} else {
											alert("상세주소를 확인해주세요!");
											$("#addressDetail1").focus();
											return false;

										}
										//주소검색 안했을경우5
									} else {
										alert("주소를 확인해주세요!");
										$("#postCode1").focus();
										return false;

									}
								//핸드폰번호값 null일경우4
							} else {
								alert("핸드폰 번호를 확인해주세요!");
								$("#memberPhone2").focus();
								return false;
							}
							//이름이 null이 아닐경우 3
						} else {
							alert("이름을 확인해주세요!");
							$("#memberName").focus();
							return false;
						}

			//이용약관 체크안했을경우 1
		} else {
			alert("이용약관 동의를 체크해주세요");
			$("#allAgreement").focus();
			return false;

		}
	}

	

	//주소 검색
	function addrSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#postCode1").val(data.zonecode);
				$("#addressRoad1").val(data.roadAddress);
				$("#addressDetail1").focus();
			}
		}).open();
	}
</script>

</head>

<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="contents">
		<h1 style="text-align: center; margin-top: 100px;">SIGN UP</h1>
		<hr>
		<br> <br>

		<div class="wrap">


			<div class="content">
				<form action="/bjoin.do" method="post" class="contentDetail"
					id="contentDetail-field" name="joinFrm">
					<legend class="contentDetail-legend">14세 이상 회원 가입 입력양식</legend>
					<div class="contentDetail">
						<h3 class="title">이용약관 확인 및 동의</h3>
						<br>
				
						<div class='agreebox'>
							<input type="checkbox" id="privacyAgreement" class="agreeCheck">
							<label for="privacyAgreement">개인정보 수집 및 이용에 동의 <span
								class="fcBlue">(필수)</span></label>
							<div class="agreeContent">
								<ul style="list-style: none;padding: 10px;;">
									<li>수집항목 : 이름, 휴대전화번호, 생년월일, 비밀번호</li>
									<li>수집·이용목적 : 회원제 서비스 제공</li>
									<li>보유 및 이용기간 : 회원탈퇴 시 까지</li>
								</ul>
							</div>
						</div>

						<br> <br>
						<hr>
						<br> <br> <br> <br> <br> <br>
					</div>

					<h3 class="title">필수정보입력</h3>
					<div class="contentDetail border">
						<br>
						<table class="inputTbl">
							
							
							
							<tr>
								<td>이름</td>
								<td><input type="text" class="joinInput short3" id="memberName" name="memberName"></td>
							</tr>
							
							<tr>
								<td>휴대전화번호</td>
								<td>
								<select class="joinInput short1 memberphone" style="margin-left:0px;" name="memberPhone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								
								</select> -
								<input type="text" class="joinInput short2 memberphone" id="memberPhone2" name="memberPhone2" >  -
								<input type="text" class="joinInput short2 memberphone" id="memberPhone3" name="memberPhone3" >
								
								</td>
							</tr>
						
							<tr>
								<td>주소입력</td>
								<td><input type="text" id="postCode1" class="joinInput short3" name="postCode1"
									readonly>
									<button onclick="addrSearch();" type="button" class="addrBtn">찾기</button></td>
							</tr>
							<tr>
								<td></td>
								<td style="padding-top: 5px;"><input type="text" id="addressRoad1" class="joinInput long" name="addressRoad1">
									<input type="text" id="#addressDetail1" class="joinInput long" name="addressDetail1" placeholder="상세주소">
									<!--카카오톡api값으로 받아온 id값으로 join   -->
								<input type="hidden" class="joinInput" name="memberId" id="memberId" value="${requestScope.id }">							
								<input type="hidden" class="joinInput" name="memberPw" value="${requestScope.id }">
								<input type="hidden" name="memberPhone" id="memberPhone">
								</td>
							</tr>
							
								
							
						</table>
						<br>
						<br>
					</div>
					<div class="btnBox">
						<button onclick="return join();" class="nextBtn">회원가입</button>
					</div>
				</form>
			</div>
		</div>

	</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>
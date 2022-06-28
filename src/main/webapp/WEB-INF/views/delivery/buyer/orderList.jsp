<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/zcdCart.css">
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="container">
		<div class="purchasePage">
			<div class="content_title">주문/결제</div>
				<div class="purchase-content">
					<div class="purchaseInfo">
						<div class="table-title">구매 정보</div>
						<table class="purchaseInfo">
							<tr>
								<th>상호명</th>
								<th>주문 정보</th>
								<th>수량</th>
								<th>결제 예정 금액</th>
							</tr>
							<c:set var="sum" value="0"/>
							<c:forEach items="${zcv }" var="z">
			            	<tr>
			            		<td>${z.storeName }</td>
			            		<td>
			            			<div>${z.menuName }</div>
		                            <c:if test="${not empty z.addmenuInfo1 || not empty z.addmenuInfo2}">
			                            <div><small>- ${z.addmenuInfo1 }</small></div>
			                            <div><small>- ${z.addmenuInfo2 }</small></div>
	        	                    </c:if>
	        	                </td>
			            		<td>${z.amount }</td>
			            		<td>${z.menuAllprice }원</td>
			            	</tr>
			            	<c:set var="sum" value="${sum + (z.menuAllprice * z.amount)}"/>
			            	</c:forEach>
			            </table>
			           	   
					</div>	
					<div class="wrap-area">
						<div class="deliveryInfo">
							<div class="table-title">배달 정보</div>
							<table>
								<tr>
									<td></td>
									<td>
										<div class="addrList">
											<c:forEach items="${addr }" var="a" varStatus="status">
												<label><input type="radio" name="memberAddr" id="memberAddr" value="${a.addrNo }">기본주소</label>
											</c:forEach>
											<!-- 
											<button class="addrBtn" id="addAddr">추가</button>
											<div id="addAddrFrm">
												<form action="/addAddr.do" method="post" name="insertAddrFrm">
													<div>배송지 추가</div>
													<table>
														<tr>
															<td>배송지 별칭</td>
															<td><input type="text" id="title"></td>
														</tr>
														<tr>
															<td>주소 입력</td>
															<td>
																<input type="text" name="postcode" id="postcode" class="add_addr" readonly placeholder="우편번호">
																<button type="button" id="findpostcode" style="width: 70px;">찾기</button>
															</td>
														</tr>
														<tr>
															<td></td>
															<td><input type="text" name="address1" id="address1" class="add_addr" readonly placeholder="주소"></td>
														</tr>
														<tr>
															<td></td>
															<td><input type="text" name="address2" id="address2" class="add_addr" placeholder="상세주소" maxlength="40"></td>
														</tr>
														<tr>
															<td></td>
															<td id="addrBtn" style="text-align: center;"><button class="addAddrBtn">추가</button></td>
														</tr>
													</table>
												</form>
											</div>
											 -->
											<!-- 5개정도만 할 수 있게 -->
										</div>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>서울시 영등포구 </td>
								</tr>
				            	<tr>
				            		<td>연락처</td>
				            		<td id="phone">${sessionScope.m.memberPhone }</td>
				            	</tr>
					           	<tr>
					           		<td>배송 요청 사항</td>
					           		<td><input type="text" id="order-request"></td>
					           	</tr>
							</table>
						</div>
						<div class="lastCheckInfo">
							<div class="table-title">최종 결제 금액</div>
					        <table>
					           	<tr>
					           		<td>합 계</td>
					           		<td><span id="result">${finalPrice }</span>원</td>
					           	</tr>
					           	<tr>
					           		<td>주문 금액</td>
					           		<td>${sum }원</td>
					           	</tr>
				            	<tr>
				            		<td>배달 금액</td>
				            		<td>${deliFee }원</td>
				            	</tr>
				            	<tr>
				            		<td colspan="2" class="btn-area">
										<button id="payment" type="button">결제하기</button>
										<button id="no-payment" type="button">결제없이 진행</button>				            		
				            		</td>
				            	</tr>
				            </table>
						</div>
					</div>
			</div>
		</div>
		<div class="purchase-content">
			<div class="content_title_1">주문이 완료되었습니다.</div>
			<div class="linkArea">
			<a href="/zcdMain.do">메인으로</a><a href="/zcdOrderDetail.do">주문내역확인</a>
			</div>
		</div>
		<div class="purchase-content">
			<div class="content_title_1">결제에 실패하였습니다.</div>
			<div class="linkArea">
			<a href="/zcdMain.do">메인으로</a><a href="/zcdCart.do">장바구니로</a>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	
	<script>
	$(function(){
		$($(".purchase-content")[1]).css("display","none");
		$($(".purchase-content")[2]).css("display","none");
		$("#addAddrFrm").css("display","none");
		
		$("#changeAddr").click(function(){
			alert("짠");
		});
		
		$("#findpostcode").on("click", function() {
			return findAddr();
		});
		
		function findAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					$("#postcode").val(data.zonecode);
					if (data.userSelectedType === 'R') {
						$("#address1").val(data.roadAddress);
					} else {
						$("#address1").val(data.jibunAddress);
					}
					$("#address2").focus();
				}
			}).open();
		}
		
		$("#payment").click(function(){
			var price = $("#result").html();
			var d = new Date();
			var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			console.log(date);
			console.log(price);
			IMP.init("imp24716388"); //가맹점 식별코드
			IMP.request_pay({
				merchant_uid : "ZIPcoock"+date, //거래아이디
				name : "ZIPcoock"+date, //결제이름설정
				amount : $("#result").html(), //결제금액
				buyer_phone : $("#phone").val() //전화번호
				
			},function(rsp){
				if(rsp.success){
					$($(".purchase-content")[0]).css("display","none");
					$($(".purchase-content")[1]).css("display","block");
					console.log("카드승인번호 : "+rsp.apply_num);
					$("#payForm").submit();
				}else{
					$($(".purchase-content")[0]).css("display","none");
					$($(".purchase-content")[2]).css("display","block");
				}
			});
		});
		
		$("#no-payment").click(function() {
			$($(".purchase-content")[0]).css("display","none");
			$($(".purchase-content")[1]).css("display","block");
		});
		
		$("input[name=memberAddr]").click(function(){
			var checkAddr=$("input[name=memberAddr]:checked").val();
			console.log(checkAddr);
		});
		
		$("#addAddr").click(function() {
			$("#addAddrFrm").css("display","block");
		})
		
		$(".addAddrBtn").click(function(){
			// 추가 성공 시
			$("#addAddrFrm").css("display","none");
		});
	});
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/manageMarket.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="s-wrapper">
	<jsp:include page="/WEB-INF/views/common/deliveryHeader.jsp" />
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
	        						<span class="user_div_name">${sessionScope.m.memberName }<span class="user_div_nim">님</span></span>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
        			<div class="side_nav_content">
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageMarketFrm.do">매장관리</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageMenuFrm.do">메뉴관리</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">매장관리</div>
        			<div class="content_div_area">
        				<div class="content_div_content">
        					<div class="content_div_info">
        						<div class="content_div_opt1">상호명</div>
        						<div class="content_div_opt2">매장 전화번호</div>
        						<div class="content_div_opt3">관리</div>
        						<div class="content_div_opt4">영업 상태</div>
        					</div>
        					<c:if test="${not empty list }">
        						<table class="content_div_table">
	        						<c:forEach items="${list }" var="zs">
										<tr class="table_tr_height">
											<td>
												<input type="hidden" value="${zs.memberNo }">
												<input type="hidden" value="${zs.storeNo }">
												<div class="content_div_opt1 overflow-text marketView" style="color: #333">${zs.storeName }</div>
											</td>
											<td><div class="content_div_opt2" style="color: #333">${zs.storePhone }</div></td>
											<td>
												<div class="content_div_opt3">
													<a href="/selectOneMarket.do?storeNo=${zs.storeNo }" style="color: #9ac6e8;">변경</a> ｜
													<span class="deleteMarket" style="color: #f45452;">삭제</span>
													<input type="hidden" name="storeNo" value="${zs.storeNo }">
												</div>
											</td>
											<c:choose>
												<c:when test="${zs.storeState eq 'N' }">
													<td>
														<div class="content_div_opt4">
															<select class="form-select state-change" style="font-size: 12px; width: 80px;">
																<option value='N' selected>CLOSE</option>
																<option value='Y'>OPEN</option>
															</select>
														</div>
													</td>
												</c:when>
												<c:otherwise>
													<td>
														<div class="content_div_opt4">
															<select class="form-select state-change" style="font-size: 12px; width: 80px;">
																<option value='N'>CLOSE</option>
																<option value='Y' selected>OPEN</option>
															</select>
														</div>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>        						
        						</table>
        					</c:if>
        					<a class="add_market_btn" href="/addMarketFrm.do">+ 매장 정보 등록하기</a>
        				</div>
        			</div>
        		</div>
        	</div> <!-- main content -->
        </div> <!-- main field -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function() {
			
			$(".state-change").change(function() {
				var storeState = $(this).val();
				var storeNo = $(this).parent().parent().prev().children().children().eq(2).val();
				console.log(storeState);
				console.log(storeNo);
				var data = {storeState : storeState, storeNo : storeNo};
				$.ajax({
					url : "/changeState.do",
					data : data,
					type : "post",
					success : function(data) {
						if (data == 0) {
							alert("영업 상태가 변경되었습니다.");
						} else {
							alert("영업 상태가 변경되지 않았습니다.");
						}
					}
				});
			});
			
			$(".deleteMarket").click(function(e) {
				e.preventDefault();
				var del_ans = confirm("해당 매장 정보를 삭제하시겠습니까?");
				var storeNo = $(this).next().val();
				if (del_ans == true) {
					location.href="/deleteOneMarket.do?storeNo=" + storeNo;			
				} else {
					
				}
			});
			
			$(".marketView").click(function() {
				var storeNo = $(this).prev().val();
				var memberNo = $(this).prev().prev().val();
				location.href="/marketView.do?storeNo=" + storeNo + "&memberNo=" + memberNo;
			});
			
		});
		
	</script>
</div>
</body>
</html>
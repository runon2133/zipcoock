<%@ page import="java.text.NumberFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/addMenu.css">

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
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageMarketFrm.do">매장관리</a></span></div>
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageMenuFrm.do">메뉴관리</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">
        				<span class="prev_tap">
        					<a class="prev_tap" href="/manageMenuFrm.do">메뉴관리</a> > 
        					<a class="prev_tap" href="/addMenuGroupFrm.do?storeNo=${storeNo }">메뉴편집</a> >
        					<a class="prev_tap" href="/addMenuFrm.do?groupNo=${groupNo }&storeNo=${storeNo }">${groupName }</a> >
        				</span> ${menuName }
        			</div>
        			<div class="content_div_area">
        				<div class="content_div_content">
        					<div class="content_div_info">
        						<div class="content_div_opt1">선택메뉴명</div>
        						<div class="content_div_opt2">선택메뉴 가격</div>
        						<div class="content_div_opt3">선택메뉴 상태</div>
        						<div class="content_div_opt4">관리</div>
        					</div>
        					<c:if test="${not empty list }">
        						<table class="content_div_table">
	        						<c:forEach items="${list }" var="addmenu">
										<tr class="table_tr_height">
											<td><div class="content_div_opt1 overflow-text" style="color: #333">${addmenu.addmenuName }</div></td>
											<td>
												<div class="content_div_opt2" style="color: #333">
													<fmt:formatNumber value="${addmenu.addmenuPrice }" pattern="#,###" /> 원
												</div>
											</td>
											<td>
												<div class="content_div_opt3">
													<span>${addmenu.addmenuStatus }</span>
													
												</div>
											</td>
											<td>
												<div class="content_div_opt4">
													<span class="deleteOption" style="color: #f45452;">삭제</span>
													<input type="hidden" name="addmenuNo" value="${addmenu.addmenuNo }">
													<input type="hidden" name="groupNo" value="${groupNo }">
													<input type="hidden" name="storeNo" value="${storeNo }">
													<input type="hidden" name="menuNo" value="${menuNo }">
													<input type="hidden" name="menuName" value="${menuName }">
												</div>
											</td>
										</tr>
									</c:forEach>        						
        						</table>
        					</c:if>
        					
        					<button class="add_menu_btn" data-toggle="modal" data-target="#modal1">+ 선택메뉴 추가하기</button>
        					
        				</div>
        			</div>
        		</div>
        	</div> <!-- main content -->
        </div> <!-- main field -->
				
		<!-- 선택메뉴 추가 모달 -->
        <div class="modal" id="modal1" style="margin-top: 200px;">
		  	<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		    	<form action="/addMenuOption.do" method="post">
			      	<div class="modal-header">
			        	<h5 class="modal-title"><span class="add_menugroup_title">선택메뉴 추가</span></h5>
			        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			          	<span aria-hidden="true"></span>
			        	</button>
			      	</div>
		      		<div class="modal-body">
  						<div class="form_opt add_margin">
  							<div class="form_opt_title">선택메뉴명</div>
  							<input type="hidden" id="storeNo" name="storeNo" value="${storeNo }">
  							<input type="hidden" id="groupNo" name="groupNo" value="${groupNo }">
  							<input type="hidden" id="menuName" name="menuName" value="${menuName }">
  							<input type="hidden" id="menuNo" name="menuNo" value="${menuNo }">
							<input class="form-control" id="addmenuName" name="addmenuName" type="text" placeholder="영문 또는 한글 시작, 특수문자(&, /) 사용 가능" maxlength="20">
  						</div>
  						<div class="form_opt add_margin">
  							<div class="form_opt_title">추가/필수</div>
								
						    <div class="form-check">
						        <input type="radio" class="form-check-input" name="addmenuStatus" id="addmenuStatus1" value="추가" checked="">
						        <label for="addmenuStatus1" style="font-size: 16px;"> 추가 선택</label>
						    </div>
						    <div style="margin-right: 15px;"></div>
						    <div class="form-check">
						        <input type="radio" class="form-check-input" name="addmenuStatus" id="addmenuStatus2" value="필수">
						        <label for="addmenuStatus2" style="font-size: 16px;"> 필수 선택</label>
						    </div>
							
  						</div>
  						<div class="form_opt">
  							<div class="form_opt_title">선택메뉴 가격</div>
							<input class="form-control" id="addmenuPrice" name="addmenuPrice" type="text" placeholder="가격을 입력해주세요. (100원 이상)" maxlength="5">
  						</div>
  						
		      		</div>
			      	<div class="modal-footer">
			        	<button type="submit" class="btn btn-primary btn-100" id="addMenuOption">추가</button>
			      	</div>
		      	</form>
		    	</div>
		  	</div>
		</div>
				
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function() {
			
			var addmenuNameChk = false;
			var addmenuPriceChk = false;
			
			$(".add_menu_btn").click(function(e) {
				e.preventDefault();
				$("#modal1").modal("show");
			});
			
			$(".btn-close").click(function() {
				$("#groupName").val("");
			});
			
			$("#addMenuOption").on("click", function() {
				return checkMenuOption();
			});
			
			$("#addmenuStatus1").on("click", function() {
				var addmenuPrice = $(this).parent().parent().next().children().eq(1);
				addmenuPrice.val("");
				addmenuPrice.removeAttr("readonly");
			});
			
			$("#addmenuStatus2").on("click", function() {
				var addmenuPrice = $(this).parent().parent().next().children().eq(1);
				addmenuPrice.val(0);
				addmenuPrice.attr("readonly", true);
				addmenuPriceChk = true;
			});
			
			function checkMenuOption() {
				var addmenuName = $("#addmenuName").val();
				var addmenuPrice = $("#addmenuPrice").val();
				
				if (addmenuName == "" || addmenuNameChk == false) {
    				alert("선택메뉴명을 확인하세요.");
    				return false;
    			} else if (addmenuPrice == "" || addmenuPriceChk == false) {
    				alert("선택메뉴 가격을 확인하세요.");
    				return false;
    			} else {
 					return true;
    			}
			}
			
			$("#addmenuName").on("keyup", function() {
    			var addmenuName = $(this).val();
    			var addmenuNameReg = /^[a-zA-Z가-힣][0-9a-zA-Z가-힣&/\s]{1,20}$/;
    			if (addmenuNameReg.test(addmenuName)) {
    				addmenuNameChk = true;
				} else {
					addmenuNameChk = false;
    			}
    		});
			
			$("#addmenuPrice").on("keyup", function() {
    			var addmenuPrice = $(this).val();
    			var addmenuPriceReg = /^[1-9][0-9]{2,4}$/;
    			if (addmenuPriceReg.test(addmenuPrice)) {
    				addmenuPriceChk = true;
				} else {
					addmenuPriceChk = false;
    			}
    		});
			
			$(".deleteOption").click(function(e) {
				e.preventDefault();
				var del_ans = confirm("해당 선택메뉴를 삭제하시겠습니까?");
				var addmenuNo = $(this).next().val();
				var groupNo = $(this).next().next().val();
				var storeNo = $(this).next().next().next().val();
				var menuNo = $(this).next().next().next().next().val();
				var menuName = $(this).next().next().next().next().next().val();
				if (del_ans == true) {
					location.href="/deleteOption.do?addmenuNo=" + addmenuNo + "&groupNo=" + groupNo + "&storeNo=" + storeNo + "&menuNo=" + menuNo + "&menuName=" + menuName;			
				} else {
					
				}
			});
		
		});
		
	</script>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/addMenuGroup.css">

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
        			<div class="content_title"><span class="prev_tap"><a class="prev_tap" href="/manageMenuFrm.do">메뉴관리</a> ></span> 메뉴편집</div>
        			<div class="content_div_area">
        				<div class="content_div_content">
        					<div class="content_div_info">
        						<div class="content_div_opt1 overflow-text">메뉴그룹</div>
        						<div class="content_div_opt2">메뉴그룹 삭제</div>
        						<div class="content_div_opt3">메뉴관리</div>
        					</div>
        					<c:if test="${not empty list }">
        						<table class="content_div_table">
	        						<c:forEach items="${list }" var="mg">
										<tr class="table_tr_height">
											<td><div class="content_div_opt1" style="color: #333">${mg.groupName }</div></td>
											<td>
												<div class="content_div_opt2">
													<input type="hidden" name="storeNo" value="${mg.storeNo }">
													<input type="hidden" name="groupNo" value="${mg.groupNo }">
													
													<span class="delMenuGroup" style="color: #f45452;">삭제</span>	
												</div>
											</td>
											<td>
												<div class="content_div_opt3">
													<a href="/addMenuFrm.do?groupNo=${mg.groupNo }&storeNo=${mg.storeNo }" style="color: #9ac6e8;">관리</a>
													
												</div>
											</td>
										</tr>
										
										
										
										
									</c:forEach>        						
        						</table>
        					</c:if>
        					
        					<button class="add_menugroup_btn" data-toggle="modal" data-target="#modal1">+ 메뉴그룹 추가하기</button>
        					
        				</div>
        			</div>
        		</div>
        	</div> <!-- main content -->
        </div> <!-- main field -->
        
        <!-- 메뉴그룹 추가 모달 -->
        <div class="modal" id="modal1" style="margin-top: 200px;">
		  	<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		    	<form action="/addMenuGroup.do" method="get">
			      	<div class="modal-header">
			        	<h5 class="modal-title"><span class="add_menugroup_title">메뉴그룹 추가</span></h5>
			        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			          	<span aria-hidden="true"></span>
			        	</button>
			      	</div>
		      		<div class="modal-body">
  						<div class="form_opt">
  							<div class="form_opt_title">메뉴그룹명</div>
  							<input type="hidden" id="storeNo" name="storeNo" value="${storeNo }">
							<input class="form-control" id="groupName" name="groupName" type="text" placeholder="영문 또는 한글 시작, 특수문자(&, /) 사용 가능" maxlength="20">
  						</div>
		      		</div>
			      	<div class="modal-footer">
			        	<button type="submit" class="btn btn-primary btn-100" id="addMenuGroup">추가</button>
			      	</div>
		      	</form>
		    	</div>
		  	</div>
		</div>
				
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function() {
		
			var menuGroupChk = false;
			
			$(".add_menugroup_btn").click(function(e) {
				e.preventDefault();
				$("#modal1").modal("show");
			});
			
			$(".btn-close").click(function() {
				$("#groupName").val("");
			});
			
			$("#addMenuGroup").on("click", function() {
				return checkMenuGroup();
			});
			
			function checkMenuGroup() {
				var groupName = $("#groupName").val();
				
				if (groupName == "" || menuGroupChk == false) {
    				alert("메뉴그룹명을 확인하세요.");
    				return false;
    			} else {
 					return true;
    			}
			}
			
			$("#groupName").on("keyup", function() {
    			var groupName = $(this).val();
    			var groupNameReg = /^[a-zA-Z가-힣][0-9a-zA-Z가-힣&/\s]{1,20}$/;
    			if (groupNameReg.test(groupName)) {
    				menuGroupChk = true;
				} else {
					menuGroupChk = false;
    			}
    		});
			
			$(".delMenuGroup").click(function(e) {
				e.preventDefault();
				var del_ans = confirm("메뉴그룹 삭제 시, 등록된 메뉴도 함께 삭제됩니다. 삭제하시겠습니까?");
				var storeNo = $(this).prev().prev().val();
				var groupNo = $(this).prev().val();
				if (del_ans == true) {
					location.href="/deleteMenuGroup.do?storeNo=" + storeNo + "&groupNo=" + groupNo;			
				} else {
					
				}
			});
		
		});
		
	</script>
</div>
</body>
</html>
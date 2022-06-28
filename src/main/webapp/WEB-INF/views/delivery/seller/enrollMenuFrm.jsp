<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/enrollMenu.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
        				</span> ${groupName }
        			</div>
        			<div class="content_div_area">
        				<div class="content_div_div">
        					<div class="content_div_content">
        						<div class="content_div_div_content">
        							<div class="content_div_info">
        								<div class="content_div_title" style="font-weight: bold">메뉴 정보 등록</div>
        								<div class="content_div_end"></div>
        								<br>
        								<div class="container2">
	        								<form action="/addMenu.do" method="post" enctype="multipart/form-data">
	        								<input type="hidden" name="groupNo" value="${groupNo }">
	        								<input type="hidden" name="storeNo" value="${storeNo }">
	        									<fieldset>
		        									
		        									<span class="info_span">메뉴 정보</span>
		        									<hr>
		        									
												    <div class="row">
														<label for="menuName" class="col-2 col-form-label">메뉴명</label>
														<div class="col-5">
															<input type="text" class="form-control" id="menuName"
																name="menuName" placeholder="메뉴명을 입력하세요." maxlength="20">
														</div>
														<div class="col-4">
															<span class="span_chk" id="menuNameChk"></span>
														</div>
													</div>
	        										<br>
	        										
	        										<div class="row">
														<label for="menuContent" class="col-2 col-form-label">메뉴설명</label>
														<div class="col-10">
															<textarea class="form-control" name="menuContent"
																id="menuContent" rows="4" placeholder="메뉴설명을 입력하세요."></textarea>
														</div>
													</div>
													<br>
	        										
	        										<div class="row">
	        											<label for="menuPrice" class="col-2 col-form-label">가격</label>
	        											<div class="col-5">
	        												<input type="text" class="form-control" id="menuPrice"
	        											 		name="menuPrice" placeholder="가격을 입력하세요." maxlength="6">
	        											</div>
	        											<div class="col-4">
															<span class="span_chk" id="menuPriceChk"></span>
														</div>
	        										</div>
	        										<br>
													
													<div class="row">
														<label class="col-2 col-form-label">메뉴 이미지</label>
														<div class="col-8"> 
															<label for="formFile" class="btn btn-primary add_margin" style="width: 70px;">찾기</label>
															<input class="form-control" type="file" name="files" id="formFile" accept=".gif, .jpg, .jpeg, .png" style="display:none;">
															<div class="logo_img" style="height: 150px;"></div>
														</div>
													</div>
													<br>

													<br><br>
	        									
	        									</fieldset>
	        									
	        									<div class="row">
		        									<a class="cart_btn" style="font-weight: 400; margin-left:200px;" href="/addMenuFrm.do?groupNo=${groupNo }&storeNo=${storeNo }">취소</a>
		        									<div class="col-md-auto"> </div>
		        									<input type="submit" style="font-weight: 400; margin-right:200px;" class="buy_btn" id="enrollsubmit" value="등록">	        									
	        									</div>
	        								</form>
        								
        								</div>
        							</div>
        							<br>
        							<div class="content_div_end"></div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div> <!-- main content -->
        </div> <!-- main field -->
    <script>
    	$(function() {
    		
    		var menuNameChk = false;
    		var menuPriceChk = false;
	
    		
    		$("input[name=files]").on("change", function() {
    			var fileVal = $(this).val();
    			var pathPoint = fileVal.lastIndexOf('.');
    			var filePoint = fileVal.substring(pathPoint+1, this.length);
    			var fileType = filePoint.toLowerCase();
    			var fileSize = 10 * 1024 * 1024; // 10메가
    			if (fileType == 'jpg' || fileType == 'png' || fileType == 'jpeg' || fileType == 'gif') {
    				var uploadFileSize = this.files[0].size;
    				if (uploadFileSize > fileSize) {
    					alert("용량은 10MB 이하로 가능합니다.");
    					$(this).val("");
    				}
    			} else if (fileVal == "") {
    				
    			} else {
    				alert("이미지 파일만 가능합니다.");
    				$(this).val("");
    			}
    			loadImg(this);
    		});
    		
    		function loadImg(obj) {
    			var files = obj.files;
    			var divTag = document.querySelector(".logo_img");
    			if (files.length != 0) {
    				var reader = new FileReader();
    				reader.readAsDataURL(files[0]);
    				reader.onload = function(e) {
    					var imgTag = document.createElement("img");
    					imgTag.setAttribute("src", e.target.result)
    					divTag.innerHTML = "";
    					divTag.appendChild(imgTag);
    				}
    			} else {
    				divTag.innerHTML = "";
    			}
    		}
    		
    		
    		$("#enrollsubmit").on("click", function() {
    			return checkAddMenu();
    		});
    		
    		function checkAddMenu() {
    			var menuName = $("#menuName").val();
    			var menuContent = $("#menuContent").val();
    			var menuPrice = $("#menuPrice").val();
    			var files = $("input[name=files]").val();
    			
    			if (menuName == "" || menuNameChk == false) {
    				alert("메뉴명을 확인하세요.");
    				return false;
    			} else if (menuContent == "") {
    				alert("메뉴설명을 확인하세요.");
    				return false;
    			} else if (menuPrice == "" || menuPriceChk == false) {
    				alert("금액을 확인하세요.");
    				return false;
    			} else if (files == "") {
    				alert("메뉴 이미지를 선택하세요.");
    				return false;
    			} else {
    				return true;
    			}
    		}
    		
    		$("#menuName").on("keyup", function() {
    			var menuName = $(this).val();
    			var menuNameReg = /^[0-9a-zA-Z가-힣][0-9a-zA-Z가-힣\s]{1,20}$/;
    			if (menuNameReg.test(menuName)) {
    				$.ajax({
    					url : "/menuNameCheck.do",
    					data : {menuName : menuName},
    					type : "post",
    					success : function(data) {
    						if (data == 0) {
    							$("#menuNameChk").html("");
    							/*
    							$("#marketNameChk").html("사용 가능한 메뉴명입니다.");
    							$("#marketNameChk").css("color", "#9ac6e8");
    							*/
    							menuNameChk = true;
    						} else if (data == 1) {
    							$("#marketNameChk").html("사용중인 메뉴명입니다.");
    							$("#marketNameChk").css("color", "red");
    							menuNameChk = false;
    						}
    					}
    				});
    			} else {
    				$("#menuNameChk").html("다시 입력해주세요.")
    				$("#menuNameChk").css("color", "red");
    				menuNameChk = false;
    			}
    		});
    		
    		$("#menuPrice").on("keyup", function() {
    			var menuPrice = $(this).val();
    			var menuPriceReg = /^[1-9][0-9]{2,6}$/;
    			if (menuPriceReg.test(menuPrice)) {
    				$("#menuPriceChk").html("");
					/*
    				$("#menuPriceChk").html("사용 가능");
					$("#menuPriceChk").css("color", "#9ac6e8");
					*/
    				menuPriceChk = true;
				} else {
					$("#menuPriceChk").html("100원 이상 입력해주세요.");
					$("#menuPriceChk").css("color", "red");
					menuPriceChk = false;
    			}
    		});
    		
    	});
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>
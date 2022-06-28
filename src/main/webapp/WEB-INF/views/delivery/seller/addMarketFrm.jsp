<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliverySeller/addMarket.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a332b607a0069f2456286f6df7d82ed7&libraries=services"></script>

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
        				<div class="content_div_div">
        					<div class="content_div_content">
        						<div class="content_div_div_content">
        							<div class="content_div_info">
        								<div class="content_div_title" style="font-weight: bold">매장 정보 등록</div>
        								<div class="content_div_end"></div>
        								<br>
        								<div class="container2">
	        								<form action="/addMarket.do" method="post" enctype="multipart/form-data">
	        								<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
	        									<fieldset>
		        									
		        									<span class="info_span">필수 정보</span>
		        									<hr>
		        									
												    <div class="row">
														<label for="storeName" class="col-2 col-form-label">상호명</label>
														<div class="col-5">
															<input type="text" class="form-control" id="storeName"
																name="storeName" placeholder="상호명을 입력하세요." maxlength="20">
														</div>
														<div class="col-4">
															<span class="span_chk" id="marketNameChk"></span>
														</div>
													</div>
	        										<br>
	        										
	        										<div class="row">
														<label for="storeTime" class="col-2 col-form-label">운영시간</label>
														<div class="col-10">
															<textarea class="form-control" name="storeTime"
																id="storeTime" rows="4" placeholder="운영시간을 입력하세요."></textarea>
														</div>
													</div>
													<br>
	        										
	        										<div class="row">
	        											<label for="storePhone" class="col-2 col-form-label">전화번호</label>
	        											<div class="col-5">
	        												<input type="text" class="form-control" id="storePhone"
	        											 		name="storePhone" placeholder="전화번호를 입력하세요. (- 제외)" maxlength="11">
	        											</div>
	        											<div class="col-4">
															<span class="span_chk" id="marketPhoneChk"></span>
														</div>
	        										</div>
	        										<br>
	        										
	        										<div class="row">
	        											<label for="minPrice" class="col-2 col-form-label">배달비</label>
	        											<div class="col-5">
	        												<input type="text" class="form-control" id="minPrice"
	        											 		name="minPrice" placeholder="배달비를 입력하세요." maxlength="5">
	        											</div>
	        											<div class="col-4">
															<span class="span_chk" id="minPriceChk"></span>
														</div>
	        										</div>
	        										<br>
	        										
	        										<div class="row">
	        											<label class="col-2 col-form-label">주소입력</label>
	        											<div class="col-4">
															<input type="text" name="postcode" id="postcode" class="form-control add_margin" readonly placeholder="우편번호">
	        											</div>
	        											<div class="col-2" style="padding: 0;">
															<button type="button" class="btn btn-primary" id="findpostcode" style="width: 70px;">찾기</button>	        											
	        											</div>
	        										</div>
	        										
	        										
	        										<div class="row">
														<label class="col-2 col-form-label"> </label>
														<div class="col-8">
															<input type="text" name="address1" id="address1" class="form-control add_margin" readonly placeholder="주소">			
														</div>
													</div>
										
													<div class="row">
														<label class="col-2 col-form-label"> </label>
														<div class="col-8">
															<input type="text" name="address2" id="address2" class="form-control add_margin" placeholder="상세주소" maxlength="40">														
														</div>
													</div>
	        										<br>
	        										
													<input type="hidden" id="x" name="x" value="">
													<input type="hidden" id="y" name="y" value="">
													<div id="map" style="display: none;"></div>
													<div id="coordXY" style="display: none;"></div>
	        										
													<div class="row">
														<label for="originInfo" class="col-2 col-form-label">원산지 정보</label>
														<div class="col-10">
															<textarea class="form-control" name="originInfo"
																id="originInfo" rows="4" placeholder="재료명: 원산지 (돼지고기: 국내산, 닭고기: 브라질산)"></textarea>
														</div>
													</div>
													<br>
													
													<div class="row">
														<label class="col-2 col-form-label">카테고리</label>
														<div class="col-3">
															<select id="category1" name="category1" class="form-select add_margin" >
											                    <option value="한식">한식</option>
											                    <option value="치킨">치킨</option>
											                    <option value="분식">분식</option>
											                    <option value="돈까스/회/일식">돈까스/회/일식</option>
											                    <option value="족발/보쌈">족발/보쌈</option>
											                    <option value="피자">피자</option>
											                    <option value="중식">중식</option>
											                    <option value="양식">양식</option>
											                    <option value="카페/디저트">카페/디저트</option>
											                    <option value="버거">버거</option>
											        		</select>
											        		<select id="category2" name="category2" class="form-select">
													        	<option value="" selected disabled>추가 선택</option>
													        </select>
											        	</div>
											        </div>
											        <br>
													
													<div class="row">
														<label class="col-2 col-form-label">매장 로고</label>
														<div class="col-8"> 
															<label for="formFile" class="btn btn-primary add_margin" style="width: 70px;">찾기</label>
															<input class="form-control" type="file" name="files" id="formFile" accept=".gif, .jpg, .jpeg, .png" style="display:none;">
															<div class="logo_img" style="height: 150px;"></div>
														</div>
													</div>
													<br>
												
	        										<br>
	        										<span class="info_span">선택 정보</span>
		        									<hr>
	        										
	        										<div class="row">
														<label for="storeInfo" class="col-2 col-form-label">매장소개</label>
														<div class="col-10">
															<textarea class="form-control" name="storeInfo"
																id="storeInfo" rows="4" placeholder="매장 소개를 입력하세요."></textarea>
														</div>
													</div>
													<br>
													
													<div class="row">
														<label for="storeNotice" class="col-2 col-form-label">공지사항</label>
														<div class="col-10">
															<textarea class="form-control" name="storeNotice"
																id="storeNotice" rows="4" placeholder="공지사항을 입력하세요."></textarea>
														</div>
													</div>
													<br>
													
													<div class="row">
														<label for="storeTip" class="col-2 col-form-label">팁/안내</label>
														<div class="col-10">
															<textarea class="form-control" name="storeTip"
																id="storeTip" rows="4" placeholder="팁 또는 안내 내용을 입력하세요."></textarea>
														</div>
													</div>
													<br><br>
	        									
	        									</fieldset>
	        									
	        									<div class="row">
		        									<a class="cart_btn" style="font-weight: 400; margin-left:200px;" href="/manageMarketFrm.do">취소</a>
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
    		
    		var storeNameChk = false;
    		var storePhoneChk = false;
    		var minPriceChk = false;
    		var address2Chk = false;
    		
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
    		
    		
    		$("#address2").on("focus", function() {
    			return addressChk();
    		});
    		
    		
    		var address = document.getElementById("address1");
    		var mapContainer = document.getElementById("map");
    		var coordXY = document.getElementById("coordXY");
    		var mapOption;
    		var map;
    		var x,y = "";

    		if (address.value == "") {
				mapOption = {
					center: new daum.maps.LatLng(37.5339937455272, 126.89698912697732), // 임의의 지도 중심좌표
    		        level: 4 // 지도의 확대 레벨
				};
    		}

    		map = new daum.maps.Map(mapContainer, mapOption); // 지도 생성

    		function addressChk() {
				var gap = address.value; // 주소검색어
				if (gap == "") {
					address.focus();
		  			return;
		 		}
    		 
				// 주소-좌표 변환 객체를 생성
				var geocoder = new daum.maps.services.Geocoder();
	
				// 주소로 좌표를 검색
	    		geocoder.addressSearch(gap, function(result, status) {
	    		  
		    		// 정상적으로 검색이 완료됐으면,
		    		if (status == daum.maps.services.Status.OK) {
		    		   var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		    		   y = result[0].x;
		    		   x = result[0].y;
		
		    		   // 결과값으로 받은 위치를 마커로 표시
		    		   var marker = new daum.maps.Marker({
		    			   map: map,
		    			   position: coords
		    		   });
		   
		    		   // 지도 중심을 이동
		    		   map.setCenter(coords);
		
		    		   coordXY.innerHTML = "<br>X좌표 : " + x + "<br><br>Y좌표 : " + y;
		    		   var x1 = $("#x");
		    		   var y1 = $("#y");
		    		   x1.val(x);
		    		   y1.val(y);
		    		   console.log(x);
		    		   console.log(y);
		    		}
		    	});
    		}
    		
    		$("#category1").on("change", function() {
    			$(this).next().empty();
    			$(this).next().append("<option value='' selected>선택하지 않음</option>");
    			$(this).next().append("<option value='1인분'>1인분</option>");
    			$(this).next().append("<option value='프랜차이즈'>프랜차이즈</option>");
   		    });
    		
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
    			return checkAddMarket();
    		});
    		
    		function checkAddMarket() {
    			var storeName = $("#storeName").val();
    			var storeTime = $("#storeTime").val();
    			var storePhone = $("#storePhone").val();
    			var minPrice = $("#minPrice").val();
    			var postcode = $("#postcode").val();
    			var address1 = $("#address1").val();
    			var address2 = $("#address2").val();
    			var originInfo = $("#originInfo").val();
    			var category1 = $("#category1").val();
    			var files = $("input[name=files]").val();
    			
    			if (storeName == "" || storeNameChk == false) {
    				alert("상호명을 확인하세요.");
    				return false;
    			} else if (storeTime == "") {
    				alert("운영시간을 확인하세요.");
    				return false;
    			} else if (storePhone == "" || storePhoneChk == false) {
    				alert("전화번호를 확인하세요.");
    				return false;
    			} else if (minPrice == "" || minPriceChk == false) {
    				alert("배달비를 확인하세요.");
    				return false;
    			} else if (postcode == "" || address1 == "" || address2 == "" || address2Chk == false) {
    				alert("주소를 확인하세요.");
    				return false;
    			} else if (originInfo == "") {
    				alert("원산지 정보를 확인하세요.");
    				return false;
    			} else if (category1 == null) {
    				alert("카테고리를 확인하세요.");
    				return false;
    			} else if (files == "") {
    				alert("매장 로고를 선택하세요.");
    				return false;
    			} else {
    				return true;
    			}
    		}
    		
    		$("#storeName").on("keyup", function() {
    			var storeName = $(this).val();
    			var storeNameReg = /^[0-9a-zA-Z가-힣][0-9a-zA-Z가-힣\s]{1,20}$/;
    			if (storeNameReg.test(storeName)) {
    				$.ajax({
    					url : "/storeNameCheck.do",
    					data : {storeName : storeName},
    					type : "post",
    					success : function(data) {
    						if (data == 0) {
    							$("#marketNameChk").html("");
    							/*
    							$("#marketNameChk").html("사용 가능한 상호명입니다.");
    							$("#marketNameChk").css("color", "#9ac6e8");
    							*/
    							storeNameChk = true;
    						} else if (data == 1) {
    							$("#marketNameChk").html("사용중인 상호명입니다.");
    							$("#marketNameChk").css("color", "red");
    							storeNameChk = false;
    						}
    					}
    				});
    			} else {
    				$("#marketNameChk").html("다시 입력해주세요.")
    				$("#marketNameChk").css("color", "red");
    				storeNameChk = false;
    			}
    		});
    		
    		$("#storePhone").on("keyup", function() {
    			var storePhone = $(this).val();
    			var storePhoneReg = /^[0-9]{10,11}$/;
    			if (storePhoneReg.test(storePhone)) {
    				$.ajax({
    					url : "/storePhoneCheck.do",
    					data : {storePhone : storePhone},
    					type : "post",
    					success : function(data) {
    						if (data == 0) {
    							$("#marketPhoneChk").html("");
    							/*
    							$("#marketPhoneChk").html("사용 가능한 전화번호입니다.");
    							$("#marketPhoneChk").css("color", "#9ac6e8");
    							*/
    							storePhoneChk = true;
    						} else if (data == 1) {
    							$("#marketPhoneChk").html("사용중인 전화번호입니다.");
    							$("#marketPhoneChk").css("color", "red");
    							storePhoneChk = false;
    						}
    					}
    				});
    			} else {
    				$("#marketPhoneChk").html("다시 입력해주세요.")
    				$("#marketPhoneChk").css("color", "red");
    				storePhoneChk = false;
    			}
    		});
    		
    		$("#minPrice").on("keyup", function() {
    			var minPrice = $(this).val();
    			var minPriceReg = /^[1-9][0-9]{3,4}$/;
    			if (minPriceReg.test(minPrice)) {
    				$("#minPriceChk").html("");
					/*
    				$("#minPriceChk").html("사용 가능");
					$("#minPriceChk").css("color", "#9ac6e8");
					*/
    				minPriceChk = true;
				} else {
					$("#minPriceChk").html("1,000원 이상 입력해주세요.");
					$("#minPriceChk").css("color", "red");
					minPriceChk = false;
    			}
    		});
    		
    		$("#address2").on("keyup", function() {
    			var address2 = $(this).val();
    			var address2Reg = /^[0-9a-zA-Z가-힣][0-9a-zA-Z가-힣\s]{1,40}$/;
    			if (address2Reg.test(address2)) {
    				address2Chk = true;
				} else {
					address2Chk = false;
    			}
    		});
    		
    	});
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>
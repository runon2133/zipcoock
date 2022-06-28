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
<link rel="stylesheet" href="/resources/css/deliverySeller/marketView.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- naver maps api -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j1crffrgk5"></script>
<meta charset="UTF-8">

<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx00134e08007f4fcbabe5706db62ea793"></script>

</head>
<body>
<div class="s-wrapper">
	<jsp:include page="/WEB-INF/views/common/deliveryHeader.jsp" />
		<div class="main_field" style="background-color: #fff">        	
        	<div class="main_content2">
        		<div class="main_left">
        			<section class="iBMwaq">
        				<div class="kQdztO">
        					<c:forEach items="${zs.list }" var="f">
								<div class="logo_div"><img class="logo_img" src='/resources/upload/zcdSeller/${f.filename }'></div>
							</c:forEach>
        				</div>
        			</section>
        			<div class="gEhAFQ">
        				<ul class="nav nav-tabs">
						  <li class="nav-item">
						    <a class="nav-link active" data-bs-toggle="tab" href="#menu">메뉴</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-bs-toggle="tab" href="#review">리뷰</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link map-open" data-bs-toggle="tab" href="#info">매장 정보</a>
						    <input type="hidden" id="x" value="${zs.x }">
						    <input type="hidden" id="y" value="${zs.y }">
						  </li>
						</ul>
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade active show" id="menu">
						    <c:if test="${not empty menuGrouplist }">
						    	<c:forEach items="${menuGrouplist }" var="mg">
									<div class="card">
										<div class="card-header" style="font-weight: 600;">${mg.groupName }</div>
											<c:if test="${not empty menulist }">
												<c:forEach items="${menulist }" var="ml">
													<c:if test="${mg.groupNo eq ml.groupNo }">
														<div class="menu_div gjcLUR popupBtn">
															
															<div class="menuImg_div"><img class="menu_img" src='/resources/upload/zcdSeller/${ml.filename }'></div>
															<input id="menuNo" type="hidden" value="${ml.menuNo }">
															<input id="storeNo" type="hidden" value="${zs.storeNo }">
															<div class="menu_name cQHmLv">
																<div style="font-weight: 600;">${ml.menuName }</div>
																<div><fmt:formatNumber value="${ml.menuPrice }" pattern="#,###" /> 원</div>															
															</div>
															
														</div>
													</c:if>
												</c:forEach>
											</c:if> 
									</div>
								</c:forEach>
						    </c:if>
						    <p></p>
						  </div>
						  <div class="tab-pane fade" id="review">
						    
						    <c:if test="${not empty zrlist }">
												<c:forEach items="${zrlist }" var="zr">
													<div class="card">
														<h6 class="card-header" style="font-weight: 600;">작성자 : *** <span style="font-size: 14px; font-weight: 500;"> ${zr.reviewDate }</span></h6>
														
														<div class="card-body">
															<div class="card_info">${zr.reviewContent }</div>
														</div>
															
														<c:forEach items="${rclist }" var="rc">
															<c:if test="${zr.reviewNo eq rc.reviewNo}">
																<div style="padding: 0.8rem 1rem; margin: 10px; border: 1px solid #ccc;">
																		<div style="font-weight: 600;">사장님 <span style="font-size: 14px; font-weight: 500;"> ${rc.commentDate }</span></div><br>
																		<div class="card_info">${rc.commentContent }</div>																		
																</div>
															</c:if>		
														</c:forEach>
													</div>
												</c:forEach>
											</c:if> 
						    
						  </div>
						  
						  <div class="tab-pane fade" id="info">
						    	
						    	<div id="map" style="width: 660px; height: 400px;"></div>
						    	<br>
						    	<div class="card">
									  <h6 class="card-header" style="font-weight: 600;">매장정보</h6>
									  <div class="card-body">
									  	<div class="card_info">매장명 : ${zs.storeName }</div>
									    <div class="card_info">전화번호 : ${zs.storePhone }</div>
									    <div class="card_info">주소 : ${zs.address1 } ${zs.address2 }</div>
									    <div class="card_info">대표자명 : ${sellerName }</div>
									    <div class="card_info">사업자등록번호 : ${businessNo }</div>
									  </div>		  
								</div>
								<div class="card">
									  <h6 class="card-header" style="font-weight: 600;">영업시간</h6>
									  <div class="card-body">
									  	<div class="card_info">${zs.storeTime }</div>
									  </div>		  
								</div>
								<div class="card">
									  <h6 class="card-header" style="font-weight: 600;">매장소개</h6>
									  <div class="card-body">
									  	<div class="card_info">${zs.storeInfo }</div>
									  </div>		  
								</div>
								<div class="card">
									  <h6 class="card-header" style="font-weight: 600;">공지사항</h6>
									  <div class="card-body">
									  	<div class="card_info">${zs.storeNotice }</div>
									  </div>		  
								</div>
								<div class="card">
									  <h6 class="card-header" style="font-weight: 600;">팁 / 안내사항</h6>
									  <div class="card-body">
									  	<div class="card_info">${zs.storeTip }</div>
									  </div>		  
								</div>
								<div class="card">
									  <h6 class="card-header" style="font-weight: 600;">원산지 정보</h6>
									  <div class="card-body">
									  	<div class="card_info">${zs.originInfo }</div>
									  </div>		  
								</div>
						  </div>
						</div>
        			</div>
        		</div>
        		<div class="main_right">
        			<section class="kImnZs">
        				<div class="iIpQyh">
	        				<div class="ekSBjK">${zs.storeName }</div>
	        			</div>
	        			<div class="fDZBJF">
	        				<div class="ezeJar" style="font-size: 16px;"> · 주문 배달비</div>
	        				<span class="iNKAwY" style="font-size: 16px; font-weight: 500;"><fmt:formatNumber value="${zs.minPrice }" pattern="#,###" /> 원</span>
	        			</div>
        			</section>
	        		<section class="bMCyww">
	        			<!-- 
	        			<div class="gjcLUR">
	        				<span class="hwbCCJ">총 주문금액</span>
	        				<div class="cQHmLv"><span class="element"><fmt:formatNumber value="0" pattern="#,###" /> 원</span></div>
	        			</div>
	        			-->
		        		<div class="isPSSz">
		        			<!-- <button class="KZVRS"><span class="likeButton">♡</span></button> -->
		        			<button class="hYJzRO jdSXaC">장바구니 보기</button>
		        		</div>
	        		</section>
        		</div>
        		        		
        		
        	</div> <!-- main content -->
        </div> <!-- main field -->
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function() {
			
			var x = $("#x").val();
			var y = $("#y").val();
			
			var map = new naver.maps.Map('map', {
			    center: new naver.maps.LatLng(x, y),
			    zoom: 18,
			    zoomControl: true, //줌 컨트롤의 표시 여부
			    zoomControlOptions: {
		            style: naver.maps.ZoomControlStyle.SMALL,
		            position: naver.maps.Position.TOP_RIGHT
		        }
			});

			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(x, y),
			    map: map
			});
			
			
			$(".likeButton").click(function() {
				var isLiked = $(".likeButton").hasClass("liked");
				$(".likeButton").toggleClass("liked");

			});
			
			
			var formObj = $("form[role='form']");

		    $('.popupBtn').on("click", function() {
		        var menuNo = $(this).children().eq(1).val(); //화면의 파라미터 가져오기
		        var storeNo = $(this).children().eq(2).val();
		  		window.open("/menuPopup.do?menuNo="+menuNo+"&storeNo="+storeNo,"_blank","scrollbars=yes,left=700,top=200,width=460,height=600").focus();
		    });
		    
		
		});
		
	</script>
</div>
</body>
</html>
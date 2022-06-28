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
<body onload="initTmap();">
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
						    <p>리뷰</p>
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
	        				<div class="ezeJar"> · 최소주문금액</div>
	        				<span class="iNKAwY"><fmt:formatNumber value="${zs.minPrice }" pattern="#,###" /> 원 이상
	        				<span style="font-weight: 500;">구매 시 주문 가능</span>
	        				</span>
	        			</div>
        			</section>
	        		<section class="bMCyww">
	        			<div class="gjcLUR">
	        				<span class="hwbCCJ">총 주문금액</span>
	        				<div class="cQHmLv"><span class="element"><fmt:formatNumber value="0" pattern="#,###" /> 원</span></div>
	        			</div>
		        		<div class="isPSSz">
		        			<button class="KZVRS"><span class="likeButton">♡</span></button>
		        			<button class="hYJzRO jdSXaC">장바구니 보기</button>
		        		</div>
	        		</section>
        		</div>
        		        		
        		
        	</div> <!-- main content -->
        </div> <!-- main field -->
		

		<div class="ft_area">
			<div class="ft_select_wrap">
				<div class="ft_select">
					<select id="selectLevel">
						<option value="0" selected="selected">교통최적+추천</option>
						<option value="1">교통최적+무료우선</option>
						<option value="2">교통최적+최소시간</option>
						<option value="3">교통최적+초보</option>
						<option value="4">교통최적+고속도로우선</option>
						<option value="10">최단거리+유/무료</option>
						<option value="12">이륜차도로우선</option>
						<option value="19">교통최적+어린이보호구역 회피</option>
					</select> <select id="year">
						<option value="N" selected="selected">교통정보 표출 옵션</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
					<button id="btn_select">적용하기</button>
				</div>
			</div>
			<div class="map_act_btn_wrap clear_box"></div>
			<div class="clear"></div>
		</div>
	
		<div id="map_wrap" class="map_wrap">
			<div id="map_div"></div>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		<p id="result"></p>
		<br />
		
		
		
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
		  		window.open("/menuPopup.do?menuNo="+menuNo,"_blank","scrollbars=yes,left=700,top=200,width=460,height=600").focus();
		    });
		    
		
		});
		
	</script>
	
	
	<script type="text/javascript">
			var map;
			var markerInfo;
			//출발지,도착지 마커
			var marker_s, marker_e, marker_p;
			//경로그림정보
			var drawInfoArr = [];
			var drawInfoArr2 = [];
		
			var chktraffic = [];
			var resultdrawArr = [];
			var resultMarkerArr = [];
		
			function initTmap() {
				// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(37.51845764080273, 126.88828604335164),
					width : "100%",
					height : "400px",
					zoom : 11,
					zoomControl : true,
					scrollwheel : true
				});
		
				// 2. 시작, 도착 심볼찍기
				// 시작
				marker_s = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(37.51845764080273, 126.88828604335164),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});
		
				//도착
				marker_e = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(37.5268554005838, 126.89165247885224),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});
		
				// 3. 경로탐색 API 사용요청
				$("#btn_select")
						.click(
								function() {
		
									//기존 맵에 있던 정보들 초기화
									resettingMap();
		
									var searchOption = $("#selectLevel").val();
		
									var trafficInfochk = $("#year").val();
		
									//JSON TYPE EDIT [S]
									$
											.ajax({
												type : "POST",
												url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
												async : false,
												data : {
													"appKey" : "l7xx00134e08007f4fcbabe5706db62ea793",
													"startX" : "126.88828604335164",
													"startY" : "37.51845764080273",
													"endX" : "126.89169539419491",
													"endY" : "37.5268554005838",
													"reqCoordType" : "WGS84GEO",
													"resCoordType" : "EPSG3857",
													"searchOption" : searchOption,
													"trafficInfo" : trafficInfochk
												},
												success : function(response) {
		
													var resultData = response.features;
		
													var tDistance = "총 거리 : "
															+ (resultData[0].properties.totalDistance / 1000)
																	.toFixed(1) + "km,";
													var tTime = " 총 시간 : "
															+ (resultData[0].properties.totalTime / 60)
																	.toFixed(0) + "분,";
													var tFare = " 총 요금 : "
															+ resultData[0].properties.totalFare
															+ "원,";
													var taxiFare = " 예상 택시 요금 : "
															+ resultData[0].properties.taxiFare
															+ "원";
		
													$("#result").text(
															tDistance + tTime + tFare
																	+ taxiFare);
		
													//교통정보 표출 옵션값을 체크
													if (trafficInfochk == "Y") {
														for ( var i in resultData) { //for문 [S]
															var geometry = resultData[i].geometry;
															var properties = resultData[i].properties;
		
															if (geometry.type == "LineString") {
																//교통 정보도 담음
																chktraffic
																		.push(geometry.traffic);
																var sectionInfos = [];
																var trafficArr = geometry.traffic;
		
																for ( var j in geometry.coordinates) {
																	// 경로들의 결과값들을 포인트 객체로 변환 
																	var latlng = new Tmapv2.Point(
																			geometry.coordinates[j][0],
																			geometry.coordinates[j][1]);
																	// 포인트 객체를 받아 좌표값으로 변환
																	var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																			latlng);
		
																	sectionInfos
																			.push(convertPoint);
																}
		
																drawLine(sectionInfos,
																		trafficArr);
															} else {
		
																var markerImg = "";
																var pType = "";
		
																if (properties.pointType == "S") { //출발지 마커
																	markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
																	pType = "S";
																} else if (properties.pointType == "E") { //도착지 마커
																	markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
																	pType = "E";
																} else { //각 포인트 마커
																	markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
																	pType = "P"
																}
		
																// 경로들의 결과값들을 포인트 객체로 변환 
																var latlon = new Tmapv2.Point(
																		geometry.coordinates[0],
																		geometry.coordinates[1]);
																// 포인트 객체를 받아 좌표값으로 다시 변환
																var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																		latlon);
		
																var routeInfoObj = {
																	markerImage : markerImg,
																	lng : convertPoint._lng,
																	lat : convertPoint._lat,
																	pointType : pType
																};
																// 마커 추가
																addMarkers(routeInfoObj);
															}
														}//for문 [E]
		
													} else {
		
														for ( var i in resultData) { //for문 [S]
															var geometry = resultData[i].geometry;
															var properties = resultData[i].properties;
		
															if (geometry.type == "LineString") {
																for ( var j in geometry.coordinates) {
																	// 경로들의 결과값들을 포인트 객체로 변환 
																	var latlng = new Tmapv2.Point(
																			geometry.coordinates[j][0],
																			geometry.coordinates[j][1]);
																	// 포인트 객체를 받아 좌표값으로 변환
																	var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																			latlng);
																	// 포인트객체의 정보로 좌표값 변환 객체로 저장
																	var convertChange = new Tmapv2.LatLng(
																			convertPoint._lat,
																			convertPoint._lng);
																	// 배열에 담기
																	drawInfoArr
																			.push(convertChange);
																}
																drawLine(drawInfoArr,
																		"0");
															} else {
		
																var markerImg = "";
																var pType = "";
		
																if (properties.pointType == "S") { //출발지 마커
																	markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
																	pType = "S";
																} else if (properties.pointType == "E") { //도착지 마커
																	markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
																	pType = "E";
																} else { //각 포인트 마커
																	markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
																	pType = "P"
																}
		
																// 경로들의 결과값들을 포인트 객체로 변환 
																var latlon = new Tmapv2.Point(
																		geometry.coordinates[0],
																		geometry.coordinates[1]);
																// 포인트 객체를 받아 좌표값으로 다시 변환
																var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																		latlon);
		
																var routeInfoObj = {
																	markerImage : markerImg,
																	lng : convertPoint._lng,
																	lat : convertPoint._lat,
																	pointType : pType
																};
		
																// Marker 추가
																addMarkers(routeInfoObj);
															}
														}//for문 [E]
													}
												},
												error : function(request, status, error) {
													console.log("code:"
															+ request.status + "\n"
															+ "message:"
															+ request.responseText
															+ "\n" + "error:" + error);
												}
											});
									//JSON TYPE EDIT [E]
								});
			}
		
			function addComma(num) {
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
		
			//마커 생성하기
			function addMarkers(infoObj) {
				var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.
		
				if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
					size = new Tmapv2.Size(8, 8);
				}
		
				marker_p = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
					icon : infoObj.markerImage,
					iconSize : size,
					map : map
				});
		
				resultMarkerArr.push(marker_p);
			}
		
			//라인그리기
			function drawLine(arrPoint, traffic) {
				var polyline_;
		
				if (chktraffic.length != 0) {
		
					// 교통정보 혼잡도를 체크
					// strokeColor는 교통 정보상황에 다라서 변화
					// traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)
		
					var lineColor = "";
		
					if (traffic != "0") {
						if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시
		
							lineColor = "#06050D";
							//라인그리기[S]
							polyline_ = new Tmapv2.Polyline({
								path : arrPoint,
								strokeColor : lineColor,
								strokeWeight : 6,
								map : map
							});
							resultdrawArr.push(polyline_);
							//라인그리기[E]
						} else { //교통정보가 있음
		
							if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
								var trafficObject = "";
								var tInfo = [];
		
								for (var z = 0; z < traffic.length; z++) {
									trafficObject = {
										"startIndex" : traffic[z][0],
										"endIndex" : traffic[z][1],
										"trafficIndex" : traffic[z][2],
									};
									tInfo.push(trafficObject)
								}
		
								var noInfomationPoint = [];
		
								for (var p = 0; p < tInfo[0].startIndex; p++) {
									noInfomationPoint.push(arrPoint[p]);
								}
		
								//라인그리기[S]
								polyline_ = new Tmapv2.Polyline({
									path : noInfomationPoint,
									strokeColor : "#06050D",
									strokeWeight : 6,
									map : map
								});
								//라인그리기[E]
								resultdrawArr.push(polyline_);
		
								for (var x = 0; x < tInfo.length; x++) {
									var sectionPoint = []; //구간선언
		
									for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
										sectionPoint.push(arrPoint[y]);
									}
		
									if (tInfo[x].trafficIndex == 0) {
										lineColor = "#06050D";
									} else if (tInfo[x].trafficIndex == 1) {
										lineColor = "#61AB25";
									} else if (tInfo[x].trafficIndex == 2) {
										lineColor = "#FFFF00";
									} else if (tInfo[x].trafficIndex == 3) {
										lineColor = "#E87506";
									} else if (tInfo[x].trafficIndex == 4) {
										lineColor = "#D61125";
									}
		
									//라인그리기[S]
									polyline_ = new Tmapv2.Polyline({
										path : sectionPoint,
										strokeColor : lineColor,
										strokeWeight : 6,
										map : map
									});
									//라인그리기[E]
									resultdrawArr.push(polyline_);
								}
							} else { //0부터 시작하는 경우
		
								var trafficObject = "";
								var tInfo = [];
		
								for (var z = 0; z < traffic.length; z++) {
									trafficObject = {
										"startIndex" : traffic[z][0],
										"endIndex" : traffic[z][1],
										"trafficIndex" : traffic[z][2],
									};
									tInfo.push(trafficObject)
								}
		
								for (var x = 0; x < tInfo.length; x++) {
									var sectionPoint = []; //구간선언
		
									for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
										sectionPoint.push(arrPoint[y]);
									}
		
									if (tInfo[x].trafficIndex == 0) {
										lineColor = "#06050D";
									} else if (tInfo[x].trafficIndex == 1) {
										lineColor = "#61AB25";
									} else if (tInfo[x].trafficIndex == 2) {
										lineColor = "#FFFF00";
									} else if (tInfo[x].trafficIndex == 3) {
										lineColor = "#E87506";
									} else if (tInfo[x].trafficIndex == 4) {
										lineColor = "#D61125";
									}
		
									//라인그리기[S]
									polyline_ = new Tmapv2.Polyline({
										path : sectionPoint,
										strokeColor : lineColor,
										strokeWeight : 6,
										map : map
									});
									//라인그리기[E]
									resultdrawArr.push(polyline_);
								}
							}
						}
					} else {
		
					}
				} else {
					polyline_ = new Tmapv2.Polyline({
						path : arrPoint,
						strokeColor : "#DD0000",
						strokeWeight : 6,
						map : map
					});
					resultdrawArr.push(polyline_);
				}
		
			}
		
			//초기화 기능
			function resettingMap() {
				//기존마커는 삭제
				marker_s.setMap(null);
				marker_e.setMap(null);
		
				if (resultMarkerArr.length > 0) {
					for (var i = 0; i < resultMarkerArr.length; i++) {
						resultMarkerArr[i].setMap(null);
					}
				}
		
				if (resultdrawArr.length > 0) {
					for (var i = 0; i < resultdrawArr.length; i++) {
						resultdrawArr[i].setMap(null);
					}
				}
		
				chktraffic = [];
				drawInfoArr = [];
				resultMarkerArr = [];
				resultdrawArr = [];
			}
		</script>
	
</div>
</body>
</html>
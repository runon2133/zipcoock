<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a332b607a0069f2456286f6df7d82ed7&libraries=services"></script>

<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx00134e08007f4fcbabe5706db62ea793"></script>

<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

<style>
	.card_info {
		font-size: 15px;
		margin-bottom: 5px;
	}
	#result {
		margin-top: 10px;
	}
</style>
</head>
<body onload="initMap();">
<div class="s-wrapper">
	<jsp:include page="/WEB-INF/views/common/deliveryHeader.jsp" />
	<div class="main_field">
			<div class="main_content2" >
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
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageMenuFrm.do">메뉴관리</a></span></div>
	        			<div class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected"><a href="/manageZcdOrderFrm.do">주문접수</a></span></div>
	        			<div class="side_nav_div"><span class="side_nav_span"><a href="/manageZcdReviewFrm.do">리뷰관리</a></span></div>       			
        			</div>
        		</div>
        		
        		<div class="content_div">
        			<div class="content_title">주문접수</div>
        			<div class="content_div_area">
        				<div class="content_div_div">
        					<div class="content_div_content">
        						<div class="content_div_div_content">
        							<div class="content_div_info">
        								<div class="content_div_title" style="font-weight: bold">주문정보</div>
        								<div class="content_div_end"></div>
        								<br>
        								
        								
				        				<div class="card" style="width: 100%;">
										  <h6 class="card-header" style="font-weight: 600;">배달지</h6>
										  <div class="card-body">
										  	<div class="card_info">주문번호 : ${mo.orderNo }</div>
										  	<div class="card_info">주문시간 : ${mo.orderTime }</div>
										    <div class="card_info">배달지 : ${mo.orderAddress } ${mo.orderAddress2 }</div>
										    <div class="card_info">고객 연락처 : ${memberPhone }</div>
										    <div class="card_info">요청사항 : ${mo.orderRequest }</div>
										  </div>		  
										</div>
										
										<div class="card" style="width: 100%;">
										  <h6 class="card-header" style="font-weight: 600;">배달 예정 시간</h6>
										  <div class="card-body">
										  	<input type="hidden" id="storeX" value=${zs.x }>
										  	<input type="hidden" id="storeY" value=${zs.y }>
										  	
										  	<div id="map2" style="width:100%;height:350px; display: none;"></div>
										  	<input type="hidden" id="memberAddr" value="${mo.orderAddress }">
										  	
										  	<div class="ft_area">
												<div class="ft_select_wrap">
													<div class="ft_select" style="display: none;">
														<select id="selectLevel">
															<option value="12" selected="selected">이륜차도로우선</option>
														</select> <select id="year">
															<option value="N" selected="selected">교통정보 표출 옵션</option>
															
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
										  	
										  	
										  	
										  </div>		  
										</div>
										
										 <br><br>
										 <div class="row">
        									<a class="cart_btn" style="font-weight: 400; margin-left:200px;" href="/manageZcdOrder.do?reqPage=1&storeNo=${mo.storeNo }&orderState=처리중">취소</a>
        									<div class="col-md-auto"> </div>
        									<button type="button" id="deliveryStart" class="buy_btn" style="font-weight: 400; margin-right:200px;">배달 접수</button>
        									<input type="hidden" id="orderNo" value="${mo.orderNo }">
        									<input type="hidden" id="storeNo" value="${mo.storeNo }">							
       									</div>
										 <br>
        								<div class="content_div_end"></div>
									</div>
								</div>
							</div>
						</div>
        			</div>
        		</div>
    		</div> <!-- main content -->
        </div> <!-- main field -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
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
			
			var storeX = $("#storeX").val();
			var storeY = $("#storeY").val();
			var memberAddr = $("#memberAddr").val();
			var memberX;
			var memberY;
			
			var time;
			
			function initMap() {
				
				var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
	
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
		
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
		
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(memberAddr, function(result, status) {
		
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
		
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						memberX = result[0].x;
				        memberY = result[0].y;
						console.log(memberX);
						console.log(memberY);
						return initTmap();
				    } 
				});    
			}
	
			
			function initTmap() {
				// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(storeX, storeY),
					width : "100%",
					height : "400px",
					zoom : 13,
					zoomControl : true,
					scrollwheel : true
				});
		
				/*
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
				*/
				

					var searchOption = $("#selectLevel").val();

					var trafficInfochk = $("#year").val();

					//JSON TYPE EDIT [S]
					$.ajax({
								type : "POST",
								url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
								async : false,
								data : {
									"appKey" : "l7xx00134e08007f4fcbabe5706db62ea793",
									"startX" : storeY,
									"startY" : storeX,
									"endX" : memberX,
									"endY" : memberY,
									"reqCoordType" : "WGS84GEO",
									"resCoordType" : "EPSG3857",
									"searchOption" : searchOption,
									"trafficInfo" : trafficInfochk
								},
								success : function(response) {

									var resultData = response.features;

								
									var tDistance = $("<div class='card_info'>총 거리 : " + (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km" + "</div>");
									var tTime = $("<div class='card_info'> 배달 소요 시간 : " + (resultData[0].properties.totalTime / 60).toFixed(0) + "분" + "</div>");
									
									time = (resultData[0].properties.totalTime / 60).toFixed(0);
									
									$("#result").append(tDistance);
									$("#result").append(tTime);

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
			
			
			$("#deliveryStart").on("click", function() {
				var orderNo = $(this).next().val();
				var storeNo = $(this).next().next().val();
				
				$.ajax({
					url : "/deliveryStart.do",
					data : {orderNo : orderNo},
					type : "post",
					success : function(data) {
						if (data == 1) {
							alert("배달접수가 완료되었습니다.");
							location.href = "/manageZcdOrder.do?reqPage=1&storeNo=" + storeNo + "&orderState=처리중";
						} else {
							alert("배달접수가 완료되지 않았습니다.");
							location.href = "/manageZcdOrder.do?reqPage=1&storeNo=" + storeNo + "&orderState=처리중";
						}
					}
				});
			});
			
			
	</script>
	
</div>
</body>
</html>
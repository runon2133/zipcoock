<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/admin/jquery-3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/common/slick.css">
<link rel="stylesheet" href="/resources/css/common/slick-theme.css">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<title>Insert title here</title>
<style>

.test::-webkit-scrollbar 
{
    display: none;
}

.scrollMenu 
{ 
	display : flex;  
  	white-space:nowrap;
	overflow-x:scroll;
}


 .scrollMenu::-webkit-scrollbar {
    height: 5px;
  }
 .scrollMenu::-webkit-scrollbar-thumb {
    background-color: rgba(0,0,0,0.3);
    border-radius: 10px;
  }
 .scrollMenu::-webkit-scrollbar-track {
   	background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }



.scrollMenu a 
{
  display: inline-block;
  color: rgb(0, 0, 0);
  text-align: center;
  text-decoration: none;
  padding: 14px;
}


.card
{	
	margin-left: 10px;
	margin-right: 10px;
}

.card>a
{
	height: 250px;
	width: 200px;
	border: 1px solid black;
	background-color: rgb(161, 247, 11);
}

.card>a:hover 
{
	background-color: rgba(229, 242, 208, 0.797);
}

.slider_box
{
	margin-top: 20px;
	padding-left: 25px;
	padding-right: 25px;	
	height: 300px;
}

.slider_content
{
	width: 100%;
	height: 248px;
}

.slider_img
{
	width: 100%;
}

.product_box
{
	padding-left: 25px;
	padding-right: 25px;	
	height: 0 auto;
	
	margin-bottom: 20px;
	
	min-width: 894px;
}

.slider-card
{
	width: 144px;
	height: 230px;	
	margin-left: 10px;
	margin-right: 10px;
}

.slider-card>.img_box
{
	width: 144px;
	height: 144px;
}

/*-- card text 설정 --*/
.img_box>.img_content
{
	color: rgb(51, 51, 51);
    transition: all 0.3s ease 0s;
    margin-bottom: 4px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    font-size: 14px;
    -webkit-line-clamp: 2 !important;
}
.img_box>.img_subcontent
{
	color: rgb(136, 136, 136);
    font-weight: 400;
    letter-spacing: -0.5px;
    display: block;
    font-size: 12px;
}

.img_box>.img_price
{
	color: rgb(51, 51, 51);
    white-space: pre;
    font-size: 16px;
    font-weight: bold;
    letter-spacing: -0.57px;
}

.product_name
{
	font-family: "ns_medium";
}



/*-- 서브타이틀css --*/
.subtitle_text
{
	font-size: 20px;
	font-weight: bolder;
}

.subtitle_box
{
	border-bottom: 1px solid rgb(238, 238, 238);
	margin-bottom: 10px;
}

.subtitle_more
{
	font-size: 15px !important;
	font-weight: bolder !important;
	
}

/* cate_ head 관련 */

.textbox_sub
{
	font-family: "ns_medium";
	color: gray;
}

.back_color_gray
{
	background-color: rgb(238, 238, 238);
}

.cate_head
{
	width: 100%;
	height: 0 auot;
	display : flex;
	justify-content: space-around;
	
	min-width: 894px;
}

.cate_head_box
{
	width: 90%;		
	
	padding: 32px 64px 28px 46px;	
	border-radius: 8px;	
	
	display : flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
}

.cate_head_iconbox
{
	display: flex;	
}

.cate_head_imgcard
{
	width: 68px;	
	margin-right: 20px;	
	margin-top: 10px;
}

.cate_head_imgcard>.imgcard_img
{
	width: 100%;
	height: 68px;	
	
	border-radius: 100%;
    overflow: hidden;	
}

.cate_head_imgcard>.imgcard_text
{
	margin-top: 8px;
	text-align: center;
	font-family: "ns_regular";
	font-size:small;	
}

.cate_head_second
{
	width: 100%;
	height: 0 auot;
	display : flex;
	justify-content: space-around;
	
	border-top: 1px solid rgb(238, 238, 238);
}

.cate_head_second>.cate_head_box
{
	width: 100%;	
	margin-top: 20px;
	padding: 0;
}

.cate_head_second>.cate_head_box>.cate_head_textbox
{
	width: 280px;
	height: 144px;
}

.cate_head_second_imgbox
{
	border-radius: 8px;
    overflow: hidden;	
}

.cate_head_second_imgbox>img
{
 	transition: all 0.5s;
}

.cate_head_second_imgbox>img:hover
{
	transform: scale(1.05);	
}


</style>
</head>
<body>
<div class="s-wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>			
        <div class = "main_field">        	
        	<div class = "main_content">
        		<div class = "main_content_field">
        			<!-- main content making area -->        			
        				<!-- stlye 은 slick 영역 확인용 -->
					<div class = "slider_box">
					  	<div id="slider-div">
						    <div class = "slider_content">
						    	<img src="/resources/img/common/slider_00.jpg" class="slider_img">	
						    </div>
						    <div class = "slider_content">
						    	<img src="/resources/img/common/slider_01.jpg" class="slider_img">	
						    </div>
						    <div class = "slider_content">
						    	<img src="/resources/img/common/slider_02.jpg" class="slider_img">	
						    </div>
						    <div class = "slider_content">
						    	<img src="/resources/img/common/slider_03.jpg" class="slider_img">	
						    </div>
						 
					  	</div>
					</div>
					
					<div class = "subtitle_box">
        				<div class = "subtitle_content">
        					<div class = "content">
        						<div class = "subtitle_text">
        							사장님 BEST
        						</div>
        						<button type = "button" class = "subtitle_more" onclick = "location.href='/mainboard.do';" >더보기 ></button>     					
        					</div>
        				</div>	
        			</div>	
					<div class = "product_box">
						<div class = "product_slider" id = "bestSlider">	
						</div>
					</div>
					<div class = "cate_head back_color_gray">
						<div class = "cate_head_box">
							<div class = "cate_head_textbox">
								<div class = "textbox_main"><h2>집쿠욱만의 특별한 상품!</h2></div>
								<div class = "textbox_sub">배민상회만의 특별함을 경험해보세요</div> 
							</div>
							<div class = "cate_head_iconbox">
								<div class = "cate_head_imgcard">
									<div class = "imgcard_img">
										<img src="/resources/img/common/cate_head_img00.png" class="slider_img">	
									</div>
									<div class = "imgcard_text">
										듬직한배송
									</div>
								</div>	
								<div class = "cate_head_imgcard">
									<div class = "imgcard_img">
										<img src="/resources/img/common/cate_head_img01.png" class="slider_img">	
									</div>
									<div class = "imgcard_text">
										친환경제품
									</div>
								</div>	
								<div class = "cate_head_imgcard">
									<div class = "imgcard_img">
										<img src="/resources/img/common/cate_head_img02.jpg" class="slider_img">	
									</div>
									<div class = "imgcard_text">
										직접생산
									</div>
								</div>	
								<div class = "cate_head_imgcard">
									<div class = "imgcard_img">
										<img src="/resources/img/common/cate_head_img03.png" class="slider_img">	
									</div>
									<div class = "imgcard_text">
										기획전
									</div>
								</div>						
							</div>
						</div>
						
					</div>
					
					<div class = "subtitle_box">
        				<div class = "subtitle_content">
        					<div class = "content">
        						<div class = "subtitle_text">
        							집쿠욱 초이스
        						</div>
        						<button type = "button" class = "subtitle_more" onclick = "location.href='/mainboard.do';" >더보기 ></button>     					
        					</div>
        				</div>	
        			</div>		
					<div class = "product_box">
						<div class = "product_slider" id = "choiceSlider">
							<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/choice/choice_img00.jpg' class='slider_img'>
		                                <div class = 'product_name'>[소형] 보냉보온팩</div>
		                                <div class = 'img_subcontent'>개당 259원/100ea</div>
		                                <div class = 'img_price'>25,900원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/choice/choice_img02.jpg' class='slider_img'>
		                                <div class = 'product_name'>[중형] 보냉보온팩</div>
		                                <div class = 'img_subcontent'>개당 287원/100ea</div>
		                                <div class = 'img_price'>28,900원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/choice/choice_img03.jpg' class='slider_img'>
		                                <div class = 'product_name'>손잡이보온팩-후끈후끈</div>
		                                <div class = 'img_subcontent'>개당 483원/200ea</div>
		                                <div class = 'img_price'>96,600원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/choice/choice_img04.jpg' class='slider_img'>
		                                <div class = 'product_name'>보온팩-아프리카</div>
		                                <div class = 'img_subcontent'>개당 196원/200ea</div>
		                                <div class = 'img_price'>39,100원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/choice/choice_img01.jpg' class='slider_img'>
		                                <div class = 'product_name'>롤형 스티커 디스펜서</div>
		                                <div class = 'img_subcontent'>개당 28,100원/1ea</div>
		                                <div class = 'img_price'>28,100원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/choice/choice_img05.jpg' class='slider_img'>
		                                <div class = 'product_name'>보냉보온팩(36x30)</div>
		                                <div class = 'img_subcontent'>개당 316원/200ea</div>
		                                <div class = 'img_price'>63,100원</div>
		                            </div>
		                        </div>
                    		</div>
						</div>
					</div><!-- product slider end -->
					<div class = "cate_head_second">
						<div class = "cate_head_box">
							<div class = "cate_head_textbox">
								<div class = "textbox_main"><h2>식재료 브랜드관</h2></div>
								<div class = "textbox_sub">검증된 브랜드의 대표상품을 만나보세요</div> 
							</div>
							<div class = "cate_head_iconbox">
								<div class= "cate_head_second_imgbox">
									<img src="/resources/img/common/cate_head_second.jpg" class="slider_img">		
								</div>											
							</div>
						</div>
					</div>
					<div class = "subtitle_box">
        				<div class = "subtitle_content">
        					<div class = "content">
        						<div class = "subtitle_text">
        							인기 수산물
        						</div>
        						<button type = "button" class = "subtitle_more" onclick = "location.href='/mainboard.do';" >더보기 ></button>     					
        					</div>
        				</div>	
        			</div>		
					<div class = "product_box">
						<div class = "product_slider" id = "choiceSlider2">
							<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/food_00.jpg' class='slider_img'>
		                                <div class = 'product_name'>페루산 대왕 오징어</div>
		                                <div class = 'img_subcontent'>1kg당 2,925원/4ea</div>
		                                <div class = 'img_price'>11,700원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/food_01.jpg' class='slider_img'>
		                                <div class = 'product_name'>[든든]노르웨이 생연어</div>
		                                <div class = 'img_subcontent'>1kg당 27,750원/1ea</div>
		                                <div class = 'img_price'>55,500원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/food_02.jpg' class='slider_img'>
		                                <div class = 'product_name'>노르웨이 생연어 1마리</div>
		                                <div class = 'img_subcontent'>1kg당 17,847원/1ea</div>
		                                <div class = 'img_price'>116,000원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/food_03.jpg' class='slider_img'>
		                                <div class = 'product_name'>절단주꾸미 1kg</div>
		                                <div class = 'img_subcontent'>1kg당 11,080원/1ea</div>
		                                <div class = 'img_price'>11,080원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/food_04.jpg' class='slider_img'>
		                                <div class = 'product_name'>생칵테일새우</div>
		                                <div class = 'img_subcontent'>1kg당 16,334원/2ea</div>
		                                <div class = 'img_price'>29,400원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/food_05.jpg' class='slider_img'>
		                                <div class = 'product_name'>자숙문어 600~700g</div>
		                                <div class = 'img_subcontent'>100g당 3,293원/1ea</div>
		                                <div class = 'img_price'>21,400원</div>
		                            </div>
		                        </div>
                    		</div>
						</div>
					</div><!-- product slider end -->
					<div class = "subtitle_box">
        				<div class = "subtitle_content">
        					<div class = "content">
        						<div class = "subtitle_text">
        							식재료 신상품 모음
        						</div>
        						<button type = "button" class = "subtitle_more" onclick = "location.href='/mainboard.do';" >더보기 ></button>     					
        					</div>
        				</div>	
        			</div>		
					<div class = "product_box">
						<div class = "product_slider" id = "choiceSlider3">
							<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/newfood_00.jpg' class='slider_img'>
		                                <div class = 'product_name'>샤인머스캣 베이스1kg</div>
		                                <div class = 'img_subcontent'>개당 6,930원/1ea</div>
		                                <div class = 'img_price'>6,930원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/newfood_01.jpg' class='slider_img'>
		                                <div class = 'product_name'>애플망고 베이스 1kg</div>
		                                <div class = 'img_subcontent'>개당 6,930원/1ea</div>
		                                <div class = 'img_price'>6,930원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/newfood_02.png' class='slider_img'>
		                                <div class = 'product_name'>로제떡볶이 분말소스1kg</div>
		                                <div class = 'img_subcontent'>개당 7,980원/1ea</div>
		                                <div class = 'img_price'>7,980원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/newfood_03.jpg' class='slider_img'>
		                                <div class = 'product_name'>자숙랍스터4.5kg</div>
		                                <div class = 'img_subcontent'>1kg당 34,445원/1box</div>
		                                <div class = 'img_price'>155,000원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/newfood_04.jpg' class='slider_img'>
		                                <div class = 'product_name'>세척 당근 1kg</div>
		                                <div class = 'img_subcontent'>개당 2,100원/1ea</div>
		                                <div class = 'img_price'>2,100원</div>
		                            </div>
		                        </div>
                    		</div>
                    		<div>
		                        <div class = 'slider-card'>
		                            <div class = 'img_box'>
		                                <img src='/resources/img/common/food/newfood_05.jpg' class='slider_img'>
		                                 <div class = 'product_name'>불꽃오징어 1.25kg</div>
		                                <div class = 'img_subcontent'>100g당 1,381원/1ea</div>
		                                <div class = 'img_price'>17,260원</div>
		                            </div>
		                        </div>
                    		</div>
						</div>
					</div><!-- product slider end -->
					
					
        		</div> <!-- main_content_field -->
        	</div> <!-- main content -->
        </div> <!-- main field -->
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
<script>
$(document).ready(function()
{	
	$('#slider-div').slick({
		slide: 'div',				//슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, 			//무한 반복 옵션	 
		slidesToShow : 1,			// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1,			//스크롤 한번에 움직일 컨텐츠 개수
		speed : 1000,	 			// 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 				// 옆으로 이동하는 화살표 표시 여부
		dots : true, 				// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev slick-skyblue'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next slick-skyblue'>Next</button>",		// 다음 화살표 모양 설정
		dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
		draggable : true, 	//드래그 가능 여부 
		responsive: [ // 반응형 웹 구현 옵션
			{  
				breakpoint: 960, //화면 사이즈 960px
				settings: {
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:3 
				} 
			},
			{ 
				breakpoint: 768, //화면 사이즈 768px
				settings: {	
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:2 
				} 
			}
		]
	});
	
	/*$(".product_slider").slick({
		slidesToShow : 5,			// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 5,			//스크롤 한번에 움직일 컨텐츠 개수		
		prevArrow : "<button type='button' class='slick-prev slick-gray'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next slick-gray'>Next</button>",		// 다음 화살표 모양 설정
	});*/
	
	
	var iBest = 3;
	var iCount = 8;
	var indexMax = 0;
	
	$.ajax({			
		
		url 	: 	"/get_ProductList.do", 	//서블릿을 요청할지 매핑값
		type	: 	"post",					// method 설정
		data 	:	
		{	
			iCategory : iBest
		},
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			var list  = data;
			if(list != null)
			{
				if(list.length <= iCount)
					indexMax = list.length;		
				else
					indexMax = iCount;
				
				var table = $("#bestSlider");
				
				console.log(list);
				
				for(var i = 0; i < indexMax; ++i)
				{	
					console.log(list[i].productName);
					console.log(list[i].capacity);
					console.log(list[i].price);
					
					
					var html = "";
					var card = "<a href = '/mainboardView.do?memberNo=0&productNo="+list[i].productNo +"'><div class = 'slider-card'>";
					var imgbox = "<div class = 'img_box'>";
					var img = "<img src='/resources/img/common/test_product_00.jpg' class='slider_img'>";
					var product_name = "<div class = 'product_name'>"+list[i].productName+"</div>";
					var img_sub = "<div class = 'img_subcontent'>"+list[i].capacity+"</div>";
					var price = "<div class = 'img_price'>"+list[i].price+" 원</div>";
					var end = "</div></div></a>";
							
					html += card + imgbox+ img+ product_name+ img_sub+ price+ end;
					table.append(html);
				}
				
				$("#bestSlider").slick({
					slidesToShow : 5,			// 한 화면에 보여질 컨텐츠 개수
					slidesToScroll : 5,			//스크롤 한번에 움직일 컨텐츠 개수		
					prevArrow : "<button type='button' class='slick-prev slick-gray'>Previous</button>",		// 이전 화살표 모양 설정
					nextArrow : "<button type='button' class='slick-next slick-gray'>Next</button>",		// 다음 화살표 모양 설정
				});
			}			
		},
		error	: function()
		{
			console.log("Fail get productList best...");
		}	
	});
	
	$("#choiceSlider").slick({
		slidesToShow : 5,			// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 5,			//스크롤 한번에 움직일 컨텐츠 개수		
		prevArrow : "<button type='button' class='slick-prev slick-gray'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next slick-gray'>Next</button>",		// 다음 화살표 모양 설정
	});
	$("#choiceSlider2").slick({
		slidesToShow : 5,			// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 5,			//스크롤 한번에 움직일 컨텐츠 개수		
		prevArrow : "<button type='button' class='slick-prev slick-gray'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next slick-gray'>Next</button>",		// 다음 화살표 모양 설정
	});
	$("#choiceSlider3").slick({
		slidesToShow : 5,			// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 5,			//스크롤 한번에 움직일 컨텐츠 개수		
		prevArrow : "<button type='button' class='slick-prev slick-gray'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next slick-gray'>Next</button>",		// 다음 화살표 모양 설정
	});
	
	
	//choiceSlider2
	/*var iChoice = 5;
		$.ajax({
		url 	: 	"/get_ProductList.do", 	//서블릿을 요청할지 매핑값
		type	: 	"post",					// method 설정
		data 	:	
		{	
			iCategory : iChoice
		},
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{			
			var list  = data;
			if(list != null)
			{
				if(list.length <= iCount)
					indexMax = list.length;		
				else
					indexMax = iCount;
				
				var table = $("#choiceSlider");
				
				for(var i = 0; i < indexMax; ++i)
				{	
					var html = "";
					var card = "<div><div class = 'slider-card'>";
					var imgbox = "<div class = 'img_box'>";
					var img = "<img src='/resources/img/common/test_product_00.jpg' class='slider_img'>";
					var product_name = "<div class = 'product_name'>"+list[i].productName+"</div>";
					var img_sub = "<div class = 'img_subcontent'>"+list[i].capacity+"</div>";
					var price = "<div class = 'img_price'>"+list[i].price+" 원</div>";
					var end = "</div></div></div>";
							
					html += card + imgbox+ img+ product_name+ img_sub+ price+ end;
					table.append(html);
				}
				
				$("#choiceSlider").slick({
					slidesToShow : 5,			// 한 화면에 보여질 컨텐츠 개수
					slidesToScroll : 5,			//스크롤 한번에 움직일 컨텐츠 개수		
					prevArrow : "<button type='button' class='slick-prev slick-gray'>Previous</button>",		// 이전 화살표 모양 설정
					nextArrow : "<button type='button' class='slick-next slick-gray'>Next</button>",		// 다음 화살표 모양 설정
				});
			}			
		},
		error	: function()
		{
			console.log("Fail get productList best...");
		}	
	});*/
	
	
	
});


</script>
</html>
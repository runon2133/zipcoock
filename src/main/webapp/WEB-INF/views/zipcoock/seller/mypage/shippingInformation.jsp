<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<link rel="stylesheet" href="/resources/css/sellerMypage/pageNavi.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
	.content_div_info:first-child{
		margin-bottom: 0;
		border-bottom: 0;
	}
	.btn-area{
		text-align: center;
		display: flex;
	}
	.btn-area>button:first-child {
		margin-right: 10px;
	}
	#text-emp{
		color:#333; 
		font-weight:600;
	}
	.side_nav_div:hover{
		background: rgba(51, 51, 51, 0.05);
		cursor: pointer;
		font-weight: 700;
	}
	.side_nav_div:hover span{
		font-weight: 700;
	}
	.side_nav_content a{
		text-decoration: none;
	}
</style>
</head>
<body>
<div class="s-wrapper">
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class = "main_field"> 
		<div class="main_content2" >
			<div class="side_nav" style="padding-top: 50px; margin-left: 30px;">
				<div class="my_info">
					<div class="my_info_div">
						<span class="my_info_span">환영합니다</span>
						
					</div>
					<div class="user_div">
					
						<div class="user_div_div">
						
							<div class="user_div_content">
								<span class="user_div_name">${sessionScope.m.memberId}<span class="user_div_nim">님</span></span>
							</div>
							
						</div>
						
					</div>
				</div>
				
				<div class="side_nav_content">
					<a href="/zipsellerMypage.do" class="side_nav_div"><span
						class="side_nav_span side_nav_span">정보 확인/수정</span></a> <a
						href="productList.do?reqPage=1" class="side_nav_div side_nav_div">
						<span class="side_nav_span">상품 관리</span></a> 
						<a href="/shippingInfomation.do" class="side_nav_div side_nav_div_selected"><span class="side_nav_span_selected">매출 정보</span></a> 
						<a href="/sellerQNA.do?reqPage=1" class="side_nav_div"><span class="side_nav_span">문의내역</span></a>
				</div>
			</div>


        <div class = "content_div">
        	<div class = "content_div_area">
        		
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221); overflow: hidden;">
        				<div id="title">
						<h2>판매 정보</h2>
                </div>
						
						   
                <hr>
                <br>
                <div class="dilivery-statuswarps" style=" border: solid 1px #ddd;padding: 50px; float: left; width: 48%;">

                    <div class="dilivery-status">
                        <table class="table">
                            <tr>
                                <th style="width:50%;">오늘 주문</th>
                                <td style="width:50%;"><span>${shippingInfo[0] }</span><span> 건</span></td>
                            </tr>
                            <tr>
                                <th style="width:50%;">오늘 매출</th>
                                <td style="width:50%;"><span>${shippingInfo[1] }</span><span> 원</span></td>
                            </tr>
                             <tr>
                                <th style="width:50%;">결제 완료</th>
                                <td style="width:50%;"><span>${shippingInfo[2] }</span><span> 건</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="dilivery-statuswarps" style="border: solid 1px #ddd; overflow:hidden; padding: 50px; float: right;width: 48%;">

                    <div class="dilivery-status">
                        <table class="table">
                               <tr>
                                <th>배송전　</th>
                                <td><a href = "/searchOrder.do?reqPage=1&isDelivered=N&memberNo=${m.memberNo }"><span>${shippingInfo[3] }</span><span> 건</span></a></td>
                            </tr>
                            <tr>
                                <th>배송중　</th>
                                <td><a href = "/searchOrder.do?reqPage=1&isDelivered=E&memberNo=${m.memberNo }"><span>${shippingInfo[4] }</span><span> 건</span></a></td>
                            </tr>
                            <tr>
                                <th>배송완료</th>
                                <td><a href = "/searchOrder.do?reqPage=1&isDelivered=Y&memberNo=${m.memberNo }"><span>${shippingInfo[5] }</span><span> 건</span></a></td>
                            </tr>
                        </table>
                        
                    </div>
					</div>
					<br><br>
					<div class="well col-lg-6" style="background-color:white;overflow: hidden;padding-top: 100px;width: 49%;float: left;">
          		<div>
          			<h4>일별 판매량</h4>
          		</div>
          		<div>
          			<canvas id="myChart"></canvas>
          		</div>
          	</div>
          	<div class="well col-lg-6" style="background-color:white;overflow: hidden;padding-top: 100px;width: 49%;float: right;">
          		<div>
          			<h4>일별 매출</h4>
          		</div>
          		<div>
          			<canvas id="myChart2"></canvas>
          		</div>
          	</div>  
        		</div>	
        	</div>
        </div>
        	</div>
        </div>
    </div> <!-- main content -->
    <input type="hidden" name=memberNo value="${sessionScope.m.memberNo}">
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

<style>
	.input{
			height: 30px;
		}
	.content_div_info {
	margin: 0px;
	height : 80px;
	border : unset;
		}
</style>





<script>

(function () {
	
	
	var memberNo = $("[name=memberNo]").val();
	$.ajax({
	    url: "/ajaxWeekSaleCount.do",
	    data: {
	        memberNo:memberNo
	    },
	    type: "post",
	    dataType    :   "json",
	    success: function(data) {
	    	console.log(data+"data값");
	    	var ctx = document.getElementById('myChart').getContext('2d');
	    	var d = new Date();	
	    	var chart = new Chart(ctx, {
	    	    // The type of chart we want to create
	    	    type: 'bar',
	    	    
	    	    // The data for our dataset
	    	    data: {
	    	        labels: [d.getDate()-6+"일", d.getDate()-5+"일", d.getDate()-4+"일", d.getDate()-3+"일", d.getDate()-2+"일", d.getDate()-1+"일", d.getDate()+"일"],
	    	        datasets: [{
	    	            label: '판매 건',
	    	            backgroundColor: '#9ac6e8',
	    	            borderColor: '#5F755A',
	    	            data: [data[0], data[1], data[2], data[3], data[4], data[5], data[6]]
	    	        }]
	    	    },

	    	    // Configuration options go here
	    	    options: {}
	    
	    })
	}
})
})();

           
(function () {
	
	
	var memberNo = $("[name=memberNo]").val();
	$.ajax({
	    url: "/ajaxWeekSaleCount.do",
	    data: {
	        memberNo:memberNo
	    },
	    type: "post",
	    dataType    :   "json",
	    success: function(data) {
	    	console.log(data+"data값");
	    	var ctx = document.getElementById('myChart').getContext('2d');
	    	var d = new Date();	
	    	var chart = new Chart(ctx, {
	    	    // The type of chart we want to create
	    	    type: 'bar',
	    	    
	    	    // The data for our dataset
	    	    data: {
	    	        labels: [d.getDate()-6+"일", d.getDate()-5+"일", d.getDate()-4+"일", d.getDate()-3+"일", d.getDate()-2+"일", d.getDate()-1+"일", d.getDate()+"일"],
	    	        datasets: [{
	    	            label: '판매 건',
	    	            backgroundColor: '#9ac6e8',
	    	            borderColor: '#5ca3da',
	    	            data: [data[0], data[1], data[2], data[3], data[4], data[5], data[6]]
	    	        }]
	    	    },

	    	    // Configuration options go here
	    	    options: {}
	    
	    })
	}
})
})();

(function () {
	
	
	var memberNo = $("[name=memberNo]").val();
	$.ajax({
	    url: "/ajaxWeekSalePriceCount.do",
	    data: {
	        memberNo:memberNo
	    },
	    type: "post",
	    dataType    :   "json",
	    success: function(data) {
	    	var ctx2 = document.getElementById('myChart2').getContext('2d');
	    	var d = new Date();	
	    	var chart2 = new Chart(ctx2, {
	    	    // The type of chart we want to create
	    	    type: 'line',

	    	    // The data for our dataset
	    	    data: {
	    	        labels: [d.getDate()-6+"일", d.getDate()-5+"일", d.getDate()-4+"일", d.getDate()-3+"일", d.getDate()-2+"일", d.getDate()-1+"일", d.getDate()+"일"],
	    	        datasets: [{
	    	            label: '판매 금액',
	    	            backgroundColor: '#9ac6e8',
	    	            borderColor: '#5ca3da',
	    	            data: [data[0], data[1], data[2], data[3], data[4], data[5], data[6]]
	    	        }]
	    	    },

	    	    // Configuration options go here
	    	    options: {}
	    	});
	}
})
})();
	
	
	
</script>
      </body>
      </html>
      
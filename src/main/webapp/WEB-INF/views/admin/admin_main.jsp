<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<script type="text/javascript" src="resources/js/admin/jquery-3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>

.chart_area2
{
	display: flex;
	justify-content: space-around;	
}

</style>
<body>
<div class="s-wrapper">
		<%@include file="/WEB-INF/views/common/header.jsp" %>	
        <div class = "main_field">        	
        	<div class = "main_content">
        		<div class = "main_content_field">
        			<!-- main content making area -->      
        			<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>	 	
        			<div class = "amdin_main_content">
        				<div class = "chart_area" id = "test">
        					<canvas id="myChart"></canvas>
        				</div>        				
        				<div class = "chart_area2">
        					<div><canvas id="myChart2"></canvas></div>
        					<div><canvas id="myChart3"></canvas></div>        					
        				</div>        			
        			</div>        			
        		</div> <!-- main_content_field -->
        	</div> <!-- main content -->
        </div> <!-- main field -->
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
<script>
$(function()
{	
	var ctx = document.getElementById('myChart').getContext('2d'); 
	var dayArray = new Array();
	
	
	for(var i = 0; i < 7; ++i)
	{
		var now = new Date();
		var today = new Date(now.setDate(now.getDate() - i));
		
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		
		var dateString = year + '-' + month  + '-' + day;
		
		dayArray[i] = dateString;
	}
	
	var dateCount = dayArray.length -1;
	
	var chart = new Chart(ctx, 
			{ 
				type: 'line', 
				// 챠트를 그릴 데이타 
				data: { labels: [dayArray[dateCount--], dayArray[dateCount--], dayArray[dateCount--], dayArray[dateCount--], dayArray[dateCount--], dayArray[dateCount--], dayArray[dateCount--]], 
				datasets: [{ label: '고객 문의량', backgroundColor: '#6653e3', borderColor: '#908b8f', data: [5, 8, 5, 9, 15, 20, 15] }] }, 
				// 옵션 
				options: {} 
			});
	
	var ctx2 = document.getElementById('myChart2'); 
	var myChart = new Chart(ctx2, 
			{ 
				type: 'bar', 
				data: 
				{ 
					labels: ['식품', '반려동물', '오피스', '생활용품', '헬스', '주방용품'], 
					datasets: 
						[{ 
							label: '판매량', 
							data: [150, 190, 40, 100, 120, 80], 
							backgroundColor: [ '#7f7f7f', '#7f7f7f', '#7f7f7f', '#7f7f7f', '#7f7f7f', '#7f7f7f' ], 
							borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
							borderWidth: 3 
						}] }, 
					options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } 
				});
	
	var ctx3 = document.getElementById('myChart3'); 
	
	dateCount = dayArray.length -1;
	var myChart = new Chart(ctx3, 
			{ 
				type: 'bar', 
				data: 
				{ 
					labels: [dayArray[dateCount--].substr(5), dayArray[dateCount--].substr(5), dayArray[dateCount--].substr(5), dayArray[dateCount--].substr(5), dayArray[dateCount--].substr(5), dayArray[dateCount--].substr(5)], 
					datasets: 
						[{ 
							label: '주문취소 건수', 
							data: [12, 19, 3, 5, 2, 3], 
							backgroundColor: [ '#7f7f7f', '#7f7f7f', '#7f7f7f', '#7f7f7f', '#7f7f7f', '#7f7f7f' ], 
							borderColor: [ '#a0a0a0', '#a0a0a0', '#a0a0a0', '#a0a0a0', '#a0a0a0', '#a0a0a0' ], 
							borderWidth: 3 
						}] }, 
					options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } 
				});
});
</script>
</html>
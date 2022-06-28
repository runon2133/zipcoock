<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.table_head
{
	background: #b3a9f1;
	font-size: 14px;
}

.table_value
{
	background: #ecf5fc;
	text-align: center;	
	font-size: 12px;
}

.memberTabel
{
	margin-top: 20px;
	margin-bottom: 20px;
}

.search_content
{
	font-size: 12px;
	display: flex;
}
.search_box
{
	margin-left: 20px;
}
.seach_btn_model
{
	width: 60px;
	height: 20px;
	
	background: #dcdff2;
	border: none;
	border-bottom: 1px solid #8c77fa;
	border-right: 1px solid #8c77fa;
	
}

.seach_btn_model:active
{
	background : #514e61;
	color: white;
	border: none;
	border-top: 2px solid #dcdff2;
	border-left: 2px solid #dcdff2;
}

#search_Data:focus 
{
	outline: none;
}

.pageTtile
{
	font-size : 20px;
	font-weight: bolder;	
}

.pageTtitle_box
{
	margin-top : 10px;
	width: 200px;
	color : #252528;
	border-bottom : 2px solid gray;
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
        				<div class = "pageTtile">
        					<div class = "pageTtitle_box">
        						할인 상품 전체 조회
        					</div>        					
        				</div>
        				<table class = "memberTabel" id = "memberList" style = "width:100%;">
						<tr class = "table_head">
							<th>할인 번호</th><th>상품 이름</th><th>할인율</th><th>할인기간</th><th>종료기간</th>							
						</tr>					
						</table>
						<div class = "search_content">
							<div class="btn-group " role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="btnradio" id="radio_Id" autocomplete="off" checked="">
							  <label class="btn btn-outline-secondary" for="radio_Id">회원 id</label>
							  <input type="radio" class="btn-check" name="btnradio" id="radio_Name" autocomplete="off" checked="">
							  <label class="btn btn-outline-secondary" for="radio_Name">회원 이름</label>
							  <input type="radio" class="btn-check" name="btnradio" id="radio_Level" autocomplete="off" checked="">
							  <label class="btn btn-outline-secondary" for="radio_Level">회원 등급</label>
							</div>
							<div class  = "search_box">
								<input type = "text" id = "search_Data">
								<button type="button" class="seach_btn_model" id = "search_Btn">검색</button>							
							</div>							
						</div>       				
        			</div>
        		</div> <!-- main_content_field -->
        	</div> <!-- main content -->
        </div> <!-- main field -->
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
</div>
<script>
	$(function()
	{		
		var table = $('#memberList');
		
		$.ajax(
		{
			url 	: 	"/getAllHomecookDeal.do", 	//서블릿을 요청할지 매핑값 
			data 	:	
			{				
			},								// 서블릿에 전송할 데이터 오브젝트
			type	: 	"get",				// method 설정
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{			
				var list  = data;
				if(list != null)
				{
					indexMax = list.length;		
					
					for(var i = 0; i < indexMax; ++i)
					{	
						var html = 
						"<tr class = 'table_value' id = 'memberInfo'>";
						var dealNo = "<td>"+list[i].dealNo +"</td>";
						var productName = "<td>"+list[i].productName +"</td>";
						var discountRate = "<td>"+list[i].discountRate + " %" +"</td>";
						var discountDate = "<td>"+list[i].discountDate +"</td>";
						var discountendDate = "<td>"+list[i].discountendDate +"</td>";
												
						html += dealNo + productName + discountRate + discountDate + discountendDate;
						table.append(html);
					}
				}
				else
				{
					console.log("결과 없음");
				}
			}
		});
		$(document.body).delegate('#memberInfo', 'click', 
		function() 
		{
			if($(this).children(1).html() != '해당 자료 없음')
				window.location.href = '/admin_HomecookDeal.do?dealNo='+$(this).children(1).html();	
		});
	});
</script>
</body>
</html>
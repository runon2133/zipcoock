<%@page import="kr.or.table.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.pageTtile
{
	font-size : 20px;
	font-weight: bolder;	
	
	width: 80%;
}

.pageTtitle_box
{
	margin-top : 10px;
	width: 40%;
	color : #252528;
	border-bottom : 2px solid gray;
}

.admin_table
{
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-content: center;
	justify-content: center;
}

.admin_mView_Table
{
	margin-top: 15px;
	border: 1px solid black;
	border-collapse: collapse;
	
	width: 50% !importent;
}
.q_table_00,.q_table_content
{
	border: 1px solid black;
	border-collapse: collapse;
	height: 50px;
	
	font-size: 15px;
}

.q_table_content
{
	padding-left: 15px;
}


.q_table_content>input:focus
{
	outline:none;
}

.admin_submit_btn
{
	margin-top: 20px;
	margin-bottom: 20px;
	display: flex;
	justify-content: flex-end;	
}


#submitButton
{
	width: 20%;
	height: 25px;
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
        						할인 상세 정보 : ${d.productName }
        					</div>  		
        				</div>   
        				<div class = "admin_table" >					
						<table class = "admin_mView_Table" style = "width:70%;">
							<tr class = "table-primary">
								<th class = "q_table_00">할인 번호</th>
								<td class = "q_table_content" id = "Deal_no">${d.dealNo}</td>
							</tr>		
							<tr class = "table-primary">
								<th class = "q_table_00">제품번호</th>
								<td class = "q_table_content" id = "Product_No">${d.productNo}</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">제품이름</th>
								<td class = "q_table_content" id = "Product_Name">${d.productName}</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">할인률 정보</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "DiscountRate" value = "${d.discountRate}">%
								</td>
							</tr>	
							<tr class = "table-primary">
								<th class = "q_table_00">할인 시작일</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "DiscountDate" value = "${d.discountDate}">
								</td>
							</tr>	
							<tr class = "table-primary">
								<th class = "q_table_00">할인률 종료일</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "DiscountendDate" value = "${d.discountendDate}">
								</td>
							</tr>	
						</table>	
						<div class = "admin_submit_btn">
							<button type="submit" class="btn btn-secondary" id = "submitButton">정보 수정</button>	
						</div>	
        			</div>      				      			
        		</div> <!-- main_content_field -->
        	</div> <!-- main content -->
        </div> <!-- main field -->
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
<script>
$(function()
{
	$("#submitButton").click(function()
	{
		var Deal_no = $('#Deal_no').html();
		var Product_No = $('#Product_No').html();
		var Product_Name = $('#Product_Name').html();
		
		var DiscountRate = $('#DiscountRate').val();
		var DiscountDate = $('#DiscountDate').val();
		var DiscountendDate = $('#DiscountendDate').val();
		
		console.log(Deal_no);
		console.log(Product_No);
		console.log(Product_Name);
		console.log(DiscountRate);
		console.log(DiscountDate);
		console.log(DiscountendDate);
		
		$.ajax({	
			url 	: 	"/fix_HomeDeal.do", 	//서블릿을 요청할지 매핑값
			type	: 	"post",				// method 설정
			data 	:	
			{	dealNo:Deal_no,		
				productNo:Product_No,
				productName:Product_Name,
				discountRate:DiscountRate,
				discountDate:DiscountDate,
				discountendDate:DiscountendDate
			},
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{
				if(data == 1)
					alert("변경 성공");
				else
					alert("변경 실패")
							
				location.href="/getAllHomecookDeal.do";	
			},			
		});
	});
});


</script>
</div>
</div>
</body>
</html>
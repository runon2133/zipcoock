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

.policyContent
{
	margin-top: 5px;
	margin-right: 5px;
	width : 95%;
	min-height: 100px;
	resize: vertical;
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
        						환불 정책 세부 내용 : ${r.productName }
        					</div>  		
        				</div>
        				<div class = "admin_table" >					
						<table class = "admin_mView_Table" style = "width:70%;">
							<tr class = "table-primary">
								<th class = "q_table_00">환불 정책 번호</th>
								<td class = "q_table_content" id = "rePolicyNo">${r.returnPolicyNo}</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">상품 번호</th>
								<td class = "q_table_content" id = "productNo">${r.productNo}</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">상품 번호</th>
								<td class = "q_table_content" id = "productName">${r.productName}</td>
							</tr>
							
							<tr class = "table-primary">
								<th class = "q_table_00">교환, 반품 소요 비용</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "returnShipping" value = "${r.returnShipping}">	
								</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">교환, 반품 소요 시간</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "retrunLength" value = "${r.retrunLength}">	
								</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">정책 내용</th>
								<td class = "q_table_content" id = "q_no">
									<textarea class = "policyContent">${r.policyContent}</textarea>	
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
		var rePolicyNo = $('#rePolicyNo').html();
		var productNo = $('#productNo').html();
		var productName = $('#productName').html();
				
		var returnShipping = $('#returnShipping').val();
		var retrunLength = $('#retrunLength').val();
		var policyContent = $('.policyContent').val();
				
				
		$.ajax({		
		
			url 	: 	"/Fix_RePolicyData.do", 	//서블릿을 요청할지 매핑값
			type	: 	"post",						// method 설정
			data 	:	
			{	rePolicyNo:rePolicyNo,	
				returnShipping:returnShipping,
				retrunLength:retrunLength,
				policyContent:policyContent		
			},
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{
				if(data == 1)
					alert("변경 성공");
				else
					alert("변경 실패")
							
				location.href="/admin_returnPolicy.do";	
			},
			error	: function()
			{
				console.log("Update rePolicyData Fail");
			}	
		});
				
	});
});
</script>
</div>
</div>
</body>
</html>
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
        						유저 상세 정보 _ ${m.memberName }
        					</div>  		
        				</div>
        				<div class = "admin_table" >					
						<table class = "admin_mView_Table" style = "width:70%;">
							<tr class = "table-primary">
								<th class = "q_table_00">회원 번호</th>
								<td class = "q_table_content" id = "Member_No">${m.memberNo}</td>
							</tr>		
							<tr class = "table-primary">
								<th class = "q_table_00">회원 아이디</th>
								<td class = "q_table_content" id = "Member_Id">
									${m.memberId}
								</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">회원 비밀번호</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "Member_Pw" value = "${m.memberPw}" readonly="readonly">	
								</td>
							</tr>							
							<tr class = "table-primary">
								<th class = "q_table_00">회원 이름</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "Member_Fname" value = "${m.memberName}">	
								</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">회원 등급</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "hidden" id = "Member_Level_Save" value = "${m.memberLevel}">
									<select id = "Member_Level" name = "pay_Status">
										<option value = "1">1. 일반회원</option>
										<option value = "2">2. 판매자</option>
										<option value = "3">3. 관리자</option>	
										<option value = "4">3. 딜리버리 판매자</option>									
									</select>				
								</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">회원 딜리버리 등급</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "hidden" id = "Delivery_Level_Save" value = "${m.deliveryLevel}">
									<select id = "Delivery_Level" name = "pay_Status">
										<option value = "1">1. 집쿡초보</option>
										<option value = "2">2. 집쿡중수</option>
										<option value = "3">3. 집쿡고수</option>										
									</select>				
								</td>
							</tr>
							<tr class = "table-primary">
								<th class = "q_table_00">회원 전화번호</th>
								<td class = "q_table_content" id = "q_no">
									<input type = "text" id = "Member_Phone" value = "${m.memberPhone}">	
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
	var memberLevel = 0;	
	var levelName = $('#Member_Level_Save').val();
	
	if(levelName == "일반회원")
		memberLevel = 1;
	else if(levelName == "판매자")	
		memberLevel = 2;	
	else if(levelName == "관리자")	
		memberLevel = 3;	
	else if(levelName == "딜리버리판매자")	
		memberLevel = 4;
	
	$('#Member_Level').val(memberLevel).prop("selected",true);
	
	
	var deliveryLevel = 0;
	var deliceryName = $('#Delivery_Level_Save').val();
	
	if(deliceryName == "집쿡초보")	
		deliveryLevel = 1;	
	else if(deliceryName == "집쿡중수")	
		deliveryLevel = 2;	
	else if(deliceryName == "집쿡고수")	
		deliveryLevel = 3;		
	
	$('#Delivery_Level').val(deliveryLevel).prop("selected",true);
	
	$("#submitButton").click(function()
	{
		var memberNo = $('#Member_No').html();
		var memberName =  $('#Member_Fname').val();
		
		var memberLevel = $('#Member_Level').val();
		var memberDLevel = $('#Delivery_Level').val();
		var memberPhone = $('#Member_Phone').val();
		
		var strMemberLvl = memberLevel_parse(memberLevel);
		var strMemberDlvl = memberDLevel_parse(memberDLevel);
		
		
		$.ajax({			
			
			url 	: 	"/Fix_MemberInfo.do", 	//서블릿을 요청할지 매핑값
			type	: 	"post",				// method 설정
			data 	:	
			{	memberNo:memberNo,		
				memberName:memberName,
				memberLevel:strMemberLvl,
				memberDLevel:strMemberDlvl,
				memberPhone:memberPhone		
			},
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{
				if(data == 1)
					alert("변경 성공");
				else
					alert("변경 실패")
							
				location.href="/admin_allMember.do";				
				//location.replace("/adminMemberList?reqPage=1&dataType=List&data=''");
			},
			error	: function()
			{
				console.log("Update MemberInfo Fail");
			}	
		});
		
	});
	
	function memberLevel_parse(iMemberLevel)
	{
		var sMemberLevel = "";
		
		if(iMemberLevel == 1)
			sMemberLevel = "일반회원";
		else if(iMemberLevel == 2)	
			sMemberLevel = "판매자";	
		else if(iMemberLevel == 3)	
			sMemberLevel = "관리자";	
		else if(iMemberLevel == 4)	
			sMemberLevel = "딜리버리판매자";
		
		return sMemberLevel;
	}
	
	function memberDLevel_parse(iDLevel)
	{
		var strDlevel = "";
		
		if(iDLevel == 1)	
			strDlevel = "집쿡초보";	
		else if(iDLevel == 2)	
			strDlevel = "집쿡중수";	
		else if(iDLevel == 3)	
			strDlevel = "집쿡고수";	
		
		return strDlevel;
	}
});


</script>
</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Qa Info</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	margin-top : 20px;
	width: 40%;
	color : #252528;
	border-bottom : 2px solid gray;
}

.admin_table
{
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;	
	justify-content: center;	
	align-content: flex-start;
}

.admin_table_re
{
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;	
	justify-content: center;	
	align-content: flex-end;
}

.admin_mView_Table
{
	margin-top: 15px;
	border: 1px solid black;
	border-collapse: collapse;
	
	width: 50% !importent;
}
.q_table_00,.q_table_content, .q_table_01
{
	border: 1px solid black;
	border-collapse: collapse;
	height: 25px;
	
	font-size: 15px;
}

.q_table_00
{
	background: #ebfbff;	
}

.q_table_01
{
	background: #F2EFBD;
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

.q_table_content>input
{
	margin-top: 10px;
	margin-bottom: 10px;
	height: 25px;
	width: 95%;
}

.qna_textarea, .qna_textarea_re
{
	margin-top: 5px;
	margin-right: 5px;
	width : 95%;
	min-height: 100px;
	resize: vertical;
}

.qna_textarea:focus 
{
	outline: none;
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
        						문의 상세 정보
        					</div>  		
        				</div>
        				<div>
        				<table class="table">
							  <tbody>
							    <tr>
							      <th scope="row">문의 번호</th>
							      <td id = "qna_no">${q.qnaNo}</td>							     
							    </tr>
							    <tr>
							      <th scope="row">문의자 번호</th>
							      <td id = "member_no">${q.memberNo}</td>
							      
							    </tr>
							    <tr>
							      <th scope="row">문의자</th>
							      <td id = "member_name">${q.memberName}</td>						      
							    </tr>
							    <tr>
							      <th scope="row">문의 날짜</th>
							      <td id = "qna_date">${q.writeDate}</td>				      
							    </tr>
							    <tr>
							      <th scope="row">문의 제목</th>
							      <td id = "qna_title">${q.qnaTitle}</td>			      
							    </tr>
							     <tr>
							      <th scope="row">문의 내용</th>
							      <td id = "qna_content">
							      	<textarea class = "qna_textarea" style="border: none" readonly="readonly">${q.qnaContent}</textarea>
							      </td>	      
							    </tr>
							  </tbody>
							  <input type= "hidden"  id = "memberNo_Save" value = "${sessionScope.m.memberNo }" >
							</table>
        				</div>
        			 				      			
        		</div> <!-- main_content_field -->        		
        	</div> <!-- main content -->
        </div> <!-- main field -->
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
	</div>

<script>
$(function()
{
	//----------------------------------<변수필드>//
	var submitType = 0;
	var origin_qnaNo = $('#qna_no').html();	
	
	var content = $('.amdin_main_content');
	var qnaData;	
		
	//----------------------------------<초기 실행 필드>//
	qna_ready();
	
	//--------------------------------------------//
	
	$(document).on('click', '#submitButton', function()
	{
		var content_test = $('.qna_textarea_re').val();		
		if(content_test == "")
		{
			alert("답변 내용을 입력해주세요.");
			return;
		}		
		
		if(submitType == 1)//fix
		{	
			var qna_no = $('#qna_no_re').html();			
			var content = $('.qna_textarea_re').val();
			
			fix_reQna(qna_no,content);
		}
		else if(submitType == 2)//insert
		{
			var myNo = $('#memberNo_Save').val();			
			
			insert_reQna();
		}			
	});	
	
	function qna_ready()
	{
		qnaData = call_refQna(origin_qnaNo);	
	}	
	
	function insert_reQna()
	{
		var myNo = $('#memberNo_Save').val();
		var qnaNo = $('#qna_no').html();
		var content = $('.qna_textarea_re').val();
		var title = $('#qna_title').html() + "_Reply";
		console.log(title);
		
		$.ajax(
		{
			url 	: 	"/insert_reQna.do",	
			data 	:	
			{
				myNo:myNo,
				qnaNo:qnaNo,
				content:content,
				title:title
			},								
			type	: 	"get",				
			async: false,
			success	: function(data)
			{
				alert("성공적으로 답변이 등록되었습니다.");
				location.href="/admin_qna.do";
			},
			error:function(request,status,error)
			{
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

			});
	}
	
	function fix_reQna(qna_no_re,reContent)
	{
		$.ajax(
		{
			url 	: 	"/fix_reQna.do", 	
			data 	:	
			{	
				qna_no : qna_no_re,
				reContent: reContent
			},								
			type	: 	"get",				
			async: false,
			success	: function(data)
			{
				alert("성공적으로 답변이 수정되었습니다.");
				location.href="/admin_qna.do";
			}
		});
	}

	function call_refQna(refQnaNo)
	{
		var QnaValue;
		
		$.ajax(
		{
			url 	: 	"/get_SelectOneQna.do", 	//서블릿을 요청할지 매핑값 
			data 	:	
			{	
				refQnaNo:refQnaNo
			},								// 서블릿에 전송할 데이터 오브젝트
			type	: 	"get",				// method 설정
			async: false,
			success	: function(data)		// 성공시와 에러시, 그리고 완료시
			{	
				QnaValue = data;		
				
				if(QnaValue)
				{
					var head = "<div class = 'pageTtile'><div class = 'pageTtitle_box'>답변 정보</div> </div>";
					var div = "<div class = 'admin_table_re' >";
					var table = "<table class = 'admin_mView_Table' style = 'width:70%;'>";
						
					var qnaNo = "<tr class = 'table-primary'><th class = 'q_table_00'>상담 번호</th><td class = 'q_table_content' id = 'qna_no_re'>"+QnaValue.qnaNo+"</td></tr>"
					var memberNo = 					
					'<tr class = "table-primary"><th class = "q_table_00">답변자</th><td class = "q_table_content" id = "member_no">'+QnaValue.memberName+'</td></tr>';
					var qnaContent = 
					'<tr class = "table-primary"><th class = "q_table_00">답변 내용 </th><td class = "q_table_content" id = "qna_content"><textarea class = "qna_textarea_re" >'+QnaValue.qnaContent+'</textarea></td></tr>';
			
					var table_end = "</table>";
					var btn = '<div class = "admin_submit_btn"><button type="submit" class="btn btn-secondary" id = "submitButton">답변 수정</button></div>';
					var div_end = "</div>"
					
					var table = "<div><table class='table'><tbody>";
					var no = "<tr><th scope='row'>상담번호</th><td id = 'qna_no_re'>"+QnaValue.qnaNo+"</td></tr>";
					var name = "<tr><th scope='row'>답변자</th><td id = 'member_no'>"+QnaValue.memberName+"</td></tr>";
					var textfield = "<tr><th scope='row'>답변 정보</th><td id = 'qna_no'><textarea class = 'qna_textarea_re' style='border: 1px solid #acacac'>"+QnaValue.qnaContent+"</textarea></td></tr>";
					var end = "</tbody></table></div>";
					
					var html2 = head + table + no + name + textfield + end + btn;
						
					var htmlval = head+div + table + qnaNo + memberNo + qnaContent + table_end + btn +div_end;
					content.append(html2);					
					submitType = 1;
					
					
					
					
				}
				else
				{
					var head = "<div class = 'pageTtile'><div class = 'pageTtitle_box'>답변 정보</div> </div>";
					var div = "<div class = 'admin_table_re' >";
					var table = "<table class = 'admin_mView_Table' style = 'width:70%;'>";
					var qnaContent = 
						'<tr class = "table-primary"><th class = "q_table_00">답변 내용 </th><td class = "q_table_content" id = "qna_content"><textarea class = "qna_textarea_re" ></textarea></td></tr>';
				
					var table_end = "</table>";
					var btn = '<div class = "admin_submit_btn"><button type="submit" class="btn btn-secondary" id = "submitButton">답변 전송</button></div>';
					var div_end = "</div>"
					
					var htmlval =  head+div + table +qnaContent + table_end + btn +div_end;
					
					
					var table = "<table class='table'><tbody><tr><th scope='row'>답변 정보</th>";
					var textfield = "<td id = 'qna_no'><textarea class = 'qna_textarea_re' style='border: 1px solid #acacac'></textarea></td>";
					var end = "</tr></table></div>";
					
					var html2 = head + table + textfield + end + btn;
					
					content.append(html2);					
					submitType = 2;	
					
					
					
				}
				
				return data;
			}
		});
	}
});
</script>
</div>
</body>
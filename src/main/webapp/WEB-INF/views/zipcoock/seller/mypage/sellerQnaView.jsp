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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/sellerMyPage/pageNavi.css">

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
	.input{
			height: 30px;
		}
	.content_div_info {
	margin: 0px;
	height : 80px;
	border : unset;
		}
	.container{
	margin-top: 100px;
	margin-bottom: 50px;	
}
ul {
 	padding-left: 0;
	list-style: none;
}
.btn{
	background-color:#9ac6e8; 
	color:#ffffff;
}
.btn:hover{
	color: #fff;
	background-color: #7abaff;
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
								<span class="user_div_name" >${sessionScope.m.memberId}<span class="user_div_nim">님</span></span>
							</div>
							
						</div>
						
					</div>
				</div>
				
				<div class="side_nav_content">
					<a href="/zipsellerMypage.do" class="side_nav_div"><span class="side_nav_span side_nav_span">정보 확인/수정</span></a>
					<a href="productList.do?reqPage=1" class="side_nav_div"> <span class="side_nav_span">상품 관리</span></a>
					<a href="/shippingInfomation.do" class="side_nav_div"><span class="side_nav_span">매출 정보</span></a> 
					<a href="/sellerQNA.do?reqPage=1" class="side_nav_div side_nav_div_selected"><span class="side_nav_span_selected">문의내역</span></a>
				</div>
			</div>


        <div class = "content_div">
        	<div class = "content_div_area">
        		
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
        				<div id="title">
						   <h1 style="border-left:2px solid #5f755a;">상품 문의</h1>
                        <br>         
          <div class="content">
        	<fieldset class="well well-lg" style="background-color:white;border: 1px solid rgb(221, 221, 221); padding : 20px;">
			<table class="table" id="inquiryView" style="width:100%;">
				<tr>
					<th style=" border-top: none;">제목</th>
					<th style=" border-top: none;">${q.qnaTitle }</th>
					<th style=" border-top: none;">작성일</th>
					<th style=" border-top: none;">${q.writeDate }</th>
				</tr>
				<tr>
					<th style="width:15%;">상품번호</th>
					<th style="width:35%;">${q.productRefNo }</th>
					<th>답변일</th>
					<th>${q.writeAnswerDate }</th>
					
				</tr>
				<tr>
					<th style="height:100px;">내용</th>
					<th colspan="3">
						${q.qnaContent }
					</th>
				</tr>
				<tr>
					<th style="height:100px;">답변</th>
					<th colspan="3">
						${q.qnaAnswerTitle }
					</th>
				</tr>
			</table>
			</fieldset>
			<br>
			<div class="well well-lg" style="background-color:white;"">
				<h4>답변 작성</h4>
				<form action="/insertAnswer.do" method="post">
					<ul>
						<li>
							
							<input type="hidden" name="qnaRefNo" value="${q.qnaNo }">
							<input type="hidden" name="qnaAnswerNo" value="${q.qnaAnswerNo }">
							<input type="hidden" name="productRefNo" value="${q.productRefNo }">
							<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
							<input type="text" name="qnaAnswerTitle" class="form-control" placeholder="제목" style="margin-bottom: 10px;">
							<textarea name="qnaAnswerContent" class="form-control"placeholder="내용" style="margin-bottom: 10px;"></textarea>
						</li>
						<li>
							<c:if test="${q.qnaAnswerer == 0  }">
								<input type="hidden" name="answerStatus" value="1">
								<button type="submit" class="btn btn-block">등록</button>
							</c:if>
							<c:if test="${q.qnaAnswerer != 0  }">
								<input type="hidden" name="answerStatus" value="2">
								<button type="submit" class="btn btn-block">수정</button>
							</c:if>
						</li>
					</ul>
				</form>
			</div>
          </div>
        </div>
                    </div>
					</div>
        		</div>	
        	</div>
        </div>
        	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


      </body>
      </html>
      
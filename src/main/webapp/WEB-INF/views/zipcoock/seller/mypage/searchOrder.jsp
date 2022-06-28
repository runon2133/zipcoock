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
.container{
	margin-top: 100px;
	margin-bottom: 50px;	
}
.pagination{
	height:60px;
}
#pageNavi{
	display:flex;
	width:420px;
	margin: 0 auto;
	justify-content: center;
}
.table{
	font-size: 12px;
	overflow: hidden;
	text-align: center;
}
.btn{
	background-color:#9ac6e8; 
	color:#ffffff;
}
.btn:hover{
	color: #fff;
	background-color: #7abaff;
}
.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 5%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 5%);
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
						<a href="/zipsellerMypage.do" class="side_nav_div side_nav_div_selected"><span class="side_nav_span side_nav_span_selected">정보 확인/수정</span></a> 
						<a href="/productList.do?reqPage=1" class="side_nav_div"><span	class="side_nav_span">상품 관리</span></a>
						<a href="/searchOrder.do?reqPage=1&isDelivered=A&memberNo=${m.memberNo } "class="side_nav_div"><span class="side_nav_span">매출 정보</span></a> 
						<a href="/sellerQNA.do?reqPage=1" class="side_nav_div"><span class="side_nav_span">문의내역</span></a>
					</div>
			</div>


        <div class = "content_div">
        	<div class = "content_div_area">
        		
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221); overflow: hidden;">
        				<div id="title">
						<h2>판매 정보</h2>
                </div>


    <div class="container">
    	<div class="row">
        
        <div class="col-sm-8 col-md-9">
          <h2 style="border-left:2px solid #9ac6e8;">주문관리</h2>
          <div class="content">
          	<div class="well" style="background-color:white;">
          		<div>
          			<strong>모든 주문건을 조회할 수 있는 통합 주문조회 메뉴입니다.</strong>
          			<ul style="list-style-type: disc;";>
          				<li style="list-style-position: inside; display: list-item; text-align: -webkit-match-parent;">주문조회 가이드 문구.</li>
          				<li style="list-style-position: inside; display: list-item; text-align: -webkit-match-parent;">해당 메뉴에서는 주문확인/상품발송을 대상 메뉴들에서 진행하실 수 있습니다.</li>
          			</ul>
          		</div>
          	</div>
          	<div class="well well-lg" style="background-color:white;">
          		<form action="/searchOrder.do?reqPage=1&memberNo=${sessionScope.m.memberNo }" method="post">
          		<table>
          			<tbody>
          				<tr>
          					<th style="width:150px;">조회조건</th>
          					<td>
          						<div>
          							<div>
          								<div class="dropdown">
          									<select class="btn btn-default" name="isDelivered" style="background: white;color: black; border: 1px solid; vertical-align: middle; height: 35px;">
          										<option selected value="A">전체</option>
          										<option value="N">결제완료</option>
          										<option value="E">발송</option>
          										<option value="Y">배송완료</option>
          									</select>
          								</div>
          							</div>
          						</div>
          					</td>
          				</tr>
          			</tbody>
          		</table>
          		<br>
          		<div>
          			<button type="submit" class="btn btn-block" id="searchBtn">조회</button>
          		</div>
          		</form>
          	</div>
          	<div class="well well-lg" style="background-color:white;">
	          	<table class="table table-hover" style="width:100%;">
					<tr class="table-primary">
						<th>주문번호</th>
						<th>구매자</th>
						<th>결제방식</th>
						<th>주문가격</th>
						<th>주문일자</th>
						<th>주문상태</th>
						<th>상세보기</th>
					</tr>
					<c:forEach items="${opd.list }" var="o" varStatus="i">
						<tr class="table-light">
							<td>${o.paymentInfoCode }</td>
							<td>${o.receiverName }</td>
							
									<td>${o.paymentMethod}</td>
							<td>${o.price }</td>
							<td>${o.orderDate }</td>
							<c:choose>
								<c:when test="${o.isDelivered eq 'N' }">
									<td>결제완료</td>
								</c:when>
								<c:when test="${o.isDelivered eq 'E' }">
									<td>발송</td>
								</c:when>
								<c:when test="${o.isDelivered eq 'Y' }">
									<td>배송완료</td>
								</c:when>
							</c:choose>
							<td><a href="/orderManage.do?paymentInfoCode=${o.paymentInfoCode }&reqPage=1"><button class="btn btn-sm">이동</button></a></td>
						</tr>
					</c:forEach>
				</table>
				<div id="pageNavi">${opd.pageNavi }</div>
          	</div>
          </div>
        </div>
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
</body>
      </html>
      
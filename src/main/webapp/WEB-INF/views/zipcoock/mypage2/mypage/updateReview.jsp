<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yy/MM/dd");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
</style>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>        	
<!-- 
<link rel="stylesheet" href="/resources/css/mainboard/star.css">
 -->
	<%@include file="/WEB-INF/views/zipcoock/mypage2/mypage/zcdMypageHeader.jsp"%>
	<div class = "content_div">
       	<div class = "content_title">상품 리뷰 수정</div>
       	<div class = "content_div_area">
       		<div class = "content_div_content">
        	
        			
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
				<table class="table" style="margin-top:70px">				
					<tr>
					<th>이름</th>
					<td colspan="4">
						<input disabled type="text" class="form-control" style="width:200px; float:left" value="${sessionScope.m.memberName }">
					</td>
					</tr>
					<tr>
					<th>날짜</th>
					<td colspan="4">
						<input disabled type="text" class="form-control" style="width:200px" value="${r.writeDate }">
					</td>
					</tr>					
					<tr>
						<th>별점</th>
						<td colspan="4">
							<div class="star-rating js-star-rating">
							  <input class="star-rating__input" type="radio" name="rating" value="1"><i class="star-rating__star"></i>
							  <input class="star-rating__input" type="radio" name="rating" value="2"><i class="star-rating__star"></i>
							  <input class="star-rating__input" type="radio" name="rating" value="3"><i class="star-rating__star"></i>
							  <input class="star-rating__input" type="radio" name="rating" value="4"><i class="star-rating__star"></i>
							  <input class="star-rating__input" type="radio" name="rating" value="5"><i class="star-rating__star"></i>
							  <div class="current-rating current-rating--${r.starClass } js-current-rating"><i class="star-rating__star">AAA</i>
							  </div>
							</div>
						</td>
					</tr>					
					<tr>
						<th>내용</th>
						<td colspan="4">
							<textarea maxlength="650" id="qnaContent" class="form-control" style="height:300px">${r.reviewContent }</textarea>
						</td>
					</tr>
					
					
					<tr>
						<th></th>
						<td colspan="4">
							<div class="btn-area">
								<button class="buy_btn" id="insertQna">작성하기</button>
								<button class="cart_btn" id="deleteQna">삭제하기</button>
							</div>
						</td>
					</tr>
				</table>

        		</div>	
        	</div>
        </div>
        
        
        
        
				<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" id="productNo" value="${r.productNo }">        		
				<input type="hidden" id="orderedProductNo" value="${r.orderedProductNo }">        		
				<input type="hidden" id="reviewNo" value="${r.reviewNo }">        		
        

        
        
        
        
        
        
        
        
        	</div>
    </div>
    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/zipcoock/mypage2/zcdMypageFooter.jsp"%>
	
<link rel="stylesheet" href="/resources/css/mainboard/star.css">
</body>
<style>
	.input{
			height: 30px;
		}
		th{
		 vertical-align: middle;text-align: center;
		}
	.content_div_info {
	margin: 0px;
	height : 80px;
	border : unset;
		}
		#a{
		margin-top:30px;}
</style>
<script>
var memberNo = $("#memberNo").val()==""? 0:Number($("#memberNo").val());
var productNo = $("#productNo").val()==""? 0:Number($("#productNo").val());
var reviewNo = $("#reviewNo").val()==""? 0:Number($("#reviewNo").val());
var orderedProductNo = $("#orderedProductNo").val()==""? 0:Number($("#orderedProductNo").val());
var star = ${r.starClass }+"".substring(0,1);
star = Number(star)-1;
$(".star-rating__input:eq("+star+")").prop('checked',true);

	$("#insertQna").click(function() {
		if($("#orderedProductNo").val() == "" || $("#qnaContent").val() == "" || $("#productNo").val() == ""){
			alert("제목 및 내용을 작성해주셔야 합니다.");
			return;
		}
		var url = "/myReviewList.do";
		var newForm = $('<form></form>'); 
		newForm.attr("name","newForm"); 
		newForm.attr("method","post"); 
		newForm.attr("action","/update.do");
		newForm.append($('<input/>', {type: 'hidden', name: 'r.memberNo', value:memberNo})); 
		newForm.append($('<input/>', {type: 'hidden', name: 'r.productNo', value:productNo })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'r.reviewNo', value:reviewNo })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'r.orderedProductNo', value:orderedProductNo })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'r.reviewContent', value:$("#qnaContent").val() })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'r.star', value:$("input[name=rating]:checked").val() })); 
		
		newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
		newForm.appendTo('body');
		newForm.submit();
	});


$("#deleteQna").click(function() {
	var url = "/myReviewList.do";
	var newForm = $('<form></form>'); 
	newForm.attr("name","newForm"); 
	newForm.attr("method","post"); 
	newForm.attr("action","/delete.do");
	newForm.append($('<input/>', {type: 'hidden', name: 'r.memberNo', value:memberNo})); 
	newForm.append($('<input/>', {type: 'hidden', name: 'r.productNo', value:productNo })); 
		newForm.append($('<input/>', {type: 'hidden', name: 'r.reviewNo', value:reviewNo })); 
	newForm.append($('<input/>', {type: 'hidden', name: 'url', value:url })); 
	newForm.appendTo('body');
	newForm.submit();
});
	
</script>
<style>
<style>
.star-rating {
	font-size: 0;
	position: relative;
	width: 92.5px;
	height: 18px;
	overflow: hidden;
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAkCAYAAAAOwvOmAAACZ0lEQVR42s2Yz0sUYRjH+wVmB4lCOgR66BAegoQU/4SgQ4culSeRoEKiU0QRrHpSwcCDFEREBMGSiMIOdpA9bGwbLTML+1MjQlE8GGmXgpTdPk/MxrLMzsDM484ufFne2ff9vp95nnee9905VKlUVFQqlQa1vFRM0un0CaB2TNPsbBmoYrF4E6hKoVC42zJQAMUECiVaAkpSRqT2bKhyPp/vCh0KoBEBqooUPmgFqI+1UMgKFSqbzZ4TkHpxvSc0KFL1xAkKjYUGRepKTlBc/xIKFJNfEoBGyuVyfWFAPXWDIlrTTYWKRqNHmXTLA2ozEokc8QWFwRAGb9EcWkRLXFtGCfSJtolyaAV9k8nQd3tyL23QdxVlUZr2B9vbQPP2vK/QczTDgzOJrv+7azpMoLIYhazXsrn/Dxnbw1Uu7oYE85tI3aqyOBVDq5lAUj4IyEXXhR6Px4/T8WWTgN6lUqmOega3aj0sYT0gmD/43/dVEghrLyZflaHWARoIVKcsyzoppUIJyMDrtErx5HMYs0cBYMoyXnxUK3p1r/MrUtatvs1wp6MBoe4cBJQZcD3FVKEymcxZhUX+K5lMtqtBYXhbAUpSeEUTKuZ1GkCPSfEPj36zKlCya7tVdkDeSC2rppn2e5e+aypQcnpoMMk2k1xrUNNGZA01ALsQGAqjFw7GC5wozniMO0+/zw5jHwaCkruuO/b+REMeprUnjmNS39BejUciEBSp668xW/b7nkB8AFuxffZpn/INxSM8bq+NexI1hXdYs3YKb/iGYvAzWRs+INyidhnfKd9Q8qdCvrVlGEab2+9/AaqhSf4SQ/sOAAAAAElFTkSuQmCC");
	background-size: contain;
	margin: auto;
}

.star-rating__star {
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
	width: 20%;
	height: 100%;
	opacity: 0;
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAkCAYAAAAOwvOmAAACtElEQVR42s2YzWsTQRjG4wf4cRBRRFDRgkEtuzujoOKfIHjw4MWPk4igIuJJRBGqPamg4EEUREQEoSiiYtBDCWibZmakHvSgBil+H9SmbXZGUGl8XsniQpdN2J1mE3gJm8y+89t3nnlmZnP1et1K+NLbYyuXlSRfHi6brxWv1p7ml3QMlC+83UbxupbsUMdAacUeEZRR7FlHQNGQGcl/N6AmRweclZlDGeEdJqAgMJTHMoeCjobCUFryF5lCjQ26qwOYcNSG3O7MoFCVU1FQWnpnMoMykr2OgkJUMoHSwt0YQERXy9nUdihfsotxUL7iF9oK1deXm6Ul+xpbKcU/9/TkZiaCwkK6F9q4jU7uIh4gHuO6n9wZiQWuhyHoVzDIN4gR6gy/fY8BCtvDJ9zzFu1fwvWf47cByo3rAvLca/R7A+2uauVdMoKdqym2899To/FZcmNKlGkIdpMW9//CLXvbQT+WCYxkP2Ej+wOWKWZIjtxmqIovnfWxQh8pds0F2PV2AEFPd36U8wtann1asH1U1mkC+gUNH01kCdDYBoC9s6yfD6bMtqTyqWqxayFZhaXhKkyIdYutmCc+M+AzJ5IDsUm6n/JYdfRgrUsa1cHuVdaXGfjI6ZRDd3AaoNhwKigcLqxCmdKa5elnHTcfSyvmWYPSgh+wMvuEu80eFErfbDcAsz2JdqNNdHXZChSt2rHOLvkt8rJgmGG4T2Ks4b0VKNo9RAuXf0MnO6I8jc6CpKHIHWnJ89JDKXYtYhju+2V3adx9E4qtRTs1BUry46mg6KnD215oZ5x2qq1O7WIxN5v8LTjWt/q+oYkVOJtDC2l/0vcElIe20w0N/hkvOYsSQ6EyvaQNAB2hqqV+h4XZR2C+YLuSQyl+hbSRACLuaLYVD3k+MRQdKujbdlQK+Tlx//8FHj0VVkETdoMAAAAASUVORK5CYII=");
	background-size: contain;
}

.star-rating__star ~ .star-rating__star {
	width: 40%;
}

.star-rating__star ~ .star-rating__star ~ .star-rating__star {
	width: 60%;
}

.star-rating__star ~ .star-rating__star ~ .star-rating__star ~
	.star-rating__star {
	width: 80%;
}

.star-rating__star ~ .star-rating__star ~ .star-rating__star ~
	.star-rating__star ~ .star-rating__star {
	width: 100%;
}

.star-rating__input {
	-moz-appearance: none;
	-webkit-appearance: none;
	position: relative;
	z-index: 2;
	opacity: 0;
	display: inline-block;
	width: 20%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.star-rating__input:hover+i, .star-rating__input:checked+i {
	opacity: 1;
}

.star-rating:hover .current-rating {
	display: none;
}


.current-rating.current-rating--1-0 .star-rating__star, .current-rating.current-rating--1-5 .star-rating__star,
	.current-rating.current-rating--2-0 .star-rating__star, .current-rating.current-rating--2-5 .star-rating__star,
	.current-rating.current-rating--3-0 .star-rating__star, .current-rating.current-rating--3-5 .star-rating__star,
	.current-rating.current-rating--4-0 .star-rating__star, .current-rating.current-rating--4-5 .star-rating__star,
	.current-rating.current-rating--5-0 .star-rating__star {
	opacity: 1;
	
}

.current-rating.current-rating--1-0 .star-rating__star {
	width: 20%;
}

.current-rating.current-rating--1-5 .star-rating__star {
	width: 31%;
}

.current-rating.current-rating--2-0 .star-rating__star {
	width: 40%;
}

.current-rating.current-rating--2-5 .star-rating__star {
	width: 51%;
}

.current-rating.current-rating--3-0 .star-rating__star {
	width: 60%;
}

.current-rating.current-rating--3-5 .star-rating__star {
	width: 71%;
}

.current-rating.current-rating--4-0 .star-rating__star {
	width: 80%;
}

.current-rating.current-rating--4-5 .star-rating__star {
	width: 91%;
}

.current-rating.current-rating--5-0 .star-rating__star {
	width: 100%;
}
.star-rating{
	margin-left:0px;
}

</style>
<script>
$("a[href='myReviewList.do']").toggleClass("side_nav_div_selected");
$("a[href='myReviewList.do']").find("span").toggleClass("side_nav_span_selected");
$(".star-rating__input").on("click",function(){
	$(".current-rating").removeClass("current-rating--${r.starClass}");
});
</script>

</html>
      
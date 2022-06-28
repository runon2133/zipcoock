<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/member/checksjoin.css">

</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="container">

    <div id="SjoinInfo">
        <div id="SjoinInfo_title"> 
        <h2>사업자 번호 조회 및 가입 여부 확인</h2> 
        </div>
        <hr>
        
        <div id="SjoinInfo_text">
        <p>사업자 등록번호 인증이 되지 않을 결우, 아래방법으로 확인하실 수 있습니다.</p>
        <p>-FAX접수 : 0303-3455-1534로 사업자등록증 1부 발송(연락처기재)</p>
        <p>*관련문의 : NICE평가정보(주)고객센터로 문의 바람니다.(02-3771-1011)</p>
        <p>ARS 전화 문의 : 1544-9970 (주말·공휴일에도 상담 및 접수 가능합니다.)</p>
        </div>
        <hr>

    </div>
    
    <div id="searchSno">
  
        <div id="searchSno_BOX">
          <p> - 없이 10자리 숫자를 입력해주세요</p>
            <label for="no">사업자 등록 번호 </label>
            <input type="text" id="no">
            <button class="btn btn-block" id="searchBtn">사업자 등록번호 인증</button>
            <div id="result"></div>
        </div>

    </div>
	</div>
	
<script>
	
		
		$("#searchBtn").click(function(){
			var snum = $("#no").val();
			console.log(snum);

			var result = {
			  "url": "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=iBn%2FgMj0Jtxy%2BVM7S3DYu2W5OR1xK42BT7%2BfQPmOhPRyBS6Ywwts%2FOo8lrn6wsonN1t%2BROAiVjMfhQ7f8QWjIA%3D%3D",
			  "method": "POST",
			  "timeout": 0,
			  "headers": {
			  "Content-Type": "application/json"
			  },
			  "data": JSON.stringify({
			    "b_no": [
			    	snum
			    ]
			  }),
			};			
			$.ajax(result).done(function (response) {
				  
				  
				  if(response.data[0].b_stt == ""){
						alert("등록되지 않은 사업자 번호입니다");
						
						
					}else{
						$.ajax({
							url : "/ajaxbNoCheck.do",
							data : {businessNo:response.data[0].b_no},
							type : "post",
							success : function(data){
								if(data == 0){
									alert("추가정보 입력을 위한 페이지로 이동합니다");
									 (function(obj,inputNo) {								
									var Bno = $("#no").val();
										//새로운 form태그를 생성
										var form = $("<form action='/sjoinFrm.do' method='post'></form>");
										//form안에 사업자번호 설정
										form.append($("<input type='text' name='businessNo' value='"+Bno+"'>"));
										form.append($(obj).parent().prev());
										//전송할 form태그를 현재 페이지에 추가
										$("body").append(form);
										//form태그 전송
										form.submit();
							           
								  })();
								}else if(data == 1){
									
									alert("이미 사용중인 사업자 번호입니다");
								}
								
					}
				});
					}
			});
		});
		
		
		
	
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
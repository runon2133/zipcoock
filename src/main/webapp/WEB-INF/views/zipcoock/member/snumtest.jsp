<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<title>Insert title here</title>
</head>
<body>
<input type="text" id="snum" name="snum"><button onclick="snumSearch();">조회</button>
<script>

function snumSearch(){
var snum = $("#snum").val();
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
response.data
console.log(response);
console.log(response.data);
});

}


</script>
</body>


</html>
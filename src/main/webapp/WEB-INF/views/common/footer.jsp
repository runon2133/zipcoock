<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.footer_top>a
{
	display: flex;
	margin-right: 20px;
	
	font-size: 12px;
	font-weight: bold;
	
	color: gray;
}
.footer_top>a>img
{
	margin-top: 15px;
	
	width: 28px;
	max-height: 19px; 
}
.footer_top>a>div
{
	line-height: 50px;
	color: gray;
}
.coperinfo
{
	flex-basis: 530px;
	display: flex;
	justify-content: flex-start;	
}
.coperinfo>div
{
	margin-right: 15px;
	color: gray;
}

.bank_info
{
	flex-basis: 250px;
    display: flex;
    flex-flow: column;
}
.bank_title
{
	font-size: 13px;
    line-height: 18px;
    letter-spacing: -0.5px;
    font-weight: bolder;
    color: rgb(51, 51, 51);
}
.bank_content
{
	color: rgb(136, 136, 136);
}
.bank_link
{
	margin-top: 10px;
	font-size: 13px;
    line-height: 18px;
    letter-spacing: -0.5px;
    font-weight: bolder;
     color: gray;
}
.coper_name
{
	margin-top: 25px;
	font-size: 13px;
	font-weight: bold;
}

.call_title
{
	font-size: 12px;
	font-weight: bolder;
}

.call_number
{
	font-size: 20px;
	font-weight: bolder;
}

.call_time
{
	font-size: 12px;
	color: gray;
}

.call_text
{
	font-size: 10px;
	color: gray;
}

</style>
        <footer class = "footer">
        	<div class = "footer_topline"></div>
        	<div class = "footer_top">
        		<a href = "/">집쿠욱 이용약관</a>
        		<a href = "/">전자 금융거래 이용약관 </a>
        		<a href = "/">개인정보처리방침 </a>
        		<a href = "/">
        		<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAWCAYAAAClrE55AAAAAXNSR0IArs4c6QAABNdJREFUSA29ll9s01UUx23X1s4VGGkL2SLQbiCM7AGzrnVdN2Zkmk0aHCaAvvhgWJwPGl+MGMAHDDNL1KBTUGCJ0wdxUzfCKEQ0M6t0o5sxRCCImrpE/oQ0Q2jG2LrWz/nR3y/t1tURE25ye/59z7nnnnvu7U/3wByjsrKyJJFIbMHcqNPpnMlk0g5/DT4CHYB2hMPhP+G1UVVVtQafddPT06XYCzHE8RvLy8sbNRqNZ4LBYAZec4TRpQvCV1RU2AiyB3Y7QeLwP0DPI1+HXwItRd4AfYjZazAYXkL2svjbyGuZMXC/o7sEjSMXw1dALcyz6N4YHh4OwGeMjERcLlc5Tn2AF0P3ssjHQ0NDNzM8EKqrqxdMTk4+x+5lceC62+Cv6/X6NofD0d3V1TWd7tPQ0PBgNBqtJ9md6D3gO+12e3MgELij4rREPB7PWoAhAv6FcePIyMioCpqL4rM0Ho93ErgWzAZ2+tNcWFXPkW9nA+34hDmu+lAodFtsevkh4EIC9sCOUgXffJIQP6p1raSkxC8ss5dKFYs+16CvDlK5J9mwa2pqqkPFKomQxA4URWTYlO0oVHA2yjFMms3mJgKfoKKmbJiZOpL5kYo047ONCm0Vu66mpsY+Pj4egX+XSuwW5f0a9OQpknGwXplhYmKiCcaYn5//fnoCXq93BQ25B+BjZH+H2cNOdtXV1RXGYrFdYKW8ZvRheuN58XW73Rs5/zdhl2E7x7VtQ26Bd4OLom8Hqx0H8lvMoMlkqtUDehphgDs+BlWG9AxJDGDbQoBj0K8IaIbqSKIH+hrAn5mH4RPixO5WczTfwEoSHfhJ838PX4/uM6YJ/jBHIVdfGWzsNMxleqXRgLEMofuu6e4vi25FvwyphR0cUG0EcaNfzyIH0LeoeqHoarEZmR9xxO+QWAx1G/ovwe7G91dsR4j9BPpTKZ8k71YQvlyatYh5RQzqAPxIiu9XdUIJquihGfoUZlEKExHKolkpvvLiagP5b4Qi5dZo2hSDMZJi16TbSFDVr07X/wefFDsxFZoFK6+vwcCPVEOqog3ekj6u9F521U5JLdAogazov6Z3LpHQ65T0Bu/BefgyjuJDzfneGVn7qp4FLsB40v0HBwcjyJuw3WChz0nkOLRZXkF0fmYY+z5038HLM/9/hhvn3ySRPpgan8+3OD0aDdbPLOdqWdEX+/3+OrGju8h8fAGDCskNsYm+oKDgENhVFovlmMiYAyLzLHwqss1mO5uStbdK/lbwl74LaA8aZX5P3glxul+D4/2CtZ6yWq0OZU0UrcxbfE+snG8SXM9P6J9188XPxOG7njUTzFfEptwaStwKf4WH5Vt5zGY6ZZMpqYseOQl+VTZ7Lh2Ll+LbTVuEwO0XrJKI/NGRzDPIy7ktQYDLxZhrgG/EflNeT3ZXmwubbiO2D/k0M0bPNHHjpsSufY+IQLnn9WHE/42Fp/5lXF6kMhJIvsz2s8MPpJnhZw3+h5xUQT6MXmCeAbuZnryqAjMSESUZ5/pUfDjV5XLlCgl2lAq+yp/bNvgd2BZCw9BfoPKBJY+YfKN40T0KHUPf6nQ698nnA7I2ZiWiWij3zI/nJQS5hf0PZj98Jzs6p+Jp9HyS2syun0W3EvsKqMS/zBRcL8n0chT/wM8a/wKlFH23+Tv5SgAAAABJRU5ErkJggg==" srcset="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAWCAYAAAClrE55AAAAAXNSR0IArs4c6QAABNdJREFUSA29ll9s01UUx23X1s4VGGkL2SLQbiCM7AGzrnVdN2Zkmk0aHCaAvvhgWJwPGl+MGMAHDDNL1KBTUGCJ0wdxUzfCKEQ0M6t0o5sxRCCImrpE/oQ0Q2jG2LrWz/nR3y/t1tURE25ye/59z7nnnnvu7U/3wByjsrKyJJFIbMHcqNPpnMlk0g5/DT4CHYB2hMPhP+G1UVVVtQafddPT06XYCzHE8RvLy8sbNRqNZ4LBYAZec4TRpQvCV1RU2AiyB3Y7QeLwP0DPI1+HXwItRd4AfYjZazAYXkL2svjbyGuZMXC/o7sEjSMXw1dALcyz6N4YHh4OwGeMjERcLlc5Tn2AF0P3ssjHQ0NDNzM8EKqrqxdMTk4+x+5lceC62+Cv6/X6NofD0d3V1TWd7tPQ0PBgNBqtJ9md6D3gO+12e3MgELij4rREPB7PWoAhAv6FcePIyMioCpqL4rM0Ho93ErgWzAZ2+tNcWFXPkW9nA+34hDmu+lAodFtsevkh4EIC9sCOUgXffJIQP6p1raSkxC8ss5dKFYs+16CvDlK5J9mwa2pqqkPFKomQxA4URWTYlO0oVHA2yjFMms3mJgKfoKKmbJiZOpL5kYo047ONCm0Vu66mpsY+Pj4egX+XSuwW5f0a9OQpknGwXplhYmKiCcaYn5//fnoCXq93BQ25B+BjZH+H2cNOdtXV1RXGYrFdYKW8ZvRheuN58XW73Rs5/zdhl2E7x7VtQ26Bd4OLom8Hqx0H8lvMoMlkqtUDehphgDs+BlWG9AxJDGDbQoBj0K8IaIbqSKIH+hrAn5mH4RPixO5WczTfwEoSHfhJ838PX4/uM6YJ/jBHIVdfGWzsNMxleqXRgLEMofuu6e4vi25FvwyphR0cUG0EcaNfzyIH0LeoeqHoarEZmR9xxO+QWAx1G/ovwe7G91dsR4j9BPpTKZ8k71YQvlyatYh5RQzqAPxIiu9XdUIJquihGfoUZlEKExHKolkpvvLiagP5b4Qi5dZo2hSDMZJi16TbSFDVr07X/wefFDsxFZoFK6+vwcCPVEOqog3ekj6u9F521U5JLdAogazov6Z3LpHQ65T0Bu/BefgyjuJDzfneGVn7qp4FLsB40v0HBwcjyJuw3WChz0nkOLRZXkF0fmYY+z5038HLM/9/hhvn3ySRPpgan8+3OD0aDdbPLOdqWdEX+/3+OrGju8h8fAGDCskNsYm+oKDgENhVFovlmMiYAyLzLHwqss1mO5uStbdK/lbwl74LaA8aZX5P3glxul+D4/2CtZ6yWq0OZU0UrcxbfE+snG8SXM9P6J9188XPxOG7njUTzFfEptwaStwKf4WH5Vt5zGY6ZZMpqYseOQl+VTZ7Lh2Ll+LbTVuEwO0XrJKI/NGRzDPIy7ktQYDLxZhrgG/EflNeT3ZXmwubbiO2D/k0M0bPNHHjpsSufY+IQLnn9WHE/42Fp/5lXF6kMhJIvsz2s8MPpJnhZw3+h5xUQT6MXmCeAbuZnryqAjMSESUZ5/pUfDjV5XLlCgl2lAq+yp/bNvgd2BZCw9BfoPKBJY+YfKN40T0KHUPf6nQ698nnA7I2ZiWiWij3zI/nJQS5hf0PZj98Jzs6p+Jp9HyS2syun0W3EvsKqMS/zBRcL8n0chT/wM8a/wKlFH23+Tv5SgAAAABJRU5ErkJggg==" class="sc-eirqVv dSzotL">
        		<div>소비자 중심경영</div></a>
        	</div>
        	<div class = "footer_topline"></div>
        	<div class = "footer_maincontent">
        		<div class = "coper_info_box">
        			<div class = "coperinfo">
        				<div>대표이사 : 아무개</div>
        				<div>주소 : 서울특별시 송파구 위례성대로 3 장은빌딩 20층</div>        			
        			</div>    
        			<div class = "coperinfo">   
        				<div>사업자등록번호 : 121-81-12763</div>
        				<div>통신판매업신고번호 : 2011-서울당산-0545</div>     
        			</div>   
        			<div class = "coperinfo">   
        				<div>팩스 : 02-532-3211</div>
        				<div>이메일 : zipcoook@gmail.com</div>     
        			</div>    
        			<div class = "coper_name">
        				상호명 : (주)집에서 쿠-욱
        			</div>
        			
        			
        		</div>
        		<div class = "bank_info">
        			<div class = "bank_title">좋은은행 채무지급보증 안내</div>
        			<div class = "bank_content">당사는 고객님이 현금 결제한 금액에 대해 좋은은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.</div>
        			<div class = "bank_link">서비스 가입사실 확인</div>
        		</div>
        		<div class = "call_info">
        			<div class = "call_title">집-쿡 고객센터</div>
        			<div class = "call_number">1600 - 4949</div>
        			<div class = "call_time">평 일</div>
        			<div class = "call_time">09:00~19:00</div>
        			<div class = "call_time">토요일</div>
        			<div class = "call_time">09:00~16:00</div>
        			<div class = "call_time">공휴일</div>
        			<div class = "call_time">09:00~18:00</div>
        			<div class = "call_text">일요일 및 설,추석은 휴무입니다.</div>
        		</div>
        	</div>        	
        </footer>
        
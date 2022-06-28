<%@ page import="java.text.NumberFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menuImg_div {
		width: 460px;
		height: 200px;
		text-align: center;
	}
	.menu_img {
		width: 100%;
		height: 100%;
		position: relative;
		left: 100%;
		margin-left: -200%;
		object-fit: cover;
	}
	.gjcLUR {
	    display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 0.8rem 1rem;
	}
	.cQHmLv {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-end;
	}
	.border_bottom {
		border-bottom: 1px solid rgba(0, 0, 0, 0.08);
	}
	.menu_content {
	    display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 0.8rem 1rem;
	    font-size: 14px;
	    color: #888;
	    border-bottom: 1px solid rgba(0, 0, 0, 0.08);
	}
	.btn-100 {
		width: 100%;
		height: 60px;
		position:fixed; 
		bottom:0px;
	}
	.div_gap {
		height: 60px;
	}
	
</style>

<link rel="stylesheet" href="/resources/css/common/default2.css">
<link rel="stylesheet" href="/resources/css/common/font.css">
<!-- bootstrap css -->
<link rel="stylesheet" href="/resources/css/deliverySeller/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="menuImg_div"><img class="menu_img" src='/resources/upload/zcdSeller/${menu.filename }'></div>
	
	<form method="post" id="addCartForm">
	
		<div class="card">
			<div class="card-header" style="font-weight: 600;">${menu.menuName }</div>
			<div class="menu_content">${menu.menuContent }</div>
			<div class="gjcLUR border_bottom">
				<span class="hwbCCJ">가격</span>
				<input type="hidden" value="${menu.menuPrice }">
				<div class="cQHmLv"><span><fmt:formatNumber value="${menu.menuPrice }" pattern="#,###" /> 원</span></div>
			</div>
			<div class="gjcLUR border_bottom">
				<span class="hwbCCJ">수량</span>
				<div class="cQHmLv">
					<input type="number" class="form-control text-center" id="quantity" name="amount" value="1" min="1" max="100" style="width: 70px; border: none;"/>
					<input type="hidden" id="menuPrice" name="menuPrice" value="">
					<input type="hidden" id="menuNo" name="menuNo" value="${menu.menuNo }">
				</div>
			</div>
			
			<c:choose>
				<c:when test="${not empty addMenu1 }">
					<div class="card-header" style="font-weight: 600;">필수 선택</div>
					<c:forEach items="${addMenu1 }" var="am1" varStatus="i">
						<div class="gjcLUR border_bottom">
						<div class="form-check">
					        <input type="radio" class="form-check-input" name="addmenu1Opt" id="addmenuOpt${i.count }" value="${am1.addmenuName }">
					        <label class="hwbCCJ" for="addmenuOpt${i.count }" style="font-size: 16px;"> ${am1.addmenuName }</label>
					    </div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="addmenu1Opt" value="">
				</c:otherwise>
			</c:choose>
					
			<c:choose>
				<c:when test="${not empty addMenu2 }">
					<div class="card-header" style="font-weight: 600;">추가 선택</div>
					<div class="addMenu2_div">
						<c:forEach items="${addMenu2 }" var="am2" varStatus="i">
							<div class="gjcLUR border_bottom">
								<div class="form-check">
							        <input type="checkbox" class="form-check-input addmenuInfo2" name="addmenuInfo2" id="addmenu2Opt${i.count }" value="${am2.addmenuName }">
							        <label class="hwbCCJ" for="addmenu2Opt${i.count }" style="font-size: 16px;"> ${am2.addmenuName }</label>
							        <span>(+<fmt:formatNumber value="${am2.addmenuPrice }" pattern="#,###" /> 원)</span>
							        <input type="hidden" value="${am2.addmenuPrice }">
							    </div>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="addmenuInfo2" value="">
				</c:otherwise>
			</c:choose>
			
		<!--
		<input type="hidden" name="addmenuInfo1" value="">
		 -->
		<input type="hidden" name="storeNo" value="${storeNo }">
		</div>
		<div class="div_gap" ></div>
		<button type="button" class="btn btn-primary btn-100" id="addcart">장바구니 담기</button>
		<!-- (주문금액 <span style="color: #fff;"><fmt:formatNumber value="${menu.menuPrice }" pattern="#,###" /></span> 원) -->
	</form>
	
	
	<script>
		$(function() {
		
			var addCartChk = false;
			
			/*
			$("input[type=number]").on("change", function() {
				var quantity = $(this).val();
				var price = $(this).parent().parent().prev().children().eq(1).val();
				var total = (price * quantity);
				var menuPrice = $(this).next().val();
				menuPrice = total;
				var totalPrice = $(this).parent().parent().parent().next().next().children();
				totalPrice.html(menuPrice.formatNumber());
				console.log(menuPrice);
			});
			*/
			/*
			Number.prototype.formatNumber = function(){
			    if(this==0) return 0;
			    let regex = /(^[+-]?\d+)(\d{3})/;
			    let nstr = (this + '');
			    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
			    return nstr;
			};
			*/
			
			$("input[name=addmenu1Opt]").on("change", function() {
				addCartChk = true;
			});
			
			
			$("input[name=addmenu1Opt]").on("click", function() {
				var addmenu1Opt = $(this).parent().parent().parent().parent().next().next().val();
				addmenu1Opt = $(this).val();
				console.log(addmenu1Opt);
			});
			
			/*
			$("input[name=addmenuInfo2]").on("click", function() {
				
				var menuPrice = $(this).parent().parent().parent().parent().children().eq(2).children().eq(1).val();
				var addmenuPrice = $(this).next().next().next().val();
				
				if ($(this).prop("checked")) {
					menuPrice = (Number(menuPrice) + Number(addmenuPrice));
				} else {
					menuPrice = (Number(menuPrice) - Number(addmenuPrice));
				}
				console.log(menuPrice);
			});
			*/
			
			
			$("#addcart").on("click", function() {
				var addmenu1Opt = $("input[name=addmenu1Opt]").val();
				if (addmenu1Opt == "") {
					var params = $("#addCartForm").serialize();
					$.ajax({
						url : "/addCart.do",
						data : params,
						type : "post",
						success : function(data) {
							if (data == 0) {
								alert("장바구니 등록 완료");
								self.close();
							} else if (data == 1) {
								alert("장바구니 등록 실패");
								self.close();
							}
						}
					});
	    			return true;
	    		} else if (addCartChk == false) {
    				alert("필수 선택을 확인하세요.");
    				return false;
    			} else {
    				var params = $("#addCartForm").serialize();
    				$.ajax({
    					url : "/addCart.do",
    					data : params,
    					type : "post",
    					success : function(data) {
    						if (data == 0) {
    							alert("장바구니 등록 완료");
    							self.close();
    						} else if (data == 1) {
    							alert("장바구니 등록 실패");
    							self.close();
    						}
    					}
    				});
 					return true;
    			}
			});
			
			
		});
	</script>
</body>
</html>
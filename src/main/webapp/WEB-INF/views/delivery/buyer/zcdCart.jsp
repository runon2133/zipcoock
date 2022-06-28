<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/zcdCart.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<%@include file="/WEB-INF/views/common/deliveryHeader.jsp"%>
	<div class="container">
		<div class="content_title">장바구니</div>
			<c:if test="${not empty zcv }">
	            <input type="hidden" name="cmd" value="order">
	            <div class="cartBtn">
	               	<button class="abutton">선택상품 삭제</button>
	            </div>
	            <div class="cartdiv" id="cart">
	                <div class="divRow head">
	                    <div class="subdiv">
	                        <div class="check"><input type="checkbox" name="checkAll" id="checkAll" checked=""></div>
	                        <div class="img">상호명</div>
	                        <div class="pname">메뉴</div>
	                    </div>
	                    <div class="subdiv">
	                        <div class="cartprice">가격</div>
	                        <div class="num">수량</div>
	                        <div class="sum">합계</div>
	                    </div>
	                    <div class="subdiv">
	                        <div class="cartcmd">배달비</div>
	                    </div>
	                    <div class="split"></div>
	                </div>
	                <c:set var="sum" value="0"/>
	        		<c:forEach items="${zcv }" var="z" varStatus="status">
	                <div class="divRow data">
	                    <div class="subdiv">
	                        <div class="check"><input type="checkbox" name="buy" class="checkBox" value="260" checked="" data-menuNo="${z.menuNo }">&nbsp;</div>
	                        <div class="img img-content">${z.storeName }</div>
	                        <div class="pname pname-content">
	                            <div>${z.menuName }</div>
	                            <c:if test="${not empty z.addmenuInfo1 || not empty z.addmenuInfo2}">
		                            <div><small>- ${z.addmenuInfo1 }</small></div>
		                            <div><small>- ${z.addmenuInfo2 }</small></div>
	                            </c:if>
	                        </div>
	                    </div>
	                    <div class="subdiv">
	                        <div class="cartprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="${z.menuAllprice }">${z.menuAllprice }원</div>
	                        <div class="num">
	                            <div class="updown">
	                                <span class="down" onclick="changePNum(${status.count});"><i class="fas fas fa-minus-circle"></i></span>
	                                <input type="hidden" id="menuNo" value="${z.menuNo }">
	                                <input type="text" name="p_num1" id="${z.menuName }" size="2" maxlength="4" class="p_num" value="${z.amount }" readonly>
	                                <span class="up" onclick="changePNum(${status.count});"><i class="fas fa-plus-circle"></i></span>
	                            </div>
	                        </div>
	                        <div class="sum">${z.menuAllprice }원</div>
	                    </div>
	                    <div class="subdiv">
	                        <div class="cartcmd">${deliFee }원</div>
	                    </div>
	                </div>
	                <c:set var="sum" value="${sum + (z.menuAllprice * z.amount)}"/>
				</c:forEach>
				</div>                
	            <div class="bigtext right-align box summoney">결제 예정 금액 <span class="blue" id="sum_p_price">${sum }</span>원 + 배달비 <span class="blue">${deliFee }</span>원 = <span class="blue">${finalPrice }</span>원</div>
	    
	            <div id="goorder" class="">
	                <div class="clear"></div>
	                <div class="buttongroup center-align cmd">
	                    <a id="orderList" href="/zcdOrderList.do">선택한 상품 주문</a>
	                </div>
	            </div>
            
            </c:if>
            <c:if test="${empty zcv }">
            	<h2>장바구니가 비었습니다.</h2>
            </c:if>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	var totalCount=0;
	var totalPrice=0;
	
	$(function(){
		// 전체 선택
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$(".checkBox").prop("checked",true);
			}else{
				$(".checkBox").prop("checked",false);
			}
		});
		$(".check").click(function(){
			if($("input[name=buy]:checked").length < $("input[name=buy]").length){
				$("#checkAll").prop("checked",false);
			}else{
				$("#checkAll").prop("checked",true);
			}
			reCalc();
			updateUI();
		});

		// 선택 상품 삭제
		$(".abutton").eq(0).click(function(){
			var confirm_val=confirm("선택 상품을 장바구니에서 삭제하시겠습니까?");
			
			if(confirm_val){
				var checkArr=new Array();
				$("input[name=buy]:checked").each(function(index,item){
					item.parentElement.parentElement.parentElement.remove();
					checkArr.push($(this).attr("data-menuNo"));
				});
				
				$.ajax({
					url:"/zcdDeleteCart.do",
					type:"post",
					data:{chkbox:checkArr},
					success: function(result){
						if(result==1){
							location.href="/zcdCart.do";							
						}else{
							alert("장바구니 삭제에 실패하였습니다.");
						}
					}
				});
			}
		});
		
		// 선택한 상품 주문 (ajax)
		$("#orderList").click(function(){
			var cartNo=$("#cartNo").val();
			var checkArr=new Array();
			$("input[name=buy]:checked").each(function(index,item){
				checkArr.push($(this).attr("data-menuNo"));
			});
			$("#chk").val(checkArr);
			$.ajax({
				url:"/zcdOrder.do",
				type:"post",
				data:{chkbox:checkArr}
			})
		});
		
		// 수량 변경
		$('.updown').each(function(el, idx){
			//수량 입력 필드 값 변경
			item.$('input').keyup(function(){
			changePNum(idx+1);
		});

			//수량 증가 화살표 클릭
			$(event.target).closest("span").hasClass("up").click(function(){
				changePNum(idx+1);
			});

			//수량 감소 화살표 클릭
			$(event.target).closest("span").hasClass("down").click(function(){
				changePNum(idx+1);
			});
		}
	);
});
	
	// 개별 수량 변경
	function changePNum(obj){
		var menuNo=$("#menuNo").val();
		console.log(menuNo);
		var item=$("input[name=p_num"+obj+"]").val();
		var p_num=parseInt(item);
		var newval= 1;
		if($(event.target).closest("span").hasClass("up")===true){
			p_num+=1;
		}else if($(event.target).closest("span").hasClass("down")===true){
			p_num-=1;
		}
		
		newval=p_num;
		
        if (parseInt(newval) < 1 || parseInt(newval) > 99) {
        	return false;
        }
        $("input[name=p_num"+obj+"]").val(newval);
        item= newval;

        var price = $("input[name=p_num"+obj+"]").parent().parent().prev().children().val();
        
        $("input[name=p_num"+obj+"]").parent().parent().next().text((newval * price).formatNumber()+"원");
        // ajax 전송
        $.ajax({
			url:"/zcdChangeNum.do",
			type:"post",
			data:{amount:p_num, menuNo:menuNo},
			success: function(result){
				if(result==1){
					location.href="/zcdCart.do";
					reCalc();
				}else{
					alert("수량 변경에 실패하였습니다.");
				}
			}
		});
	};
	
	// 재계산
	function reCalc(){
		totalCount=0;
		totalPrice=0;
		
		$(".p_num").each(function(index,item){
			if($(item).parent().parent().parent().prev().children().first().children().first().prop("checked")){
				var count=parseInt($(item).val());
				totalCount+=count;
				var price=$(item).parent().parent().prev().first().children().first().val();
				totalPrice+=count*price;
			}
		});
		// ajax 전송
        
        // 성공 시
        //reCalc();
        updateUI();
	};
	
	// 화면 업데이트
	function updateUI(){
		$("#sum_p_price").text(totalPrice.formatNumber()+" 원");
	}
	
	// 숫자 3자리 콤마찍기
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
	
	</script>
</body>
</html>
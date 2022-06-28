<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>


<script>
function insert() {
	var memberContact = $("#managerContact1").val() + $("#managerContact2").val() + $("#managerContact3").val();
	$("#managerContact").val(memberContact);
	
	if ($("#photoStatus").val == '1' ){
		alert($("#managerContact").val());
		$("#productImage").attr("id", 'NoId');
	}else{
		
	}	
	//카테고리에 값을 입력했을경우 1
	if ($("#categoryNo").val() != '0') {
		
		//상품명을 입력했을경우 2
		if ($("#productName").val() != '') {
			//판매가 입력했을 경우3
				if ($("#Price").val() != '') {
				
				//재고 입력 했을경우4
					if ($("#stock").val() != '') {
					
					//제조일자 공백아닌경우5
						if($("#manufactureDate").val() !=''){
		
						//제조국 공백 아닌경우6
							if ($("#origin").val() != '') {
								
								//제조자 공백 아닌경우7
								if ($("#manufacturer").val() != '') {									
									//담당자 연락처 공백 아닌경우8
									if ($("#managerContact2").val() && $("#managerContact3").val() != '') {	
										//상품 설명 공백 아닌경우9
										if ($("#productDetail").val() != '') {
											//주의사항 공백인 경우10
											if ($("#precautions").val() != '') {
												//유통기한 입력한경우11
												if($("#expirationDate").val() != ''){
													//구매제한 입력한경우12
													if($("#limit").val() != ''){
														//배송방법 입력한경우13
														if($("#shippingMethod").val() != ''){
															//배송회사 입력한경우14
															if($("#shippingCompany").val() != ''){
																//상품이미지 입력한경우15
																if($("#productImage").val() != ''){
																	//상품상세이미지 입력한경우16
																	if($("#productFile").val() != ''){
																		
																		//환불정책 입력한경우 17
																		if($("#policyContent").val() != ''){
																			
																			//상품등록 확인버튼 취소했을경우18
																			if (confirm("상품등록 하시겠습니까?")) {
																				alert("상품등록이 완료되었습니다.");
																				
																				return true;
																			} else {
																				return false;
																		}
																			//환불정책 입력한경우 17
																		}else{
																			alert("환불 주의사항을 확인해주세요!");
																			$("#productFile").focus();
																			return false;
																		}		
																			//상품상세이미지 입력한경우16
																	}else{
																		alert("상품  이미지를 확인해주세요!");
																		$("#productFile").focus();
																		return false;
																	}
																	
																	//상품이미지 입력한경우15
																}else{
																	alert("상품 이미지를 확인해주세요!");
																	$("#productImage").focus();
																	return false;
																}
															
																//배송회사 입력한경우14
															}else{
																alert("배송회사를 확인해주세요!");
																$("#shippingCompany").focus();
																return false;
															}
															//배송방법 입력한경우13
														}else{
															alert("배송방법을 확인해주세요!");
															$("#shippingMethod").focus();
															return false;
														}
														//구매제한 입력한경우12
													}else {
														alert("구매제한을 확인해주세요!");
														$("#limit").focus();
														return false;
													}
													//유통기한 입력한경우11
												}else{
													alert("유통기한을 확인해주세요!");
													$("#expirationDate").focus();
													return false;
												}
											
												//주의사항 공백인 경우10
										
											}else{
												alert("주의사항을 확인해주세요!");
												$("#precautions").focus();
												return false;
											}
											
											//상품 상세설명 입력 안한경구9
										} else {
											alert("상세설명을 확인해주세요!");
											$("#productDetail").focus();
											return false;
										}
										//상세주소 입력안했을경우8
									} else {
										alert("담당자 연락처를 확인해 주세요!!");
										$("#managerContact2").focus();
										return false;

									}
									//제조자 공백인경우7
								} else {
									alert("제조자를 확인해주세요!");
									$("#manufacturer").focus();
									return false;

								}
							
							//제조국 공백인경우경우6
						} else {
							alert("제조국 확인해주세요!");
							$("#origin").focus();
							return false;
						}
						//제조일자 공백인경우5
					} else {
						alert("제조일자를 확인해주세요!");
						$("#manufactureDate").focus();
						return false;
						}
						//재고 입력 안했을 경우4
				} else {
						alert("재고값을 확인해주세요!");
						$("#stock").focus();
						return false;
					}
					//상품 가격 입력 안했을 경우3
				} else {
					alert("상품 가격을 확인해주세요!");
					$("#Price").focus();
					return false;
				}
				//아이디값 중복이거나 null일 경우2
			} else {
				alert("상품 이름을 확인해주세요!");
				$("#productName").focus();
				return false;
			}

			//이용약관 체크안했을경우1
		} else {
			alert("카테고리을 확인해 주세요!");
			$("#categoryNo").focus();
			return false;
		}
}
	




	
</script>
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
	$(function(){
		var selectValue = $(#categoryNo).attr("selectValue");
		$("#categoryNo>option").eq(selectValue).prop("selected",true);
		console.log(selectValue);
	});
	
</style>
<link rel="stylesheet" href="/resources/css/deliveryBuyer/buyerDefault.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css'>



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
					<a href="/zipsellerMypage.do" class="side_nav_div side_nav_div"> <span class="side_nav_span side_nav_span">정보 확인/수정</span></a> 
					<a href="/productList.do?reqPage=1" class="side_nav_div_selected side_nav_div"><span class="side_nav_span side_nav_span_selected">상품 관리</span></a> 
					<a href="/shippingInfomation.do" class="side_nav_div"><span class="side_nav_span">매출 정보</span></a>   
					<a href="/sellerQNA.do?reqPage=1" class="side_nav_div"><span class="side_nav_span">문의내역</span></a>
				</div>
			</div>


        <div class = "content_div">
        	<div class = "content_div_area">
        	
        			
        		<div class = "content_div_content" style="background: white; padding: 20px 20px; border: 1px solid rgb(221, 221, 221);">
        			   <form action="/productUpdate.do" method="post" enctype="multipart/form-data">
        			   <input type="hidden" name="productNo" value="${p.PRODUCTNO }">
				<table class="table" style="margin-top:70px">
					<tr>
						<th>카테고리</th>
						<td colspan="4">
							<select class="form-control" id="categoryNo" name="categoryNo" selectValue="${p.CATEGORYNO }">								
								<option value="1">생활용품</option>
								<option value="2">뷰티</option>
								<option value="3">헬스/건강식품</option>
								<option value="4">주방용품</option>
								<option value="5">완구/취미</option>
								<option value="6">헬스/건강식품</option>
								<option value="7">주방용품</option>
								<option value="8">완구/취미</option>
							</select>
							
						</td>
					</tr>
					<tr>
					<th>상호명</th>
					<td colspan="4">
						<input type="text" id="tradeName" name="tradeName" class="form-control" value="${p.TRADENAME}" readonly> 
					</td>
					</tr>
					<tr>
					<th>상품명</th>
					<td colspan="4">
						<input type="text" id="productName" name="productName" value="${p.PRODUCTNAME}"class="form-control"> 
					</td>
					</tr>
					<tr>
					<th>판매가</th>
					<td colspan="4">
						<input type="text" id="price" name="price" class="form-control" style="width:200px; float:left" value="${p.PRICE}"><span style="   vertical-align: middle; line-height: 37px; font-size: 20px; padding-left: 10px;" >원</span>
					</td>
					</tr>
					<tr>
					<th>재고</th>
					<td colspan="4">
						<input type="text" id="stock" name="stock" class="form-control" style="width:200px" value="${p.STOCK}">
					</td>
					</tr>
					<tr>
					<th>제조일자</th>
					<td colspan="4">
						<input type="date" id="manufactureDate" name="manufactureDate" class="form-control" style="width:200px" value="${p.MANUFACTUREDATE}">
					</td>
					</tr>
					<tr>
					<th style="vertical-align: middle;text-align: center;">제조국</th>
					<td colspan="2">
						<input type="text" id="orgin" name="origin" class="form-control" value="${p.ORIGIN}">
					</td>
					<th style="width: 100px; vertical-align: middle;text-align: center;">제조자</th>
					<td colspan="2">
						<input type="text" id="manufacturer" name="manufacturer" class="form-control" value="${p.MANUFACTURER}">
					</td>
					</tr>
					<tr>
					<th style="width:120px;">담당자 연락처</th>
					<td colspan="4">
						<input type="text" id="managerContact1" name="managerContact1" class="form-control" style="width:100px;display: inline;"value="${managerContact1}" ><span>-</span>
						<input type="text" id="managerContact2" name="managerContact2" class="form-control" style="width:200px;display: inline;"value="${managerContact2}" ><span>-</span>
						<input type="text" id="managerContact3" name="managerContact3" class="form-control" style="width:200px;display: inline;"value="${managerContact3}" >
						<input type="hidden" id="managerContact" name="managerContact">
					</td>
					</tr>
					
					<tr>
						<th>상품설명</th>
						<td colspan="4">
							<textarea id="howToUse" name="howToUse" class="form-control" style="height:300px">${p.HOWTOUSE}</textarea>
						</td>
					</tr>
					<tr>
						<th>상품사용법</th>
						<td colspan="4">
							<textarea id="productDetail" name="productDetail" class="form-control" style="height:300px">${p.PRODUCTDETAIL}</textarea>
						</td>
					</tr>
					<tr>
					<th>주의사항</th>
					<td colspan="4">
						<input type="text" id="precautions" name="precautions" class="form-control" style="width:200px"value="${p.PRECAUTIONS}">
					</td>
					</tr>
					<tr>
					<th>유통기한</th>
					<td colspan="4">
						<input type="date" id="expirationDate" name="expirationDate" class="form-control" style="width:200px" value="${p.EXPIRATIONDATE}">
					</td>
					</tr>
					
					
					<tr>
					<th>구매제한</th>
					<td colspan="4">
						<input type="text" id="limit" name="limit" class="form-control" style="width:200px" value="${p.LIMIT}">
					</td>
					</tr>
					<tr>
					<th>배송 방법</th>
					<td colspan="4">
						<input type="text" id="shippingMethod" name="shippingMethod" class="form-control" value="${p.SHIPPINGMETHOD}" >
					</td>
					
					<tr>
					<th>배송 회사</th>
					<td colspan="4">
						<input type="text" id="shippingCompany" name="shippingCompany" class="form-control" value="${p.SHIPPINGCOMPANY}">
					</td>
					
					</tr>
					<tr>
					<th>배송예상기간</th>
					<td colspan="4">
						<input type="text" id="shippingPeriod" name="shippingPeriod" class="form-control" value="${p.SHIPPINGPERIOD}">
					</td>
					</tr>
					
					<tr>
					<th>배송비</th>
					<td colspan="4">
						<input type="text" id="shippingFee" name="shippingFee" class="form-control" value="${p.SHIPPINGFEE}">
					</td>
					</tr>
					
					<tr>
						<th>썸네일 파일</th>
						<td colspan="4"> 
							<input type="file" id="productImage" name="productMainImg" accept=".png,.jpg,.jpeg" style="float:left">
							<span style="float:right" class="float-right">권장크기 : 500x500</span>
						</td>
					</tr>
						<tr id="productImgViewWrap">					
					
						<td colspan='5'><img id="productImgView" style="height: 50px;width: 50px;" src='/resources/upload/product/${p.FILEPATH }'><span id=productImageText> ${p.FILENAME } </span> <a href="javascript: void(0)" id=productImgCancle >x</a></td></tr>
					<tr>
						<th>상세보기 파일</th>
						<td colspan="4">
							<input type="file" id="productFile" name="productDetailImg" accept=".png,.jpg,.jpeg"  style="float:left" multiple>
							<span style="float:right" class="float-right">파일형식 : png,jpg,jpeg</span><input type="hidden" name="status" value="1">
						</td>
					</tr>
					<c:forEach items="${p.oldpath }" var="opi" varStatus="i">
					<tr id="oldproductImgViewWrap">
						<td colspan='5'><img id="oldProductImgView${i }" style="height: 50px;width: 50px;" src='/resources/upload/product/${opi.filePath }'><span id="productImageText${i }"> ${opi.fileName } </span> <a href="javascript: void(0)" onclick='productImgCancle(this)' >x</a><input type="hidden" id="oldPathValue" name="oldPath" value=${opi.filePath } disabled> <input type="hidden" id="oldPathValue" name="oldPathNo" value=${opi.productImgNo } disabled></td></tr>
						
					</c:forEach>
					
					
					<tr id="detailWrapper">
					<th>환불 주의사항</th>
					<td colspan="4">
						<input type="text" id="policyContent" name="policyContent" class="form-control" style="width:200px" value="${p.POLICYCONTENT}">
					</td>
					</tr>

					
				<tr>
						<th>환불 가능 기간</th>
						<td colspan="4">
							<select class="form-control" id="retrunLength" name="retrunLength">
							<c:if test="${p.RETURNLENGTH == 0 }">
							<option value="${p.RETURNLENGTH}" selected>환불/교환 불가</option>
							</c:if>
							<c:if test="${p.RETURNLENGTH != 0}">returnLength
							<option value="${p.RETURNLENGTH}" selected>${p.RETURNLENGTH}일이내</option>
							</c:if>
							
								<option value="0">환불/교환 불가</option>
								<option value="1">1일 이내</option>
								<option value="2">2일 이내</option>
								<option value="3">3일 이내</option>
								<option value="4">4일 이내</option>
								<option value="5">5일 이내</option>
								<option value="6">6일 이내</option>
								<option value="7">7일 이내</option>
								<option value="8">7일 이상</option>
							</select>
							
						</td>
					</tr>
					
					<tr>
						<th>반품/교환 비용</th>
						<td colspan="4">
							<select class="form-control" id="returnShipping" name="returnShipping">
								<c:if test="${p.RETURNSHIPPING == 0}">
							<option value="${p.RETURNSHIPPING}" selected>환불/교환 불가</option>
							</c:if>
							<c:if test="${p.RETURNSHIPPING != 0}">
							<option value="${p.RETURNSHIPPING}" selected>${p.RETURNSHIPPING}원</option>
							</c:if>
								<option value="0">환불/교환 무료(불가)</option>
								<option value="2500">2500원</option>
								<option value="5000">5000원</option>							
							</select>
							
						</td>
					</tr>	
					
					
					
					<tr>
						<td colspan="6" style="text-align: center;">
							<button onclick="return insert();" id="frmCheck" class="btn btn-block">상품 등록</button>
						</td>
					</tr>
				</table>

				<%--나중에 session으로 받아서 memberNo 추가로 보내주기 --%>
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="productId" value=${sessionScope.m.memberId }>
				<input type="hidden" name="photoStatus" id="photoStatus" value="1">
			</form>
        	
        		
        		</div>	
        	</div>
        </div>
        	</div>
        </div>
    </div> <!-- main content -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
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
</style>
<script>

$('#productImage').change(function() { 
		var files = $(this)[0].files; // input type=file에서 선택한 파일을 배열로 가져옴
		if (files.length != 0) { // 첨부파일이 있는 경우
			var reader = new FileReader(); // 파일에 대한 정보를 읽어오는 객체
			reader.readAsDataURL(files[0]); // 첫번째 파일 경로를 읽어옴
			// 경로를 다 읽어오면 실행할 함수 설정
			reader.onload = function(e) {
				$("#productImgViewWrap").show();
				$("#productImgView").attr("src", e.target.result); // 읽어온 경로를 img태그의 src속성에 설정
				$('#productImageText').html(files[0].name);
				console.log(files[0].name);

			}
		} else { // 첨부파일이 없는 경우
			$("#productImgViewWrap").hide();
			
			
		}
	
	});
$("#productImgCancle").click(function(){
	$("#productImage").val("");
	$("#productImgViewWrap").hide();
	$("#photoStatus").val(1);
	
	
});
$("#productImage").click(function(){
	$("#photoStatus").val(0);
})
$("#productImage").change(function() {
	$("#photoStatus").val(0);
})
/* var files; */
 
var fileNames = new Array();
$('#productFile').change(function() {
	$(".detailPhoto").remove();
	files = $(this)[0].files; // input type=file에서 선택한 파일을 배열로 가져옴
	
	if (files.length != 0) { // 첨부파일이 있는 경우
		for(var i=0;i<files.length;i++){
			fileNames.push(files[i].name);
		}
		for (var i = 0; i < files.length; i++) {			
			
			var reader = new FileReader(); // 파일에 대한 정보를 읽어오는 객체					
			reader.readAsDataURL(files[i]); // 첫번째 파일 경로를 읽어옴
						
			// 경로를 다 읽어오면 실행할 함수 설정
			reader.onload = function(e) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
				console.log(e);
				console.log(files);
				
				var html = "";
				
				html += "<tr class='detailPhoto'>";
				html += "<td colspan='5' class='detailPhoto' id=detailTd" + i + ">";
				html += "<img style='height: 50px;width: 50px;' src= "+e.target.result+">";
				html += "<span class='productDetailPhotoText' style='width:200px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display: inline-block'></span></td>";
				html += "</tr>";

				
				$("#detailWrapper").before(html);
				var spans = $(".productDetailPhotoText");
				spans.eq(spans.length-1).html(fileNames[spans.length-1]);
				/* if(spans.length==files.length){
					for(var i=0;i<spans.length;i++){
						spans.eq(i).html(fileNames[i]);
					}
				} */
			}
		}
	} else { // 첨부파일이 없는 경우
		$("#img-view").attr("src", "");
	}
});
function getFilename(idx){
	return files[idx].name;
}


function productImgCancle(obj){
	$(obj).parent().parent().hide();
	console.log($(obj));
	$(obj).next().attr("disabled", false);
	$(obj).next().next().attr("disabled", false);
	$("[name=status]").val(2);
	console.log(($(obj).next().val()));
	console.log(($(obj).next().attr("disabled")));
}
</script>

      </body>
      </html>
      
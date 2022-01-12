<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%@ include file = "../../setting.jsp" %> 
<link rel="stylesheet" href="${project}css/graindashboard.css">
<script type="text/javascript" src="${project}js/logisticsScript.js"></script>
<script src="${project}js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

/* 현 재고 수량 리턴 AJAX */
$(function() {
	$('#amount').click(function() {
		var prod = $('#prod').val();
		var wareh = $('#wareh').val();
		var param = '&${_csrf.parameterName}=${_csrf.token}&prod='+prod+'&wareh='+wareh;
		
		$.ajax({
	        // sendRequest(콜백함수명, url, method, params)
	        url: "getAdjStock", // 전송 페이지 => 컨트롤러 "basic_next"
	        type: 'POST', // 전송방식('GET', 'POST') - method
	        data: param, // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
	        success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
	           $('#quantity').val(data);
	        },
	        error: function(){
	           alert('오류');
	        }
	     });
	});
});

/* 조정 후 재고 계산 */
$('#amount').change(function() {
	var amount = parseInt($('#amount').val());
	var quantity = parseInt($('#quantity').val());
	var quan = quantity + amount;
	
	if(amount < quantity) {
		alert('재고수량을 초과하였습니다.');
		$('#amount').val('');
		$('#amount').focus();
	} else {
		$('#quantity').val(quan);
	}
});

/* 입력 값 없이 submit 할 경우 포커스 및 sumbit안타기 */
function adjCheck() {
	
	if(!document.adjform.amount.value) {
		alert('조정 재고를 입력하세요.')
		document.adjform.amount.focus();
		return false;
	}
} 


</script>


<body>
<form action="invenAdjInsert" method="post" name="adjform" onsubmit="return adjCheck();">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
	<table class="table bg-white text-dark center ass2" style="text-align:center">
	    <tr>
			<td class="font-weight-semi-bold border-top-0 py-3 text-dark"
			colspan="2" style="vertical-align: middle;">상품명</td>
			<td class="font-weight-semi-bold border-top-0 py-3"
				colspan="2">
				<select class="custom-select custom-select-lg" id="prod" name="prod">
	               	<c:forEach var="prolist" items="${selprolist}">
						<option value="${prolist.pro_code}">${prolist.pro_name}</option>
	               	</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<td class="py-3 text-dark" colspan="2"style="vertical-align: middle;"><b>창고명</b></td>
			<td class="py-3" colspan="2">
				<select class="custom-select custom-select-lg" id="wareh" name="arrivewh">
					<c:forEach var="ware" items="${selectware}">
					<c:if test="${ware.ware_type == 1}">
						<option value="${ware.ware_code}">${ware.ware_name}</option>
					</c:if>
					<c:if test="${ware.ware_type == 2}">
						<option value="${ware.ware_code}">${ware.ware_name}</option>
					</c:if>
					<c:if test="${ware.ware_type == 3}">
						<option value="${ware.ware_code}">${ware.ware_name}</option>
					</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="py-3" colspan="2" style="vertical-align: middle;"><b>조정 재고</b></td>
			<td class="py-3" colspan="2">
				<input class="form-control form-control-icon-text" type="text" id="amount" name="amount" onKeyup="calculation()" placeholder="조정 재고">
			</td>
		</tr>
		
		<tr>
			<td class="py-3" colspan="2" style="vertical-align: middle; "><b>조정 후 재고</b></td>
			<td class="py-3" colspan="2">
				<input class="form-control form-control-icon-text" type="text" id="quantity" name="quantity" readonly>
			</td>
		</tr>
		<tr>
			<td class="py-3" colspan="2" style="vertical-align: middle; "><b>담당자</b></td>
	        <td class="py-3" colspan="2" style="vertical-align: middle; text-align:left;">
				<input class="form-control form-control-icon-text" type="hidden" name="empid" style="font-size:25px" value="${sessionScope.mem_id}" readonly>
				${sessionScope.mem_name}
			</td>
	  	</tr>
	</tbody>
	</table>
	<div align=center>
        <button type="submit" class="btn btn-outline-info">등록</button>&nbsp;&nbsp;&nbsp;
        <button type="reset" class="btn btn-outline-info">재입력</button>
    </div>
</form>
</body>
</html>
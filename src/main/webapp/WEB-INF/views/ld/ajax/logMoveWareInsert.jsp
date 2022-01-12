<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../../setting.jsp" %> 
<head>
    <!-- Title -->
    <title>Users | Graindashboard UI Kit</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${project}img/favicon.ico">
	<link rel="stylesheet" href="${project}css/board.css">
    <!-- Template -->
    <link rel="stylesheet" href="${project}css/graindashboard.css">
    <script src="${project}js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    
    function changeProduct() {
        var logscode = document.getElementById("logscode").options[document.getElementById("logscode").selectedIndex].id;
        
        document.getElementById("prod").value = logscode; 
     }
    
    /* 현 재고 수량 리턴 AJAX */
    $(function() {
    	$('#amount').click(function() {
    		var prod = $('#prod').val();
    		var wareh = $('#startwh').val();
    		var param = '&${_csrf.parameterName}=${_csrf.token}&prod='+prod+'&wareh='+wareh;
    		
    		$.ajax({
    			url: 'getAdjStock',
    			type: 'POST',
    			data: param,
    			success: function(data){
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
    	
    	if(amount > quantity) {
    		alert('재고수량을 초과하였습니다.');
    		$('#amount').val('');
    		$('#amount').focus();
    	} 
    });
    
    /* 입력 값 없이 submit 할 경우 포커스 및 sumbit안타기 */
    function moveCheck() {
    	
    	if(!document.moveform.amount.value) {
    		alert('수량을 입력하세요.')
    		document.moveform.amount.focus();
    		return false;
    	}
    } 

    </script>
</head>

<body>

<main>

	<!-- 신규등록 -->
<form action="movelogsInsert" method="post" name="moveform" onsubmit="return moveCheck();">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
<input type = "hidden" name = "quantity" id="quantity">
		<table class="table bg-white text-dark center ass2" style="text-align:center">
             <tr>
             	<td class="font-weight-semi-bold border-top-0 py-2 text-dark" 
             		colspan="3"style="vertical-align: middle;"><b>전표번호</b></td>
                <td class="py-3" colspan="2">
                	<select class="custom-select custom-select-lg" id="logscode" name="logscode" onchange="changeProduct()">
                	<c:if test="${empty logsCodeVo}"><option value="0"> 전표 없음  </option></c:if>
                	<c:forEach var="logsCodeVo" items="${logsCodeVo}">
                		<c:choose>
	                		<c:when test="${logsCodeVo.logs_code != 0}">
								<option id="${logsCodeVo.pro_code}" value="${logsCodeVo.logs_code}">${logsCodeVo.logs_code}</option>
	                		</c:when>
                		</c:choose>
                	</c:forEach>
					</select>
                   </td>
           	</tr>
              	
              	<tr>
				<td class="py-3 text-dark" colspan="2" style="vertical-align: middle;"><b>출발창고명</b></td>
				<td class="font-weight-semi-bold border-top-0 py-2"
					colspan="3">
					<select class="custom-select custom-select-lg" id="startwh" name="startwh">
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
				<td class="py-3 text-dark" colspan="2"style="vertical-align: middle;"><b>도착창고명</b></td>
				<td class="py-3" colspan="2">
					<select class="custom-select custom-select-lg" name="arrivewh">
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
             	<td class="py-3 text-dark" colspan="2"style="vertical-align: middle;"><b>상품명</b></td>
                <td class="py-3" colspan="2">
                	<select class="custom-select custom-select-lg" id="prod" name="prod">
                	<c:forEach var="prolist" items="${selprolist}">
						<option value="${prolist.pro_code}">${prolist.pro_name}</option>
                	</c:forEach>
					</select>
                 </td>
            </tr>
            
			<tr>
				<td class="py-3" colspan="2" style="vertical-align: middle;"><b>수량</b></td>
				<td class="py-3" colspan="2">
					<input class="form-control form-control-icon-text" id="amount" name="amount" placeholder="수량" type="text" style="font-size:20px">
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
	<!-- 신규등록 끝 -->
</form>

    
    
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
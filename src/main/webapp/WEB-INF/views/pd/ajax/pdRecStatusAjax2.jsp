<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdRecStatusAjax2</title>
<%@ include file="../../setting.jsp"%>
</head>
<body>
	<form action="${path}/logsPdInsert" method="post" name="logsPdInsert">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="emp_code" value="${sessionScope.mem_id}">	
			<input type="hidden" name="accs_code" value="${vo.accs_code}">
		<table class="table bg-white text-dark center ass2">
			<tr class="text-white table-bordered tap">
				<th colspan="3">입고 전표 등록</th>
			</tr>
			<tr>
				<td class="py-3 text-dark" colspan="2"
					style="vertical-align: middle;"><b>거래처명</b></td>
				<td class="py-3" colspan="2" style="vertical-align: middle; text-align: left;">
					<input
					type="hidden" name="com_code" id="com_code" value="${vo.company.com_code}">
					${vo.company.com_name}
				</td>				
			</tr>
			<tr>
				<td class="py-3 text-dark" colspan="2"
					style="vertical-align: middle;"><b>상품명</b></td>
				<td class="py-3" colspan="2" style="vertical-align: middle; text-align: left;">
					<input
					type="hidden" name="pro_code" id="pro_code" value="${vo.product.pro_code}">
					${vo.product.pro_name}
				</td>
			</tr>
			<tr>
				<td class="py-3" colspan="2" style="vertical-align: middle;"><b>수량</b></td>

				<td class="py-3" colspan="2"
					style="vertical-align: middle; text-align: left;"><input
					type="hidden" name="logs_quantity" id="logs_quantity" value="${vo.accs_quantity}">
					${vo.accs_quantity}</td>
			</tr>
			<tr>
				<td class="py-3" colspan="2" style="vertical-align: middle;"><b>담당자</b></td>
				<td class="py-3" colspan="2"
					style="vertical-align: middle; text-align: left;"><input
					type="hidden" name="emp_name" value="${emp_name}">
					${emp_name}</td>
			</tr>
			</tbody>
		</table>
		<br>
		<div align=center>
			<button type="submit" class="btn btn-outline-info">등록</button>
			&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-outline-info">재입력</button>
		</div>
	</form>
	<br><br>
</body>
</html>
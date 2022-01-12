<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../setting.jsp"%>
</head>
<body>
	<form action="${path}/logsstInsert" method="post" name="ssstem">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
			<input type="hidden" name="accs_code" value="${account.accs_code}">
		<table class="table bg-white text-dark center ass2">
			<tr class="text-white table-bordered tap">
				<th colspan="3">출고 전표 등록</th>
			</tr>
			<tr>
				<td class="py-3 text-dark" colspan="2"
					style="vertical-align: middle;"><b>거래처명</b></td>
				<td class="py-3" colspan="2" style="vertical-align: middle; text-align: left;">
					<input
					type="hidden" name="com_code" id="com_code" value="${account.company.com_code}">
					${account.company.com_name}
				</td>				
			</tr>
			<tr>
				<td class="py-3 text-dark" colspan="2"
					style="vertical-align: middle;"><b>상품명</b></td>
				<td class="py-3" colspan="2" style="vertical-align: middle; text-align: left;">
					<input
					type="hidden" name="pro_code" id="pro_code" value="${account.product.pro_code}">
					${account.product.pro_name}
				</td>
			</tr>
			<tr>
				<td class="py-3" colspan="2" style="vertical-align: middle;"><b>수량</b></td>

				<td class="py-3" colspan="2"
					style="vertical-align: middle; text-align: left;"><input
					type="hidden" name="logs_quantity" id="logs_quantity" value="${account.accs_quantity}">
					${account.accs_quantity}</td>
			</tr>
			<tr>
				<td class="py-3" colspan="2" style="vertical-align: middle;"><b>담당자</b></td>
				<td class="py-3" colspan="2"
					style="vertical-align: middle; text-align: left;"><input
					type="hidden" name="emp_code" value="${sessionScope.mem_id}">
					${sessionScope.mem_name}</td>
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
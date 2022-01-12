<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "../../setting.jsp" %> 
<html>
<head>
<meta charset="UTF-8">
<title>proPage</title>
</head>
<body>
<table class="table table-bordered bg-white text-dark ass2 center">
		<tbody>
			<tr class="text-white con">
				<th colspan="4">상품</th> <!-- sccontent -->
			</tr>
			<tr>
				<th colspan="1" style="width: 20%">NO.</th>
				<td colspan="3">${product.pro_code}</td>
			</tr>
			<tr>
				<th colspan="1">상품명</th>
				<td colspan="3">${product.pro_name}</td>
			</tr>
			<tr>
				<th colspan="1">구매단가</th>
				<td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.pro_pur_price}" /></td>
			</tr>
			<tr>
				<th colspan="1">판매단가</th>
				<td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.pro_sal_price}" /></td>
			</tr>
			<tr>
				<th colspan="1">상태</th>
				<c:if test="${product.pro_state == 1}">
					<td colspan="3">사용</td>
				</c:if>
				<c:if test="${product.pro_state == 0}">
					<td colspan="3">미사용</td>
				</c:if>
			</tr>
			<tr>
				<th colspan="1">등록일</th>
				<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd" value="${product.pro_reg_date}" /></td>
			</tr>
		</tbody>
	</table>
	<br><br><br>
</body>
</html>
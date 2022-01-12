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
	<table class="table table-bordered bg-white text-dark ass2 center">
		<tbody>
			
			<tr class="text-white con">
				<c:if test="${content.accs_type == 1 }">
					<th colspan="4">판매 전표</th>
				</c:if>
				<c:if test="${content.accs_type == 3 }">
					<th colspan="4">채권 전표</th>
				</c:if>
				<c:if test="${content.accs_type == 2 }">
					<th colspan="4">판매 전표</th>
				</c:if>
				<c:if test="${content.accs_type == 4 }">
					<th colspan="4">채무 전표</th>
				</c:if>
			</tr>

			<tr>
				<th colspan="1" style="width: 20%">NO.</th>
				<td colspan="3">${content.accs_code}</td>
			</tr>
			<tr>
				<th colspan="1">거래처명</th>
				<td colspan="3">${content.company.com_name}</td>
			</tr>
			<tr>
				<th colspan="1">상품명</th>
				<td colspan="3">${content.product.pro_name}</td>
			</tr>
			<tr>
				<th colspan="1">담당자</th>
				<td colspan="3">${content.employee.emp_name}<input type="hidden" value="${content.employee.dep_code}"></td>
			</tr>
			<tr>
				<th colspan="1">단가</th>
				<td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${content.accs_price}" /></td>
			</tr>
			<tr>
				<th colspan="1">수량</th>
				<td colspan="3">${content.accs_quantity}</td>
			</tr>
			<tr>
				<th colspan="1">합계</th>
				<td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${content.accs_sum}" /></td>
			</tr>
			<tr>
				<th colspan="1">상세내역</th>
				<td colspan="3">${content.accs_content}</td>
			</tr>

		</tbody>
	</table>
	<c:if test="${content.accs_state == 0 }">
	<div align=center> 
		<button type="button" onclick="location.href='${path}/appr?accs_code=${content.accs_code}&dep_code=${content.employee.dep_code}'" class="btn btn-outline-info">승인</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="location.href='${path}/reappr?accs_code=${content.accs_code}&dep_code=${content.employee.dep_code}'" class="btn btn-outline-info">승인거부</button>
	</div>
	</c:if>
	<br>
	<br>
	<br>
</html>
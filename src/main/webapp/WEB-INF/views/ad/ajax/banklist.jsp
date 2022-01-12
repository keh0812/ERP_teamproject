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
	<table class="table bg-white text-dark center ass2 table-striped">
		<thead class="text-white table-bordered tap">
			<tr>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">계좌명</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">계좌번호</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">은행</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">개설목적</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">사용상태</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${bank}">
				<tr>
					<td class="py-3">${vo.bank_name}</td>
					<td class="py-3">${vo.bank_no}</td>
					<td class="py-3">${vo.bank_bank}</td>
					<td class="py-3">${vo.bank_object}</td>
					<c:if test="${vo.bank_state == 0 }">
						<td class="py-3">미사용</td>
					</c:if>
					<c:if test="${vo.bank_state == 1 }">
						<td class="py-3">사용중</td>
					</c:if>
					<td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${vo.bank_reg_date}" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	
</body>
</html>
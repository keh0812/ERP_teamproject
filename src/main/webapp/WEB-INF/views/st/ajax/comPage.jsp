<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "../../setting.jsp" %> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-bordered bg-white text-dark ass2 center">
		<tbody>
			<tr class="text-white con">
				<th colspan="4">거래처</th> <!-- sccontent -->
			</tr>
			<tr>
				<th colspan="1" style="width: 20%">NO.</th>
				<td colspan="3">${company.com_code}</td>
			</tr>
			<tr>
				<th colspan="1">거래처 유형 </th>
				<c:if test="${company.com_type == 100}">
				<td colspan="3">판매 거래처</td>
				</c:if>
			</tr>
			<tr>
				<th colspan="1">거래처명</th>
				<td colspan="3">${company.com_name}</td>
			</tr>
			<tr>
				<th colspan="1">대표자명</th>
				<td colspan="3">${company.com_ceo_name}</td>
			</tr>
			<tr>
				<th colspan="1">사업자번호</th>
				<td colspan="3">${company.com_reg_no}</td>
			</tr>
			<tr>
				<th colspan="1">주소</th>
				<td colspan="3">${company.com_address}</td>
			</tr>
			<tr>
				<th colspan="1">거래처 등록일</th>
				<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd" value="${company.com_reg_date}" /></td>
			</tr>
		</tbody>
	</table>
	<br><br><br>
</body>
</html>
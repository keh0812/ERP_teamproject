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
				<th colspan="4"><input type="hidden"
					value="${sccontent.employee.dep_code}">
					${sccontent.employee.emp_name}</th>
			</tr>
			<tr>
				<th style="width: 20%">기본 급여</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_basic}" /></td>
				<th style="width: 20%">갑근세</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_worktax}" /></td>
			</tr>
			<tr>
				<th>초과근로 수당</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_over}" /></td>
				<th>주민세</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_resident}" /></td>
			</tr>
			<tr>
				<th>상여금</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_bonus}" /></td>
				<th>고용보험</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_hire}" /></td>
			</tr>
			<tr>
				<th>식대</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_meal}" /></td>
				<th>국민연금</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_pension}" /></td>
			</tr>
			<tr>
				<th>차량유지비</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_vehicle}" /></td>
				<th>건강보험</th>
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${sccontent.salary.sal_health}" /></td>
			</tr>
		</tbody>
	</table>
	<c:if test="${sccontent.ss_state == 0 }">
		<div align=center>
			<button type="button"
				onclick="location.href='${path}/saappr?ss_code=${sccontent.ss_code}&dep_code=${sccontent.employee.dep_code}'"
				class="btn btn-outline-info">승인</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="location.href='${path}/sareappr?ss_code=${sccontent.ss_code}&dep_code=${sccontent.employee.dep_code}'"
				class="btn btn-outline-info">승인거부</button>
		</div>
	</c:if>
</body>
</html>
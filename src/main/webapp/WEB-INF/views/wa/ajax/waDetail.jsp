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
			<tr class="text-white con center">
                <th colspan="4">근태 신청 승인</th>
            </tr>
			<tr>
				<th colspan="1" style="width: 20%">사번</th>
				<td colspan="3">${vo.employee.emp_code}</td>
			</tr>
			<tr>
				<th colspan="1">사원명</th>
				<td colspan="3">${vo.employee.emp_name}</td>
			</tr>
			<tr>
				<th colspan="1">부서명</th>
				<td colspan="3">${vo.department.dep_name}</td>
			</tr>
			
			<tr>
				<th colspan="1">근태유형</th>
				<td colspan="3">${vo.hrCode.hr_code_name}</td>
			</tr>
			<tr>
				<th colspan="1">신청일</th>
				<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wr_ap_date}"/></td>
			</tr>
			<tr>
				<th colspan="1">신청기간</th>
				<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wr_va_start}"/>&nbsp;<strong>~</strong>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wr_va_end}"/></td>
			</tr>
			<tr>
				<th colspan="1">사유</th>
				<td colspan="3" rowspan="5">${vo.wr_va_reason}</td>
			</tr>
		</tbody>
	</table>    
	<div align=center> 
		<button type="button" onclick="location.href='${path}/waConfirmAction?emp_code=${vo.employee.emp_code}'" class="btn btn-outline-info">승인</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="location.href='${path}/waDeleteAction?emp_code=${vo.employee.emp_code}'" class="btn btn-outline-info">승인거부</button>
	</div>
	<br>
	<br>
	<br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../setting.jsp" %> 
<head>
	<!-- Favicon -->
	<link rel="shortcut icon" href="${project}img/favicon.ico">
	<link rel="stylesheet" href="${project}css/board.css">
	<!-- Template -->
	<link rel="stylesheet" href="${project}css/graindashboard.css">
	
	<!-- Script -->
	<script src="${spath}script.js"></script>
</head>
<body>
	<div align=center>
	<form action ="hrSalaryCheck" method="post" onsubmit="return confirmCheck2();">
	<input type="hidden" name="pay_month" value="${pay_month}">
		<br>
		<br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<c:if test="${selectCnt == 0}">
			<table class="table bg-white text-dark center ass2">
				<thead class="text-white table-bordered tap font-weight-semi-bold border-top-0 ass2">
					<tr>
						<th>사원확인</th>
					</tr>
				</thead>
				<tbody>
				   <tr>
				      <td style="vertical-align: middle">
				           <strong>${emp_code}</strong> 은(는) 존재하지 않는 사원번호입니다.
				      </td>
				   </tr>
				   <tr>
				      <td style="vertical-align: middle">
				      	<strong>사원번호 : </strong>&nbsp;&nbsp;&nbsp;
				      	<input class="form-control" type="text" name="emp_code" style="width:250px; display:inline" autofocus required>
				      </td>
				   </tr>
			   </tbody>
			</table>
		    <button type="submit" class="btn btn-outline-info">확인</button>&nbsp;&nbsp;
		    <button type="reset" class="btn btn-outline-info" onclick="self.close()">취소</button>
		</c:if>
		<c:if test="${selectCnt != 0}">
			<table class="table bg-white text-dark center ass2">
				<thead class="text-white table-bordered tap font-weight-semi-bold border-top-0 ass2">
					<tr>
						<th>사원확인</th>
					</tr>
				</thead>
				<tbody>
				   <tr>
				      <td style="vertical-align: middle">
				        <strong>${vo.emp_name}</strong>님, &nbsp;사원번호를 확인했습니다.
				      </td>
				   </tr>
			   </tbody>
			</table>
			<input class="btn btn-outline-info" type="button" value="확인" onclick="setSalEmpInfo('${emp_code}', '${vo.emp_name}', '${dep_name}', '${hr_code_name}', '${sal_basic}', '${sal_over}', '${vo.hr_code}', '${vo.dep_code}')">
		</c:if>
	</form>
	</div>
</body>
</html>
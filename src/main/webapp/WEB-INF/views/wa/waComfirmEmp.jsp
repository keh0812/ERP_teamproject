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
	<script src="${spath}hr.js"></script>
	
</head>
<body onload="confirmWaFocus();">
<div align=center>
<form action ="empComfirm?${_csrf.parameterName}=${_csrf.token}" method="post" name="confirmWaform" onsubmit="return confirmWaCheck();">
<br>
<br>
<c:if test="${selectCnt != 1}">
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
		      	<strong>사번 : </strong>&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="emp_code" style="width:250px; display:inline" autofocus required>
		      </td>
		   </tr>
	   </tbody>
	</table>
    <button type="submit" class="btn btn-outline-info">확인</button>&nbsp;&nbsp;
    <button type="reset" class="btn btn-outline-info" onclick="self.close();">취소</button>
</c:if>
<c:if test="${selectCnt == 1}">
	<table class="table bg-white text-dark center ass2">
		<thead class="text-white table-bordered tap font-weight-semi-bold border-top-0 ass2">
			<tr>
				<th>사원확인</th>
			</tr>
		</thead>
		<tbody>
		   <tr>
		      <td style="vertical-align: middle">
		        <strong>${vo.emp_name}</strong>님, 사원번호를 확인했습니다.
		      </td>
		   </tr>
	   </tbody>
	</table>
	<button class="btn btn-outline-info" type="button" onclick="setConfirm('${emp_code}', '${vo.emp_name}', '${vo.department.dep_name}','${vo.department.dep_code}');">확인</button>
</c:if>
</form>
</div>
</body>
</html>
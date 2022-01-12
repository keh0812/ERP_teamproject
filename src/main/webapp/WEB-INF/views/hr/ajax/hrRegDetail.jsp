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
    <table class="table table-bordered bg-white text-dark ass2">
	 <tbody>
	    <tr class="text-white con center">
	       <th colspan="4">인사 코드</th>
	    </tr>
	    <tr>
	       <th>그룹번호</th>
	       <th>인사코드</th>
	       <th>인사코드명</th>
	       <th>사용상태</th>
	    </tr>
	    <c:forEach var="vo" items="${list10}">
		    <tr>
		       <td>${vo.hrCodeGroup.hcg_code}</td>
		       <td>${vo.hr_code}</td>
		       <td>${vo.hr_code_name}</td>
		     <c:if test="${vo.hr_state == 1}">
			   <td>사용</td>
		 	</c:if>
			<c:if test="${vo.hr_state == 0}">
			  <td>미사용</td>
			</c:if>
		    </tr>
	    </c:forEach>
	   </tbody>
	</table><br><br><br>
</body>
</html>
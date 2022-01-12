<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<html>
<body>
	<c:if test="${insertCnt != 2}">
		<script type="text/javascript">
			alert("급여 전표 등록을 실패했습니다. \n확인 후 다시 시도해 주십시오.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${insertCnt == 2}">
		<script type="text/javascript">
			alert("급여 전표를 등록했습니다.");
			window.location="hrSalary";
		</script>
	</c:if>
</body>
</html>
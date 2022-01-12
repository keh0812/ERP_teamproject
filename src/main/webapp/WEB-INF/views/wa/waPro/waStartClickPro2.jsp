<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<html>
<body>
	<c:if test="${insertCnt == 0 && selectCnt == 1}">	
		<script type="text/javascript">
			alert("출근은 하루에 한 번만 가능합니다.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${insertCnt == 1 && selectCnt == 0}">	
		<script type="text/javascript">
			alert("출근 확인되었습니다.");
			window.location="waSelect";
		</script>
	</c:if>
</body>
</html>
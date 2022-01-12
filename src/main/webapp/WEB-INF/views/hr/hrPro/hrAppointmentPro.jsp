<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<html>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("원인을 알 수 없는 오류가 발생했습니다. \n잠시 후 다시 시도해 주십시오.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("인사 발령을 완료했습니다.");
			window.location="hrAppointment";
		</script>
	</c:if>
</body>
</html>
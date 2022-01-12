<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./setting.jsp" %>
<html>
<body>
	<c:if test="${sessionScope.mem_id == null}">
		<script type="text/javascript">
			window.location="login";
		</script>
	</c:if>
	<c:if test="${sessionScope.mem_id != null}">
		<script type="text/javascript">
			window.location="main";
		</script>
	</c:if>
</body>
</html>
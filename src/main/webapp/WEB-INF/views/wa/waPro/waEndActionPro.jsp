<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<html>
<body>
	<script type="text/javascript">
		if(confirm("퇴근 처리하시겠습니까?")) {
			window.location="${path}/waEndAction";
		} else {
			window.location="${path}/waSelect";
		}
	</script>
</body>
</html>


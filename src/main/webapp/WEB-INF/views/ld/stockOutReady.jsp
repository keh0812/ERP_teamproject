<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stockOutReady.jsp</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 코어 태그 사용 -->
</head>
<body>
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("출고준비 승인이 완료됐습니다");
			window.location="ldStatementManagement";
		</script>
	</c:if>
	<c:if test="${updateCnt == 0}"> 
		<script type="text/javascript">
			alert("출고준비 승인을 실패했습니다");
			window.location="ldStatementManagement";
		</script>
	</c:if>
</body>
</html>
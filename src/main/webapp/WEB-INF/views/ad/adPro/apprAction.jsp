<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../../setting.jsp" %>  
</head>
<body>
<!-- 상품등록 실패  -->
<c:if test="${updateCnt == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<!-- 상품등록 성공  -->
<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
		alert("승인 되었습니다.");
		window.location='${path}/adStatementManagement';
	</script>
</c:if>

<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
		alert("승인 거부 되었습니다.");
		window.location='${path}/adStatementManagement';
	</script>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>   
<html>
<body>

<!-- 상품등록 실패  -->
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<!-- 상품등록 성공  -->
<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
		alert("등록 되었습니다.");
		window.location='${path}/stStatus';
	</script>
</c:if>

<c:if test="${insertCnt1 == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<c:if test="${insertCnt1 == 1}">
	<script type="text/javascript">
		alert("등록 되었습니다.");
		window.location='${path}/stRelStatus';
	</script>
</c:if>
</body>
</html>
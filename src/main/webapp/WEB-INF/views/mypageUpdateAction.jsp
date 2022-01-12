<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./setting.jsp" %> 
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("원인을 알 수 없는 오류가 발생했습니다. \n잠시 후 다시 시도해 주십시오.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("내 정보가 수정되었습니다.");
			window.location="mypage";
		</script>
	</c:if>
</body>
</html>
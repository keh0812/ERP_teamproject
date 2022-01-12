<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%@ include file = "../../setting.jsp" %> 
<link rel="stylesheet" href="${project}css/graindashboard.css">
<script type="text/javascript" src="${project}js/logisticsScript.js"></script>
 
<body>
	
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			errorAlert(wareModifyError);
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("창고 정보가 수정되었습니다.");
				window.location="ldBasicReg";
			}, 1000);
		</script>
	</c:if>
</body>
</html>
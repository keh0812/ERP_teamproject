<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%@ include file = "../../setting.jsp" %> 
<link rel="stylesheet" href="${project}css/graindashboard.css">
<%@ include file = "../../common/header.jsp" %> 
<script type="text/javascript" src="${project}js/logisticsScript.js"></script>
 
<body>
	
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			errorAlert(insertWareError);
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<c:if test="${wareState == 1}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("양품창고가 등록되었습니다.");
				window.location="logWarehouseList";
			}, 1000);
		</script>
		</c:if>
		
		<c:if test="${wareState == 2}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("불량품창고가 등록되었습니다.");
				window.location="logWarehouseList";
			}, 1000);
		</script>
		</c:if>
		
		<c:if test="${wareState == 3}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("출고대기창고가 등록되었습니다.");
				window.location="logWarehouseList";
			}, 1000);
		</script>
		</c:if>
	</c:if>
</body>
</html>
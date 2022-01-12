<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%@ include file = "../../setting.jsp" %> 
<link rel="stylesheet" href="${project}css/graindashboard.css">
<script type="text/javascript" src="${project}js/logisticsScript.js"></script>
 
<body>
		<c:if test="${stockBadInsert != 0 && stoBadMinusUpdate != 0 && stsuBadMoveInsert != 0}">
			<script type="text/javascript">
				setTimeout(function() {
					alert("재고가 이동이 되었습니다.");
					window.location="ldInventoryControl";
				}, 1000);
			</script>
		</c:if>
			
		<%-- <c:if test="${stockBadInsert == 0 || stoBadMinusUpdate == 0 || stsuBadMoveInsert == 0}">
			<script type="text/javascript">
				errorAlert(stockMoveFailError);
			</script>
		</c:if> --%>
		
		<c:if test="${stoMinusUpdate != 0 && stoPlusUpdate != 0 && stsuMoveInsert != 0}">
			<script type="text/javascript">
				setTimeout(function() {
					alert("재고가 이동이 되었습니다.");
					window.location="ldInventoryControl";
				}, 1000);
			</script>
		</c:if>
		
		<%-- <c:if test="${stoMinusUpdate != 0 && stoPlusUpdate != 0 && stsuMoveInsert != 0 && logsShortUpdate == 0}">
			<script type="text/javascript">
				errorAlert(stockShortError);
			</script>
		</c:if> --%>
		
		<%-- <c:if test="${stoMinusUpdate != 0 && stoPlusUpdate != 0 && stsuMoveInsert != 0 && logsShortUpdate != 0 && logsStateUpdate != 0}">
			<script type="text/javascript">
				setTimeout(function() {
					alert("재고가 이동이 되었습니다.");
					window.location="ldInventoryControl";
				}, 1000);
			</script>
		</c:if> --%>
		
		<%-- <c:if test="${stoMinusUpdate == 0 || stoPlusUpdate == 0 || stsuMoveInsert == 0}">
			<script type="text/javascript">
				errorAlert(stockMoveFailError);
			</script>
		</c:if> --%>
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%@ include file = "../../setting.jsp" %> 
<link rel="stylesheet" href="${project}css/graindashboard.css">
<script type="text/javascript" src="${project}script/logisticsScript.js"></script>
 
<body>
	<table class="table table-bordered bg-white text-dark ass2 center th20">
		<tr class="text-white con center">
			<th colspan="5">재고 수불 일보</th>
		</tr>
		<tr>
			<th>기간</th>
			<td colspan="4">${start} ~ ${end}</td>
		</tr>
		<tr>
			<th>상품명(상품번호)</th>
			<td colspan="4">${proname}(${procode})</td>
		</tr>
		<tr>
			<th>날짜</th>
			<th>분류</th>
			<th>수량증가</th>
			<th>수량감소</th>
			<th>재고수량</th>
		</tr>
		<c:forEach var="suplist" items="${suplist}">
		<tr>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${suplist.stsu_reg_date}"/>
			</td>
			<c:choose>
				<c:when test="${suplist.stsu_type == 1}">
					<td>입고내역</td>
				</c:when>
				<c:when test="${suplist.stsu_type == 2}">
					<td>출고내역</td>
				</c:when>
				<c:when test="${suplist.stsu_type == 3}">
					<td>재고이동</td>
				</c:when>
				<c:when test="${suplist.stsu_type == 4}">
					<td>재고조정</td>
				</c:when>
			</c:choose>
			
			<c:choose>
				<c:when test="${suplist.stsu_type == 1}">
					<td>${suplist.stsu_amount}</td>
					<td>0</td>
				</c:when>
				<c:when test="${suplist.stsu_type == 2}">
					<td>0</td>
					<td>${suplist.stsu_amount}</td>
				</c:when>
				<c:when test="${suplist.stsu_type == 3}">
					<td>0</td>
					<td>${suplist.stsu_amount}</td>
				</c:when>
				<c:when test="${suplist.stsu_type == 4}">
					<c:if test="${suplist.stsu_amount >= 0}">
						<td>${suplist.stsu_amount}</td>
						<td>0</td>
					</c:if>
					<c:if test="${suplist.stsu_amount < 0}">
						<td>0</td>
						<td>${suplist.stsu_amount}</td>
					</c:if>
				</c:when>
			</c:choose>
			<td>${suplist.stsu_quantity}</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>
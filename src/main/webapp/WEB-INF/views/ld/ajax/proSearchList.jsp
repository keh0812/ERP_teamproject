<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<%@ include file = "../../setting.jsp" %> 
<link rel="stylesheet" href="${project}css/graindashboard.css">
<script type="text/javascript" src="${project}js/logisticsScript.js"></script>
<script src="${project}js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
</script>
<body>
	<div class="row">
		<table class="table bg-white text-dark center ass2 table-striped">
			<tr>
			</tr>
			<thead>
				<tr class="text-white table-bordered tap">
					<th class="font-weight-semi-bold border-top-0 py-3 con2">상품번호</th>
					<th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
					<th class="font-weight-semi-bold border-top-0 py-3 con2">구매단가</th>
					<th class="font-weight-semi-bold border-top-0 py-3 con2">판매단가</th>
					<th class="font-weight-semi-bold border-top-0 py-3 con2">사용상태</th>
					<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="productList" items="${prolist}">
				<tr>
					<td class="py-3" style="vertical-align: middle">${productList.pro_code}</td>
					<td class="py-3" style="vertical-align: middle">${productList.pro_name}</td>
					<td class="py-3" style="vertical-align: middle">
						<fmt:formatNumber value="${productList.pro_pur_price}" pattern=",###" />
					</td>
					<td class="py-3" style="vertical-align: middle">
						<fmt:formatNumber value="${productList.pro_sal_price}" pattern=",###" />
					</td>
					<c:choose>
						<c:when test="${productList.pro_state == 1}">
							<td class="py-3" style="vertical-align: middle">사용중</td>
						</c:when>
						<c:when test="${productList.pro_state == 0}">
							<td class="py-3" style="vertical-align: middle">사용중지</td>
						</c:when>
					</c:choose>
					<td class="py-3" style="vertical-align: middle">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${productList.pro_reg_date}"/>
					</td>
					
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
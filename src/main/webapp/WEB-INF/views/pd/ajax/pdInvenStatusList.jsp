<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../../setting.jsp" %> 
<head>
    <!-- Title -->
    <title>Users | Graindashboard UI Kit</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${project}img/favicon.ico">
	<link rel="stylesheet" href="${project}css/board.css">
    <!-- Template -->
    <link rel="stylesheet" href="${project}css/graindashboard.css">
</head>

<body>

<main>
			
	<table class="table  bg-white text-dark center ass2 table-striped">
		<thead>
			<tr class="text-white table-bordered tap">
				<th class="font-weight-semi-bold border-top-0 py-3 con2">상품번호</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">창고이름</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">구매단가</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">판매단가</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">재고수량</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">사용상태</th>
				<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="stocklist" items="${stocklist}">
				<tr>
					<td class="py-3">${stocklist.pro_code}</td>
					<td class="py-3">${stocklist.product.pro_name}</td>
					<td class="py-3">${stocklist.warehouse.ware_name}</td>
					<td class="py-3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${stocklist.product.pro_pur_price}"/></td>
					<td class="py-3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${stocklist.product.pro_sal_price}"/></td>
					<td class="py-3">${stocklist.sto_quantity}</td>
					<c:if test="${stocklist.product.pro_state == 1}">
						<td class="py-3">사용</td>
					</c:if>
					<td class="py-3">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${stocklist.sto_reg_date}"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
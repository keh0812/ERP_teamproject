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
    <script src="${project}js/jquery-3.5.1.min.js"></script>
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="${project}img/favicon.ico">
	<link rel="stylesheet" href="${project}css/board.css">
    <!-- Template -->
    <link rel="stylesheet" href="${project}css/graindashboard.css">
</head>

<body>

<main>
	<table class="table table-bordered bg-white center text-dark ass2 th20">
			<tbody>
				<tr class="text-white con center">
					<th colspan="2">${compInfo.com_name}</th>
				</tr>
				<tr>
					<th style="vertical-align: middle">NO.</th>
					<td style="vertical-align: middle">${compInfo.com_code}</td>
				</tr>
				<tr>
					<th style="vertical-align: middle">구분</th>
					<c:if test="${compInfo.com_type == 200}">
						<td style="vertical-align: middle">구매거래처</td>
					</c:if>
					<c:if test="${compInfo.com_type == 100}">
						<td style="vertical-align: middle">판매거래처</td>
					</c:if>
				</tr>
				<tr>
					<th style="vertical-align: middle">대표자명</th>
					<td style="vertical-align: middle">${compInfo.com_ceo_name}</td>
				</tr>
				<tr>
					<th style="vertical-align: middle">사업자번호</th>
					<td style="vertical-align: middle">${compInfo.com_reg_no}</td>

				</tr>
				<tr>
					<th style="vertical-align: middle">주소</th>
					<td style="vertical-align: middle"> ${compInfo.com_address}</td>
				</tr>
				<tr>
					<th style="vertical-align: middle">등록일</th>
					<td style="vertical-align: middle"><fmt:formatDate pattern="yyyy-MM-dd" value="${compInfo.com_reg_date}"/></td>
				</tr>
			</tbody>
		</table><br><br><br>
    
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
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
	<form action="moveWareSoInsert" method="post">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
	<input type = "hidden" name = "logscode" value = "${vo.logs_code}">
	<input type = "hidden" name = "prod" value = "${vo.pro_code}">
	<input type = "hidden" name = "amount" value = "${vo.logs_quantity}">
	<input type = "hidden" name = "warecode" value = "${vo.ware_code}">
	<input type = "hidden" name = "empcode" value = "${vo.emp_code}">
	<input type = "hidden" name = "shortage" value = "${vo.logs_shortage}">
       <table class="table table-bordered bg-white center text-dark ass2 th20">
               <tr class="text-white con center">
                  <th colspan="2">재고 이동 승인</th>
               </tr>
            <tr>
		      <th class="py-3" style="width:20%;">NO.</th>
	          <td class="py-3">${vo.logs_code}</td>
		   </tr>
		   <tr>
		      <th class="py-3" style="width:20%;">상품명</th>
		      <td class="py-3">${vo.product.pro_name}</td>
		   </tr>
		   
		   <tr>
		      <th class="py-3" style="width:20%;">거래처명</th>
		      <td class="py-3">${vo.company.com_name}</td>
		   </tr>
		   
		   <tr>
		      <th class="py-3" style="width:20%;">유형</th>
	          <c:if test="${vo.logs_type == 6}">
	          	<td class="py-3">출고</td>
	          </c:if>
		   </tr>
		   
		   <tr>
		      <th class="py-3" style="width:20%;">출고수량</th>
		      <td class="py-3">${vo.logs_quantity}</td>
		   </tr>
		   <tr>
		      <th class="py-3" style="width:20%;">부족수량</th>
		      <td class="py-3">${vo.logs_shortage}</td>
		   </tr>
		   <tr>
		      <th class="py-3" style="width:20%;">창고명</th>
		      <td class="py-3">${vo.warehouse.ware_name}</td>
		   </tr>
		   <tr>
		      <th class="py-3" style="width:20%;">담당자</th>
		      <td class="py-3">${vo.employee.emp_name}</td>
		   </tr>
		   <tr>
		      <th class="py-3" style="width:20%;">상태</th>
		      <c:if test="${vo.logs_state == 3}">
		      	<td class="py-3">출고준비중</td>
		      </c:if>
		      <c:if test="${vo.logs_state == 1}">
		      	<td class="py-3">출고준비완료</td>
		      </c:if>
		   </tr>
		   <tr>
		      <th class="py-3" style="width:20%;">발행일</th>
		      <td class="py-3"><fmt:formatDate value="${vo.logs_reg_date}" pattern="yyyy-MM-dd"/></td>
		   </tr>
               
            </table>
               <div align=center>
               		<c:if test="${vo.logs_state == 1}">
                   		<button type="submit" class="btn btn-outline-info">승인</button>
               		</c:if>
               		<c:if test="${vo.logs_state == 3}"> 
               			<button type="button" onclick="location.href='${path}/logsupdate?logs_code=${vo.logs_code}'" class="btn btn-outline-info">부족수량</button>
               		</c:if>
               </div>
               <br><br><br>
		</form>
    
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
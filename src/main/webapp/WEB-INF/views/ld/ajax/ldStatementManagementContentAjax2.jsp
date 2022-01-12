<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${project}css/graindashboard.css">

<meta charset="UTF-8">
<title>ldStatementManagementContentAjax2</title>
</head>
<body>

	<table class="table table-bordered center bg-white text-dark ass2 th20">
		<tbody>
		   <tr class="text-white con center">
		      <th colspan="2" style="width:20%;">물류 전표</th>
		   </tr>
		   <tr>
		      <th style="width:20%;">NO.</th>
	          <td class="py-3">${vo.logs_code}</td>
		   </tr>
		   <tr>
		      <th style="width:20%;">상품명</th>
		      <td class="py-3">${vo.product.pro_name}</td>
		   </tr>
		   <tr>
		      <th style="width:20%;">거래처명</th>
		      <td class="py-3">${vo.company.com_name}</td>
		   </tr>
		   <tr>
		      <th style="width:20%;">유형</th>
		      <c:if test="${vo.logs_type == 5}">
	          	<td class="py-3">입고</td>
	          </c:if>
	          <c:if test="${vo.logs_type == 6}">
	          	<td class="py-3">출고</td>
	          </c:if>
		   </tr>
		   <tr>
		      <th style="width:20%;">수량</th>
		      <td class="py-3">${vo.logs_quantity}</td>
		   </tr>
		   <tr>
		      <th style="width:20%;">창고명</th>
		      <td class="py-3">${vo.warehouse.ware_name}</td>
		   </tr>
		   <tr>
		      <th style="width:20%;">담당자</th>
		      <td class="py-3">${vo.employee.emp_name}</td>
		   </tr>
		   <tr>
		      <th style="width:20%;">발행일</th>
		      <td><fmt:formatDate value="${vo.logs_reg_date}" pattern="yyyy-MM-dd"/></td>
		   </tr>
		   <tr>
		   	  <c:if test="${vo.logs_type == 5}">
		   	  		<c:if test="${vo.logs_state == 1}">
			      		<th style="width:20%;">입고일</th>
			      		<td class="py-3"><fmt:formatDate value="${vo.logs_update_date}" pattern="yyyy-MM-dd"/></td>
			      	</c:if>
			      	<c:if test="${vo.logs_state == 0}">
			      		<th style="width:20%;">입고일</th>
			      		<td class="py-3">입고대기</td>
			      	</c:if>
		      </c:if>
		      <c:if test="${vo.logs_type == 6}">
				  <c:if test="${vo.logs_state == 1}">		      
			      	<th style="width:20%;">출고일</th>
			      	<td class="py-3"><fmt:formatDate value="${vo.logs_update_date}" pattern="yyyy-MM-dd"/></td>
			      </c:if>
		      	  <c:if test="${vo.logs_state == 0}">		      
			      	<th style="width:20%;">출고일</th>
			      	<td class="py-3">출고대기</td>
			      </c:if>
			      <c:if test="${vo.logs_state == 2}">		      
			      	<th style="width:20%;">출고일</th>
			      	<td class="py-3">출고준비완료</td>
			      </c:if>
		      </c:if>
		   </tr>
		   <tr>
		      <th style="width:20%;">상태</th>
		      <c:if test="${vo.logs_type == 5}">
			      <c:if test="${vo.logs_state == 1}">
		          	<td class="py-3">입고완료</td>
		          </c:if>
		          <c:if test="${vo.logs_state == 0}">
		          	<td class="py-3">입고대기</td>
		          </c:if>
		      </c:if>
		      <c:if test="${vo.logs_type == 6}">
			      <c:if test="${vo.logs_state == 1}">
		          	<td class="py-3">출고완료</td>
		          </c:if>
		          <c:if test="${vo.logs_state == 0}">
		          	<td class="py-3">출고대기</td>
		          </c:if>
		          <c:if test="${vo.logs_state == 2}">
	          		<td class="py-3">출고준비완료</td>
	          	  </c:if>
	          </c:if>
		   </tr>
		   </tbody>
		</table>
</body>
</html>
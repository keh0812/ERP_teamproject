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
    <script src="${project}js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	function content(code) {
		
		var param = "&${_csrf.parameterName}=${_csrf.token}&ware_code=" + code;
	   $.ajax({
	      type:"POST",
		  data:param,
		  url:'logWarehouseDetail',
	      success: function(data){ 
	         $('#logWarehouseDetail').html(data);
	      },
	      error: function(){
	         alert('오류');
	      }
	   });
	}
	
	</script>
</head>

<body>

<main>
 <!-- 숨겨진 페이지 -->
 <div class="row">
       <div class="col">
          <div class="collapse multi-collapse"
             id="multiCollapseExample9"> 
             <div class="bg-white p-4">
             	<div id="logWarehouseDetail"></div>
             
                	</div>
                	<br><br><br>
                </div>
             </div>
             <!-- 숨겨진 페이지 종료 -->
             <table class="table bg-white text-dark center ass2 table-striped">
                <thead>
                   <tr class="text-white table-bordered tap">
                      <th class="font-weight-semi-bold border-top-0 py-3 h4">창고ID</th>
                      <th class="font-weight-semi-bold border-top-0 py-3 h4">창고명</th>
                      <th class="font-weight-semi-bold border-top-0 py-3 h4">창고주소</th>
                      <th class="font-weight-semi-bold border-top-0 py-3 h4">상태</th>
                   </tr>
                </thead>
                <tbody>
                   <c:forEach var="houseVo" items="${warehouseList}">
                   <tr>
                      <td class="py-3" style="vertical-align: middle">
                         <a class="text-dark con2" data-toggle="collapse"
							href="#multiCollapseExample9" role="button"
							aria-expanded="false"
							aria-controls="multiCollapseExample9"
							onclick="content(${houseVo.ware_code})"> ${houseVo.ware_code}</a>
                         </td>
                      <td class="py-3" style="vertical-align: middle">${houseVo.ware_name}</td>
                      <td class="py-3" style="vertical-align: middle">${houseVo.ware_location}</td>
                      <c:choose>
                      		<c:when test="${houseVo.ware_state == 0}">
                      			<td class="py-3" style="vertical-align: middle">미사용</td>
                      		</c:when>
                      		<c:when test="${houseVo.ware_state == 1}">
                      			<td class="py-3" style="vertical-align: middle">사용중</td>
                      		</c:when>
                      </c:choose>
                   </tr>
                   </c:forEach>
                </tbody>
             </table>
             </div>
    
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
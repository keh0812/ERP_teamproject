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
   	
   	/* $('#amount').change(function() {
   		var amount = $('#amount').val();
   		var quantity = ${stsu_quantity};
   		
   		if(count < quantity) {
   			alert("재고수량을 초과했습니다.");
   			
   			return false;
   		}
   	}); */
   	
   	/* 재고 조정/이동 등록 AJAX */
    $('#selectStock').change(function() {
    	
    	var selectStock = $('#selectStock').val();
    	
    	if(selectStock == 1) {
    		$.ajax({
    	          // sendRequest(콜백함수명, url, method, params)
    	          url: "logAdjNewInsert", // 전송 페이지 => 컨트롤러 "basic_next"
    	          type: 'GET', // 전송방식('GET', 'POST') - method
    	          dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
    	          success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
    	             $('#adjOptionList').html(data);
    	          },
    	          error: function(){
    	             alert('오류');
    	          }
    	       });
    	} else if(selectStock == 2) {
    		
	    	$.ajax({
	          // sendRequest(콜백함수명, url, method, params)
	          url: "logMoveWareInsert", // 전송 페이지 => 컨트롤러 "basic_next"
	          type: 'GET', // 전송방식('GET', 'POST') - method
	          dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
	          success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
	             $('#adjOptionList').html(data);
	          },
	          error: function(){
	             alert('오류');
	          }
	       });
    	}
    	
    });
	
    
    </script>
</head>

<body>
<main>
	<div class="px-3">
        <ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-3"
           role="tablist">
           <li class="nav-item"><a
              class="nav-link px-2 pb-2 active ass2" href="#tabs2-tab3"
              role="tab" aria-selected="true" data-toggle="tab">재고 조정 내역 </a></li>
           <li class="nav-item ml-4"><a
              class="nav-link px-2 pb-2 ass2" href="#tabs2-tab4" role="tab"
              aria-selected="false" data-toggle="tab">재고 조정 등록</a></li>
        </ul>
        
		<div id="tabsContent2" class="card-body tab-content p-0">
           <div class="tab-pane fade show active" id="tabs2-tab3"
              role="tabpanel">
			<table class="table  bg-white text-dark center ass2 table-striped">
				<thead>
					<tr class="text-white table-bordered tap">
						<th class="font-weight-semi-bold border-top-0 py-3 con2">상품번호</th>
						<th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
						<th class="font-weight-semi-bold border-top-0 py-3 con2">창고명</th>
						<th class="font-weight-semi-bold border-top-0 py-3 con2">조정 재고</th>
						<th class="font-weight-semi-bold border-top-0 py-3 con2">조정 후 재고</th>
						<th class="font-weight-semi-bold border-top-0 py-3 con2">담당자명</th>
						<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
					</tr>
				</thead>
				<c:forEach var="adjlist" items="${adjlist}">
					<tr>
						<td class="py-3" style="vertical-align: middle;">${adjlist.pro_code}</td>
						<td class="py-3" style="vertical-align: middle;">${adjlist.product.pro_name}</td>
						<td class="py-3" style="vertical-align: middle;">${adjlist.stsu_arrivewh}</td>
						<td class="py-3" style="vertical-align: middle;">${adjlist.stsu_amount}</td>
						<td class="py-3" style="vertical-align: middle;">${adjlist.stsu_quantity}</td>
						<td class="py-3" style="vertical-align: middle;">${adjlist.employee.emp_name}</td>
						<td class="py-3" style="vertical-align: middle;">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${adjlist.stsu_reg_date}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<!-- 신규등록 -->
		<div class="tab-pane fade" id="tabs2-tab4" role="tabpanel">
			<table class="table bg-white text-dark center ass2" style="text-align:center">
                    <tr class="text-white table-bordered tap">
                        <th colspan="3"> 재고 조정 등록 </th>
                    </tr>
                    <tr>
                    	<td class="font-weight-semi-bold border-top-0 py-2 text-dark"
						colspan="2" style="vertical-align: middle;">유형</td>
						<td class="font-weight-semi-bold border-top-0 py-2"
						colspan="2">
							<select class="custom-select custom-select-lg" id="selectStock" onchange="stockAdjustList()">
								<option value="1">재고 조정</option>
								<option value="2">재고 이동</option>
							</select>
						</td>
                    </tr>
			</table>
				<div id="adjOptionList"></div> 
		</div>
		<!-- 신규등록 끝 -->
		
	</div>
</div>
<!-- 재고조정 끝 -->    
    
    
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
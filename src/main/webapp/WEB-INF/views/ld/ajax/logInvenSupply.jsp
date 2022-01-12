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
    
    /* 재고수불부 내역 AJAX */
    function ajaxSupplyList() {
    	var start_date = $('#start_date').val();
    	var end_date = $('#end_date').val();
    	var proname = $('#proname').val();
    	var param =  "&${_csrf.parameterName}=${_csrf.token}&start_date=" + start_date + "&end_date=" + end_date + "&proname=" + proname; 
    	
    	$.ajax({
    		url: "supplyListAction",
            type: 'POST', // 전송방식('GET', 'POST') - method
            data: param, // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
            success: function(result){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
               $('#supList').html(result);
            },
            error: function(){
            	if(!start_date) {
            		alert('기준일자를 입력하세요.')
           			$('#start_date').focus();
           			return false;
            	}
            	if(!end_date) {
            		alert('기준일자를 입력하세요.')
           			$('#end_date').focus();
           			return false;
            	}
            	if(!proname) {
            		alert('상품명을 입력하세요.')
           			$('#proname').focus();
           			return false;
            	}
            }
    		
    	});
    }
    	
    	$('#search_stockpile_date').change(function(){	
    		
    		var date = document.getElementById("search_stockpile_date").value;
    		var start_day = document.getElementById("start_date");
    		var end_day = document.getElementById("end_date");
    		var now = new Date();
    		
    		var year= now.getFullYear();
    		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    		var day = now.getDate()>9? now.getDate() : '0' + now.getDate()>9 ? ''+now.getDate()>9? now.getDate() : '0' + now.getDate() : '0'+now.getDate()>9? now.getDate() : '0' + now.getDate();
    		
    		if(date == 'today'){
    			start_day.value = year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + now.getDate());
    			if(now.getDate()+1 >= 31){
    				end_day.value = year + "-" + ((now.getMonth()+2)>9 ? ''+(now.getMonth()+2) : '0'+(now.getMonth()+2)) + "-" + '01';		
    			}else{
    				end_day.value = year + "-" + mon + "-" + (now.getDate()+1>9? now.getDate()+1 : '0' + (now.getDate()+1));
    			}
    			return false;
    		
    		}else if(date == 'week'){
    			var i = now.getDay();
    			if(i > 0 && i < 7){
    				aa = 1 - i;
    				if(now.getDate() + aa == 0){
    					start_day.value =  year + "-" + ((now.getMonth())>9 ? ''+(now.getMonth()) : '0'+(now.getMonth())) + "-" + '31';
    				}else{
    					start_day.value =  year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + (now.getDate() + aa));
    				}
    			}
    			
    			if(now.getDate()+1 >= 31){
    				end_day.value = year + "-" + ((now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1)) + "-" + '01';		
    			}else{
    				end_day.value = year + "-" + mon + "-" + (now.getDate()+1>9? now.getDate()+1 : (now.getDate()-(aa)));
    			}
    		
    			if(start_day.value == end_day.value){
    				end_day.value = year + "-" + mon + "-" + (now.getDate()+2>9? now.getDate()+2 : '0' + now.getDate()+2);
    			}
    			return false;
    		
    		}else if(date == 'month'){
    			if(now.getMonth()+1 >= 10 && now.getMonth()+2 >= 8 && now.getMonth()+2 <= 10){
    				start_day.value = year + "-" + (now.getMonth()+1) + "-01";
    				end_day.value = year + "-" + (now.getMonth()+2) + "-01";
    			}else{
    				start_day.value = year + "-0" + (now.getMonth()+1) + "-01";
    				end_day.value = year + "-0" + (now.getMonth()+2) + "-01";
    			}
    			return false;
    		
    		}else if(date == 'year'){
    			start_day.value = year + "-01-01";
    			end_day.value = (now.getFullYear() + 1) + "-01-01";
    			return false;
    		
    		}else if(date == '1_quarter'){
    				start_day.value = year + "-01-01";
    				end_day.value = year + "-04-01";
    				return false;
    		
    		}else if(date == '2_quarter'){
    				start_day.value = year + "-04-01";
    				end_day.value = year + "-07-01";
    				return false;
    		
    		}else if(date == '3_quarter'){
    				start_day.value = year + "-07-01";
    				end_day.value = year + "-10-01";
    				return false;
    		
    		}else if(date == '4_quarter'){
    				start_day.value = year + "-10-01";
    				end_day.value = (now.getFullYear()+1) + "-01-01";
    				return false;
    		
    		}else if(date == 'first_half'){
    			start_day.value = year + "-01-01";
    			end_day.value = year + "-07-01";
    			return false;
    		
    		}else if(date == 'second_half'){
    			start_day.value = year + "-07-01";
    			end_day.value = (now.getFullYear()+1) + "-01-01";
    			return false;
    		}
    	});
    	
    </script>
</head>

<body>

<main>
		<table class="table  bg-white text-dark center ass2">
			<thead>
				<tr class="text-white tap">
					<th class="font-weight-semi-bold border-top-0 py-4 h4">기준일자</th>
					<th class="font-weight-semi-bold border-top-0 py-3 h4">
						<input type="date" class="form-control" name="start_date" id="start_date">
					</th>
					<th class="font-weight-semi-bold border-top-0 py-4 h4"> ~ </th>
					<th class="font-weight-semi-bold border-top-0 py-3 h4">
						<input type="date" class="form-control" name="end_date" id="end_date">
					</th>
					<th class="font-weight-semi-bold border-top-0 py-3 h5">
					<select class="custom-select" id="search_stockpile_date">
					    <option value="0">조회 기간 선택</option>
						<option value="today">금일</option>
						<option value="week">금주</option>
						<option value="month">금월</option>
						<option value="year">금년</option>
						<option value="1_quarter">1분기</option>
						<option value="2_quarter">2분기</option>
						<option value="3_quarter">3분기</option>
						<option value="4_quarter">4분기</option>
						<option value="first_half">전반기</option>
						<option value="second_half">후반기</option>
					</select>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">
						<!-- 검색창 시작 -->      
                       	<div class="input-group">
                         	<div class="input-group-append">
                             <i class="gd-search icon-text icon-text-sm" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"></i>
                           	</div>
                           	<input class="form-control form-control-icon-text" placeholder="상품명 검색" id="proname" name="proname" type="text" style="font-size:20px">
                         </div>
					</td>
				</tr>
				<tr align="center">
					<td colspan="5">
						<input type="submit" id="select_stockpile" onclick="ajaxSupplyList()" class="btn btn-outline-info" value="확인" 
						data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					</td>
				</tr>
			</tbody>
		</table>
	
	<div class="collapse" id="collapseExample">
		<div class="bg-white p-4">
			<div id="supList"></div>
			<br>
		</div>
	</div>
										
				
    
    
</main>

<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
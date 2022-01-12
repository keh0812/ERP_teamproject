<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../setting.jsp" %> 
<head>
    <!-- Title -->
    <title>Users | Graindashboard UI Kit</title>

<script type="text/javascript">
function pdContent(code) {
      var param = "&${_csrf.parameterName}=${_csrf.token}&accs_code=" + code;
      $.ajax({
         type:"POST",
        data:param,
        url:'pdContent',
         success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
            $('#pdContent').html(data);
         },
         error: function(){
            alert('오류');
         }
      });
   }
   
   function changeProduct() {
		var count = document.getElementById("accs_quantity").value;	
		var price = document.getElementById("pro_code").options[document.getElementById("pro_code").selectedIndex].id;
		
		document.getElementById("accs_price").value = price;	
		document.getElementById("accs_sum").value = price * count;
	};
	
	function changeCount() {
		var price = document.getElementById("pro_code").options[document.getElementById("pro_code").selectedIndex].id;
		var count = document.getElementById("accs_quantity").value;	
		
		document.getElementById("accs_sum").value = price * count;
	};
	
	function conCheck() {
          if(!$("input[name='accs_content']").val()) {
             alert("내용을 입력하세요.");
             $("input[name='accs_content']").focus();
             return false;
          }
       }
	function logsContent(code) {
	      var param = "&${_csrf.parameterName}=${_csrf.token}&logs_code=" + code;
	      $.ajax({
	         type:"POST",
	        data:param,
	        url:'logsContent',
	         success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
	            $('#logsContent').html(data);
	         },
	         error: function(){
	            alert('오류');
	         }
	      });
	   }
</script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${project}img/favicon.ico">
   <link rel="stylesheet" href="${project}css/board.css">
    <!-- Template -->
    <link rel="stylesheet" href="${project}css/graindashboard.css">
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">

<%@ include file = "../common/header.jsp" %> 
<main class="main">
   <!-- Start Sidebar Nav -->
   <aside id="sidebar" class="js-custom-scroll side-nav">
      <ul id="sideNav" class="side-nav-menu side-nav-menu-top-level mb-0">
         <!-- 대메뉴 : 인사 관리 -->
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#gg">
               <span class="side-nav-menu-icon d-flex mr-3">
                  <i class="gd-themify-favicon"></i>
               </span>
               <span class="side-nav-fadeout-on-closed media-body asss">인사 관리</span>
               <span class="side-nav-control-icon d-flex">
                  <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
               </span>
               <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            
            <!-- 중메뉴 : 인사 관리 -->
<!-- b -->      <ul id="gg" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/hrBasicReg">기초 등록</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/hrAppointment">인사 발령</a>
                    </li>
                    <li class="side-nav-menu-item">
                        <a class="side-nav-menu-link ass2" href="${path}/hrCard">인사 카드</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/hrSalary">급여</a>
               </li>
            </ul>
         </li>
         <!-- 인사 관리 종료 -->
         
         <!-- 대메뉴 : 근태 관리 -->
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subPages">
               <span class="side-nav-menu-icon d-flex mr-3">
                  <i class="gd-timer"></i>
               </span>
               <span class="side-nav-fadeout-on-closed media-body asss">근태 관리</span>
               <span class="side-nav-control-icon d-flex">
                  <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
               </span>
               <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>

                <!-- 중메뉴 : 근태 관리 -->
<!-- b -->      <ul id="subPages" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/waSelect">조회</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/waApplication">신청</a>
               </li>
               <li class="side-nav-menu-item">
                       <a class="side-nav-menu-link ass2" href="${path}/waConfirm">승인</a>
               </li>
            </ul>
         </li>
         <!-- 근태 관리 종료 -->
         
         <!-- 대메뉴 : 판매 관리 -->
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subComponents">
               <span class="side-nav-menu-icon d-flex mr-3">
                  <i class="gd-money"></i>
               </span>
               <span class="side-nav-fadeout-on-closed media-body asss">판매 관리</span>
               <span class="side-nav-control-icon d-flex">
                  <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
               </span>
               <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            
            <!-- 중메뉴 : 판매 관리 -->
<!-- b -->      <ul id="subComponents" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/stBasicReg">기초 등록</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/stInvenStatus">재고 현황</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/stStatus">판매 현황</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/stRelStatus">출고 현황</a>
               </li>
            </ul>
         </li>
         <!-- 판매 관리 종료 -->
         
         <!-- 대메뉴 : 구매 관리 -->
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu side-nav-opened">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#asd">
               <span class="side-nav-menu-icon d-flex mr-3">
                  <i class="gd-shopping-cart"></i>
               </span> <span class="side-nav-fadeout-on-closed media-body asss">구매 관리</span>
               <span class="side-nav-control-icon d-flex">
                  <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
               </span>
               <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            
            <!-- 중메뉴 : 구매 관리 -->
<!-- b -->      <ul id="asd" class="side-nav-menu side-nav-menu-second-level mb-0"style="display:block;">
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/pdBasicReg">기초 등록</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/pdInvenStatus">재고 현황</a>
               </li>
               <li class="side-nav-menu-item active">
                  <a class="side-nav-menu-link ass2" href="${path}/pdStatus">구매 현황</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/pdRecStatus">입고 현황</a>
               </li>
            </ul> 
         </li>
         <!-- 구매 관리 종료 -->
         
         <!-- 대메뉴 : 물류 관리 -->
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#zxc">
               <span class="side-nav-menu-icon d-flex mr-3">
                  <i class="gd-truck"></i>
               </span>
               <span class="side-nav-fadeout-on-closed media-body asss">물류 관리</span>
               <span class="side-nav-control-icon d-flex">
                  <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
               </span>
               <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            
            <!-- 중메뉴 : 물류 관리 -->
<!-- b -->      <ul id="zxc" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/ldBasicReg">기초 등록</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/ldStatementManagement">전표 관리</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/ldInventoryControl">재고 관리</a>
               </li>
            </ul>
         </li>
         <!-- 물류 관리 종료 -->
         
         <!-- 대메뉴 : 회계 관리 -->
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subUsers">
               <span class="side-nav-menu-icon d-flex mr-3">
                  <i class="gd-infinite"></i>
               </span>
               <span class="side-nav-fadeout-on-closed media-body asss">회계 관리</span>
               <span class="side-nav-control-icon d-flex">
                  <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
               </span>
               <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            
            <!-- 중메뉴 : 회계 관리 -->
<!-- b -->      <ul id="subUsers" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/adBasicReg">기초 등록</a>
               </li>
<!-- a -->         <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/adReport">회계보고서</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/adStatementManagement">전표 관리</a>
               </li>
            </ul>
         </li>
         <!-- 회계 관리 종료 -->
         
      </ul>
   </aside>
   <!-- End Sidebar Nav -->

<div class="content">
         <div class="py-4 px-3 px-md-4">
            <div class="card">
               <div class="card-body">
                  <nav aria-label="breadcrumb">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">구매 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">구매 현황</li>
                     </ol>
                  </nav>
                  <div class="row">

                     <div class="col-xl-12">

                        <div id="example" class="mb-9">
                           <h4 class="h1 text-dark"><b>구매 현황</b>
                              <a class="anchorjs-link" href="#example"
                                 aria-label="Anchor" data-anchorjs-icon="#"></a>
                           </h4>
                           <div class="mb-3">
                              <!-- Nav Classic -->
                              <ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark"
                                 id="pills-tab-1" role="tablist">
                                 <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light " ><a
                                    class="nav-link d-flex align-items-center py-2 px-3 active"
                                    id="pills-result-tab-1" data-toggle="pill"
                                    href="#pills-result-1" role="tab"
                                    aria-controls="pills-result-1" aria-selected="false">구매 내역</a></li>
                                 <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light"><a
                                    class="nav-link d-flex align-items-center py-2 px-3"
                                    id="pills-html-tab-1" data-toggle="pill"
                                    href="#pills-html-1" role="tab" aria-controls="pills-html-1"
                                    aria-selected="false">구매 전표 등록</a></li>
                                 <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light  ">
		                           <a class="nav-link d-flex align-items-center py-2 px-3"
		                           id="pills-html-tab-2" data-toggle="pill"
		                           href="#pills-html-2" role="tab" aria-controls="pills-html-2"
		                           aria-selected="false">승인 내역</a>
		                        </li> 
		                        <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
                          			 <a class="nav-link d-flex align-items-center py-2 px-3"
                                 	id="pills-html-tab-3" data-toggle="pill"
                                 	href="#pills-html-3" role="tab" aria-controls="pills-html-3"
                                 	aria-selected="false">재고부족 요청</a>
                           </li>
                              </ul>
                              <!-- End Nav Classic -->

                              <!-- Tab Content -->
                              <div class="tab-content bg-lighter " id="pills-tabContent-1">
                                 <div class="tab-pane fade p-4 show active"
                                    id="pills-result-1" role="tabpanel"
                                    aria-labelledby="pills-result-tab-1">
                                    <div class="row">
                                       <div class="col">
                                             <div class="collapse multi-collapse"
                                                id="multiCollapseExample1">
                                                <div id="pdContent"></div>
                                            </div>
                                       <table class="table  bg-white text-dark center ass2 table-striped">
                                          <thead class="text-white table-bordered tap">
                                             <tr>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">구매번호</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처명</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">담당자</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">상태</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                            <c:forEach var="vo" items="${buy}">
                                            <c:if test="${vo.accs_type == 3 || vo.accs_type == 4}">
                                             <tr>
                                                <td class="py-3" style="vertical-align:middle">
                                                       <a class="text-dark con2" style="font-size:22px" data-toggle="collapse"
                                                          href="#multiCollapseExample1" role="button"
                                                          aria-expanded="false"
                            					          aria-controls="multiCollapseExample1"
                                                          onclick="pdContent(${vo.accs_code})"> ${vo.accs_code}</a>
                                                </td>
                                                <td class="py-3" style="vertical-align:middle">${vo.company.com_name}</td>
                                                <td class="py-3" style="vertical-align:middle">${vo.product.pro_name}</td>
                                                <td class="py-3" style="vertical-align:middle">${vo.employee.emp_name}</td>
                                                <td class="py-3" style="vertical-align:middle"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.accs_reg_date}"/></td>
                                                <c:if test="${vo.accs_state == -1 }">
                                                   <td class="py-3" style="vertical-align:middle">전표 승인 거부</td>
                                                </c:if>
                                                <c:if test="${vo.accs_state == 0 }">
                                                   <td class="py-3" style="vertical-align:middle">전표 승인 대기중</td>
                                                </c:if>
                                                <c:if test="${vo.accs_state == 1 }">
                                                   <td class="py-3" style="vertical-align:middle">입고 대기중</td>
                                                </c:if>
                                                <c:if test="${vo.accs_state == 3 }">
                                                   <td class="py-3" style="vertical-align:middle">입고 완료</td>
                                                </c:if>
                                                </tr>
                                                </c:if>
                                            </c:forEach>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                                 </div>

                                 <div class="tab-pane fade p-4" id="pills-html-1"
                                    role="tabpanel" aria-labelledby="pills-html-tab-1">
                                    <div class="row">
                                    <!-- 테스트 -->
                                    <div class="col">
                                            <div class="bg-white p-2">
                                                <form action="${path}/pdpdAppInsert" method="post" name="pppdem" onsubmit="return conCheck()">
                                                <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
                                                <table class="table bg-white text-dark center ass2">
                                                <tr class="text-white table-bordered tap">
                                                   <th colspan="3"> 구매 전표 등록 </th>
                                                </tr>
                                                   <tr>
                                          <td class="font-weight-semi-bold border-top-0 py-2 text-dark"
                                             colspan="2" style="vertical-align: middle;">전표유형</td>
                                          <td style="vertical-align: middle;">
                                                        <select class="form-control" id="accs_type" name="accs_type" style="font-size:20px">
                                                          <option value="3">구매전표</option>
                                                          <option value="4">채무전표</option>
                                                        </select>
                                          </td>
                                       </tr>   
                                                   <tr>
                                          <td class="font-weight-semi-bold border-top-0 py-2 text-dark"
                                             colspan="2" style="vertical-align: middle;">거래처명</td>
                                          <td class="font-weight-semi-bold border-top-0 py-2"
                                             colspan="2"><select class="form-control" id="com_code" name="com_code" style="font-size:20px">
		                                             		<c:forEach var="company" items="${company}">
		                                                          <option value="${company.com_code}">${company.com_name}</option>
		                                                    </c:forEach>
                                                        </select>
                                          </td>
                                       </tr>
                                          <tr>
                                             <td class="py-3 text-dark" colspan="2"style="vertical-align: middle;"><b>상품명</b></td>
                                             <td class="py-3" colspan="2">
                                             	<select class="form-control" id="pro_code" name="pro_code" onchange="changeProduct()" style="font-size:20px">
		                                             <c:forEach var="product" items="${product}">
		                                             	<option id="${product.pro_sal_price}" value="${product.pro_code}">
		                                             		${product.pro_name}
		                                             	</option>
		                                             </c:forEach>
                                                </select>
                                             </td>
                                         </tr>
                                         <tr>
                                                   <td class="py-3 text-dark" colspan="2"style="vertical-align: middle;"><b>단가</b></td>
                                                      <td class="py-3" colspan="2"><input class="form-control" style="font-size:20px" type="text" id="accs_price" name="accs_price"></td>
                                                   </tr>
                                          <tr>
                                             <td class="py-3" colspan="2" style="vertical-align: middle;"><b>수량</b></td>
                                             <td class="py-3" colspan="2"><input class = "form-control"  style="font-size:20px" type = "number" min = "1" step = "1" value = "1" id="accs_quantity" name="accs_quantity" onchange="changeCount()"></td>
                                          </tr>
                                          <tr>
                                             <td class="py-3" colspan="2" style="vertical-align: middle; "><b>총액</b></td>
                                             <td class="py-3" colspan="2"><input 
                                                class="form-control" style="font-size:20px" type="text" id="accs_sum" name="accs_sum"></td>
                                          </tr>
                                          <tr>
                                             <td class="py-3" colspan="2" style="vertical-align: middle;"><b>담당자</b></td> 
                                             <td class="py-3" colspan="2" style="vertical-align: middle; font-size:20px; text-align:left;">
                                                <input type="hidden" name="emp_code" value="${sessionScope.mem_id}">
                                                ${sessionScope.mem_name}</td>
                                          </tr>
                                          <tr>
                                             <td class="py-3" colspan="2" style="vertical-align: middle; "><b>내용</b></td>
                                             <td class="py-3" colspan="2"><input class="form-control" style="font-size:20px" type="text" id="accs_content" name="accs_content" value=""></td>
                                          </tr>
                                       </tbody>
                                    </table>                                 
                                        <br>
                                         <div align=center>
                                           <button type="submit" class="btn btn-outline-info">등록</button>&nbsp;&nbsp;&nbsp;
                                           <button type="reset" class="btn btn-outline-info">재입력</button>                                  
                                         </div>
                                       </form>                                  
                                       </div>
                                    </div>
                                    </div>
                                   </div> 
                              
                                   <div class="tab-pane fade p-4" id="pills-html-2"
                                    role="tabpanel" aria-labelledby="pills-html-tab-2">
                                    <table class="table  bg-white text-dark center ass2 table-striped">
                                          <thead class="text-white table-bordered tap">
                                             <tr class="text-white table-bordered tap">
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">구매번호</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처명</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">담당자</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
                                                <th class="font-weight-semi-bold border-top-0 py-3 con2">상태</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach var="vo" items="${buy}">
                                             <c:if test="${vo.accs_type == 3 || vo.accs_type == 4}">
                                             <tr>
                                                <td class="py-3">${vo.accs_code}</td>
                                                <td class="py-3">${vo.company.com_name}</td>
                                                <td class="py-3">${vo.product.pro_name}</td>
                                                <td class="py-3">${vo.employee.emp_name}</td>
                                                <td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.accs_reg_date}"/></td>
                                                <c:if test="${vo.accs_state == -1 }">
                                                   <td class="py-3">승인 거부</td>
                                                </c:if>
                                                <c:if test="${vo.accs_state == 0 }">
                                                   <td class="py-3">승인 대기중</td>
                                                </c:if>
                                                <c:if test="${vo.accs_state == 1 }">
                                                   <td class="py-3">승인 완료</td>
                                                </c:if>
                                                <c:if test="${vo.accs_state == 3 }">
                                                   <td class="py-3">승인 완료</td>
                                                </c:if>
                                             </tr>
                                             </c:if>
                                             </c:forEach>
                                          </tbody>
                                       </table>
                                 
                                    
                                 </div>
                                 <div class="tab-pane fade p-4" id="pills-html-3"
                                    role="tabpanel" aria-labelledby="pills-html-tab-3">
                                    
                                    <div id="logsContent"></div>
                                 <form>
                                    <table class="table table-striped bg-white text-dark center ass2">
                                       <thead>
                                          <tr class="text-white table-bordered tap">
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">물류전표번호</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">상품코드</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">부족수량</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:forEach var="list" items="${logslist}"><!-- 아이템 수정하기 -->
	                                       <tr>
	                                          <td class=" text-dark con2" style="vertical-align:middle"><a class="text-dark con2" data-toggle="collapse" style="font-size:22px"
													href="#multiCollapseExample2" role="button"
													aria-expanded="false"
													aria-controls="multiCollapseExample2"
													onclick="logsContent(${list.logs_code})">${list.logs_code}</a></td>
											  <td class="py-3 middle" style="vertical-align:middle; font-size:22px;">${list.company.com_name}</td>	
											  <td class="py-3 middle" style="vertical-align:middle; font-size:22px;">${list.product.pro_code}</td>	
	                                          <td class="py-3 middle" style="vertical-align:middle; font-size:22px;">${list.product.pro_name}</td>
	                                          <td class="py-3 middle" style="vertical-align:middle; font-size:22px;">${list.logs_shortage}</td>
	                                          <td class="py-3 middle" style="vertical-align:middle; font-size:22px;">${list.employee.emp_name}</td>
	                                       </tr>
	                                       </c:forEach>
                                       </tbody>
                                    </table>
                                    </form>
                                    </div>
                                    <br>
                              </div>
                              </div>
                              </div>
                              <!-- End Tab Content -->
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         
</main>
<%@ include file = "../common/footer.jsp" %> 
<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
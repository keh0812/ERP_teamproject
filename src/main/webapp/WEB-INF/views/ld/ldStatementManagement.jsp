<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../setting.jsp" %> 
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
<script type="text/javascript">
/* 입고 미승인 상셍페이지 */
function content1(code) {
	
	var param = "&${_csrf.parameterName}=${_csrf.token}&emp_code=${sessionScope.mem_id}&logs_code=" + code;
	
   $.ajax({
      type:"POST",
	  data:param,
	  url:'ldStatementManagementContentAjax1',
      success: function(data){ 
         $('#content1').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}

/* 입고 승인 상셍페이지 */
function content2(code) {
	
	var param = "&${_csrf.parameterName}=${_csrf.token}&emp_code=${sessionScope.mem_id}&logs_code=" + code;
	
   $.ajax({
      type:"POST",
	  data:param,
	  url:'ldStatementManagementContentAjax2',
      success: function(data){ 
         $('#content2').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}

/* 출고 미승인 상셍페이지 */
function content3(code) {
	
	var param = "&${_csrf.parameterName}=${_csrf.token}&emp_code=${sessionScope.mem_id}&logs_code=" + code;
	
   $.ajax({
      type:"POST",
	  data:param,
	  url:'ldStatementManagementContentAjax3',
      success: function(data){ 
         $('#content3').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}

/* 출고 승인 상셍페이지 */
function content4(code) {
	
	var param = "&${_csrf.parameterName}=${_csrf.token}&emp_code=${sessionScope.mem_id}&logs_code=" + code;
	
   $.ajax({
      type:"POST",
	  data:param,
	  url:'ldStatementManagementContentAjax4',
      success: function(data){ 
         $('#content4').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}

</script>    
    
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">

<%@ include file = "../common/header.jsp" %> 
<main class="main">
	<!-- Start Sidebar Nav -->
	<aside id="sidebar" class="js-custom-scroll side-nav">
		<ul id="sideNav" class="side-nav-menu side-nav-menu-top-level mb-0">
			<!-- 대메뉴 : 인사 관리 -->
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->		<ul id="gg" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->			<li class="side-nav-menu-item">
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
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->		<ul id="subPages" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->			<li class="side-nav-menu-item">
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
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->		<ul id="subComponents" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->			<li class="side-nav-menu-item">
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
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->		<ul id="asd" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->			<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/pdBasicReg">기초 등록</a>
					</li>
					<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/pdInvenStatus">재고 현황</a>
					</li>
					<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/pdStatus">구매 현황</a>
					</li>
					<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/pdRecStatus">입고 현황</a>
					</li>
				</ul> 
			</li>
			<!-- 구매 관리 종료 -->
			
			<!-- 대메뉴 : 물류 관리 -->
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu side-nav-opened">
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
<!-- b -->		<ul id="zxc" class="side-nav-menu side-nav-menu-second-level mb-0" style="display:block;">
<!-- a -->			<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/ldBasicReg">기초 등록</a>
					</li>
					<li class="side-nav-menu-item active">
						<a class="side-nav-menu-link ass2" href="${path}/ldStatementManagement">전표 관리</a>
					</li>
					<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/ldInventoryControl">재고 관리</a>
					</li>
				</ul>
			</li>
			<!-- 물류 관리 종료 -->
			
			<!-- 대메뉴 : 회계 관리 -->
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->		<ul id="subUsers" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->			<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/adBasicReg">기초 등록</a>
					</li>
<!-- a -->			<li class="side-nav-menu-item">
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
								<li class="breadcrumb-item"><a href="#">물류 관리</a></li>
								<li class="breadcrumb-item active" aria-current="page">전표
									관리</li>
							</ol>
						</nav>
						<div class="row">

							<div class="col-xl-12">

								<div id="example" class="mb-9">
									<h4 class="h1 text-dark">
										<b>전표 관리</b><a class="anchorjs-link" href="#example"
											aria-label="Anchor" data-anchorjs-icon="#"></a>
									</h4>
									<div class="mb-3">
										<!-- Nav Classic -->
										<ul
											class="nav nav-tabs nav-primary d-block d-xl-flex text-dark"
											id="tabs-tab-3" role="tablist">
											<li
												class="nav-item border-bottom border-xl-bottom-0  asss bg-light  ">
												<a
												class="nav-link d-flex align-items-center py-2 px-3 active  "
												id="tabs-result-tab-3" data-toggle="pill"
												href="#tabs-result-3" role="tab"
												aria-controls="tabs-result-3" aria-selected="true">출고 전표</a>
											</li>
											<li
												class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
												<a class="nav-link d-flex align-items-center py-2 px-3 "
												id="tabs-html-tab-3" data-toggle="pill" href="#tabs-html-3"
												role="tab" aria-controls="tabs-html-3" aria-selected="false">입고 전표</a>
											</li>
										</ul>
										<!-- End Nav Classic -->

										<!-- Tab Content -->
										<div class="tab-content bg-lighter" id="tabs-tabContent-3">
											<div class="tab-pane fade show active" id="tabs-result-3"
												role="tabpanel" aria-labelledby="tabs-result-tab-3">
												<div class="px-3 p-4">
													<ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-2"
														role="tablist">
														<li class="nav-item"><a
															class="nav-link px-2 pb-2 active ass2" href="#tabs2-tab1"
															 role="tab" aria-selected="true"
															data-toggle="tab">승인 전표 </a></li>
														<li class="nav-item ml-4"><a
															class="nav-link px-2 pb-2 ass2" href="#tabs2-tab2"
															role="tab" aria-selected="false" data-toggle="tab">미승인
																전표 </a></li>
													</ul>

													<div id="tabsContent2" class="card-body tab-content p-3">
														<div class="tab-pane fade show active" id="tabs2-tab1"
															role="tabpanel">
															<div class="row">
																<div class="col">
																	<div class="collapse multi-collapse"
							                                             id="multiCollapseExample4">
							                                             
							                                             <div id="content4"></div>
							                                                 
							                                          </div>
																</div>
																<table class="table bg-white text-dark center ass2 table-striped">
						                                          <thead class="text-white table-bordered tap">
						                                          	<tr class="text-white table-bordered tap">
						                                            	<th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
												                        <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
												                        <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처</th>
												                        <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2">판매수량</th> -->
												                        <th class="font-weight-semi-bold border-top-0 py-3 con2">담당자명</th>
												                        <th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
												                        <th class="font-weight-semi-bold border-top-0 py-3 con2">승인일</th>
												                        <th class="font-weight-semi-bold border-top-0 py-3 con2">승인상태</th>
						                                             </tr>
						                                          </thead>
						                                          <tbody>
											                          <c:forEach var="list" items="${SOlist2}"> <!-- var="개별값(작은바구니)" items="집합(큰바구니)" -->
													                  <tr>
													                     <td class="py-3"><a class="text-dark con2" data-toggle="collapse" style="font-size:22px"
																				href="#multiCollapseExample4" role="button"
																				aria-expanded="false"
																				aria-controls="multiCollapseExample4"
																				onclick="content4(${list.logs_code})">${list.logs_code}</a></td>
													                     <td class="py-3 middle" style="vertical-align:middle">${list.product.pro_name}</td>
													                     <td class="py-3 middle" style="vertical-align:middle">${list.company.com_name}</td>
													                     <%-- <td class="py-3 middle" style="vertical-align:middle">${list.logs_quantity}</td> --%>
													                     <td class="py-3 middle" style="vertical-align:middle">${list.employee.emp_name}</td>
													                     <td class="py-3 middle" style="vertical-align:middle">
													                     		<fmt:formatDate value="${list.logs_reg_date}" pattern="yyyy-MM-dd" />
													                     </td>
													                     <%-- <c:if test="${list.logs_state == 3}">
													                     	<td class="py-3 middle" style="vertical-align:middle">재고부족</td>
													                     </c:if>
													                     <c:if test="${list.logs_state == 1}">
													                     	<td class="py-3 middle" style="vertical-align:middle">승인</td>
													                     </c:if> --%>
													                     <td class="py-3 middle" style="vertical-align:middle">
													                     		<fmt:formatDate value="${list.logs_update_date}" pattern="yyyy-MM-dd" />
													                     </td>
													                     <td class="py-3 middle" style="vertical-align:middle">승인완료</td>
											                  		 </tr>
											                  		 </c:forEach>
						                                          </tbody>
						                                       </table>
															</div>
														</div>


														<div class="tab-pane fade" id="tabs2-tab2" role="tabpanel">
															<div class="row">
																<div class="col">
																	<div class="collapse multi-collapse"
							                                             id="multiCollapseExample3">
							                                             <div id="content3"></div>
							                                          </div>
																</div>
																<table class="table bg-white text-dark center ass2 table-striped">
	                                             <thead class="text-white table-bordered tap">
	                                             	<tr class="text-white table-bordered tap">
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처</th>
	                                                   <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2">판매수량</th>
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">재고수량</th>
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">부족수량</th> -->
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">창고명</th>
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">담당자명</th>
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
	                                                   <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2">승인일</th> -->
	                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">승인상태</th>
	                                                   <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2">상태</th> -->
	                                                   <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2"></th> -->
	                                                </tr>
	                                             </thead>
	                                             <tbody>
	                                                <c:forEach var="list" items="${SOlist1}"> <!-- var="개별값(작은바구니)" items="집합(큰바구니)" -->
	                                                <tr>
														<td class="py-3"><a class="text-dark con2" data-toggle="collapse" style="font-size:22px"
															href="#multiCollapseExample3" role="button"
															aria-expanded="false"
															aria-controls="multiCollapseExample3"
															onclick="content3(${list.logs_code})">${list.logs_code}</a></td>	                                                    
	                                                   <td class="py-3 middle" style="vertical-align:middle">${list.product.pro_name}</td>
	                                                   <td class="py-3 middle" style="vertical-align:middle">${list.company.com_name}</td>
	                                                   <%-- <td class="py-3 middle" style="vertical-align:middle">${list.logs_quantity}</td>
	                                                   <td class="py-3 middle" style="vertical-align:middle">${list.stock.sto_quantity}</td>
	                                                   <td class="py-3 middle" style="vertical-align:middle">${list.logs_shortage}</td> --%>
	                                                   <td class="py-3 middle" style="vertical-align:middle">${list.warehouse.ware_name}</td>
	                                                   <td class="py-3 middle" style="vertical-align:middle">${list.employee.emp_name}</td>
	                                                   <td class="py-3 middle" style="vertical-align:middle">
	                                                   		<fmt:formatDate value="${list.logs_reg_date}" pattern="yyyy-MM-dd" />
	                                                   </td>
	                                                   <%-- <td class="py-3 middle" style="vertical-align:middle">
	                                                   		<fmt:formatDate value="${list.logs_reg_date}" pattern="yyyy-MM-dd" />
	                                                   </td> --%>
	                                                   <td class="py-3 middle" style="vertical-align:middle">대기중</td>
	                                                </tr>
	                                                </c:forEach>
	                                             </tbody>
	                                          </table>
															</div>

														</div>
													</div>
												</div>
											</div>


											<div class="tab-pane fade" id="tabs-html-3" role="tabpanel"
												aria-labelledby="tabs-html-tab-3">
												<div class="tab-pane fade show active" id="tabs-result-3"
													role="tabpanel" aria-labelledby="tabs-result-tab-3">
													<div class="px-3 p-4">
														<ul id="tabs2"
															class="nav nav-tabs nav-v2 nav-primary mb-2"
															role="tablist">
															<li class="nav-item"><a
																class="nav-link px-2 pb-2 active ass2"
																href="#tabs2-tab3" role="tab" aria-selected="true"
																data-toggle="tab">승인 전표 </a></li>
															<li class="nav-item ml-4"><a
																class="nav-link px-2 pb-2 ass2" href="#tabs2-tab4"
																role="tab" aria-selected="false" data-toggle="tab">미승인
																	전표 </a></li>
														</ul>
														<div id="tabsContent2" class="card-body tab-content p-3">
															<div class="tab-pane fade show active" id="tabs2-tab3"
																role="tabpanel">
																<div class="row">
																	<div class="col">
																		<div class="collapse multi-collapse"
								                                             id="multiCollapseExample2">
								                                             
								                                             <div id="content2"></div>
								                                                 
								                                          </div>
																	</div>
																	<table class="table bg-white text-dark center ass2 table-striped">
						                                                <thead class="text-white table-bordered tap">
						                                                	<tr class="text-white table-bordered tap">
						                                               		 <th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
						                                           			 <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
						                                               		 <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처명</th>
						                                                     <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2">구매수량</th> -->
						                                                     <th class="font-weight-semi-bold border-top-0 py-3 con2">창고명</th>
						                                                     <th class="font-weight-semi-bold border-top-0 py-3 con2">담당자명</th>
						                                                     <th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
						                                                     <th class="font-weight-semi-bold border-top-0 py-3 con2">승인일</th>
						                                                     <th class="font-weight-semi-bold border-top-0 py-3 con2">승인상태</th>
						                                                   </tr>
						                                                </thead>
						                                                <tbody>
						                                                	<c:forEach var="list" items="${SIlist2}"> <!-- var="개별값(작은바구니)" items="집합(큰바구니)" -->
							                                                   <tr>
																					<td class="py-3"><a class="text-dark con2" data-toggle="collapse" style="font-size:22px"
																					href="#multiCollapseExample2" role="button"
																					aria-expanded="false"
																					aria-controls="multiCollapseExample2"
																					onclick="content2(${list.logs_code})">${list.logs_code}</a></td>	    
							                                                      <td class="py-3 middle" style="vertical-align:middle">${list.product.pro_name}</td>
							                                                      <td class="py-3 middle" style="vertical-align:middle">${list.company.com_name}</td>
							                                                      <%-- <td class="py-3 middle" style="vertical-align:middle">${list.logs_quantity}</td> --%>
							                                                      <td class="py-3 middle" style="vertical-align:middle">${list.warehouse.ware_name}</td>
							                                                      <td class="py-3 middle" style="vertical-align:middle">${list.employee.emp_name}</td>
							                                                      <td class="py-3 middle" style="vertical-align:middle">
							                                                      		<fmt:formatDate value="${list.logs_reg_date}" pattern="yyyy-MM-dd" />
							                                                      </td>
							                                                      <td class="py-3">
							                                                      		<fmt:formatDate value="${list.logs_update_date}" pattern="yyyy-MM-dd" />
							                                                      </td>
							                                                      <td class="py-3 middle" style="vertical-align:middle">승인완료</td>
							                                                   </tr>
						                                                   </c:forEach>
						                                                </tbody>
						                                             </table>
																</div>
															</div>
															<div class="tab-pane fade" id="tabs2-tab4"
																role="tabpanel">
																<div class="row">
																	<div class="col">
																		<div class="collapse multi-collapse"
							                                             id="multiCollapseExample1">
							                                             
							                                             <div id="content1"></div>
							                                                 
							                                             </div>
																	</div>
																	<table class="table bg-white text-dark center ass2 table-striped">
						                                             <thead class="text-white table-bordered tap">
						                                                <tr class="text-white table-bordered tap">
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">거래처명</th>
						                                                   <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2">구매수량</th> -->
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">창고명</th>
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">담당자명</th>
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
						                                                   <th class="font-weight-semi-bold border-top-0 py-3 con2">승인상태</th>
						                                                   <!-- <th class="font-weight-semi-bold border-top-0 py-3 con2"></th> -->
						                                                </tr>
						                                             </thead>
						                                             <tbody>
						                                             	<c:forEach var="list" items="${SIlist1}"> <!-- var="개별값(작은바구니)" items="집합(큰바구니)" -->
						                                                <tr>
						                                                   <td class="py-3"><a class="text-dark con2" data-toggle="collapse" style="font-size:22px"
																				href="#multiCollapseExample1" role="button"
																				aria-expanded="false"
																				aria-controls="multiCollapseExample1"
																				onclick="content1(${list.logs_code})">${list.logs_code}</a></td>
						                                                   <td class="py-3 middle" style="vertical-align:middle">${list.product.pro_name}</td>
						                                                   <td class="py-3 middle" style="vertical-align:middle">${list.company.com_name}</td>
						                                                   <%-- <td class="py-3 middle" style="vertical-align:middle">${list.logs_quantity}</td> --%>
						                                                   <td class="py-3 middle" style="vertical-align:middle">${list.warehouse.ware_name}</td>
						                                                   <td class="py-3 middle" style="vertical-align:middle">${list.employee.emp_name}</td>
						                                                   <td class="py-3 middle" style="vertical-align:middle">
						                                                   		<fmt:formatDate value="${list.logs_reg_date}" pattern="yyyy-MM-dd" />
						                                                   		
						                                                   </td>
						                                                   <td class="py-3 middle" style="vertical-align:middle">대기중</td>
						                                                </tr>
						                                                </c:forEach>
						                                             </tbody>
						                                          </table>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
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
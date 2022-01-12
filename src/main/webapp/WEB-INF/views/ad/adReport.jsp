<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../setting.jsp"%>
<head>
<!-- Title -->
<title>Users | Graindashboard UI Kit</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Favicon -->
<link rel="shortcut icon" href="${project}img/favicon.ico">
<link rel="stylesheet" href="${project}css/board.css">
<!-- Template -->
<link rel="stylesheet" href="${project}css/graindashboard.css">
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">

	<%@ include file="../common/header.jsp"%>
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
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->		<ul id="zxc" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->			<li class="side-nav-menu-item">
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
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu side-nav-opened">
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
<!-- b -->		<ul id="subUsers" class="side-nav-menu side-nav-menu-second-level mb-0"style="display:block;">
<!-- a -->			<li class="side-nav-menu-item ">
						<a class="side-nav-menu-link ass2" href="${path}/adBasicReg">기초 등록</a>
					</li>
<!-- a -->			<li class="side-nav-menu-item active">
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
								<li class="breadcrumb-item"><a href="#">회계 관리</a></li>
								<li class="breadcrumb-item active" aria-current="page">회계보고서</li>
							</ol>
						</nav>
						<div class="row">
							<div class="col-xl-12">
								<div id="example" class="mb-9">
									<h4 class="h1 text-dark">
										<b>회계 보고서</b> <a class="anchorjs-link" href="#example"
											aria-label="Anchor" data-anchorjs-icon="#"></a>
									</h4>
									
									<div class="mb-3">
										<!-- Nav Classic -->
										<ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark"
											id="pills-tab-1" role="tablist">
											<li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
												class="nav-link d-flex align-items-center py-2 px-3 active"
												id="pills-result-tab-1" data-toggle="pill"
												href="#pills-result-1" role="tab"
												aria-controls="pills-result-1" aria-selected="true"
												>재무상태표</a>
											</li>
											<li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
												class="nav-link d-flex align-items-center py-2 px-3"
												id="pills-html-tab-1" data-toggle="pill"
												href="#pills-html-1" role="tab" aria-controls="pills-html-1"
												aria-selected="false">손익계산서</a>
											</li>
											<li class="nav-item border-bottom border-xl-bottom-0  asss bg-light  ">
					                           <a class="nav-link d-flex align-items-center py-2 px-3"
					                                 id="pills-html-tab-2" data-toggle="pill"
					                                 href="#pills-html-2" role="tab" aria-controls="pills-html-2"
					                                 aria-selected="false">기대 수익률</a>
                           					</li>	
										</ul>
										<!-- End Nav Classic -->

										<!-- Tab Content -->
										
										<div class="tab-content bg-lighter border " id="pills-tabContent-1">
											<div class="tab-pane fade p-4 show active"
												id="pills-result-1" role="tabpanel"
												aria-labelledby="pills-result-tab-1">
												제 1기 2021.03.31 현재<br> <br>
												<div class="bg-white">
												<table class="table table-bordered bg-white text-dark ass2 center">
													<thead class="text-white table-bordered tap">
														<tr>
															<th class="font-weight-semi-bold border-top-0 py-3">과목</th>
															<th class="font-weight-semi-bold border-top-0 py-3"
																colspan="2">금액</th>
															<th class="font-weight-semi-bold border-top-0 py-3">과목</th>
															<th class="font-weight-semi-bold border-top-0 py-3"
																colspan="2">금액</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="py-3"><b>보통예금</b></td>
															<td class="py-3"></td>
															<td class="py-3">10,000,000</td>
															<td class="py-3"><b>외상매입금</b></td>
															<td class="py-3"></td>
															<td class="py-3">
																<c:if test="${get4 != 0}">	
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${get4}" />
																</c:if>
															</td>
														</tr>
														<tr>
															<td class="py-3"><b>외상매출금</b></td>
															<td class="py-3"></td>
															<td class="py-3">
															<c:if test="${get2 != 0}">	
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${get2}" />
															</c:if>
															</td>
															<td class="py-3"><b>지급어음</b></td>
															<td class="py-3"></td>
															<td class="py-3"></td>
														</tr>
														<tr>
															<td class="py-3"><b>받을어음</b></td>
															<td class="py-3"></td>
															<td class="py-3"></td>
															<td class="py-3"><b>미지급금</b></td>
															<td class="py-3"></td>
															<td class="py-3"></td>
														</tr>
														<tr>
															<td class="py-3"><b>미수금</b></td>
															<td class="py-3"></td>
															<td class="py-3"></td>
															<td class="py-3"><b>예수금</b></td>
															<td class="py-3"></td>
															<td class="py-3"></td>
														</tr>
														<tr>
															<td class="py-3"><b>상품</b></td>
															<td class="py-3"></td>
															<td class="py-3">
																<c:if test="${get1 != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${get1}" />
																</c:if>
															</td>	
															<td class="py-3"><b>자본금</b></td>
															<td class="py-3"></td>
															<td class="py-3"></td>
														</tr>
														<tr>
															<td class="py-3"><b>자산총계</b></td>
															<td class="py-3"></td>
															<td class="py-3">
																<c:if test="${get1 + get2 != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${100000000 + get1 + get2}" />
																</c:if>
															</td>
															<td class="py-3"><b>부채와 자본총계</b></td>
															<td class="py-3"></td>
															<td class="py-3">
															<c:if test="${get4 != 0}">	
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${get4}" />
															</c:if>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											</div>
											
											
											<div class="tab-pane fade p-4" id="pills-html-1"
												role="tabpanel" aria-labelledby="pills-html-tab-1">
												2021.03.31 ~ 2021.12.31(단위 : 천원) <br> <br>
												<div class="bg-white">
												<table class="table table-bordered bg-white text-dark ass2 center">
													<thead class="text-white table-bordered tap">
														<tr>
															<th class="font-weight-semi-bold border-top-0 py-3"
																colspan="2">과목</th>
															<th class="font-weight-semi-bold border-top-0 py-3">금액</th>
														</tr>
													</thead>
													<tbody>	
														<tr>
															<td class="py-3 asss" rowspan="5" style="vertical-align: middle"><b>영업손익</b></td>
															<td class="py-3"><b>매출액</b></td>
															<td class="py-3">
																<c:if test="${sum != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sum}" />
																</c:if>
															</td>
														</tr>
														<tr>
															
															<td class="py-3"><b>매출원가</b></td>
															<td class="py-3">
																<c:if test="${sum1 != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sum1}" />
																</c:if>
															</td>
															
														<tr>
															
															<td class="py-3"><b>매출총이익</b></td>
															<td class="py-3">
																<c:if test="${sum - sum1 != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sum - sum1}" />
																</c:if>
															</td>
														</tr>
														<tr>
															
															<td class="py-3"><b>판매비와 관리비</b></td>
															<td class="py-3">
																<c:if test="${sum2 != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sum2}" />
																</c:if>
																
															</td>
														</tr>
														<tr>
															
															<td class="py-3"><b>영업이익</b></td>
															<td class="py-3">
																<c:if test="${sum - sum1 - sum2 != 0}">
																	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sum - sum1 - sum2}" />
																</c:if>
															</td>
														</tr>
													</tbody>
												</table>
												</div>
											</div>
											<div class="tab-pane fade p-4" id="pills-html-2"
	                                    		role="tabpanel" aria-labelledby="pills-html-tab-2">
	                                    			기대기대기대기대기대
	                                		</div>
										</div>
										<!-- End Tab Content -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="../common/footer.jsp"%>
	<script src="${project}js/graindashboard.js"></script>
	<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
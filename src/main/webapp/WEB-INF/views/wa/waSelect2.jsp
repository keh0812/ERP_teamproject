<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../setting.jsp" %> 
<head>
    <!-- Title -->
    <title>Users | Graindashboard UI Kit</title>
    
    <script type="text/javascript">
    
    	// 김은희 - 출근 버튼 클릭시
	    function confirmLogin() {
			var id = '<%=(String) session.getAttribute("mem_id")%>';
		
			if( id == "null") {
				alert ("로그인 후 다시 시도하세요.");
			} else  {
				location.href='${path}/waStartClick';
			}
			
		}
    	
	 	// 김은희 - 퇴근 버튼 클릭시
	    function confirmEnd() {
			var id = '<%=(String) session.getAttribute("mem_id")%>';
		
			if( id == "null") {
				alert ("로그인 후 다시 시도하세요.");
			} else {
				location.href='${path}/waEndClick';
			}
			
		}
		
		
		// 김은희 - 야근 버튼 클릭시
	    function confirmNight() {
			var id = '<%=(String) session.getAttribute("mem_id")%>';
			var select = document.getElementById('cm_night_time');
			var nightTime = select.options[select.selectedIndex].value;
			if( id == "null") {
				alert ("로그인 후 다시 시도하세요.");
			} else if(nightTime == 0){
				alert("시간을 선택해주세요");
			}else {
				location.href='${path}/waNightClick?cm_night_time='+ nightTime;
				
			}
			
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
    
    <!-- Script -->
    <script src="${spath}hr.js"></script>
    
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
<!-- o -->	<li class="side-nav-menu-item side-nav-has-menu side-nav-opened">
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
<!-- b -->		<ul id="subPages" class="side-nav-menu side-nav-menu-second-level mb-0" style="display:block;">
<!-- a -->			<li class="side-nav-menu-item active">
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

  <!-- 근태 조회 시작 -->
    <div class="content">
			<div class="py-4 px-3 px-md-4">
				<div class="card">
					<div class="card-body">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">근태 관리</a></li>
								<li class="breadcrumb-item active" aria-current="page">조회</li>
							</ol>
						</nav>
						<div class="row">

							<div class="col-xl-12">

								<div id="example" class="mb-9">
									<h4 class="h1 text-dark"><b>
										조회</b><a class="anchorjs-link" href="#example"
											aria-label="Anchor" data-anchorjs-icon="#"></a>
									</h4>
									<div class="mb-3">
									
										<!-- Nav Classic -->
										<ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark" id="tabs-tab-3" role="tablist">
											<li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
											<a class="nav-link d-flex align-items-center py-2 px-3 active"
												id="pills-result-tab-1" data-toggle="pill"
												href="#pills-result-1" role="tab"
												aria-controls="pills-result-1" aria-selected="true">출퇴근</a>
											</li>
											<li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
											<a class="nav-link d-flex align-items-center py-2 px-3"
												id="pills-html-tab-1" data-toggle="pill"
												href="#pills-html-1" role="tab" aria-controls="pills-html-1"
												aria-selected="false">근태 조회</a>
											</li>
										</ul>
										<!-- End Nav Classic -->

										<!-- Tab Content -->
										<div class="tab-content bg-lighter" id="pills-tabContent-1">
											<div class="tab-pane fade p-4 show active"
												id="pills-result-1" role="tabpanel"
												aria-labelledby="pills-result-tab-1">
										 <form action="waNightClick?${_csrf.parameterName}=${_csrf.token}" method="post">
											  <div align="right">
			                                       <button type="button" onclick="confirmLogin()" class="btn btn-outline-info">출근</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                       <button type="button" onclick="confirmEnd()" class="btn btn-outline-info">퇴근</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                       <button type="button" onclick="confirmNight()" class="btn btn-outline-info">야근</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                <select name="cm_night_time" class="form-control" id="cm_night_time" style="width:250px; display:inline; vertical-align:middle">
					                                	<option value="0">야근시간을 선택하세요.</option>
					                                	<option value="1">PM 19:00 </option>
					                                    <option value="2">PM 20:00 </option>
					                                    <option value="3">PM 21:00 </option>
					                                    <option value="4">PM 22:00 </option>
					                                    <option value="5">PM 23:00 </option>
					                                    <option value="6">PM 24:00 </option>
					                                </select>
			                                      </div>
											  </form>
										  <br>		
										 <!-- 검색창 시작 -->		
									   	  <div class="input-group">
										    <div class="input-group-append">
										      <i class="gd-search icon-text icon-text-sm"></i>
										    </div>
										    <input class="form-control form-control-icon-text" placeholder="사원명/사번 검색" width="100px" type="text" style="font-size:20px">
										  </div>
										  <!-- 검색창 끝 -->		
										  <br>
											<table class="table table-striped bg-white text-dark center ass2">
											    <thead class="text-white table-bordered tap">
											      <tr>
											      	<th class="font-weight-semi-bold border-top-0 py-3 con2">일자</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">사번</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">사원명</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">출근시간</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">퇴근시간</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">야근시간</th>
											      </tr>
											    </thead>
											    <tbody style="vertical-align: middle">
											    <c:forEach var="vo" items="${list}">
											      <tr>
											      	<td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.cm_date}"/></td>
											      	<td class="py-3">${vo.employee.emp_code}</td>
											      	<td class="py-3">${vo.employee.emp_name}</td>
													<td class="py-3"><fmt:formatDate pattern="HH:mm" value="${vo.cm_start}"/></td>
											        <td class="py-3">
												        <c:if test="${vo.cm_night_time == 0}">
												        	<fmt:formatDate pattern="HH:mm" value="${vo.cm_end}"/>
												        </c:if>
											        </td>
											      <c:if test="${vo.cm_night_time == 1}">
											        <td class="py-3">19:00</td>
											      </c:if>
											      <c:if test="${vo.cm_night_time == 2}">
											        <td class="py-3">20:00</td>
											      </c:if>
											      <c:if test="${vo.cm_night_time == 3}">
											        <td class="py-3">21:00</td>
											      </c:if>
											      <c:if test="${vo.cm_night_time == 4}">
											        <td class="py-3">22:00</td>
											      </c:if>
											      <c:if test="${vo.cm_night_time == 5}">
											        <td class="py-3">23:00</td>
											      </c:if>
											      <c:if test="${vo.cm_night_time == 6}">
											        <td class="py-3">24:00</td>
											      </c:if>
											      <c:if test="${vo.cm_night_time == 0}">
											        <td class="py-3"></td>
											      </c:if>
											      </tr>
											      </c:forEach>
											    </tbody>
											  </table>
											</div>

											<div class="tab-pane fade p-4" id="pills-html-1"
												role="tabpanel" aria-labelledby="pills-html-tab-1">
										  <form>
										 <!-- 검색창 시작 -->		
									   	  <div class="input-group">
										    <div class="input-group-append">
										      <i class="gd-search icon-text icon-text-sm"></i>
										    </div>
										    <input class="form-control form-control-icon-text" placeholder="사원명/사번 검색" type="text" style="font-size:20px">
										  </div>
										  <!-- 검색창 끝 -->		
										  <br>
										  
											<table class="table table-striped bg-white text-dark center ass2">
											    <thead class="text-white table-bordered tap">
											      <tr>
											      	<th class="font-weight-semi-bold border-top-0 py-3 con2">신청일</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">사번</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">사원명</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">부서명</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">근태 유형</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">사유</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">시작일</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">종료일</th>
											        <th class="font-weight-semi-bold border-top-0 py-3 con2">처리상태</th>
											      </tr>
											    </thead>
											    <tbody>
											     <c:forEach var="vo" items="${list2}">
											      <tr>
											      	<td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wr_ap_date}"/></td>
											      	<td class="py-3">${vo.employee.emp_code}</td>
											      	<td class="py-3">${vo.employee.emp_name}</td>
													<td class="py-3">${vo.department.dep_name}</td>
													<td class="py-3">${vo.hrCode.hr_code_name}</td>
													<td class="py-3">${vo.wr_va_reason}</td>
											        <td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wr_va_start}"/></td>
											        <td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wr_va_end}"/></td>
											       <c:if test="${vo.wr_state == 1}">
			                                       	 <td class="py-3">완료</td>
			                                       </c:if>
			                                       	<c:if test="${vo.wr_state == 0}">
			                                       	 <td class="py-3">미완료</td>
			                                       </c:if>
											      </tr>
											      </c:forEach>
											    </tbody>
											  </table>
											 
												<br>
											</form>
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
	</div>
	<!-- 부서 관리 끝-->
</main>

<%@ include file = "../common/footer.jsp" %> 
<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="./setting.jsp"%>
<head>
<!-- Title -->
<title>UsERP</title>

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

<!-- 파이썬 css -->
<link rel="stylesheet" href="${path}/resources/weather.css">

<body class="has-sidebar has-fixed-sidebar-and-header">
<jsp:include page="./common/header.jsp"/>
	<main class="main">
		<!-- Start Sidebar Nav -->
		<aside id="sidebar" class="js-custom-scroll side-nav">
			<ul id="sideNav" class="side-nav-menu side-nav-menu-top-level mb-0">
				<!-- 대메뉴 : 인사 관리 -->
				<!-- o -->
				<li class="side-nav-menu-item side-nav-has-menu"><a
					class="side-nav-menu-link media align-items-center" href="#"
					data-target="#gg"> <span class="side-nav-menu-icon d-flex mr-3">
							<i class="gd-themify-favicon"></i>
					</span> <span class="side-nav-fadeout-on-closed media-body asss">인사
							관리</span> <span class="side-nav-control-icon d-flex"> <i
							class="gd-angle-right side-nav-fadeout-on-closed"></i>
					</span> <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
				</a> <!-- 중메뉴 : 인사 관리 --> <!-- b -->
					<ul id="gg" class="side-nav-menu side-nav-menu-second-level mb-0">
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/hrBasicReg">기초
								등록</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/hrAppointment">인사
								발령</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/hrCard">인사 카드</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/hrSalary">급여</a></li>
					</ul></li>
				<!-- 인사 관리 종료 -->

				<!-- 대메뉴 : 근태 관리 -->
				<!-- o -->
				<li class="side-nav-menu-item side-nav-has-menu"><a
					class="side-nav-menu-link media align-items-center" href="#"
					data-target="#subPages"> <span
						class="side-nav-menu-icon d-flex mr-3"> <i class="gd-timer"></i>
					</span> <span class="side-nav-fadeout-on-closed media-body asss">근태
							관리</span> <span class="side-nav-control-icon d-flex"> <i
							class="gd-angle-right side-nav-fadeout-on-closed"></i>
					</span> <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
				</a> <!-- 중메뉴 : 근태 관리 --> <!-- b -->
					<ul id="subPages"
						class="side-nav-menu side-nav-menu-second-level mb-0">
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/waSelect">조회</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/waApplication">신청</a>
						</li>
						<li class="side-nav-menu-item "><a
							class="side-nav-menu-link ass2" href="${path}/waConfirm">승인</a>
						</li>
					</ul>
				</li>
				<!-- 근태 관리 종료 -->

				<!-- 대메뉴 : 판매 관리 -->
				<!-- o -->
				<li class="side-nav-menu-item side-nav-has-menu"><a
					class="side-nav-menu-link media align-items-center" href="#"
					data-target="#subComponents"> <span
						class="side-nav-menu-icon d-flex mr-3"> <i class="gd-money"></i>
					</span> <span class="side-nav-fadeout-on-closed media-body asss">판매
							관리</span> <span class="side-nav-control-icon d-flex"> <i
							class="gd-angle-right side-nav-fadeout-on-closed"></i>
					</span> <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
				</a> <!-- 중메뉴 : 판매 관리 --> <!-- b -->
					<ul id="subComponents"
						class="side-nav-menu side-nav-menu-second-level mb-0">
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/stBasicReg">기초
								등록</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/stInvenStatus">재고
								현황</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/stStatus">판매 현황</a>
						</li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/stRelStatus">출고
								현황</a></li>
					</ul></li>
				<!-- 판매 관리 종료 -->

				<!-- 대메뉴 : 구매 관리 -->
				<!-- o -->
				<li class="side-nav-menu-item side-nav-has-menu"><a
					class="side-nav-menu-link media align-items-center" href="#"
					data-target="#asd"> <span
						class="side-nav-menu-icon d-flex mr-3"> <i
							class="gd-shopping-cart"></i>
					</span> <span class="side-nav-fadeout-on-closed media-body asss">구매
							관리</span> <span class="side-nav-control-icon d-flex"> <i
							class="gd-angle-right side-nav-fadeout-on-closed"></i>
					</span> <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
				</a> <!-- 중메뉴 : 구매 관리 --> <!-- b -->
					<ul id="asd" class="side-nav-menu side-nav-menu-second-level mb-0">
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/pdBasicReg">기초
								등록</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/pdInvenStatus">재고
								현황</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/pdStatus">구매 현황</a>
						</li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/pdRecStatus">입고
								현황</a></li>
					</ul></li>
				<!-- 구매 관리 종료 -->

				<!-- 대메뉴 : 물류 관리 -->
				<!-- o -->
				<li class="side-nav-menu-item side-nav-has-menu"><a
					class="side-nav-menu-link media align-items-center" href="#"
					data-target="#zxc"> <span
						class="side-nav-menu-icon d-flex mr-3"> <i class="gd-truck"></i>
					</span> <span class="side-nav-fadeout-on-closed media-body asss">물류
							관리</span> <span class="side-nav-control-icon d-flex"> <i
							class="gd-angle-right side-nav-fadeout-on-closed"></i>
					</span> <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
				</a> <!-- 중메뉴 : 물류 관리 --> <!-- b -->
					<ul id="zxc" class="side-nav-menu side-nav-menu-second-level mb-0">
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/ldBasicReg">기초
								등록</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2"
							href="${path}/ldStatementManagement">전표 관리</a></li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/ldInventoryControl">재고
								관리</a></li>
					</ul></li>
				<!-- 물류 관리 종료 -->

				<!-- 대메뉴 : 회계 관리 -->
				<!-- o -->
				<li class="side-nav-menu-item side-nav-has-menu"><a
					class="side-nav-menu-link media align-items-center" href="#"
					data-target="#subUsers"> <span
						class="side-nav-menu-icon d-flex mr-3"> <i
							class="gd-infinite"></i>
					</span> <span class="side-nav-fadeout-on-closed media-body asss">회계
							관리</span> <span class="side-nav-control-icon d-flex"> <i
							class="gd-angle-right side-nav-fadeout-on-closed"></i>
					</span> <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
				</a> <!-- 중메뉴 : 회계 관리 --> <!-- b -->
					<ul id="subUsers"
						class="side-nav-menu side-nav-menu-second-level mb-0">
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/adBasicReg">기초
								등록</a></li>
						<!-- a -->
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2" href="${path}/adReport">회계보고서</a>
						</li>
						<li class="side-nav-menu-item"><a
							class="side-nav-menu-link ass2"
							href="${path}/adStatementManagement">전표 관리</a></li>
					</ul></li>
				<!-- 회계 관리 종료 -->

			</ul>
		</aside>
		<!-- End Sidebar Nav -->

		<div class="content">
			<c:if test="${msg != null}">
				<script type="text/javascript">
		       		alert("${msg}");
		        </script>
			</c:if>

			<div class="py-4 px-3 px-md-4">
				<div class="card mb-3 mb-md-4">

					<div class="container-fluid pb-5">

						<div class="row justify-content-md-center">
							<div class="card-wrapper col-12 col-md-4 mt-5">
								<div class="card">
									<div class="card-body">
										<c:if test="${sessionScope.mem_id == null}">
											<h4 class="card-title">로그인</h4>

											<form action="main" method="post" name="mainform"
												onsubmit="return mainCheck();">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}">
												<div class="form-group">
													<label for="emp_code">사원번호</label> <input id="emp_code"
														type="text" class="form-control" name="emp_code">
												</div>

												<div class="form-group">
													<label for="emp_pwd">비밀번호</label> <input id="emp_pwd"
														type="password" class="form-control" name="emp_pwd">
												</div>
												<br>
												<div class="form-group no-margin">
													<input class="btn btn-primary btn-block" type="submit"
														value="로그인">
												</div>
												<div class="text-center mt-3 small">
													사원 인증하셨나요?&nbsp;&nbsp;&nbsp;<a href="${path}/signin">사원인증</a>
												</div>
											</form>
										</c:if>
										<c:if test="${sessionScope.mem_id != null}">
                          	 				<center>
                           						<strong><span class="h4">${sessionScope.mem_name}</span></strong>님 환영합니다.
                           					</center><br>
                      						
                      						<!-- 김은희 - 파이썬 날씨 정보 위젯 -->
		                                   	<center>
		                                   		<div style="width:410px; height:300px; ">
													${weatherWidget}
												</div>
	                        				</center>
                        				</c:if>
									</div>
								</div>
								
								<footer class="footer mt-3">
									<div class="container-fluid">
										<div class="footer-content text-center small center">
											<span class="text-muted">&copy; 2021. Team UsERP. all
												rights reserved.</span>
										</div>
									</div>
								</footer>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</main>

	<%@ include file="./common/footer.jsp"%>
	<script src="${project}js/graindashboard.js"></script>
	<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
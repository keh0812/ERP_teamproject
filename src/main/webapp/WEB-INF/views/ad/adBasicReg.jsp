<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../setting.jsp" %> 
<head>
    <!-- Title -->
    <title>Users | Graindashboard UI Kit</title>
<script type="text/javascript">
function bankadd() {
   $.ajax({
      // sendRequest(콜백함수명, url, method, params)
      url: "bankadd", // 전송 페이지 => 컨트롤러 "basic_next"
      type: 'GET', // 전송방식('GET', 'POST') - method
      dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
      success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
         $('#bank').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}

function banklist() {
	$.ajax({
      // sendRequest(콜백함수명, url, method, params)
      url: "banklist", // 전송 페이지 => 컨트롤러 "basic_next"
      type: 'GET', // 전송방식('GET', 'POST') - method
      dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
      success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
         $('#banklist').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}

function accountadd() {
   $.ajax({
      // sendRequest(콜백함수명, url, method, params)
      url: "accountadd", // 전송 페이지 => 컨트롤러 "basic_next"
      type: 'GET', // 전송방식('GET', 'POST') - method
      dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
      success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
         $('#account').html(data);
      },
      error: function(){
         alert('오류');
      }
   });
}
function accountlist() {
	$.ajax({
      // sendRequest(콜백함수명, url, method, params)
      url: "accountlist", // 전송 페이지 => 컨트롤러 "basic_next"
      type: 'GET', // 전송방식('GET', 'POST') - method
      dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
      success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
         $('#accountlist').html(data);
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

<body class="has-sidebar has-fixed-sidebar-and-header" onload="banklist()">

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
						<a class="side-nav-menu-link ass2 href="${path}/pdStatus">구매 현황</a>
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
<!-- b -->		<ul id="subUsers" class="side-nav-menu side-nav-menu-second-level mb-0" style="display:block;">
					<li class="side-nav-menu-item active">
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

   <!-- 기초 등록 시작 -->
      <div class="content">
         <div class="py-4 px-3 px-md-4">
            <div class="card">
               <div class="card-body">
                  <nav aria-label="breadcrumb">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">회계 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">기초 등록</li>
                     </ol>
                  </nav>
                  <div class="row">

                     <div class="col-xl-12">

                        <div id="example" class="mb-9">
                           <h4 class="h1 text-dark"><b>
                              기초 등록 </b><a class="anchorjs-link" href="#example"
                                 aria-label="Anchor" data-anchorjs-icon="#"></a></h4>
                                 
                           <div class="mb-3">
                           
                              <!-- Nav Classic -->
                                    <ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark" id="tabs-tab-3" role="tablist">
                                        <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light  ">
                                            <a class="nav-link d-flex align-items-center py-2 px-3 active  " id="tabs-result-tab-3" data-toggle="pill" href="#tabs-result-3" onclick="banklist()" role="tab" aria-controls="tabs-result-3" aria-selected="true">계좌 관리</a>
                                        </li>
                                        <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
                                            <a class="nav-link d-flex align-items-center py-2 px-3 " id="tabs-html-tab-3" data-toggle="pill" href="#tabs-html-3" onclick="accountlist()" role="tab" aria-controls="tabs-html-3" aria-selected="false">계정 관리</a>
                                        </li>
                                    </ul>
                                    <!-- End Nav Classic -->

                                    <!-- Tab Content -->
                                    <div class="tab-content bg-lighter" id="tabs-tabContent-3">
                                        <div class="tab-pane fade show active" id="tabs-result-3" role="tabpanel" aria-labelledby="tabs-result-tab-3">
                                            <div class="px-3 p-4">
                                                <ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-2" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link px-2 pb-2 active ass2" href="#tabs2-tab1" onclick="banklist()" role="tab" aria-selected="true"
                                                           data-toggle="tab">계좌 목록
                                                        </a>
                                                    </li>
                                                    <li class="nav-item ml-4">
                                                        <a class="nav-link px-2 pb-2 ass2" href="#tabs2-tab2" onclick="bankadd()" role="tab" aria-selected="false"
                                                           data-toggle="tab">계좌 등록
                                                        </a>
                                                    </li>
                                                </ul> 
                                         <div id="tabsContent2" class="card-body tab-content p-3">
                                            <!-- 탭 1 -->
                                           <div class="tab-pane fade show active" id="tabs2-tab1" role="tabpanel">
                                           
                                       			<div id="banklist"></div>
                                         
                                      
                                    </div>
                                    <!-- 탭1 -->
                                    
                                    <!-- 탭2 -->
                                    <div class="tab-pane fade" id="tabs2-tab2" role="tabpanel">
                                       <div id="bank"></div>
                                 </div>
                                  <!-- 탭2 -->
                                  <!-- 탭4 -->
                                    <div class="tab-pane fade" id="tabs2-tab4" role="tabpanel">
                                       <div id="code"></div>
                                  </div>
                                  <!-- 탭4 -->
                                  
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="tab-pane fade" id="tabs-html-3" role="tabpanel" aria-labelledby="tabs-html-tab-3">
                                            <div class="px-3 p-4">
                                                <ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-2" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link px-2 pb-2 active ass2" href="#tabs3-tab3" onclick="accountlist()" role="tab" aria-selected="true"
                                                           data-toggle="tab">계정 목록
                                                        </a>
                                                    </li>
                                                    <li class="nav-item ml-4">
                                                        <a class="nav-link px-2 pb-2 ass2" href="#tabs3-tab4" onclick="accountadd()" role="tab" aria-selected="false"
                                                           data-toggle="tab">계정 등록
                                                        </a>
                                                    </li>
                                                </ul>
                                                
                                         <div id="tabsContent2" class="card-body tab-content p-3">
                                           <!-- 탭 1 -->
                                           <div class="tab-pane fade show active" id="tabs3-tab3" role="tabpanel">
                                            <div class="bg-white">
                                       		
                                       			<div id="accountlist"></div>
                                       		
                                       		</div>
                                    	   </div>
                                    <!-- 탭1 -->
                                      
                                      
                                      <!-- 탭 1 -->
                                           <div class="tab-pane fade" id="tabs3-tab4" role="tabpanel">
                                            
                                             <div id="account"></div>
                              
                                       </div>
                                    </div>
                                    <!-- 탭1 -->
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

   </main>

   <%@ include file="../common/footer.jsp"%>
   <script src="${project}js/graindashboard.js"></script>
   <script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
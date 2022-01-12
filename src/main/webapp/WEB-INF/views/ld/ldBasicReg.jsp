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
    <script src="${project}js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    
    /* 거래처 검색 JQuery */
    $(function() {
    	$('#compKeyword').keyup(function() {
    		var compKeyword = $('#compKeyword').val();
    		
    		if(compKeyword.length == 0) {
    			$('#compList').css("visibility", "visible");
    		} else {
    			$('#compList').css("visibility", "visible");
    			
    			$.ajax({
    				url: 'compSearchList?${_csrf.parameterName}=${_csrf.token}',
    				type: 'POST',
    				data: 'compKeyword=' + compKeyword,
    				success: function(result) {
    					$('#compList').html(result);
    				},
    				error: function() {
    					alert('오류');
    				}
    			});
    		}
    	});
    });
    
    /* 거래처 목록 */
    function compSearchList() {
    	$.ajax({
    		url: "compSearchList?${_csrf.parameterName}=${_csrf.token}&compKeyword=${compKeyword}",
    		type: 'GET',
    		dataType: 'text',
    		success: function(result) {
    			$('#compList').html(result);
    		},
    		error: function() {
    			alert('오류');
    		}
    		
    	});
    }
    
    /* 상품 검색 JQuery */
    $(function() {
    	$('#proKeyword').keyup(function() {
    		var proKeyword = $('#proKeyword').val();
    		
    		if(compKeyword.length == 0) {
    			$('#proList').css("visibility", "visible");
    		} else {
    			$('#proList').css("visibility", "visible");
    			
    			$.ajax({
    				url: 'proSearchList?${_csrf.parameterName}=${_csrf.token}',
    				type: 'POST',
    				data: 'proKeyword=' + proKeyword,
    				success: function(result) {
    					$('#proList').html(result);
    				},
    				error: function() {
    					alert('오류');
    				}
    				
    			});
    		}
    	});
    });
   
    /* 상품 목록 */
    function proSearchList() {
    	
    	$.ajax({
    		url: "proSearchList?${_csrf.parameterName}=${_csrf.token}&proKeyword=${proKeyword}",
    		type: 'GET',
    		dataType: 'text',
    		success: function(result) {
    			$('#proList').html(result);
    		},
    		error: function() {
    			alert('오류');
    		}
    		
    	});
    } 
    
    /* 창고 목록 */
    function logWarehouseList() {
   		$.ajax({
	        // sendRequest(콜백함수명, url, method, params)
	        url: "logWarehouseList", // 전송 페이지 => 컨트롤러 "basic_next"
	        type: 'GET', // 전송방식('GET', 'POST') - method
	        dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
	        success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
	           $('#logWarehouseList').html(data);
	        },
	        error: function(){
	           alert('오류');
	        }
	     });
   	}
    
    /* 창고 등록 React */
    function warehouseadd() {
    	$.ajax({
          // sendRequest(콜백함수명, url, method, params)
          url: "warehouseadd", // 전송 페이지 => 컨트롤러 "basic_next"
          type: 'GET', // 전송방식('GET', 'POST') - method
          dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
          success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
             $('#warehouse').html(data);
          },
          error: function(){
             alert('오류');
          }
       });
    }
    </script>
</head>

<body class="has-sidebar has-fixed-sidebar-and-header" onload="compSearchList()">

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
<!-- a -->			<li class="side-nav-menu-item active">
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



    <div class="content">
         <div class="py-4 px-3 px-md-4">
            <div class="card">
               <div class="card-body">
                  <nav aria-label="breadcrumb">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">물류 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">기초
                           등록</li>
                     </ol>
                  </nav>
                  <div class="row">

                     <div class="col-xl-12">

                        <div id="example" class="mb-9">
                           <h4 class="h1 text-dark"><b>
                              기초 등록 </b><a class="anchorjs-link" href="#example"
                                 aria-label="Anchor" data-anchorjs-icon="#"></a>
                           </h4>
                           <div class="mb-3">
                              <!-- Nav Classic -->
                              <ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark"
                                 id="pills-tab-1" role="tablist">
                                 <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light " ><a
                                    class="nav-link d-flex align-items-center py-2 px-3 active"
                                    id="pills-result-tab-1" data-toggle="pill"
                                    href="#pills-result-1" onclick="compSearchList()" role="tab"
                                    aria-controls="pills-result-1" aria-selected="true"> 거래처
                                       조회</a></li>
                                 <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light"><a
                                    class="nav-link d-flex align-items-center py-2 px-3"
                                    id="pills-html-tab-1" data-toggle="pill"
                                    href="#pills-html-1" onclick="proSearchList()" role="tab" aria-controls="pills-html-1"
                                    aria-selected="false">상품 조회 </a></li>
                                    
                                 <li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
                                   class="nav-link d-flex align-items-center py-2 px-3"
                                   id="pills-html-tab-2" data-toggle="pill"
                                   href="#pills-html-2" role="tab" role="tab" onclick="logWarehouseList()" aria-controls="pills-html-2"
                                   aria-selected="false">창고 관리</a></li>
                              </ul>
                              <!-- End Nav Classic -->

                              <!-- Tab Content -->
                              <div class="tab-content bg-lighter " id="pills-tabContent-1">
                                 <div class="tab-pane fade p-4 show active"
                                    id="pills-result-1" role="tabpanel"
                                    aria-labelledby="pills-result-tab-1">
                                    
                                    <!-- 검색창 시작 -->
                                        <div class="input-group">
                                           <div class="input-group-append">
                                            <i class="gd-search icon-text icon-text-sm" ></i>
                                             </div>
                                             <input class="form-control form-control-icon-text" id="compKeyword" name="compKeyword" placeholder="거래처코드/거래처명 검색" type="text" style="font-size:20px">
                                        </div>
                                        <br>
                                    <!-- 검색창 끝 --> 
                                            
                                    <div id="compList"></div>
                                    
                                 </div>

                                 <div class="tab-pane fade p-4" id="pills-html-1"
                                    role="tabpanel" aria-labelledby="pills-html-tab-1">
                                    
                                    <!-- 검색창 시작 -->
                                        <div class="input-group">
                                           <div class="input-group-append">
                                            <i class="gd-search icon-text icon-text-sm"></i>
                                             </div>
                                             <input class="form-control form-control-icon-text" id="proKeyword" name="proKeyword" placeholder="상품코드/상품명 검색" type="text" style="font-size:20px">
                                        </div>
                                        <br>
                                    <!-- 검색창 끝 -->
                                            
                                            <div id="proList"></div>
                                            
                                 </div>
                                 
                                 <div class="tab-pane fade p-4" id="pills-html-2"
                                    role="tabpanel" aria-labelledby="pills-html-tab-2">
                                    <div class="px-3">
                                       <ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-3"
                                             role="tablist">
                                             <li class="nav-item"><a
                                                class="nav-link px-2 pb-2 active ass2" href="#tabs2-tab3"
                                                role="tab" aria-selected="true" onclick="logWarehouseList()" data-toggle="tab">창고 목록</a></li>
                                             <li class="nav-item ml-4"><a
                                                class="nav-link px-2 pb-2 ass2" onclick="warehouseadd()" href="#tabs2-tab4" role="tab"
                                                aria-selected="false" data-toggle="tab">창고 등록</a></li>
                                           </ul>
                                 <div id="tabsContent2" class="card-body tab-content p-0">
                                 <div class="tab-pane fade show active" id="tabs2-tab3"
                                                 role="tabpanel">
                                      <div id="logWarehouseList"></div>
                                    </div>
                                       <!-- 신규 등록 -->
                                       <div class="tab-pane fade" id="tabs2-tab4"
                                          role="tabpanel">
                                          <div id="warehouse"></div>
                                       </div>
                                       <!-- 신규 등록 끝-->
                                                 
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
         </div>
         
      </div>
    
</main>

<%@ include file = "../common/footer.jsp" %> 
<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
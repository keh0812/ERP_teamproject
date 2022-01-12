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
	<script src="${project}js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	
	/* 재고현황 검색 JQuery */
    $(function() {
    	$('#ssKeyword').keyup(function() {
    		var ssKeyword = $('#ssKeyword').val();
    		
    		if(ssKeyword.length == 0) {
    			$('#ldInvenStatus').css("visibility", "visible");
    		} else {
    			$('#ldInvenStatus').css("visibility", "visible");
    			
    			$.ajax({
    				url: 'logInvenStatus?${_csrf.parameterName}=${_csrf.token}',
    				type: 'POST',
    				data: 'ssKeyword=' + ssKeyword,
    				success: function(result) {
    					$('#ldInvenStatus').html(result);
    				},
    				error: function() {
    					alert('오류');
    				}
    				
    			});
    		}
    	});
    });
	
	/* 재고현황 AJAX */
	function logInvenStatus() {
    	$.ajax({
          // sendRequest(콜백함수명, url, method, params)
          url: "logInvenStatus?${_csrf.parameterName}=${_csrf.token}&ssKeyword=${ssKeyword}", // 전송 페이지 => 컨트롤러 "basic_next"
          type: 'GET', // 전송방식('GET', 'POST') - method
          dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
          success: function(result){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
             $('#ldInvenStatus').html(result);
          },
          error: function(){
             alert('오류');
          }
       });
    }
	
	/* 출고 승인 상세페이지 */
	function logMoveDetail(code) {
		
		var param = "&${_csrf.parameterName}=${_csrf.token}&logs_code=" + code;
		
	   $.ajax({
	      type:"POST",
		  data:param,
		  url:'logMovehouseDetail',
	      success: function(data){ 
	         $('#moveDetail').html(data);
	      },
	      error: function(){
	         alert('오류');
	      }
	   });
	}
	
	/* 재고조정 AJAX */
	function logInvenAdjustment() {
    	$.ajax({
          // sendRequest(콜백함수명, url, method, params)
          url: "logInvenAdjustment", // 전송 페이지 => 컨트롤러 "basic_next"
          type: 'GET', // 전송방식('GET', 'POST') - method
          dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
          success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
             $('#logInvenAdjustment').html(data);
          },
          error: function(){
             alert('오류');
          }
       });
    }
	
	/* 재고수불부 AJAX */
	function logInvenSupply() {
    	$.ajax({
          // sendRequest(콜백함수명, url, method, params)
          url: "logInvenSupply", // 전송 페이지 => 컨트롤러 "basic_next"
          type: 'GET', // 전송방식('GET', 'POST') - method
          dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
          success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
             $('#logInvenSupply').html(data);
          },
          error: function(){
             alert('오류');
          }
       });
    }
	</script>


    <!-- Favicon -->
    <link rel="shortcut icon" href="${project}img/favicon.ico">
   <link rel="stylesheet" href="${project}css/board.css">
    <!-- Template -->
    <link rel="stylesheet" href="${project}css/graindashboard.css">
</head>

<body class="has-sidebar has-fixed-sidebar-and-header" onload="logInvenStatus()">

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
					<li class="side-nav-menu-item">
						<a class="side-nav-menu-link ass2" href="${path}/ldStatementManagement">전표 관리</a>
					</li>
					<li class="side-nav-menu-item active">
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
                        <li class="breadcrumb-item active" aria-current="page">재고 관리</li>
                     </ol>
                  </nav>
                  <div class="row">

                     <div class="col-xl-12">

                        <div id="example" class="mb-9">
                           <h4 class="h1 text-dark"><b>재고 관리</b>
                                    <a class="anchorjs-link" href="#example"
                                       aria-label="Anchor" data-anchorjs-icon="#"></a>
                                 </h4>
                           <div class="mb-3">
                              <!-- Nav Classic -->
                              <ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark"
                                 id="pills-tab-1" role="tablist">
                                 <li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
                                    class="nav-link d-flex align-items-center py-2 px-3 active"
                                    id="pills-html-tab-1" data-toggle="pill"
                                    href="#pills-html-1" role="tab" onclick="logInvenStatus()" aria-controls="pills-html-1"
                                    aria-selected="false">재고현황</a></li>
                                    
                                 <li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
                                    class="nav-link d-flex align-items-center py-2 px-3"
                                    id="pills-html-tab-2" data-toggle="pill"
                                    href="#pills-html-2" role="tab" aria-controls="pills-html-2"
                                    aria-selected="false">입출고</a></li>
                                    
                                 <li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
                                    class="nav-link d-flex align-items-center py-2 px-3"
                                    id="pills-html-tab-3" data-toggle="pill"
                                    href="#pills-html-3" role="tab" onclick="logInvenAdjustment()" aria-controls="pills-html-3"
                                    aria-selected="false">재고조정</a></li>
                                    
                                 <li class="nav-item border-bottom border-xl-bottom-0 asss bg-light"><a
                                    class="nav-link d-flex align-items-center py-2 px-3"
                                    id="pills-html-tab-4" data-toggle="pill"
                                    href="#pills-html-4" role="tab" onclick="logInvenSupply()" aria-controls="pills-html-4"
                                    aria-selected="false">재고 수불부</a></li>
                              </ul>
                              <!-- End Nav Classic -->
                              
                              <!-- Tab Content -->
                              <div class="tab-content bg-lighter" id="pills-tabContent-1">
                                 <div class="tab-pane fade p-4 show active" id="pills-html-1"
                                    role="tabpanel" aria-labelledby="pills-html-tab-1">
                                    
									<!-- 검색창 시작 -->      
		                         	<div class="input-group">
			                          	<div class="input-group-append">
			                              <i class="gd-search icon-text icon-text-sm"></i>
		                            	</div>
		                            	<input class="form-control form-control-icon-text" id="ssKeyword" name="ssKeyword" placeholder="상품명 검색" type="text" style="font-size:20px">
		                          	</div>
		                          	<br>
                          			<!-- 검색창 끝 -->
                                    <div id="ldInvenStatus"></div>
                                    
                                 </div>
                                 
                                 <div class="tab-pane fade p-4" id="pills-html-2"
                                    role="tabpanel" aria-labelledby="pills-html-tab-2">
                                    	<div class="px-3">
									       <ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-3"
									          role="tablist">
									          <li class="nav-item"><a
									             class="nav-link px-2 pb-2 active ass2" href="#tabs2-tab1"
									             role="tab" aria-selected="true" data-toggle="tab">입출고 내역 </a></li>
									          <li class="nav-item ml-4"><a
									             class="nav-link px-2 pb-2 ass2" href="#tabs2-tab2" role="tab"
									             aria-selected="false" data-toggle="tab">입출고 승인</a></li>
									       </ul>
									       
									       <div id="tabsContent2" class="card-body tab-content p-0">
									          <div class="tab-pane fade show active" id="tabs2-tab1"
									             role="tabpanel">
									          	<table class="table  bg-white text-dark center ass2 table-striped">
													<thead>
														<tr class="text-white table-bordered tap">
															<th class="font-weight-semi-bold border-top-0 py-3 con2">구분</th>
															<th class="font-weight-semi-bold border-top-0 py-3 con2">상품번호</th>
															<th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
															<th class="font-weight-semi-bold border-top-0 py-3 con2">수량</th>
															<th class="font-weight-semi-bold border-top-0 py-3 con2">담당자</th>
															<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="shiRecVo" items="${shiRecVo}">
															<c:if test="${shiRecVo.stsu_type == 1 || shiRecVo.stsu_type == 2}">
															<tr>
																<c:if test="${shiRecVo.stsu_type == 1}">
																	<td class="py-3" style="vertical-align:middle">입고내역</td>
																</c:if>
																<c:if test="${shiRecVo.stsu_type == 2}">
																	<td class="py-3" style="vertical-align:middle">출고내역</td>
																</c:if>
																<td class="py-3" style="vertical-align:middle">${shiRecVo.pro_code}</td>
																<td class="py-3" style="vertical-align:middle">${shiRecVo.product.pro_name}</td>
																<td class="py-3" style="vertical-align:middle">${shiRecVo.stsu_amount}</td>
																<td class="py-3" style="vertical-align:middle">${shiRecVo.employee.emp_name}</td>
																<td class="py-3" style="vertical-align:middle">
																	<fmt:formatDate pattern="yyyy-MM-dd" value="${shiRecVo.stsu_reg_date}"/>
																</td>
															</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
									          </div>
									       
									          <div class="tab-pane fade" id="tabs2-tab2"
									             role="tabpanel">
									             <div class="row">
	                                          		<div class="col">
	                                          			<div class="collapse multi-collapse"
	                                             			id="multiCollapseExample4">
									             			<div id="moveDetail"></div>
									             		</div>
									             	</div>
								             	</div>
											<table class="table bg-white text-dark center table-striped">
											<thead>
												<tr class="text-white table-bordered tap">
													<th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
													<th class="font-weight-semi-bold border-top-0 py-3 con2">상품명</th>
													<th class="font-weight-semi-bold border-top-0 py-3 con2">출고수량</th>
													<th class="font-weight-semi-bold border-top-0 py-3 con2">부족수량</th>
													<th class="font-weight-semi-bold border-top-0 py-3 con2">창고명</th>
													<th class="font-weight-semi-bold border-top-0 py-3 con2">담당자명</th>
													<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="SOlist2" items="${SOlist2}">
												<c:if test="${SOlist2.logs_state == 1 || SOlist2.logs_state == 3}">
												<tr>
													<td class="py-3"><a class="btn" data-toggle="collapse" style="font-size:22px"
															href="#multiCollapseExample4" role="button"
															aria-expanded="false"
															aria-controls="multiCollapseExample4"
															onclick="logMoveDetail(${SOlist2.logs_code})">${SOlist2.logs_code}</a></td>
													<td class="py-3 con2" style="vertical-align:middle">${SOlist2.product.pro_name}</td>
													<td class="py-3 con2" style="vertical-align:middle">${SOlist2.logs_quantity}</td>
           											<td class="py-3 con2" style="vertical-align:middle">${SOlist2.logs_shortage}</td>
													<td class="py-3 con2" style="vertical-align:middle">${SOlist2.warehouse.ware_name}</td>
													<td class="py-3 con2" style="vertical-align:middle">${SOlist2.employee.emp_name}</td>
													<td class="py-3 con2" style="vertical-align:middle">
														<fmt:formatDate pattern="yyyy-MM-dd" value="${SOlist2.logs_reg_date}"/>
													</td>
												</tr>
												</c:if>
											</c:forEach>
											</tbody>
										</table>
									     </div>
                                     </div>
                                    </div>
                                  </div>
                              	<div class="tab-pane fade p-4" id="pills-html-3"
                                    role="tabpanel" aria-labelledby="pills-html-tab-3">
                                    	<div id="logInvenAdjustment"></div>
                                </div>
                                
                                <div class="tab-pane fade p-4" id="pills-html-4"
                                    role="tabpanel" aria-labelledby="pills-html-tab-4">
                                    	<div id="logInvenSupply"></div>
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
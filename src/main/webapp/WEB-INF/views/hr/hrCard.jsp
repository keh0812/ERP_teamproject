<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../setting.jsp" %> 
<head>
    <!-- Title -->
    <title>Users | Graindashboard UI Kit</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function hrCardDetail(code) {
	   
	   var param = "&${_csrf.parameterName}=${_csrf.token}&emp_code=" + code;
	   
	   $.ajax({
	      type:"POST",
	     data:param,
	     url:'hrCardDetail',
	      success: function(data){ 
	         $('#hrCardDetail').html(data);
	      },
	      error: function(){
	         alert('오류');
	      }
	   });
	}
	
function addressSearch() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('sample6_address').value = fullAddr;

                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById('sample6_address2').focus();
               }
            }).open();
   }

	$(function() {
		$("#filename").on('change', function(){
			readURL(this);
		});
	});
	
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {
				$('#preImage').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		} else {
			$('#preImage').attr('src', 'https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image');
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
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu side-nav-opened">
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
<!-- b -->      <ul id="gg" class="side-nav-menu side-nav-menu-second-level mb-0" style="display:block;">
<!-- a -->        <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/hrBasicReg">기초 등록</a>
               </li>
               <li class="side-nav-menu-item">
                  <a class="side-nav-menu-link ass2" href="${path}/hrAppointment">인사 발령</a>
                    </li>
                    <li class="side-nav-menu-item active">
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
               <li class="side-nav-menu-item ">
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
<!-- o -->   <li class="side-nav-menu-item side-nav-has-menu">
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
<!-- b -->      <ul id="asd" class="side-nav-menu side-nav-menu-second-level mb-0">
<!-- a -->         <li class="side-nav-menu-item">
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

 <!-- 인사카드 관리 시작 -->
       <div class="content">
         <div class="py-4 px-3 px-md-4">
            <div class="card">
               <div class="card-body">
                  <nav aria-label="breadcrumb">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">인사 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">인사 카드</li>
                     </ol>
                  </nav>
                  <div class="row">

                     <div class="col-xl-12">

                        <div id="example" class="mb-9">
                           <h4 class="h1 text-dark"><b>
                                 인사 카드 </b><a class="anchorjs-link" href="#example"
                                 aria-label="Anchor" data-anchorjs-icon="#"></a>
                           </h4>
                           <div class="mb-3">
                              
                              <!-- Nav Classic -->
                        <ul class="nav nav-tabs nav-primary d-block d-xl-flex text-dark" id="tabs-tab-3" role="tablist">
                           <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
                           <a class="nav-link d-flex align-items-center py-2 px-3 active"
                                 id="pills-result-tab-1" data-toggle="pill"
                                 href="#pills-result-1" role="tab"
                                 aria-controls="pills-result-1" aria-selected="true">인사 카드 조회</a>
                           </li>
                           <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
                           <a class="nav-link d-flex align-items-center py-2 px-3"
                                 id="pills-html-tab-1" data-toggle="pill"
                                 href="#pills-html-1" role="tab" aria-controls="pills-html-1"
                                 aria-selected="false">인사 카드 등록</a>
                           </li>
                              <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light  ">
                           <a class="nav-link d-flex align-items-center py-2 px-3"
                                 id="pills-html-tab-2" data-toggle="pill"
                                 href="#pills-html-2" role="tab" aria-controls="pills-html-2"
                                 aria-selected="false">휴직자 조회</a>
                           </li>
                           <li class="nav-item border-bottom border-xl-bottom-0  asss bg-light">
                           <a class="nav-link d-flex align-items-center py-2 px-3"
                                 id="pills-html-tab-3" data-toggle="pill"
                                 href="#pills-html-3" role="tab" aria-controls="pills-html-3"
                                 aria-selected="false">퇴직자 조회</a>
                           </li>
                        </ul>
                        <!-- End Nav Classic -->

                              <!-- Tab Content -->
                              <div class="tab-content bg-lighter" id="pills-tabContent-1">
                                 <div class="tab-pane fade p-4 show active"
                                    id="pills-result-1" role="tabpanel"
                                    aria-labelledby="pills-result-tab-1">
                               <!-- 검색창 시작 -->      
                                   <div class="input-group">
                                  <div class="input-group-append">
                                    <i class="gd-search icon-text icon-text-sm"></i>
                                  </div>
                                  <input class="form-control form-control-icon-text" placeholder="사원명/사번 검색" type="text" style="font-size:20px">
                                </div>
                                <br>
                                <!-- 검색창 끝 -->   
                                 <div class="row">
                                       <div class="col">
                                          <div class="collapse multi-collapse"
                                             id="multiCollapseExample1">
                                                <div id="hrCardDetail"></div>
                                          </div>
                                       </div>
                                    <table class="table table-striped bg-white text-dark center ass2">
                                       <thead class="text-white table-bordered tap">
                                          <tr>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">사번</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">부서명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">직급</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">사원명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">입사일</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                        <c:forEach var="vo" items="${list5}">
                                          <tr>
                                             <td class="py-3 middle"><a class="text-dark con2" data-toggle="collapse"
                                                      href="#multiCollapseExample1" role="button"
                                                      aria-expanded="false"
                                                      aria-controls="multiCollapseExample1"
                                                      onclick="hrCardDetail(${vo.emp_code})">${vo.emp_code}</a>
                                 </td>
                                             <td class="py-3 middle">${vo.department.dep_name}</td>
                                             <td class="py-3 middle">${vo.hrCode.hr_code_name}</td>
                                             <td class="py-3 middle">${vo.emp_name}</td>
                                             <td class="py-3 middle"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.emp_hire_date}"/></td>
                                          </tr>
                                          </c:forEach>
                                       </tbody>
                                    </table>
                                    <br>
                                 </div>
                        </div>
                        
                         <div class="tab-pane fade p-4" id="pills-html-1" role="tabpanel" aria-labelledby="pills-html-tab-1">
                            
                     <!-- 인사카드 폼 시작 -->  
                     <form action="hrCardInsert?${_csrf.parameterName}=${_csrf.token}" name="hrCardform" method="post" enctype="multipart/form-data" onsubmit="return CardCheck();">
                     <input type="hidden" name="hiddenEmp_code" value="0">
                     <table class="table bg-white text-dark center ass2" style="text-align:center">
                        <tr>
                           <th class="text-white table-bordered tap py-3 con2" colspan="3"> 인사카드 등록</th>
                        </tr>
                        <tr>
                           <th style="vertical-align:middle">사진</th>
                           <td align="left">
				 			<img id="preImage" width="150px" height="150px" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image"/>
                           	<input id="filename" type="file" accept="image/*" name="emp_photo" onchange="setThumbnail(event);">
                           </td>
                        </tr>
                        <tr>
                           <th style="vertical-align:middle">* 사번</th>
                           <td><input type="text" class="form-control" name="emp_code" maxlength="5"></td>
                           <td><input class="btn btn-outline-info" name="dupChk" type="button" value="중복확인" onclick="confirmCode();"></td>
                        </tr>
                        <tr>
                           <th style="vertical-align:middle">* 사원명</th>
                           <td> <input type="text" class="form-control" name="emp_name" maxlength="10"></td>
                        </tr>
                        <tr>
                           <th style="vertical-align:middle"> * 부서명 </th>
                           <td>    
                           <div class="form-group">
                                <select name="dep_code" class="form-control" id="exampleFormControlSelect1">
                                   <option value="0">부서 선택</option>
                                <c:forEach var="vo" items="${list3}">
                                   <option value="${vo.dep_code}">${vo.dep_name}</option>
                                  </c:forEach>
                                </select>
                              </div>
                            </td>
                        </tr>
                        <tr>
                          <th style="vertical-align:middle"> * 직급</th>
                           <td>    
                           <div class="form-group">
                               <select name="hr_code" class="form-control" id="exampleFormControlSelect1">
                           <option value="0">직급 선택</option>
                        <c:forEach var="vo" items="${list4}">
                           <option value="${vo.hr_code}">${vo.hr_code_name}</option>
                        </c:forEach>
                        </select>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <th style="vertical-align:middle">* 권한</th>
                           <td><div class="form-group">
                                   <select name="emp_authority" class="form-control" id="exampleFormControlSelect1">
                                       <option value="0">권한 선택</option>
                                     <option value="ROLE_ADMIN">관리자</option>
                                     <option value="ROLE_ST">판매팀</option>
                                     <option value="ROLE_HR">인사팀</option>
                                     <option value="ROLE_PD">구매팀</option>
                                     <option value="ROLE_LD">물류팀</option>
                                     <option value="ROLE_AD">회계팀</option>
                                     <option value="ROLE_USER">인턴</option>
                                   </select>
                                </div>
                             </td>
                         </tr>
                        <tr>
                           <th style="vertical-align:middle">* 입사일</th>
                           <td><input type="date" name="emp_hire_date" class="form-control"></td>
                        </tr>
                        <tr>                                    
                            <th style="vertical-align:middle">근속연수</th>
                            <td><input type="text" name="emp_cos" class="form-control" maxlength="5"></td>
                        </tr>
                        <tr>
                           <th style="vertical-align:middle"> * 주민등록번호 </th>
                           <td><input type="text" class="form-control" name="emp_jumin" placeholder="'-'없이 숫자만 입력" maxlength="13"></td>
                        </tr>
                         <tr>
                     <th style="vertical-align:middle">* 주소</th>
                     <td>
                        <input type="text" name="addcode" id="sample6_postcode"
                        placeholder=" 우편번호" class="form-control" size=8></td> 
                        <td><input type="button" onclick="addressSearch();" class="btn btn-outline-info" value="주소찾기">
                     </td>
                  <tr>
                     <th style="vertical-align:middle"> </th>
                     <td>
                        <input type="text" class="form-control" name="add1" id="sample6_address" size=45
                        placeholder=" 주소">
      
                     </td>
                  </tr>
                  <tr>
                     <th style="vertical-align:middle"></th>
                     <td>
                        <input type="text" name="add2" class="form-control" id="sample6_address2"
                        placeholder=" 상세주소" size=45 onchange="addinput();"> 
                        <input type="hidden" name="address">
                     </td>
                  </tr> 
                      <tr>
                              <th style="vertical-align:middle">전화번호</th>
                              <td><input type="tel" name="emp_tel" class="form-control" maxlength="13"></td>
                           </tr>
                           <tr>
                              <th style="vertical-align:middle">* 휴대전화</th>
                              <td><input type="tel" name="emp_phone" class="form-control" maxlength="15"></td>
                           </tr>
                           <tr>                                    
                              <th style="vertical-align:middle">* 이메일</th>
                              <td><input type="email" name="emp_email" class="form-control"></td>
                           </tr>
                           <tr>
                              <th style="vertical-align:middle">여권번호</th>
                              <td><input type="text" name="emp_port_no" class="form-control" maxlength="30"></td>
                           </tr>
                           <tr>
                              <th style="vertical-align:middle">* 은행</th>
                              <td><div class="form-group">
                                      <select name="emp_bank" class="form-control" id="exampleFormControlSelect1">
                                         <option value="0">은행 선택</option>
                                        <option value="농협">농협</option>
                                        <option value="신한">신한</option>
                                        <option value="기업">기업</option>
                                        <option value="하나">하나</option>
                                        <option value="국민">국민</option>
                                        <option value="우리">우리</option>
                                        <option value="카카오뱅크">카카오뱅크</option>
                                      </select>
                                    </div>
                              </td>
                           </tr>
                           <tr>
                              <th style="vertical-align:middle">* 급여계좌</th>
                              <td><input type="text" name="emp_account" class="form-control" maxlength="30"></td>
                           </tr>
                     </table>
                  
                     <div align=center>
                           <button type="submit" class="btn btn-outline-info">등록</button>&nbsp;&nbsp;&nbsp;
                           <button type="reset" class="btn btn-outline-info">재입력</button>
                     </div>
                  
                  </form>
                <!-- 인사카드 폼 끝 -->   
                                 </div>
                                 <div class="tab-pane fade p-4" id="pills-html-2"
                                    role="tabpanel" aria-labelledby="pills-html-tab-2">
                                    
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
                                       <thead>
                                          <tr class="text-white table-bordered tap">
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">사번</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">부서명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">직급</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">사원명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">휴직일</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:forEach var="vo" items="${list7}">
                                          <tr>
                                             <td class="py-3">${vo.emp_code}</td>
                                             <td class="py-3">${vo.ap_cur_dep}</td>
                                             <td class="py-3">${vo.ap_cur_position}</td>
                                             <td class="py-3">${vo.employee.emp_name}</td>
                                             <td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.ap_date}"/></td>
                                          </tr>
                                        </c:forEach>
                                       </tbody>
                                    </table>
                                 </div>
                                 <div class="tab-pane fade p-4" id="pills-html-3"
                                    role="tabpanel" aria-labelledby="pills-html-tab-3">
                                 <!-- 검색창 시작 -->      
                                   <div class="input-group">
                                  <div class="input-group-append">
                                    <i class="gd-search icon-text icon-text-sm"></i>
                                  </div>
                                  <input class="form-control form-control-icon-text" placeholder="사원명/사번 검색" type="text" style="font-size:20px">
                                </div>
                                <!-- 검색창 끝 -->   
                                   
                                 <br>
                                 <form>
                                    <table class="table table-striped bg-white text-dark center ass2">
                                       <thead>
                                          <tr class="text-white table-bordered tap">
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">사번</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">부서명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">직급</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">사원명</th>
                                             <th class="font-weight-semi-bold border-top-0 py-3 con2">퇴직일</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:forEach var="vo" items="${list8}">
                                            <tr>
                                               <td class="py-3">${vo.emp_code}</td>
                                               <td class="py-3">${vo.ap_cur_dep}</td>
                                               <td class="py-3">${vo.ap_cur_position}</td>
                                               <td class="py-3">${vo.employee.emp_name}</td>
                                               <td class="py-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.ap_date}"/></td>
                                            </tr>
                                         </c:forEach>
                                       </tbody>
                                    </table>
                                    </form>
                                    </div>
                                    <br>
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
   <!-- 인사코드 관리 끝-->


</main>

<%@ include file = "../common/footer.jsp" %> 
<script src="${project}js/graindashboard.js"></script>
<script src="${project}js/graindashboard.vendor.js"></script>

</body>
</html>
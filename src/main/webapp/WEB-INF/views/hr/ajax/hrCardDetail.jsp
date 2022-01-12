<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../setting.jsp"%>
</head>
<body>
    <table class="table table-bordered bg-white text-dark ass2 center ">
      <tbody>
         <tr class="text-white con center">
            <th colspan="3">인사카드</th>
         </tr>
         <tr>
            <th width="300" rowspan="5" style="vertical-align:middle"><img width="150px" height="150px" src="/load/${vo.emp_photo}"/></th>
         </tr>
         <tr>
             <th width="150">사번</th>
            <td>${vo.emp_code}</td>
         </tr>
         <tr>
             <th width="150">사원명</th>
             <td>${vo.emp_name}</td>
         </tr>
         <tr>
             <th width="150">부서명</th>
            <td>${vo.department.dep_name}</td>
         </tr>
         <tr>
             <th width="150">직급</th>
            <td>${vo.hrCode.hr_code_name}</td>
         </tr>
         <tr>
            <th width="150">입사일</th>
            <td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.emp_hire_date}"/></td>
         </tr>
         <tr>
            <th width="150">근속연수</th>
            <td colspan="3">${vo.emp_cos}</td>
         </tr>
         <tr>
             <th width="150">주민등록번호</th>
            <td colspan="3">${vo.emp_jumin}</td>
         </tr>
         <tr>
            <th width="150">주소</th>
            <td colspan="3">${vo.emp_address}</td>
         </tr>
         <tr>
            <th width="150">전화번호</th>
            <td colspan="3">${vo.emp_tel}</td>
         </tr>
         <tr>
            <th width="150">휴대전화</th>
            <td colspan="3">${vo.emp_phone}</td>
         </tr>
         <tr>
            <th width="150">이메일</th>
            <td colspan="3">${vo.emp_email}</td> 
         </tr>
         <tr>
            <th width="150">여권번호</th>
            <td colspan="3">${vo.emp_port_no}</td>
         </tr>
         <tr>
            <th width="150">급여 계좌</th>
            <td colspan="3"><strong>${vo.emp_bank}</strong>&nbsp;&nbsp;${vo.emp_account}</td>
         </tr>
      </tbody>
   </table><br><br><br>
</body>
</html>
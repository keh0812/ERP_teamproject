// 김은희 - 인사카드 등록 체크
function CardCheck() {
	
	if(document.hrCardform.emp_code.value.length == 0 ) {
		alert("사번을 입력하세요.");
		
		document.hrCardform.emp_code.focus();
		return false;
	}
	
	if($("select[name='dep_code']").val() == "0") {
		alert("부서를 선택하세요.");
		
		$("select[name='dep_code'] > option)").focus();
		return false;
	}
	
	if(document.hrCardform.emp_code.value.length == 0 ) {
		alert("사번을 입력하세요.");
		
		document.hrCardform.emp_code.focus();
		return false;
	}
	
	if(document.hrCardform.emp_code.value.length == 0 ) {
		alert("사번을 입력하세요.");
		
		document.hrCardform.emp_code.focus();
		return false;
	}
	
	if(document.hrCardform.emp_code.value.length == 0 ) {
		alert("사번을 입력하세요.");
		
		document.hrCardform.emp_code.focus();
		return false;
	}
	
	if(document.hrCardform.emp_code.value.length == 0 ) {
		alert("사번을 입력하세요.");
		
		document.hrCardform.emp_code.focus();
		return false;
	}
	
	if(!document.hrCardform.emp_name.value) {
		alert("사원명을 입력하세요.");
		document.hrCardform.emp_name.focus();
		return false;
	}
	
	if(!document.hrCardform.emp_jumin.value) {
		alert("주민등록번호를 입력하세요.");
		document.hrCardform.emp_jumin.focus();
		return false;
	}
	
	if(!document.hrCardform.emp_address.value) {
		alert("주소를 입력하세요.");
		document.hrCardform.emp_address.focus();
		return false;
	}
	
	if(!document.hrCardform.emp_phone.value) {
		alert("휴대전화를 입력하세요.");
		document.hrCardform.emp_phone.focus();
		return false;
	}
	
	if(!document.hrCardform.emp_email.value) {
		alert("이메일을 입력하세요.");
		document.hrCardform.emp_email.focus();
		return false;
	}
	
	if(!document.hrCardform.emp_account.value) {
		alert("급여 계좌를 입력하세요.");
		document.hrCardform.emp_account.focus();
		return false;
	}
	
	if(document.hrCardform.hiddenEmp_code.value == "0") { 
		alert("중복확인을 해주세요.");
		document.hrCardform.dupChk.focus();
		return false;
	}
}



// 김은희 - 내 정보 수정 체크
function pageCheck() {
	
	if(!document.myPageform.emp_jumin.value) {
		alert("주민등록번호를 입력하세요.");
		document.myPageform.emp_jumin.focus();
		return false;
	}
	
	if(!document.myPageform.addcode.value) {
		alert("우편번호를 입력하세요.");
		document.myPageform.addcode.focus();
		return false;
	}
	
	if(!document.myPageform.add1.value) {
		alert("주소를 입력하세요.");
		document.myPageform.add1.focus();
		return false;
	}
	
	if(!document.myPageform.add2.value) {
		alert("상세주소를 입력하세요.");
		document.myPageform.add2.focus();
		return false;
	}
	
	if(!document.myPageform.emp_phone.value) {
		alert("휴대전화를 입력하세요.");
		document.myPageform.emp_phone.focus();
		return false;
	}
	
	if(!document.myPageform.emp_email.value) {
		alert("이메일을 입력하세요.");
		document.myPageform.emp_email.focus();
		return false;
	}
	
	if(!document.myPageform.emp_account.value) {
		alert("급여 계좌를 입력하세요.");
		document.myPageform.emp_account.focus();
		return false;
	}
	
}

// 김은희 - 인사카드 사번 중복확인 버튼 클릭
function confirmCode() {
	
	if(!document.hrCardform.emp_code.value) {
		alert("사번을 입력하세요.");
		document.hrCardform.emp_code.focus();
		return false;
	}
		 
	var url ="hrConfirmCode?emp_code=" + document.hrCardform.emp_code.value; 
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

// 김은희 - 사번 확인 포커스
function confirmCodeFocus() {
	document.confirmform.emp_code.focus();
}
 
function confirmCodeCheck() {
	if(!document.confirmform.emp_code.value) {
		alert("사번을 입력하세요.");
		document.confirmform.emp_code.focus();
		return false;
	}
}

// 김은희 - 사번 중복확인 완료, 사번 넘겨주기
function setCode(emp_code) {
	opener.document.hrCardform.emp_code.value=emp_code; 
	opener.document.hrCardform.hiddenEmp_code.value=1; 
	self.close();
}
 
// 김은희 - 근태 신청 체크
function waCheck() {
	if(!document.waForm.emp_code.value) {
			alert("사번을 입력하세요.");
			document.waForm.emp_code.focus();
			return false;
		}
		
	if(!document.waForm.emp_name.value) {
			alert("사원명을 입력하세요.");
			document.waForm.emp_name.focus();
			return false;
	    }
	
	if(document.waForm.hiddenEmp_code.value == "0") { 
		 alert("사번확인을 해주세요.");
		 document.waForm.dupChk.focus();
		 return false;
	 }
}
	
// 김은희 - 근태 신청 사원확인 버튼 클릭
function confirmEmp_Code() {
	if(!document.waForm.emp_code.value) {
		alert("사번을 입력하세요.");
		document.waForm.emp_code.focus();
		return false;
	}
	
	var url ="empComfirm?emp_code=" + document.waForm.emp_code.value; 
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

// 김은희 - 근태 신청 포커스
function confirmWaFocus() {
	document.confirmWaform.emp_code.focus();
}

// 김은희 - 사번 null값 방지
function confirmCodeCheck() {
	if(!document.confirmWaform.emp_code.value) {
		alert("사번을 입력하세요.");
		document.confirmWaform.emp_code.focus();
		return false;
	}
}

// 김은희 - 사원 확인 완료, 이름과 부서명 넘겨주기
function setConfirm(emp_code, emp_name, dep_name, dep_code) {
	opener.document.waForm.emp_code.value=emp_code; 
	opener.document.waForm.emp_name.value=emp_name; 
	opener.document.waForm.dep_name.value=dep_name; 
	opener.document.waForm.dep_code.value=dep_code; 
	opener.document.waForm.hiddenEmp_code.value=1; 
	self.close();
}


// 김은희 - 인사코드 등록 체크
function CodeCheck() {
	if(!document.hrCodeform.hr_code.value) {
		alert("인사코드를 입력하세요.");
		document.hrCodeform.hr_code.focus();
		return false;
	}
	
	if(!document.hrCodeform.hr_code_name.value) {
		alert("인사코드명을 입력하세요.");
		document.hrCodeform.hr_code_name.focus();
		return false;
	}
	
	if(document.hrCodeform.hiddenHr_code.value == "0") { 
		alert("인사코드 중복확인을 해주세요.");
		document.hrCodeform.codeChk.focus();
		return false;
	}
	
	if(document.hrCodeform.hiddenHr_name.value == "0") { 
		alert("인사코드명 중복확인을 해주세요.");
		document.hrCodeform.nameChk.focus();
		return false;
	}
}

// 김은희 - 인사코드 중복확인 버튼 클릭
function confirmHrCode() {
	
	if(!document.hrCodeform.hr_code.value) {
		alert("인사코드를 입력하세요.");
		document.hrCodeform.hr_code.focus();
		return false;
	}
		 
	var url ="hrConfirmHrCode?hr_code=" + document.hrCodeform.hr_code.value; 
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

// 김은희 - 인사코드 중복확인 포커스
function confirmHrCodeFocus() {
	document.hrConfirmform.hr_code.focus();
}

// 김은희 - 인사코드 중복확인 null값 방지
function confirmHrCodeCheck() {
	if(!document.hrConfirmform.hr_code.value) {
		alert("인사코드를 입력하세요.");
		document.hrConfirmform.hr_code.focus();
		return false;
	}
}

// 김은희 - 인사코드 중복확인 완료, 값 넘겨주기
function setHrcode(hr_code) {
	opener.document.hrCodeform.hr_code.value=hr_code; 
	opener.document.hrCodeform.hiddenHr_code.value=1; 
	self.close();
}

// 김은희 - 인사코드명 중복확인 버튼 클릭
function confirmHrName() {
	
	if(!document.hrCodeform.hr_code_name.value) {
		alert("인사코드명을 입력하세요.");
		document.hrCodeform.hr_code_name.focus();
		return false;
	}
		 
	var url ="hrConfirmHrName?hr_code_name=" + document.hrCodeform.hr_code_name.value; 
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

// 김은희 - 인사코드명 중복확인 포커스
function confirmHrNameFocus() {
	document.hrNameConfirmform.hr_code_name.focus();
}

// 김은희 - 인사코드명 중복확인 lnull값 방지
function confirmHrNameCheck() {
	if(!document.hrNameConfirmform.hr_code_name.value) {
		alert("인사코드명을 입력하세요.");
		document.hrNameConfirmform.hr_code_name.focus();
		return false;
	}
}

// 김은희 - 인사코드명 중복확인 완료, 값 넘겨주기
function setHrName(hr_code_name) {
	opener.document.hrCodeform.hr_code_name.value=hr_code_name; 
	opener.document.hrCodeform.hiddenHr_name.value=1; 
	self.close();
}

// 김은희 - 숫자만 입력받기 위함
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
      return;
    else
      return false;
  }
  
  function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
      return;
    else
      event.target.value = event.target.value.replace(/[^0-9]/g, "");
  }


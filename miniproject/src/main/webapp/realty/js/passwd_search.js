// 비밀번호 찾기 버튼
function passwd_search(){
	// 이메일 정규식 코드
	var email = frm.memail.value.trim();
	let ck = /^[a-z0-9][a-z0-9_]*@[a-z0-9ㄱ-힇-]+\.[a-z]{2,}$/i;
	var result = ck.test(email);
	
	// 전화번호 정규식 코드
	var tel = frm.mtel.value;
	let ck2 = /^01\d{8,9}$/;
	var result2 = ck2.test(tel);
	
	if(email === ""){
		alert("이메일 주소를 입력하세요.");
		frm.memail.focus();
	}
	else if(result == false){
		alert("올바른 이메일 주소를 입력하세요.");
		frm.memail.value = "";
		frm.memail.focus();
	}
	else if(frm.mtel.value.trim() === ""){
		alert("휴대폰 번호를 입력하세요.");
		frm.mtel.focus();
	}
	else if(result2 == false){
		alert("휴대폰 번호는 - 없이 숫자만 올바르게 입력하세요.");
		frm.mtel.value = "";
		frm.mtel.focus();
	}
	else{
		frm.submit();
	}
}
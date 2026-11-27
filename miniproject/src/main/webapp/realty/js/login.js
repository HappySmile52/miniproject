function logincheck(){
	if(frm.lemail.value.trim() == ""){
		alert("이메일 주소를 입력하세요.");
		frm.lemail.focus();
		
		return false;	// 전송 중단
	}
	else if(frm.lpass.value.trim() == ""){
		alert("비밀번호를 입력하세요.");
		frm.lpass.focus();
		
		return false;	// 전송 중단
	}
	
	return true;	// 전송
}

// 비밀번호 보기 / 숨기기
function pw_toggle(){
	if(frm.lpass.type == "password"){
		frm.lpass.type = "text";
	}
	else{
		frm.lpass.type = "password";
	}
}
function logincheck(){
	if(frm.lemail.value == ""){
		alert("이메일 주소를 입력하세요.");
		frm.lemail.focus();
	}
	else if(frm.lpass.value == ""){
		alert("비밀번호를 입력하세요.");
		frm.lpass.focus();
	}
	else{
		frm.submit();
	}
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
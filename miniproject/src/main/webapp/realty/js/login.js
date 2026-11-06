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
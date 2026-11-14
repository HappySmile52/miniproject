// 비밀번호 변경 버튼
function pass_change(){
	// 비밀번호 정규식 코드
	var pw = frm.mpass.value;
	let ck = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[-_!]).*$/;
	var result = ck.test(pw);
	
	if(frm.mpass.value.trim() === ""){
		alert("비밀번호를 입력하세요.");
		frm.mpass.focus();
	}
	else if(frm.mpass.value.trim().length < 10 || frm.mpass.value.trim().length > 16){
		alert("비밀번호는 최소 10자에서 최대 16자까지 입력 가능합니다.");
		frm.mpass.value = "";
		frm.mpass2.value = "";
		frm.mpass.focus();
	}
	else if(result == false){
		alert("비밀번호는 영문, 숫자, 특수문자(-_!)를 보함해야 합니다.");
		frm.mpass.value = "";
		frm.mpass2.value = "";
		frm.mpass.focus();
	}
	else if(frm.mpass2.value.trim() === "" || frm.mpass2.value != frm.mpass.value){
		alert("동일한 비밀번호를 입력하세요.");
		frm.mpass2.value = "";
		frm.mpass2.focus();
	}
	else{
		frm.submit();
	}
}
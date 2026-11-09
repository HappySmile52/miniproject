// 이메일 찾기
function email_search(){
	// 전화번호 정규식 코드
	var tel = frm.mtel.value;
	let ck = /^01\d{8,9}$/;
	console.log(ck.test(tel));
	var result = ck.test(tel);
	
	if(frm.mname.value.trim() === ""){
		alert("이름을 입력하세요.");
		frm.mname.focus();
	}
	else if(frm.mtel.value.trim() === ""){
		alert("휴대폰 번호를 입력하세요.");
		frm.mtel.focus();
	}
	else if(result == false){
		alert("휴대폰 번호는 - 없이 숫자만 올바르게 입력하세요.");
		frm.mtel.value = "";
		frm.mtel.focus();
	}
	else{
		frm.submit();
	}
}
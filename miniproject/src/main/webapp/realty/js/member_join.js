// 이메일 중복 체크
function emch(){
	// 이메일 정규식 코드
	var email = f.memail.value.trim();
	let ck = /^[a-z0-9][a-z0-9_]*@[a-z0-9ㄱ-힇-]+\.[a-z]{2,}$/i;
	// console.log(ck.test(email));
	var result = ck.test(email);
	
	if(email === ""){
		alert("이메일 주소를 입력하세요.");
		f.memail.focus();
	}
	else if(result == false){
		alert("올바른 이메일 주소를 입력하세요.");
		f.memail.value = "";
		f.memail.focus();
	}
	else{
		ajaxpost(email);
	}
}

var ok = "";
function ajaxpost(data){
	// console.log(data);
	
	fetch("./email_ck.do",{
		method : "POST",
		headers : {"content-type":"application/x-www-form-urlencoded"},
		body : "memail=" + data
	}).then(function(aa){
		return aa.text();
	}).then(function(bb){
		// console.log(bb);
		if(bb == "ok"){
			alert("사용 가능한 이메일입니다.");
			f.memail.readOnly = true;	// 읽기 전용
			f.memail_ch.value = "Y";	// 이메일 중복체크 여부 확인
		}
		else{
			alert("이미 사용중인 이메일입니다.");
			f.memail.value = "";	// 값 초기화
		}
	}).catch(function(error){
		console.log(error);
	});
}

// 체크박스
var all = document.getElementById("all");	// 전체 동의 체크박스
var totalch = 4;	// 개별 체크박스 개수

// 전체 동의 선택시 개별 체크박스 전체 선택
function all_check(z){	// 체크시 z 값은 true
	var w = 1;
	while(w <= totalch){
		f["mag" + w].checked = z;
		w++;
	}
}

// 개별 체크박스 전체 선택시 전체 동의 선택 
function ag_check(){
	var w = 1;
	var count = 0;	// 카운트
	while(w <= totalch){
		if(f["mag" + w].checked == true){
			count++;
		}
		w++;
	}
	
	if(count == totalch){
		all.checked = true;
	}
	else{
		all.checked = false;
	}
}

// 약관 동의 페이지 로드
window.onload = function(){
	var http = new XMLHttpRequest;
	http.open("GET","./agree1.txt", false);
	http.send();
	document.getElementById("ag1").innerHTML = http.response;
	
	http.open("GET","./agree2.txt", false);
	http.send();
	document.getElementById("ag2").innerHTML = http.response;
}

// 회원가입 버튼
function mem_join(){
	// 정규식 코드
	// 비밀번호 정규식 코드
	var pw = f.mpass.value;
	let ck2 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[-_!]).*$/;
	console.log(ck2.test(pw));
	var result2 = ck2.test(pw);
	
	// 전화번호 정규식 코드
	var tel = f.mtel.value;
	let ck3 = /^01\d{8,9}$/;
	console.log(ck3.test(tel));
	var result3 = ck3.test(tel);
	
	if(f.memail.value.trim() === ""){
		alert("이메일 주소를 입력하세요.");
		f.memail.focus();
	}
	else if(f.memail_ch.value != "Y"){
		alert("이메일 중복체크를 해야 합니다.");
	}
	else if(f.mpass.value.trim() === ""){
		alert("비밀번호를 입력하세요.");
		f.mpass.focus();
	}
	else if(f.mpass.value.trim().length < 10 || f.mpass.value.trim().length > 16){
		alert("비밀번호는 최소 10자에서 최대 16자까지 입력 가능합니다.");
		f.mpass.value = "";
		f.mpass2.value = "";
		f.mpass.focus();
	}
	else if(result2 == false){
		alert("비밀번호는 영문, 숫자와 특수문자(-_!)를 포함해야 합니다.");
		f.mpass.value = "";
		f.mpass2.value = "";
		f.mpass.focus();
	}
	else if(f.mpass2.value.trim() === "" || f.mpass2.value != f.mpass.value){
		alert("동일한 비밀번호를 입력하세요.");
		f.mpass2.value = "";
		f.mpass2.focus();
	}
	else if(f.mname.value.trim() === ""){
		alert("이름을 입력하세요");
		f.mname.focus();
	}
	else if(f.mtel.value.trim() === ""){
		alert("휴대폰 번호를 입력하세요.");
		f.mtel.focus();
	}
	else if(f.mtel.value.trim().length < 10 || f.mtel.value.trim().length > 11 || result3 == false){
		alert("올바른 핸드폰 번호를 입력하세요.");
		f.mtel.value = "";
		f.mtel.focus();
	}
	else if(!f.mag1.checked){
		alert("(필수) 만 14세 이상 회원 여부를 확인해주세요.");
	}
	else if(!f.mag2.checked){
		alert("(필수) 이용약관에 동의해주세요.");
	}
	else if(!f.mag3.checked){
		alert("(필수) 개인정보 수집 및 이용에 동의해주세요.");
	}
	else{
		f.submit();
	}
}
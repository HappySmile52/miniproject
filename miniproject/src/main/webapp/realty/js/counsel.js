// 상담일시 : 내일부터 선택 가능
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);
var min_date = tomorrow.getFullYear() + "-"
	+ String(tomorrow.getMonth() + 1).padStart(2, "0") + "-"
	+ String(tomorrow.getDate()).padStart(2, "0");
frm.cdate.min = min_date;

// 체크박스 체크 개수
function check_count(name){
	var count = 0;
	var list = document.getElementsByName(name);
	for(var i = 0; i < list.length; i++){
		if(list[i].checked == true){
			count++;
		}
	}
	return count;
}

// 상담신청 버튼
function counsel_ok(){
	if(check_count("crent") == 0){
		alert("임대형태를 최소 1개 이상 선택하세요.");
	}
	else if(check_count("chouse") == 0){
		alert("주거형태를 최소 1개 이상 선택하세요.");
	}
	else if(frm.cdate.value === ""){
		alert("상담일시를 선택하세요.");
		frm.cdate.focus();
	}
	else if(frm.cdate.value < min_date){
		alert("상담일시는 오늘 이후 날짜만 선택 가능합니다.");
		frm.cdate.value = "";
		frm.cdate.focus();
	}
	else if(frm.ccontent.value.trim().length < 10){
		alert("상담내용은 최소 10자 이상 입력하세요.");
		frm.ccontent.focus();
	}
	else{
		frm.submit();
	}
}
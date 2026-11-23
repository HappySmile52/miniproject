// 방문일시 : 내일부터 선택 가능
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);
var min_date = tomorrow.getFullYear() + "-"
	+ String(tomorrow.getMonth() + 1).padStart(2, "0") + "-"
	+ String(tomorrow.getDate()).padStart(2, "0");
frm.rdate.min = min_date;

// 방문 예약등록 버튼
function reserve_ok(){
	if(frm.rdate.value === ""){
		alert("방문일시를 선택하세요.");
		frm.rdate.focus();
	}
	else if(frm.rdate.value < min_date){
		alert("방문일시는 오늘 이후 날짜만 선택 가능합니다.");
		frm.rdate.value = "";
		frm.rdate.focus();
	}
	else if(frm.rtime.value === ""){
		alert("방문시간을 선택하세요.");
		frm.rtime.focus();
	}
	else{
		frm.submit();
	}
}
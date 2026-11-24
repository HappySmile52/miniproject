// 방문예약 취소 버튼
function reserve_cancel(ridx){
	if(confirm("방문예약을 취소 하시겠습니까?")){
		cancel_frm.ridx.value = ridx;
		cancel_frm.submit();
	}
}
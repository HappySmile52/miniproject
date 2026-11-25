// ckeditor 적용
window.onload = function(){
	CKEDITOR.replace('board_text',{
		height : 360
	});
};

// 등록 버튼
function md_write(){
	var file = frm.mfile.files[0];
	var content = CKEDITOR.instances.board_text.getData();	// ckeditor 내용
	
	if(frm.md_title.value.trim() === ""){
		alert("제목을 입력하세요.");
		frm.md_title.focus();
	}
	else if(file == undefined){
		alert("썸네일 이미지를 첨부해주세요.");
	}
	else if(!file.type.startsWith("image/")){
		alert("이미지 파일만 첨부 가능합니다.");
		frm.mfile.value = "";
	}
	else if(file.size > 2 * 1024 * 1024){
		alert("이미지 크기는 2MB 이하만 가능합니다.");
		frm.mfile.value = "";
	}
	else if(content.replace(/<[^>]*>/g, "").replace(/&nbsp;/g, "").trim() === ""){
		alert("내용을 입력하세요.");
	}
	else{
		CKEDITOR.instances.board_text.updateElement();	// ckeditor 내용 → textarea에 반영
		frm.submit();
	}
}
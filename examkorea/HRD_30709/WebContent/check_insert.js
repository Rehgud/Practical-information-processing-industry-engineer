/**
 * 
 */

function check_insert(){
	if(document.frm_insert.id.value == ""){
		alert("학번을 입력해주세요");
		frm_insert.id.focus();
		return false;
	}
	
	if(document.frm_insert.korean.value == "" ||
	   document.frm_insert.korean.value < 0 ||
	   document.frm_insert.korean.value > 100 ||
	   isNaN(docuemt.frm_insert.korean.value) == true){
		alert("국어 점수를 정확하게 입력해주세요");
		frm_insert.korean.focus();
		return false;
	}
	if(document.frm_insert.math.value == "" ||
	   document.frm_insert.math.value < 0 ||
	   document.frm_insert.math.value > 100 ||
	   isNaN(docuemt.frm_insert.math.value) == true){
		alert("수학 점수를 정확하게 입력해주세요");
		frm_insert.math.focus();
		return false;
	}
	if(document.frm_insert.english.value == "" ||
	   document.frm_insert.english.value < 0 ||
	   document.frm_insert.english.value > 100 ||
	   isNaN(docuemt.frm_insert.english.value) == true){
		alert("영어 점수를 정확하게 입력해주세요");
		frm_insert.english.focus();
		return false;
	}
	if(document.frm_insert.history.value == "" ||
	   document.frm_insert.history.value < 0 ||
	   document.frm_insert.history.value > 100 ||
	   isNaN(docuemt.frm_insert.history.value) == true){
		alert("역사 점수를 정확하게 입력해주세요");
		frm_insert.history.focus();
		return false;
	}
	
	alert("학셍 점수 등록이 완료 되었습니다.");
	return true;
}
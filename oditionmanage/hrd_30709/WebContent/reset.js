/**
 * 
 */

function onCheck(){
	if(document.frm_insert.artist_id.value==""){
		alert("참가번호가 입력되지 않았습니다!");
		document.frm_insert.artist_id.focus();
		return false;
	}
	if(document.frm_insert.artist_name.value==""){
		alert("참가자명이 입력되지 않았습니다!");
		document.frm_insert.artist_name.focus();
		return false;
	}
	if(document.frm_insert.year.value==""||document.frm_insert.month.value==""||document.frm_insert.day.value==""){
		alert("생년월일이 입력되지 않았습니다!");
		document.frm_insert.year.focus();
		return false;
	}
	if(document.frm_insert.artist_gender[0].checked == false&&document.frm_insert.artist_gender[1].checked == false){
		alert("성별이 선택되지 않았습니다!");
		document.frm_insert.artist_gender[0].focus();
		return false;
	}
	if(document.frm_insert.talent.value==""){
		alert("특기가 선택되지 않았습니다!");
		document.frm_insert.talent.focus();
		return false;
	}
	if(document.frm_insert.agency.value==""){
		alert("소속사가 입력되지 않았습니다!");
		document.frm_insert.agency.focus();
		return false;
	}
	alert("참가신청이 정상적으로 등록 되었습니다!");
	return true;
}

function reset(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	return true;
}
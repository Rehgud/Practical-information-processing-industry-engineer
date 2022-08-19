/**
 * 
 */

function reset(){
	alert("다시씁니다");
	document.input.v_jumin.value = "";
	document.input.v_name.value = "";
	document.input.m_no.value = "";
	document.input.v_time.value = "";
	document.input.v_area.value = "";
	document.input.v_confirm = "";
	frm_insert 
	return true;
}

function insertCheck(){
	if(document.frm_insert.v_jumin.value == ""){
		alert("주민번호가 입력되지 않았습니다.");
		frm_insert.v_jumin.focus();
		return false;
	}
	if(document.frm_insert.v_name.value==""){
		alert("이름이 입력되지 않았습니다.");
		frm_insert.v_name.focus();
		return false;
	}
	if(document.frm_insert.v_no.value==""){
		alert("후보자를 선택하지 않았습니다.");
		frm_insert.v_no.focus();
		return false;
	}
	if(document.frm_insert.v_time.value == ""){
		alert("투표시간을 입력하지 않았습니다.");
		frm_insert.v_time.focus();
		return false;
	}
	if(document.frm_insert.v_area.value == ""){
		alert("투표장소를 입력하지 않았습니다.");
		frm_insert.v_area.focus();
		return false;
	}
	if(document.frm_insert.v_confirm[0].checked==false && document.frm_insert.v_confirm[1].checked==false){
		alert("유권자확인을 선택하지 않았습니다.");
		frm_insert.v_confirm[0].focus();
		return false;
	}
	success();
	return true;
}

function success(){
	alert("투표가 완료되었습니다.");
}
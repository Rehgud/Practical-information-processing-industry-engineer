/**
 * 
 */

function insertcheck(){
	if(document.frm_insert.custno.value==""){
		alert("회원번호가 입력되지 않았습니다.");
		frm_insert.custno.focus();
		return false;
	};
	if(document.frm_insert.custno.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		frm_insert.custname.focus();
		return false;
	};
	if(document.frm_insert.phone.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		frm_isnert.phone.focus();
		return false;
	};
	if(document.frm_insert.address.value==""){
		alert("회원주소가 입력되지 않았습니다.");
		frm_insert.address.focus();
		return false;
	};
	if(document.frm_insert.joindate.value==""){
		alert("가입일자가 입력되지 않았습니다.");
		frm_insert.joindate.focus();
		return false;
	}
	if(document.frm_insert.grade.value==""){
		alert("고객등급이 입력되지 않았습니다.");
		frm_insert.grade.focus();
		return false;
	};
	if(document.frm_insert.city.value==""){
		alert("도시코드가 입력되지 않았습니다.");
		frm_insert.city/focus();
		return false;
	};
	if((document.frm_insert.mode.value).equals("insert")){
		alert("회원등록이 완료 되었습니다!");
	}
	else{
		alert("회원정보 수정이 완료되었습니다.");
	}
	
	return true;
	
}
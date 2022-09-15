/**
 * 
 */
/**
 * 
 */

function reset(){
	document.input.saleno.value = "";
	document.input.scode.value = "";
	document.input.saledate.value = "";
	document.input.pcode.value = "";
	document.input.amount.value = "";
}

// inputBox에 빈 곳이 있는지 확인하는 함수
function insertCheck(){
	if(document.frm_insert.saleno.value == ""){
		alert("판매전표번호가 입력되지 않았습니다.");
		frm_insert.saleno.focus();
		return false;
	};
	
	if(document.frm_insert.scode.value == ""){
		alert("지점코드가 입력되지 않았습니다.");
		frm_insert.scode.focus();
		return false;
	};
	
	if(document.frm_insert.saledate.value == ""){
		alert("판매날짜가 입력되지 않았습니다.");
		frm_insert.saledate.focus();
		return false;
	};
	
	if(document.frm_insert.pcode.value == ""){
		alert("피자코드가 입력되지 않았습니다.");
		frm_isnert.pcode.focus();
		return false;
	};
	
	if(document.frm_isnert.amount.value == ""){
		alert("판매수량이 입력되지 않았습니다.");
		frm_insert.amount.focus();
		return false;
	};
	
	success();
	return true;
}

function success(){
	alert("매출전표가 정상적으로 등로되었습니다.");
}
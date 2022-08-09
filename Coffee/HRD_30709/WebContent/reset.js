/**
 * 
 */

// reset 다시쓰기
function reset(){
	document.input.saleno.value="";
	document.input.pcode.value="";
	document.input.saledate.value="";
	document.input.scode.value="";
	document.input.amount.value="";
	frm_insert
	return true;
}

// inputbox에 빈 곳이 있는지 확인하는 함수
function insertCheck(){
	if(document.frm_insert.saleno.value == ""){
		alert("판매번호가 입력되지 않았습니다.");
		frm_insert.slaeno.focus();
		return false;
	};
	if(document.frm_insert.pcode.value == ""){
		alert("상품코드가 입력되지 않았습니다.");
		frm_insert.pcode.focus();
		return false;
	};
	if(document.frm_insert.saledate.value == ""){
		alert("판매날짜가 입력되지 않았습니다.");
		frm_insert.saledate.focus();
		return false;
	};
	if(document.frm_insert.scode.value == ""){
		alert("매장코드가 입력되지 않았습니다.");
		frm_insert.scode.focus();
		return false;
	};
	if(document.frm_insert.amount.value == ""){
		alert("판매수량이 입력되지 않았습니다.");
		frm_insert.amount.focus();
		return false;
	};
	success();
	return true;
}

function success(){
	alery("판매등록이 완료 되었습니다.");
}
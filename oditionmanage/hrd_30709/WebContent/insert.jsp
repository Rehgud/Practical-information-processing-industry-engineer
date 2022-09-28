<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 등록</title>
<link rel = "stylesheet" type = "text/css" href = "CSS/style.css">
<style type = "text/css">
	a: nth-child(1){
		text-decoration: underline;
	}
</style>
</head>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<form name = "frm_insert" action = "action.jsp" method = "post">
	<section>
		<h2>오디션 등록</h2>
		<table border = "1">
			<tr>
				<td>참가번호</td>
				<td align = "left">
					<input type = "text" name = "artist_id" value = "">*참가번호는 (AA00)4자리입니다.
			</tr>
			<tr>
				<td>참가자명</td>
				<td align = "left">
					<input type = "text" name = "artist_name" value = "">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td align = "left">
					<input type = "text" name = "year" value = "">년
					<input type = "text" name = "month" value = "">월
					<input type = "text" name = "day" value = "">일
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td align = "left">
					<input type = "radio" name = "artist_gender" value = "M">남성
					<input type = "radio" name = "artist_gender" value = "F">여성
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td align = "left">
					<select name = "talent">
						<option value = "" selected disabled>특기선택</option>
						<option value = "1">[1]보컬</option>
						<option value = "2">[2]댄스</option>
						<option value = "3">[3]랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td align = "left">
					<input type = "text" name = "agency" value = "">
				</td>
			</tr>
			<tr>
				<td colspan = 2>
					<input type = "submit" value = "오디션 등록" onclick = "return onCheck()">
					<input type = "reset" onclick = "return reset()" value = "다시쓰기" >
				</td>
			</tr>
		</table>
	</section>
	</form>
	
	<script type = "javascript" src = "reset.js"></script>
</body>
</html>
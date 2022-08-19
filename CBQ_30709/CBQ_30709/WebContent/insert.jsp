<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>

<link type = "text/css" rel = "stylesheet" href = "CSS/style.css">
<style type = "text/css">
	a:nth-child(2){
		text-decoration : none;
	}
</style>

<script type = "text/javascript" src = "reset.js"></script>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>투표하기</h3>
		<form name = "frm_insert" action = "action.jsp" method = "post">
		<table border = 1>
			<tr>
				<td>주민번호</td>
				<td align = "left"><input type = "text" name = "v_jumin" value = "">
					예 : 8906153154726
				</td>
			</tr>
			<tr>
				<td>성명</td>
				<td align = "left"><input type ="text" name ="v_name" value =""></td>
			</tr>
			<tr>
				<td>투표번호</td>
				<td align = "left">
					<select name = "v_no">
						<option value = "" selected disabled></option>
						<option value ="1">[1] 김후보</option>
						<option value ="2">[2] 이후보</option>
						<option value ="3">[3] 박후보</option>
						<option value ="4">[4] 조후보</option>
						<option value ="5">[5] 최후보</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>투표시간</td>
				<td align="left"><input type = "text" name = "v_time" value = ""></td>
			</tr>
			<tr>
				<td>투표장소</td>
				<td align="left"><input type ="text" name = "v_area" value = ""></td>
			</tr>
			<tr>
				<td>유권자확인</td>
				<td align = "left"><input type = "radio" name = "v_confirm" value = "Y">확인
								   <input type = "radio" name = "v_confirm" value = "N">미확인</td>
			</tr>
			<tr>	
				<td colspan = "2">
					<input type = "submit" value = "투표하기" onclick = "return insertCheck()">
					<input type = "reset" value = "다시하기" onclick = "return reset()">
				</td>
			</tr>
		</table>
		</form>
	</section>
	
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>

</body>
</html>
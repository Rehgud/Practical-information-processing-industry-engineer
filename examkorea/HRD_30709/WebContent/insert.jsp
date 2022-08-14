<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적입력</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">
<style type = "text/css">
	a:nth-child(2){
		text-decoration: underline;
	}
</style>
<script type = "text/javascript" src = "check_insert.js"></script>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>학생 성적 등록</h3>
		<br>
			<form name = "frm_insert" action = "action.jsp" method = "post">
			<table>
				<tr>
					<td width="100px"> 학번 </td>
					<td><input type = "text" name = "id" value = ""></td>
				</tr>
				<tr>
					<td width="100px"> 국어 </td>
					<td><input type = "text" name = "korean" value = ""></td>
				</tr>
				<tr>
					<td width="100px"> 수학 </td>
					<td><input type = "text" name = "math" value = ""></td>
				</tr>
				<tr>
					<td width="100px"> 영어 </td>
					<td><input type = "text" name = "english" value = ""></td>
				</tr>
				<tr>
					<td width="100px"> 역사 </td>
					<td><input type = "text" name = "history" value = ""></td>
				</tr>
				<tr>
					<td colspan = 2><input type = "submit" value = "등록" onclick ="return check_insert()"></td>
				</tr>
			</table>
			</form>
	</section>
	
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
</body>
</html>
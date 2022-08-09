<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매등록</title>
</head>
<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>

	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<script type = "text/javascript" src="reset.js"></script>
	<style type = "text/css">
		a:nth-child(1){
			text-decoration:underline;
		}
	</style>
	<section>
	<h3>판매등록</h3>
		<form name = "frm_insert" action = "action.jsp" method = "post">
			<table border = "1">
				<tr>
					<th>판매번호</th>
					<td><input type = "text" name = "saleno" value=""></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type = "text" name = "pcode" value=""></td>
				</tr>
				<tr>
					<th>판매날짜</th>
					<td><input type = "text" name = "saledate" value=""></td>
				</tr>
				<tr>
					<th>매장코드</th>
					<td><input type = "text" name = "scode" value=""></td>
				</tr>
				<tr>
					<th>판매수량</th>
					<td><input type = "text" name = "amount" value=""></td>
				</tr>
				<tr>
					<td colspan = "2">
						<input type = "submit" value = "등 록" onclick = "return insertCheck()">
						<input type = "reset" value = "다시쓰기" onclick = "return reset()">
					</td>
				</tr>
			</table>
		</form>
		
		<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	</section>
</body>
</html>
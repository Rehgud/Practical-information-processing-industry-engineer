<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBPKG.Util" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출전표등록</title>
</head>

<link rel = "stylesheet" type = "text/css" href = "CSS/style.css"/>
<script type = "text/javascript" src = "reset.js"></script>
<style>
	a:nth-child(1){
		text-decoration: underline;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h3>피자전문점 판매관리 프로그램</h3>
		<form name = "frm_insert" action = "action.jsp" method = "post">
		<table border = 1>
			<tr>
				<td>매출전표번호</td>
				<td><input type = "text" name = "saleno" value = ""></td>
			</tr>
			<tr>
				<td>지점코드</td>
				<td><input type = "text" name = "scode" value = ""></td>
			</tr>
			<tr>
				<td>판매날짜</td>
				<td><input type = "text" name = "saledate" value = ""></td>
			</tr>
			<tr>
				<td>피자코드</td>
				<td>
					<select name = "pcode">
						<option value="" selected disabled>피자선택</option>
						<option value = "AA01">[AA01] 고르골졸라피자</option>
						<option value = "AA02">[AA02] 치즈피자</option>
						<option value = "AA03">[AA03] 페퍼로니피자</option>
						<option value = "AA04">[AA04] 콤비네이션피자</option>
						<option value = "AA05">[AA05] 고구마피자</option>
						<option value = "AA06">[AA06] 포테이토피자</option>
						<option value = "AA07">[AA07] 불고기피자</option>
						<option value = "AA08">[AA08] 나폴리피자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type = "text" name = "amount" value = ""></td>
			</tr>
			<tr>
				<td colspan = 2>
					<input type = "submit" value = "등록" onclick = "return insertCheck()"/>
					<input type = "reset" value = "다시쓰기" onclick = "return reset()"/>
				</td>
			</tr>
		</table>
		</form>
	</section>
</body>
</html>
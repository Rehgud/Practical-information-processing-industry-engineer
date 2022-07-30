<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<link rel = "stylesheet" type="text/css" href="CSS/style.css">
<style type = "text/css">
	a:nth-child(1){
		text-decoration:underline;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>회원가입</h3>
		<form name = "frm_insert" action = "action.jsp" method = "post">
			<table border = "1">
				<tr>
					<td align = left>아이디</td>
					<td align = left><input type="text" name="userid" value=""></td>
				</tr>
				<tr>
					<td align = left>이름</td>
					<td align = left><input type="text" name = "usernm" value=""></td>
				</tr>
				<tr>
					<td align = left>비밀번호</td>
					<td align = left><input type = "text" name = "passwd" value=""></td>
				</tr>
				<tr>
					<td align = left>주민번호</td>
					<td align = left><input type = "text" name = "jumin" value="">
					-
					<input type = "text" name = "jumin" value=""></td>
				</tr>
				<tr>
					<td align = left>성별</td>
					<td align = left>남<input type = "radio" name = "gender" value="남">
					여<input type = "radio" name = "gender" value="여"></td>
				</tr>
				<tr>
					<td align = left>주소</td>
					<td align = left><input type="text" name="address" value=""></td>
				</tr>
				<tr>
					<td align = left>직업</td>
					<td align = left><select name = "jobcd">
						<option value="" selected disabled>==직업을 선택하세요==</option>
						<option value="1">학생</option>
						<option value="2">회사원</option>
						<option value="3">군인</option>
						<option value="4">공무원</option>
						<option value="5">기타</option>
					</select></td>
				</tr>
				<tr>	
					<td align = left>메일수신여부</td>
					<td align = left>동의함<input type="checkbox" name="mailrcv" value="Y"></td>
				</tr>
				<tr>
					<td align = left>자기소개</td>
					<td align = left><input type="text"
					   		   cols="10" 
					           rows="5" 
					           style="width:200px; height:50px;" 
					           name="intro" 
					       	   value="" />
				</tr>
				<tr>
					<td align = center colspan = 2>
						<input type ="submit" onclick = "dataCheck()" value = "가입">
					</td>
				</tr>
				<tr>
					<td>
						<a href = "index.jsp">홈으로</a>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
</body>
</html>
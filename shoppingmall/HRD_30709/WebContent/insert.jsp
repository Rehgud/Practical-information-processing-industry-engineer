<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">
<script type="text/javascript" src="reset.js"></script>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>홈쇼핑 회원 등록</h3>
		
		<%
		Connection conn = null;
		Statement stmt = null;
		String custno="";
		
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT MAX(CUSTNO) + 1 CUSTNO FROM MEMBER_TBL";
			
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custno = rs.getString("custno");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
		
		<form name="frm_insert" action="action.jsp" method="post">
		<table border = 1>
			<tr>
				<th>회원번호(자동발생)</th>
				<td align="left"><input type="text" name="custno" value="" placeholder="100006"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td align="left"><input type="text" name="custname" value=""></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td align="left"><input type="text" name="phone" value=""></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td align="left"><input type="text" name="address" value=""></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td align="left"><input type="text" name="joindate" value="" placeholder="20160907"></td>
			</tr>
			<tr>
				<th>고객등급(A:VIP, B:일반, C:직원)</th>
				<td align="left"><input type="text" name="grade" value=""></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td align="left"><input type="text" name="city" value=""></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="등록" onclick="return insertcheck">
					<input type="button" value="조회" onclick="location.href="memberlist.jsp">
				</td>
			</tr>
		</table>
		</form>
	</section>
	
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">
<script type="text/javascript" src="reset.js"></script>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>회원목록조회/수정</h3>
		
		<table border = 1>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			
			Statement stmt = con.createStatement();
			String sql = " SELECT " +
					  " CUSTNO " +
						" , CUSTNAME " +
						" , PHONE " +
						" , ADDRESS " +
						" , TO_CHAR(JOINDATE, 'YYYYMMDD') JOINDATE " +
						" , GRADE " +
						" , CITY " +
					" FROM MEMBER_TBL ";
		
			ResultSet rs = stmt.executeQuery(sql);
			
			String grade = "";
			
			while(rs.next()){
				grade = rs.getString("grade");
				if(grade.equals("A")) grade = "VIP";
				else if(grade.equals("B")) grade = "일반";
				else if(grade.equals("C")) grade = "직원";
		%>
		
		<tr>
			<td><%= rs.getString("custno") %></td>
			<td><%= rs.getString("custname") %></td>
			<td><%= rs.getString("phone") %></td>
			<td><%= rs.getString("address") %></td>
			<td><%= rs.getString("joindate") %></td>
			<td><%= rs.getString("grade") %></td>
			<td><%= rs.getString("city") %></td>
		</tr>
		<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
		</table>
	</section>
	
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>
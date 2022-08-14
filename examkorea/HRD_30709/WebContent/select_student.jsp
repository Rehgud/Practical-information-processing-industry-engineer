<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생조회</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">
<style type = "text/css">
	a:nth-child(1){
		text-decoration: underline;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>학생 조회</h3>
		<br>
			<table border = 1>
				<tr>
					<td> 학번 </td>
					<td> 이름 </td>
					<td> 학년 </td>
					<td> 반 </td>
					<td> 번호 </td>
					<td> 성별 </td>
				</tr>
				
				<%
				Connection conn = null;
				Statement stmt = null;
				
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					String sql = " select " +
							" id , " +
							" name , " +
							" substr(id, 1, 1) year , " +
							" substr(id, 2, 2) class , " +
							" substr(id, 4, 2) no , " +
							" gender " +
							" from member_tbl ";
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()){
				%>
				<tr>
				<td><%= rs.getString("id") %></td>
				<td><%= rs.getString("name") %></td>
				<td><%= rs.getString("year") %></td>
				<td><%= rs.getString("class") %></td>
				<td><%= rs.getString("no") %></td>
				<td><%= rs.getString("gender") %></td>
				</tr>
				<%
					
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				%>
			</table>
	</section>
	
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
</body>
</html>
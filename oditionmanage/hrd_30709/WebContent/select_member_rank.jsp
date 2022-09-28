<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가자 등수 조회</title>
<link rel = "stylesheet" type = "text/css" href = "CSS/style.css">
<style type = "text/css">
	a: nth-child(4){
		text-decoration: underline;
	}
</style>
</head>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h2>참가자 등수 조회</h2>
		<table border = "1">
			<tr>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>총점</th>
				<th>평균</th>
				<th>점수</th>
			</tr>
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
				String sql = " select " +
						" a.artist_id, " +
						" a.artist_name, " +
						" to_char(sum(p.point)) as sum_point, " +
						" to_char(sum(p.point)/count(*) , '999.00') as avg_point, " +
						" rank() over(order by sum(p.point) desc) as rank " +
						" from tbl_artist a, tbl_point p " +
						" where a.artist_id = p.artist_id " +
						" group by a.artist_id, a.artist_name ";
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("artist_id") %></td>
				<td><%=rs.getString("artist_name") %></td>
				<td><%=rs.getString("sum_point") %></td>
				<td><%=rs.getString("avg_point") %></td>
				<td><%=rs.getString("rank") %></td>
			</tr>
			<%
			
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
		</table>
	</section>
</body>
</html>
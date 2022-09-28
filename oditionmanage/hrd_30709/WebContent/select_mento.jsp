<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토점수조회</title>
<link rel = "stylesheet" type = "text/css" href = "CSS/style.css">
<style type = "text/css">
	a: nth-child(3){
		text-decoration: underline;
	}
</style>
</head>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h2>멘토점수조회</h2>
		<table border = "1">
			<tr>
				<th>채점번호</th>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>생년월일</th>
				<th>점수</th>
				<th>평점</th>
				<th>멘토</th>
			</tr>
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
				String sql = " select " +
						" p.serial_no, " +
						" a.artist_id, " +
						" a.artist_name, " +
						" substr(a.artist_birth, 1, 4) as year, " +
						" substr(a.artist_birth, 5, 2) as month, " +
						" substr(a.artist_birth, 7, 2) as day, " +
						" p.point, " +
						" case " +
						" when p.point >= 90 then 'A' " +
						" when p.point >= 80 then 'B' " +
						" when p.point >= 70 then 'C' " +
						" when p.point >= 60 then 'D' " +
						" else 'F' end as gradepoint, " +
						" m.mento_name " +
						" from tbl_artist a, tbl_mento m, tbl_point p " +
						" where a.artist_id = p.artist_id and m.mento_id = p.mento_id " +
						" order by 1 ";
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("serial_no") %></td>
				<td><%=rs.getString("artist_id") %></td>
				<td><%=rs.getString("artist_name") %></td>
				<td><%=rs.getString("year") %>년
					<%=rs.getString("month") %>월
					<%=rs.getString("day") %>일
				</td>
				<td><%=rs.getString("point") %></td>
				<td><%=rs.getString("gradepoint") %></td>
				<td><%=rs.getString("mento_name") %></td>
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
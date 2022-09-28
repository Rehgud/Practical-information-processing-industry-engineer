<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가자목록조회</title>
<link rel = "stylesheet" type = "text/css" href = "CSS/style.css">
<style type = "text/css">
	a: nth-child(2){
		text-decoration: underline;
	}
</style>
</head>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h2>참가자목록조회</h2>
		<table border = "1">
			<tr>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>특기</th>
				<th>소속사</th>
			</tr>
			<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
				String sql = 
						" select " +
						" artist_id, " +
						" artist_name, " +
						" substr(artist_birth, 1, 4) as year, " +
						" substr(artist_birth, 5, 2) as month, " +
						" substr(artist_birth, 7, 2) as day, " +
						" case " +
						" when artist_gender = 'F' then '여' " +
						" when artist_gender = 'M' then '남' " +
						" else 'NULL' end as artist_gender, " +
						" case " +
						" when talent = '1' then '보컬' " +
						" when talent = '2' then '댄스' " +
						" when talent = '3' then '랩' " +
						" else 'NULL' end as talent, " +
						" agency " +
						" from tbl_artist ";
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("artist_id") %></td>
				<td><%=rs.getString("artist_name") %></td>
				<td><%=rs.getString("year") %>년
					<%=rs.getString("month") %>월
					<%=rs.getString("day") %>일
				</td>
				<td><%=rs.getString("artist_gender") %></td>
				<td><%=rs.getString("talent") %></td>
				<td><%=rs.getString("agency") %></td>
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
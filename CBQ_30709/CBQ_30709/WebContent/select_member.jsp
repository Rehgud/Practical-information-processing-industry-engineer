<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
</head>

<link type = "text/css" rel = "stylesheet" href = "CSS/style.css">
<style type = "text/css">
	a:nth-child(1){
		text-decoration : none;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>후보조회</h3>
		<table border = "1">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<%
			Connection con = null;
			Statement stmt = null;
			
			try{
				con = Util.getConnection();
				stmt = con.createStatement();
				
				String sql = 
						" select " +
						" m.m_no , " +
						" m.m_name , " +
						" p.p_name , " +
						" case " +
						" when m.p_school = '1' then '고졸' " +
						" when m.p_school = '2' then '학사' " +
						" when m.p_school = '3' then '석사' " +
						" when m.p_school = '4' then '박사' " +
						" else 'NULL' end as school , " +
						" substr(m.m_jumin, 1, 6) as jumin1 , " +
						" substr(m.m_jumin, 7, 7) as jumin2 , " +
						" m.m_city , " +
						" p.p_tel1, p.p_tel2, p.p_tel3 " +
						" from tbl_member_202005 m, tbl_party_202005 p " +
						" where m.p_code = p.p_code ";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				String school="";
				while(rs.next()){
			
			%>
			<tr>
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("p_name") %></td>
				<td><%=rs.getString("school")%></td>
				<td><%=rs.getString("jumin1") %>-<%=rs.getString("jumin2") %></td>
				<td><%=rs.getString("m_city") %></td>
				<td><%=rs.getString("p_tel1") %>-<%=rs.getString("p_tel2") %>-<%=rs.getString("p_tel3") %></td>
				<%
					}
				}catch(Exception e){
					e.printStackTrace();
				} %>
				
			</tr>
		</table>
	</section>
	
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>

</body>
</html>
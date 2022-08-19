<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보자등수</title>
</head>

<link type = "text/css" rel = "stylesheet" href = "CSS/style.css">
<style type = "text/css">
	a:nth-child(4){
		text-decoration : none;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>후보자등수</h3>
		<table border = "1">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
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
						" count(case when v.v_confirm = 'Y' then '확인' end ) as rank " +
						" from tbl_member_202005 m, tbl_vote_202005 v " +
						" where m.m_no = v.v_no " +
						" group by m.m_no , m.m_name " +
						" order by rank desc " ;
				
				ResultSet rs = stmt.executeQuery(sql);
				
				String school="";
				while(rs.next()){
			
			%>
			<tr>
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("rank") %></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "CSS/style.css">
<style type = "text/css">
	a:nth-child(3){
		text-decoration:underline;
	}
</style>
<body>
<header><jsp:include page = "header.jsp"></jsp:include></header>
<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
<section>
	<h3>회원 검색</h3>
<form action = "db_join.jsp" method = "post">
	<table border="1">
	<%
		String sel = request.getParameter("sel");
		String gum = request.getParameter("gum");
	%>
	<caption style = "text-align:left;">검색조건:<select name = "gum">
					<option value = "userid">회원id</option>
					<option value = "usernm">회원이름</option>
					</select><input type = "text" name = "sel"><input type = "submit" value = "검색">
	</caption>
</form>
		<tr>
			<th>회원ID</th>
			<th>회원명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>직업</th>
			<th>자기소개</th>
		</tr>
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = 
			" select userid, usernm, substr(jumin, 1, 6 ) as dates, CASE WHEN gender = '1' THEN '남' WHEN gender = '2' THEN '여' ELSE 'NULL' END as gender, CASE WHEN jobcd = 1 THEN '학생' WHEN jobcd = 2 THEN '회사원' WHEN jobcd = 3 THEN '군인' WHEN jobcd = 4 THEN '공무원' WHEN jobcd = 5 THEN '기타' ELSE 'NULL' END as job, intro from tbl_guest ";
		if(sel !="" && sel!=null){
			if(gum.equals("userid")){
				sql = sql + " where userid = '" + sel + "' ";
			}
			else{
				sql = sql + " where usernm = '" + sel + "' ";
			}
		}
		

	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getString("userid") %></td>
			<td><%=rs.getString("usernm") %></td>
			<td><%=rs.getString("dates") %></td>
			<td><%=rs.getString("gender") %></td>
			<td><%=rs.getString("job") %></td>
			<td><%=rs.getString("intro") %></td>
		</tr>
<%
	}
	stmt.close();
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
	</table>
	<a href = "index.jsp">홈으로</a>
</section>
<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
</body>
</html>
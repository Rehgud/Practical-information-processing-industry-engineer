<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBPKG.Util" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점별 매출 현황</title>
</head>

<link rel = "stylesheet" type = "text/css" href = "CSS/style.css"/>
<style>
	a:nth-child(3){
		text-decoration: underline;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h3>지점별 매출 현황</h3>
		<table border = 1>
			<tr>
				<th>지점 코드</th>
				<th>지점 명</th>
				<th>총매출액</th>
			</tr>
			<%
			try {
	Class.forName("oracle.jdbc.OracleDriver");
  	Connection con = DriverManager.getConnection
               ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
  	Statement stmt = con.createStatement();
  	
	String sql = 
		" select sp.scode, sp.sname, to_char(sum(sl.amount*p.cost)) cost " +
" from tbl_shop_01 sp, tbl_salelist_01 sl, tbl_pizza_01 p " +
" where sp.scode = sl.scode and p.pcode = sl.pcode " +
" group by sp.scode, sp.sname " +
" order by 1 ";

	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("scode")%></td>
		<td><%=rs.getString("sname")%></td>
		<td><%=rs.getString("cost")%></td>
	</tr>	
<%
	}

} catch(Exception e) {
	e.printStackTrace();
}
%>
		</table>
	</section>
</body>
</html>
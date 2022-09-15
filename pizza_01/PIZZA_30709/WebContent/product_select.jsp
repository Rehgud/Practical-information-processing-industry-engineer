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
	a:nth-child(4){
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
				<th>피자 코드</th>
				<th>피자 명</th>
				<th>총매출액</th>
			</tr>
			<%
			try {
	Class.forName("oracle.jdbc.OracleDriver");
  	Connection con = DriverManager.getConnection
               ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
  	Statement stmt = con.createStatement();
  	
	String sql = 
			" select p.pcode, p.pname, " +
" to_char(sum(sl.amount*p.cost), '999,999,999,999') cost  " +
" from tbl_pizza_01 p, tbl_salelist_01 sl, tbl_shop_01 sp  " +
" where sp.scode = sl.scode " +
" group by p.pcode, p.pname  " +
" order by 3 desc ";

	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("pcode")%></td>
		<td><%=rs.getString("pname")%></td>
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
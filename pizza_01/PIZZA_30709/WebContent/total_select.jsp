<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBPKG.Util" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합매출현황조회</title>
</head>

<link rel = "stylesheet" type = "text/css" href = "CSS/style.css"/>
<style>
	a:nth-child(2){
		text-decoration: underline;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h3>피자전문점 판매관리 프로그램</h3>
		<table border = 1>
			<tr>
				<th>매출전표번호</th>
				<th>지점</th>
				<th>판매일자</th>
				<th>피자코드</th>
				<th>피자명</th>
				<th>판매수량</th>
				<th>매출액</th>
			</tr>
			<%
			try {
	Class.forName("oracle.jdbc.OracleDriver");
  	Connection con = DriverManager.getConnection
               ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
  	Statement stmt = con.createStatement();
  	
	String sql = 
		"SELECT "+
		    "B.saleno, "+
		    "C.scode, "+
		    "C.sname, "+
		    "TO_CHAR(B.saledate, 'YYYY-MM-DD') saledate, "+
		    "A.pcode, "+
		    "A.pname, "+
		    "B.amount, "+
		    "TO_CHAR(B.amount * A.cost, '999,999,999,999') cost "+
		"FROM "+
		    "tbl_pizza_01 A, "+
		    "tbl_salelist_01 B, "+
		    "tbl_shop_01 C "+
		"WHERE "+
			"A.pcode = B.pcode "+ 
			"AND C.scode = B.scode "+
		"ORDER BY 1 ";

	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()){
%>
	<tr>
		<td><%=rs.getInt("saleno")%></td>
		<td><%=rs.getString("scode")%>-<%=rs.getString("sname")%></td>
		<td><%=rs.getString("saledate")%></td>
		<td><%=rs.getString("pcode")%></td>
		<td><%=rs.getString("pname")%></td>
		<td><%=rs.getInt("amount")%></td>
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
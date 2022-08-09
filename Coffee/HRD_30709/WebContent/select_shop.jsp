<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장별 판매액</title>
</head>
<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>

	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<style type = "text/css">
		a:nth-child(3){
			text-decoration:underline;
		}
	</style>
	<section>
	<h3>매장별 판매액</h3>
		<table border = "1">
			<tr>
				<th>매장코드</th>
				<th>매장명</th>
				<th>매장별 판매액</th>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					String sql = 
							" select " +
							" sp.scode , " +
							" sp.sname , " +
							" to_char(sum(sl.amount * p.cost), '999,999,999,999') cost " +
							" from tbl_shop_01 sp, tbl_product_01 p, tbl_salelist_01 sl " +
							" where sp.scode = sl.scode and p.pcode = sl.pcode " +
							" group by sp.scode, sp.sname " +
							" order by 1 " ;
					
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
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
		
		<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	</section>
</body>
</html>
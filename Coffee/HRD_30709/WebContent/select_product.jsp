<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품별 판매액</title>
</head>
<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>

	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<style type = "text/css">
		a:nth-child(4){
			text-decoration:underline;
		}
	</style>
	<section>
	<h3>상품별 판매액</h3>
		<table border = "1">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>상품별 판매액</th>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					String sql = 
							" select " +
							" p.pcode , " +
							" p.name , " +
							" to_char(sum(sl.amount * p.cost), '999,999,999,999') cost " +
							" from tbl_shop_01 sp, tbl_salelist_01 sl, tbl_product_01 p " +
							" where p.pcode = sl.pcode and sp.scode = sl.scode " +
							" group by p.pcode, p.name " +
							" order by 1 " ;
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("pcode")%></td>
				<td><%=rs.getString("name")%></td>
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
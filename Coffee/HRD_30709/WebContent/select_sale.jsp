<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
</head>
<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>

	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<style type = "text/css">
		a:nth-child(2){
			text-decoration:underline;
		}
	</style>
	<section>
	<h3>판매현황</h3>
		<table border = "1">
			<tr>
				<th>판매번호</th>
				<th>상품코드</th>
				<th>판매날짜</th>
				<th>매장코드</th>
				<th>상품명</th>
				<th>판매수량</th>
				<th>총판매액</th>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					String sql = " select " +
							" sl.saleno , " +
							" p.pcode , " +
							" to_char(sl.saledate, 'YYYY-MM-DD') saledate , " +
							" sp.scode , " +
							" p.name , " +
							" sl.amount , " +
							" to_char(sl.amount * p.cost, '999,999,999,999') cost " +
							" from " +
							" tbl_product_01 p , " +
							" tbl_shop_01 sp , " +
							" tbl_salelist_01 sl " +
							" where " +
							" p.pcode = sl.pcode  " +
							" and " +
							" sp.scode = sl.scode " ; 
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("saleno")%></td>
				<td><%=rs.getString("pcode")%></td>
				<td><%=rs.getString("saledate")%></td>
				<td><%=rs.getString("scode")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("amount")%></td>
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
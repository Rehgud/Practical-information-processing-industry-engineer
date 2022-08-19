<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
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
		<h3>투표검수조회</h3>
		<table border = "1">
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<%
			Connection con = null;
			Statement stmt = null;
			
			try{
				con = Util.getConnection();
				stmt = con.createStatement();
				
				String sql = 
						" select " +
						" v_name, v_jumin, v_no, v_time, v_confirm " +
						" from tbl_vote_202005 " +
						" where v_area = '제1투표장'" ;
				
				ResultSet rs = stmt.executeQuery(sql);
				
				String gender="";
				String check="";
				
				Calendar calendar = Calendar.getInstance();
				int year = calendar.get(Calendar.YEAR);
				int month = calendar.get(Calendar.MONTH);
				int day = calendar.get(Calendar.DATE);
			
				while(rs.next()){
					gender = (rs.getString("v_jumin").substring(6, 7).charAt(0) == '1'?"남":"여");
					check = (rs.getString("v_confirm").charAt(0) == 'N'?"미확인":rs.getString("v_confirm").charAt(0)=='Y'?"확인":"확인불가");
					int age = (year - 1900 - Integer.parseInt(rs.getString("v_jumin").substring(0,2)));
					
					if(month > Integer.parseInt(rs.getString("v_jumin").substring(2, 4))){
						if(day > Integer.parseInt(rs.getString("v_jumin").substring(5, 6)))
							age--;
					}
					
			%>
			<tr>
				<td><%=rs.getString("v_name") %></td>
				<td>
					<%=rs.getString("v_jumin").substring(0,2) %>년
					<%=rs.getString("v_jumin").substring(2, 4) %>월
					<%=rs.getString("v_jumin").substring(4, 6) %>일생
				</td>
				<td><%=age %>세</td>
				<td><%=gender %></td>
				<td><%=rs.getString("v_no") %></td>
				<td><%=rs.getString("v_time").substring(0, 2) %>:<%=rs.getString("v_time").substring(2,4) %></td>
				<td><%=check %></td>
			<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
				
			</tr>
		</table>
	</section>
	
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>

</body>
</html>
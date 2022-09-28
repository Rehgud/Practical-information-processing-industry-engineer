<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		String artist_id = request.getParameter("artist_id");
		String artist_name = request.getParameter("artist_name");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String artist_gender = request.getParameter("artist_gender");
		String talent = request.getParameter("talent");
		String agency = request.getParameter("agency");
		
		String sql = " insert into tbl_artist values('"+ artist_id +"', '"+ artist_name +"', '"+ year+month+day +"', '"+ artist_gender +"', '"+ talent +"', '"+ agency +"')";
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
		
%>
<jsp:include page = "select_member.jsp"></jsp:include>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%>
<%@ page import = "DBPKG.Util"%>

<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String id = request.getParameter("id");
	String korean = request.getParameter("kroean");
	String math = request.getParameter("math");
	String english = request.getParameter("english");
	String history = request.getParameter("history");
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = 
				" insert into score_tbl " +
				" values('"+ id +"', "+ korean +", "+ math +", "+ english +", "+ history +" )";
		
		stmt.executeUpdate(sql);
%>
	<jsp:include page = "insert.jsp"></jsp:include>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>


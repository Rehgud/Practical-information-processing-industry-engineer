<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%>
<%@ page import = "DBPKG.Util"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String v_jumin = request.getParameter("v_jumin");
	String v_name = request.getParameter("v_name");
	String v_no = request.getParameter("v_no");
	String v_time = request.getParameter("v_time");
	String v_area = request.getParameter("v_area");
	String v_confirm = request.getParameter("v_confirm");
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		
		String sql = 
				" insert into tbl_vote_202005" +
				" values( '"+ v_jumin +"' , '"+ v_name +"' , '"+ v_no +"' , '"+ v_time +"' , '"+ v_area +"' , '"+ v_confirm +"' )" ;
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

%>

<jsp:include page = "select_gumsu.jsp"></jsp:include>

<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
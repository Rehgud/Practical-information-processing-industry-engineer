<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String scode = request.getParameter("scode");
	String saledate = request.getParameter("saledate");
	String amount = request.getParameter("amount");
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = 
				" insert into tbl_salelist_01 values("+ saleno +", '"+ scode +"', to_date('"+ saledate +"', 'yyyy-mm-dd'), '"+ pcode +"', "+ amount +" )";
		stmt.executeUpdate(sql);
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>

<jsp:include page = "total_select.jsp"></jsp:include>
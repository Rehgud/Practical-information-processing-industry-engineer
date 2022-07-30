<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String mode 	= request.getParameter("mode"); // 삽입(insert) 및 수정(modify) 선택
	
	String custno   = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone 	= request.getParameter("phone");
	String address 	= request.getParameter("address");
	String joindate	= request.getParameter("joindate");
	String grade	= request.getParameter("grade");
	String city		= request.getParameter("city");

	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
                    ("jdbc:oracle:thin:@//localhost:1521/xe", 
                     "system", "1234");
		Statement  stmt = con.createStatement();
		String sql = "";
		
		// mode 변수 값에 따라 삽입 및 수정 작업 선택 실행
		switch(mode) {
		case "insert" :
			sql =	" INSERT MEMBER_TBL "+
					" VALUES(  "+ custno 			  + ", "+
		    		"'"+ custname    		  + "', "+ 
		    		"'"+ phone				  + "', "+ 
		    		"'"+ address 			  + "', "+ 
		    		" TO_DATE('"+ joindate    + "', 'YYYY-MM-DD'), "+
		    		"'"+ grade 	              + "', "+ 
		    		"'"+ city 	              + "') ";
			stmt.executeUpdate(sql);
%>
   			<!-- 데이터 삽입 후 회원등록 페이지로 이동 -->
   			<jsp:forward page="=insert.jsp"></jsp:forward>	
<%			
			break;
			
		case "modify" :
			sql =	" UPDATE MEMBER_TBL "+
					" SET "+    
					" custname   = '"+ custname   + "', "+
					" phone      = '"+ phone      + "', "+
					" address    = '"+ address    + "', "+
					" joindate   = TO_DATE( '"+ joindate   + "', 'YYYY-MM-DD'), "+
					" grade      = '"+ grade      + "', "+
					" city       = '"+ city       + "' " +
					" WHERE  custno   =  " + custno ;
			stmt.executeUpdate(sql);
%>
   			<!-- 데이터 삽입 후 회원조회/수정 페이지로 이동 -->
   			<jsp:forward page="memberlist.jsp"></jsp:forward>			
<%
			break;
		} 	// switch 닫는 괄호		
	} 		// try 닫는 괄호	
	catch(Exception e) {
		e.printStackTrace();
	}	
%>
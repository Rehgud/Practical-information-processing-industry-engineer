<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>학생성적조회</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<style type="text/css">
	a:nth-child(3) {
		text-decoration: underline;
	}
</style>

<body>
<header> <jsp:include page="header.jsp" /> </header>
<nav> <jsp:include page="nav.jsp" /> </nav>

<section>
<h3> 학생 성적 조회 </h3>

<form action="db_select_score.jsp" method="post"> 
	<%
		String sch_id = request.getParameter("sch_id");
	%>
	<table>
		<tr>
			<td> 학번 </td>
			<td> <input type="text"   name="sch_id" value="" /> </td>
			<td> <input type="submit" value="검 색" /> </td>
		</tr>
		
	</table>
</form>
<br>

<table border="1">
	<tr>
		<td> 학번 </td>
		<td> 이름 </td>
		<td> 학년 </td>
		<td> 반 </td>
		<td> 번호 </td>
		<td> 성별 </td>
		<td> 국어 </td>
		<td> 수학 </td>
		<td> 영어 </td>
		<td> 역사 </td>
		<td> 합계 </td>
		<td> 평균 </td>
		<td> 순위 </td>
	</tr>
<%
	Connection conn = null;
	Statement  stmt = null;
	
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql =
			" SELECT "+
			"	  A.ID "+
			"	, A.NAME "+
			"	, SUBSTR(A.ID, 1, 1) AS YEAR "+
			"	, SUBSTR(A.ID, 2, 2) AS CLASS "+
			"	, SUBSTR(A.ID, 4, 2) AS NO "+
			"	, A.GENDER "+
			"	, B.KOREAN "+
			"	, B.MATH "+
			"	, B.ENGLISH "+
			"	, B.HISTORY "+
			"	, (B.KOREAN + B.MATH + B.ENGLISH + B.HISTORY) AS SUM "+
			"	, (B.KOREAN + B.MATH + B.ENGLISH + B.HISTORY) / 4 AS AVG "+
			"	, RANK() OVER (ORDER BY (B.KOREAN + B.MATH + B.ENGLISH + B.HISTORY) DESC) AS RANK "+
			"FROM  "+
			"	MEMBER_TBL A, SCORE_TBL B "+
			"WHERE "+
			"	A.ID = B.ID ";
		if(sch_id != "" && sch_id != null)
			sql += "AND A.ID = "+ sch_id ;
					
			sql += " ORDER BY 11 DESC " ;
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
%>	
	<tr>
		<td> <%= rs.getString("id") %> </td>
		<td> <%= rs.getString("name") %> </td>
		<td> <%= rs.getString("year") %> </td>
		<td> <%= rs.getString("class") %> </td>
		<td> <%= rs.getString("no") %> </td>
		<td> <%= rs.getString("gender") %> </td>
		<td> <%= rs.getString("korean") %> </td>
		<td> <%= rs.getString("math") %> </td>
		<td> <%= rs.getString("english") %> </td>
		<td> <%= rs.getString("history") %> </td>
		<td> <%= rs.getString("sum") %> </td>
		<td> <%= rs.getString("avg") %> </td>
		<td> <%= rs.getString("rank") %> </td>
	</tr>
<%
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>

	<tr>
		<td colspan="6"></td>
		<td>국어 총합</td>
		<td>수학 총합</td>
		<td>영어 총합</td>
		<td>역사 총합</td>
		<td>총 합계</td>
		<td>총 평균</td>
		<td>------</td>
	</tr>
<%
		String sql = 
			"SELECT "+
			"	  SUM(KOREAN) AS TOT_KOR "+
			"	, SUM(MATH) AS TOT_MAT "+
			"	, SUM(ENGLISH) AS TOT_ENG "+
			"	, SUM(HISTORY) AS TOT_HIS "+
			"	, TO_CHAR( SUM( KOREAN + MATH + ENGLISH + HISTORY ), '999999.0' ) AS TOT_SUM "+
			"	, TO_CHAR( SUM( KOREAN + MATH + ENGLISH + HISTORY )/ COUNT(ID), '999999.0' ) AS TOT_AVG "+
			"FROM  "+
			"	SCORE_TBL " ;

		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
%>
	<tr>
		<td colspan="6"></td>
		<td> <%= rs.getString("tot_kor") %> </td>
		<td> <%= rs.getString("tot_mat") %> </td>
		<td> <%= rs.getString("tot_eng") %> </td>
		<td> <%= rs.getString("tot_his") %> </td>
		<td> <%= rs.getString("tot_sum") %> </td>
		<td> <%= rs.getString("tot_avg") %> </td>
		<td>------ </td>
	</tr>		
</table>


</section>
<pre>



</pre>
<footer> <jsp:include page="footer.jsp" /> </footer>
</body>
</html>
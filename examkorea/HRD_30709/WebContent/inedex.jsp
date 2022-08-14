<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈으로</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">
<style type = "text/css">
	a:nth-child(5){
		text-decoration: underline;
	}
</style>
	
<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>학생성적 관리 프로그램</h3>
		<br>
		<pre style = "text-align = left">
학생과 학생 성적에 관한 데이터베이스를 구축하고 관리하기 위한
프로그램입니다.
			
1. 학생정보 및 학생성적 테이블을 생성하고 샘플데이터를 추가한다.
2. 학생조회, 학생성적 입력, 학생성적 조회 프로그램을 작성한다.
3. 올바르게 구현되었는지 확인한다.
		</pre>
	</section>
	
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
</body>
</html>
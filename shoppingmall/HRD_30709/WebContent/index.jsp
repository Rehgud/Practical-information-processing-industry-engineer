<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈으로</title>
</head>

<link rel="stylesheet" type="text/css" href="CSS/style.css">
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	
	<section>
		<h3>쇼핑몰 회원관리 프로그램</h3>
		<pre>
쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
프로그램 작업 순서
1. 회원정보 테이블을 생성한다.
2. 매출정보 테이블을 생성한다.
3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.
4. 회원정보 입력 화면프로그램을 작성한다.
5. 회원정보 조회 프로그램을 작성한다.
5. 회원매출정보 조회 프로그램을 작성한다.
		</pre>
	</section>
	
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>
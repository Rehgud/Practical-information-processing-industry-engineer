<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈으로</title>
</head>

<link rel = "stylesheet" type = "text/css" href = "CSS/style.css"/>
<style>
	a:nth-child(5){
		text-decoration: underline;
	}
</style>

<body>
	<header><jsp:include page = "header.jsp"></jsp:include></header>
	<nav><jsp:include page = "nav.jsp"></jsp:include></nav>
	<footer><jsp:include page = "footer.jsp"></jsp:include></footer>
	
	<section>
		<h3>피자전문점 판매관리 프로그램</h3>
		<pre>
피자전문점 판매관리 프로그램을 작성한다.

1. 피자코드 테이블을 생성한다.
2. 지점코드 테이블을 생성한다.
3. 매출정보 테이블을 생성한다.
4. 생성된 테이블에 샘플데이터를 추가하시오.
5. 매출전표등록 프로그램을 작성하시오.
6. 매출조회 프로그램을 작성하시오.
		</pre>
	</section>
</body>
</html>
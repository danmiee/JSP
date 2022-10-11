<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp 안 들어감 / 일반 html과 동일 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>

	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<!-- ? 뒤의 문자 : queryString
	RequestWebInfo.jsp 안에 eng를 받는 코드가 있어야함
	주소에 정보가 노출됨 -->
	<a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">
	Get 방식 전송
	</a>
	<br />
	<!-- RequestParameter.jsp에서 post라는 method 제공 -->
	<!-- post : 정보를 숨긴 채로 정보전송 -->
	<form action="RequestWebInfo.jsp" method="post">
		영어 : <input type="text" name="eng" value="Bye" /><br />
		한글 : <input type="text" name="han" value="잘 가" /><br />
		<input type="submit" value="POST 방식 전송" />
	</form>
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<!-- post방식으로 요청하고 RequestParameter.jsp에서 응답한다 -->
	<form method="post" action="RequestParameter.jsp">
		아이디 : <input type="text" name="id" value="" /><br />
		성별 :
		<!-- name이 같은 radio는 하나의 toggle -->
		<input type="radio" name="sex" value="man" />남자
		<input type="radio" name="sex" value="woman" checked="checked" />여자
		<br />
		관심사항 : 
		<!-- checkbox는 배열로 받음 -->
		<input type="checkbox" name="favo" value="eco" />경제
		<input type="checkbox" name="favo" value="pol" checked="checked" />정치
		<input type="checkbox" name="favo" value="ent" />연예<br />
		자기소개:
		<textarea name="intro" cols="30" rows="4"></textarea>
		<br />
		<!-- submit : 서버로 제출 -->
		<input type="submit" value="전송하기" />
	</form>
	
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
	<a href="RequestHeader.jsp">
		요청 헤더 정보 읽기
	</a>

</body>
</html>
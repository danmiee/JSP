<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>

	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<!-- request : 요청에 대해 응답하는 내장 객체 -->	
		<li>데이터 전송 방식 : <%= request.getMethod() %></li>
		<li>URL : <%= request.getRequestURL() %></li>
		<li>URI : <%= request.getRequestURI() %></li>
		<li>프로토콜 : <%= request.getProtocol() %></li>
		<li>서버명 : <%= request.getServerName() %></li>
		<li>서버 포트 : <%= request.getServerPort() %></li>
		<li>클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
		<li>쿼리스트링 : <%= request.getQueryString() %></li>
		<!-- get 방식 전송 한글 정상 출력 / 상단의 pageEncoding에 따라 노출 -->
		<li>전송된 값 1 : <%= request.getParameter("eng") %></li>
		<!-- post 방식 전성 한글 깨짐 / RequestParameter.jsp에서 보완방법 설명 -->
		<li>전송된 값 2 : <%= request.getParameter("han") %></li>
	</ul>

</body>
</html>
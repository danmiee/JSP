<%@ page import="javajsp.NumberOfCases" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경우의 수</title>
</head>
<body>
	[문제]<br/>
	2g, 3g, 5g의 추가 각각 10개씩 있을 때,<br/> 
	10~100사이의 임의의 값을 입력 받아서 추의 합이 되는 경우를 찾아서<br/>
	출력하세요. 단, 각각의 추는 1개 이상은 사용되어야 합니다<br/><br/>
	
	[결과]<br/>
<%
	String snum = request.getParameter("num");
	int num = Integer.parseInt(snum);
	
	out.print("입력값 : " + num + "<br/>");
	out.print(NumberOfCases.print(num));
%>
</body>
</html>
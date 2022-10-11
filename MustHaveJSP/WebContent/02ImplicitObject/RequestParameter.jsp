<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>

<%
/* post방식 인코딩 */
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String sex = request.getParameter("sex");
String[] favo = request.getParameterValues("favo");
String favoStr = "";
if (favo != null) {
	for (int i = 0; i < favo.length; i++) {
		favoStr += favo[i] + " ";
	}
}
/* replace("찾을 문자열", "변경할 문자열") : 찾아바꾸기
	자기소개 입력란 내 줄바꿈 한 내용을 찾아 <br />으로 변경
*/
String intro = request.getParameter("intro").replace("\r\n", "<br/>");
%>

<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사항 : <%= favoStr %></li>
	<li>자기소개 : <%= intro %></li>
</ul>

</body>
</html>
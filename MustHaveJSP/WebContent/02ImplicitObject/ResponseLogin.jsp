<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - response</title>
</head>
<body>

<%
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
if(id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
	/* sendRedirect : 새로운 페이지를 새로 호출함 > 클라이언트 리턴 2번 받음 */
	response.sendRedirect("ResponseWelcome.jsp");
} else {
	/* getRequestDispather : 서버 내부적으로 처리 후 다른페이지로 토스
	토스받은 페이지에서 리턴 > 클라이언트 리턴 1번 받음 */
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
}
%>

</body>
</html>
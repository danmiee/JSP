<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 선언부에서 선언 후 html에 활용
<% String name = request.getParameter("name"); %> 
html코드에는 <%= name %>
--%>

<%-- 
<% pageContext.setAttribute("name", request.getParameter("name")); %>
html코드에는 ${ name }
--%>
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 폼값 처리</title></head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
    <h3>EL로 폼값 받기</h3>
    <ul>
    	<!-- 선언부없이 표현식에 직접 사용 -->
        <li>이름 : <%= request.getParameter("name") %></li>
        <li>성별 : <%= request.getParameter("gender") %></li>
        <li>학력 : <%= request.getParameter("grade") %></li>
        <li>관심사항 : <%= request.getParameterValues("inter")[0]%>
        <%= request.getParameterValues("inter")[1]%>
        <%= request.getParameterValues("inter")[2]%>
        <%= request.getParameterValues("inter")[3]%></li> 
    </ul>
</body>
</html>
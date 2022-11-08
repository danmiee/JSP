<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 객체 매개변수</title></head>
<body>
    <%
    request.setAttribute("personObj", new Person("홍길동", 33));
    request.setAttribute("stringObj", "나는 문자열");
    /* 기본 객체를 참조연산자로 선언하는 방식은 사용되지 않음 > new Integer(99)를 99로 변경 */
    request.setAttribute("integerObj", 99);
    %>
    <!-- jsp: 액션태그 -->
    <!-- jsp:param get방식 전송 시 queryString으로 표시됨 
    	프로그래밍 관점에서 forward행에 이어서 적는 것보다 효율적 -->
    <jsp:forward page="ObjectResult.jsp">
        <jsp:param value="10" name="firstNum" />
        <jsp:param value="20" name="secondNum" />
    </jsp:forward>
</body>
</html>
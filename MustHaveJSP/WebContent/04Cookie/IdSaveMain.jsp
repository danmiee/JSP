<%@ page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginId = CookieManager.readCookie(request, "loginId");
	/*
	static으로 정의된 메소드는 객체없이 호출 가능
	일반적으로는 객체 생성하여 사용하고
	객체없이 호출하는 경우는 특정 상황이 있으나
	지금은 배우는 과정이기 때문에 객체 호출하여 사용하는 방식으로 통일
	*/

String cookieCheck = "";
	// CookieManager.readCookie에서 null인 경우 ""을 return하기 때문에 이렇게 사용 가능
if (!loginId.equals("")) {
    cookieCheck = "checked";
}
%>
<html>
<head><title>Cookie - 아이디 저장하기</title></head>
<body>
    <h2>로그인 페이지</h2>
    <form action="IdSaveProcess.jsp" method="post">
    	<!-- form의 특징
    		1. 반드시 submit 해야한다.
    		2. submit하면 action 속성에 기재된 것을 호출한다.
    		3. parameter로 넘어감
    			- 형식 : name - 키 / value - 값
    			- get : 주소표시줄에 보임
    			- post : 주소표시줄에는 안 보이지만 parameter 넘어감
     	-->
    아이디 : <input type="text" name="user_id" value="<%= loginId %>" />  
        <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> />
        	<!-- html 속성 checkbox : checked라고 기재되어있으면 체크표시됨 -->
        아이디 저장하기
    <br />
    패스워드 : <input type="text" name="user_pw" />
    <br />
    <input type="submit" value="로그인하기" />
    	<!-- Submit하면 IDSaveProcess.jsp 호출 -->
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
<!-- 부트스트랩 삽입 : 주로 head에 사용함 -->
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
	a { text-decoration: none; }
</style>
</head>
<body>
	<!-- mvcboard와 연결하기 위해 link페이지 include -->
	<jsp:include page="../Common/Link_H2_MVC.jsp" />
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;">
		<!-- 처음 접속 시 setAttribute값이 없으므로 null / NPE 방지를 위해 조건문 활용 -->
		<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
		if (session.getAttribute("UserId") == null) { // 로그인 상태 확인
		// 로그아웃 상태
	%>
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		아이디 : 
		<input type="text" name="user_id" /><br />
		패스워드 : 
		<input type="password" name="user_pw" /><br />
		<input type="submit" value="로그인하기" />
	</form>
	<%
	} else { // 로그인된 상태
	%>
	<%=session.getAttribute("UserName")%>
	회원님, 로그인하셨습니다.
	<br />
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>
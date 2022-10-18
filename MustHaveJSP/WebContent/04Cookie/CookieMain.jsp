<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
		// 쿠키생성 - 쿠키이름 : myCookie, 값 : 쿠키맛나요
	cookie.setPath(request.getContextPath());
		// 웹앱 전체에서 myCookie 적용
		// ContextPath : 톰캣에서 웹 어플리케이션을 구분하는 경로
	cookie.setMaxAge(3600);
		// myCookie 유지기한 : 1시간(60s*60m)
	response.addCookie(cookie);
		// myCookie를 쿠키 응답헤더에 추가
	%>
	
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	// cookies 인스턴스로 모든 쿠키값 받아오기
	Cookie[] cookies = request.getCookies();
	if (cookies!=null) {
		// cookies에 값이 있으면
		for (Cookie c : cookies) {
			// cookies에 있는 요소를 하나씩 c로 가져옴
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			
			out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
				// java에서의 System.out.printf
		}
	}
	%>
	
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">
		다음 페이지에서 쿠키값 확인하기
	</a>
</body>
</html>
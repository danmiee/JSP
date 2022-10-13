<%@ page import = "common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* request 영역에 속성값 저장 */
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역</title>
</head>
<body>
	<h2>request 영역의 속성값 삭제하기</h2>
	<%
	/* removeAttribute(String name) : 속성값 삭제 메소드 */
		request.removeAttribute("requestString");
		request.removeAttribute("requestInteger");
		/* requestInteger : 저장된 속성값 없음 > 삭제하라고 해도 에러없음 */
	%>
	
	<h2>request 영역의 속성값 읽기</h2>
	<%
	Person rPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<!-- requestString에 저장되어있던 데이터는 삭제되어 null로 확인
		requestPerson에 저장되어있던 데이터는 삭제하지 않아 정상출력 -->
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
	</ul>
	
	<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
	<!-- request 내장 객체를 통해 실제로 포워드를 수행하는 코드
	request.getRequestDispatcher("포워드할 파일 경로").forward(request, response) -->
	<!-- Dispatcher : 요청전달자 -->
	<%
	request.getRequestDispatcher(
		"RequestForward.jsp?paramHan=한글&paramEng=English")
		.forward(request, response);
	 %>
	 <!-- 체인코딩
	 	: .으로 이어서 코딩
	 	객체 생성 과정을 생략할 수 있어 코드 간소화에 도움됨
	  -->
	
	<!-- request 내장 객체를 통해 실제로 포워드를 수행하는 코드2
		: 체인코딩 해제 
	 	RequestDispatcher 형식의 객체 rd 생성하여 rd가 foward 해줌 -->
	<%--
	RequestDispatcher rd = 
		request.getRequestDispatcher(
			"RequestForward.jsp?paramHan=한글&paramEng=English");
	rd.forward(request, response);
	 --%>
</body>
</html>
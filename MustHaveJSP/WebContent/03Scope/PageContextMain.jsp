<!-- Person 클래스 사용을 위해 임포트
(common. : 경로표시) -->
<%@ page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 속성값 저장
1. pageContext : page 영역 객체
2. setAttribute(String name, Object value) : 속성 저장 메소드
	- value에는 모든 타입 가능
*/
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
	/* The constructor Person(String, int) is undefined
		- Person에서 매개변수 생성자 미지정하여 생긴 에러
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%	
	/* 속성값 읽기, 형변환
	- getAttribute(String name) : 저장된 속성값 가져오기
		> Object로 자동 형변환되어 저장되므로 원래 타입으로 형변환 필요
	- 참조객체가 null인 경우(오타 등의 사유)
		기본클래스 : null은 언박싱 불가로 에러발생 > Wrapping클래스 활용하면 에러는 안뜸
		DTO : null 형변환 불가로 에러발생 > 오타수정 필요
	*/
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
	String pString = pageContext.getAttribute("pageString").toString();
		/* String 타입은 toString 활용하여 출력 가능 */
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pString %></li>
		<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
			<!-- Person은 DTO라서 멤버변수가 PRIVATE으로 선언
					> 게터 메소드 활용 하여 가져와야함 -->
	</ul>
	
	<h2>include된 파일에서 page 영역 읽어오기</h2>
	<!-- 컴파일 과정에서 include된 파일이 현재파일 안으로 들어옴 -->
	<%@ include file="PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>

</body>
</html>
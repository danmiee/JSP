<%@ page import="java.util.Set"%>
<%@ page import="common.Person"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역의 공유</title>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	Map<String, Person> maps = (Map<String, Person>) application.getAttribute("maps");
	Set<String> keys = maps.keySet();
		/* kyeSet() : HashMap에 저장된 key들을 Set 객체로 리턴 */
	for (String key : keys) {
		Person person = maps.get(key);
		out.print(String.format("이름 : %s, 나이 : %d<br/>", person.getName(), person.getAge()));
	}
	%>
</body>
</html>
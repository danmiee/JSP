<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
	<!-- session 영역은 프로세스별로 저장하기 때문에
	열려있는 모든 브라우저 종료 시 저장한 데이터 삭제됨 -->
</head>
<body>
	<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
	<%
	@SuppressWarnings("unchecked")
	ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
	/* Type safety: Unchecked cast from Object to ArrayList<String> 
		- Collection의 타입이 무엇인지 모르는 상태로 형변환하려고 해서 뜨는 경고
			> 어노테이션 활용하여 경고문구 해제 가능
	*/
	
	/* lists의 요소를 str으로 하나씩 불러오기 */
	for (String str : lists)
		out.print(str + "<br/>");
	%>
</body>
</html>
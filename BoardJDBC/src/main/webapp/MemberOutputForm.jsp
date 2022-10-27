<%@page import="com.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!List<MemberDTO> list = new ArrayList<>();%>
<%
// 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

// 데이터베이스 연결
String dburl = "jdbc:mysql://localhost:3306/musthave";
String dbid = "musthave";
String dbpw = "tiger";
Connection con = DriverManager.getConnection(dburl, dbid, dbpw);

// PreparedStatement
Statement st = con.createStatement();

// querry 실행
ResultSet rs = st.executeQuery("select * from member order by id ASC limit 10");

// 실행 결과를 객체 리스트에 저장
// 불러오는 데이터를 객체로 만들고 해당 객체를 출력하도록 진행
// DTO.java 생성
while (rs.next()) {
	list.add(new MemberDTO(rs.getString("id"), rs.getString("pass"), rs.getString("name"),
	rs.getString("regidate")));
}

rs.close();
st.close();
con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 출력</title>
</head>
<body>
	<table border="1" width="80%">
		<%
		for (MemberDTO m : list) {
			// out.print(b.toString()+"<br>");
		%>
		<!-- 자바코드와 html코드 구분 -->

		<tr align="center">
			<td><%= m.getId() %></td>
			<td><%= m.getPass() %></td>
			<td><%= m.getName() %></td>
			<td><%= m.getRegidate() %></td>
		</tr>

		<%
		}
		%>
	</table>
</body>
</html>
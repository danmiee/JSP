<%@page import="com.domain.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!List<BoardDTO> list = new ArrayList<>();%>
<%
// 드라이버 로드
// Class.forName("com.mysql.cj.jdbc.Driver");
	Class.forName("org.h2.Driver");

// 데이터베이스 연결
// 	String dburl = "jdbc:mysql://localhost:3306/musthave";
//	String dbid = "musthave";
//	String dbpw = "tiger";

	String dburl = "jdbc:h2:tcp://localhost/~/test";
	String dbid = "sa";
	String dbpw = "";
	Connection con = DriverManager.getConnection(dburl, dbid, dbpw);

// PreparedStatement
Statement st = con.createStatement();

// querry 실행
ResultSet rs = st.executeQuery("select * from board order by num ASC limit 10");

// 실행 결과를 객체 리스트에 저장
// 불러오는 데이터를 객체로 만들고 해당 객체를 출력하도록 진행
// DTO.java 생성
while (rs.next()) {
	list.add(new BoardDTO(rs.getInt("num"), 
		rs.getString("title"), 
		rs.getString("content"), 
		rs.getString("id"),
		rs.getString("postdate"), 
		rs.getInt("visitcount")));
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
		for (BoardDTO b : list) {
			// out.print(b.toString()+"<br>");
		%>
		<!-- 자바코드와 html코드 구분 -->

		<tr align="center">
			<td><%= b.getNum() %></td>
			<td><%= b.getTitle() %></td>
			<td><%= b.getContent() %></td>
			<td><%= b.getId() %></td>
			<td><%= b.getPostdate() %></td>
			<td><%= b.getVisitcount() %></td>
		</tr>

		<%
		}
		%>
	</table>
</body>
</html>
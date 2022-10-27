<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 입력</title>
</head>
<body>
<!-- 1. 파라미터 읽기(title, content, id) -->
<%
	// post방식으로 한글 전송 시 인코딩
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	
	System.out.println(id + ", " + pass + ", " + name);
	
	/* <!-- 2. 데이터베이스 연결 및 기타 프로세스 --> */

	// 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	// 데이터베이스 연결
	String dburl = "jdbc:mysql://localhost:3306/musthave";
	String dbid = "musthave";
	String dbpw = "tiger";
	Connection con = DriverManager.getConnection(dburl, dbid, dbpw);
	
	// PreparedStatement
	String sql = "insert into member(id,pass,name) values(?,?,?)";
	PreparedStatement psmt = con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name);
	
	/* <!-- 3. 데이터베이스 입력 --> */
	// querry 실행
	int result = psmt.executeUpdate();
	
	psmt.close();
	con.close();
	
	/* <!-- 4. 완료 메세지 출력 --> */
	if (result == 1) {
		out.println("입력 성공하였습니다.");
	} else {
		out.println("입력에 실패하였습니다.");
	}
	
%>

	<br>
	<br>
	<a href="MemberInputForm.jsp">입력창으로 돌아가기</a>
</body>
</html>
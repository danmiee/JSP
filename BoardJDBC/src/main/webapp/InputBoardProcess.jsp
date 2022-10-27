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

	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");
	
	System.out.println(title + ", " + content + ", " + id);
	
	/* <!-- 2. 데이터베이스 연결 및 기타 프로세스 --> */

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
	// h2는 코드 자동입력기능 없으므로 추가해줘야함
	Connection con = DriverManager.getConnection(dburl, dbid, dbpw);

	// PreparedStatement
	String sql = "insert into board(num, title,content,id) values(?,?,?,?)";
	PreparedStatement psmt = con.prepareStatement(sql);
	psmt.setInt(1, num);
	psmt.setString(2, title);
	psmt.setString(3, content);
	psmt.setString(4, id);
	
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
	<a href="BoardInputForm.jsp">입력창으로 돌아가기</a>
</body>
</html>
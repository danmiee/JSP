<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title></head>
<body>
    <h2>회원 추가 테스트(executeUpdate() 사용)</h2>
    <%
    // DB에 연결
    JDBConnect jdbc = new JDBConnect();
    
    request.setCharacterEncoding("UTF-8");
    
    // 테스트용 입력값 준비 
    // int num = Integer.parseInt(request.getParameter("num"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String id = request.getParameter("id");
    
    // 쿼리문 생성
    // String sql = "INSERT INTO board2(num, title, content, id) VALUES (?, ?, ?, ?)";  
    String sql = "INSERT INTO board2(title, content, id) VALUES (?, ?, ?)";
    PreparedStatement psmt = jdbc.con.prepareStatement(sql); 
    
	    //psmt.setInt(1, num);
	    psmt.setString(1, title);
	    psmt.setString(2, content);
	    psmt.setString(3, id);

    // 쿼리 수행
	int inResult = psmt.executeUpdate();
    out.println(inResult + "행이 입력되었습니다.");
    
    // 연결 닫기
    jdbc.close();
    %>
</body>
</html>

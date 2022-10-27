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
    
    // 테스트용 입력값 준비 
    /* int num = 1;
    String title = "제목1";
    String content = "내용1";
    String id = "musthave2"; */

    // 쿼리문 생성
    String sql = "INSERT INTO board(num, title, content, id) VALUES (?, ?, ?, ?)";  
    PreparedStatement psmt = jdbc.con.prepareStatement(sql); 
	
    for (int i=1; i<=100; i++) {
    
    	// 반복문 안에서 초기값 설정
    	int num = i;
    	String title = "제목" + i;
    	String content = "내용" + i;

    	String id = null;
    	if(i%2==1)
    		id="musthave1";
    	else
    		id="musthave2";
    
    	// PrearedStatement 문법
	    psmt.setInt(1, num);
	    psmt.setString(2, title);
	    psmt.setString(3, content);
	    psmt.setString(4, id);

    // 쿼리 수행
    	// 여기서 실행되므로 반복문 안으로 들어가야 정상작동
	int inResult = psmt.executeUpdate();
    out.println(inResult + "행이 입력되었습니다.");
    }
    
    // 연결 닫기
    jdbc.close();
    %>
</body>
</html>

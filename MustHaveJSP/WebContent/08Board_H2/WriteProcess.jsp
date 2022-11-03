<%@ page import="model1.board.BoardDAO_H2"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

// 폼값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

// 폼값을 DTO 객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

// DAO 객체를 통해 DB에 DTO 저장
BoardDAO_H2 dao = new BoardDAO_H2(application);
int iResult = dao.insertWrite(dto);
dao.close();

// 성공 or 실패? 
if (iResult == 1) {
    response.sendRedirect("List_H2.jsp");
} else {
    JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>
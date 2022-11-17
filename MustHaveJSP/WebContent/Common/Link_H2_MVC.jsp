<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="table table-dark" border="1" style="width:90%"> 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        <% if (session.getAttribute("UserId") == null) { %>
            <a href="../14MVCBoard/LoginForm.jsp">로그인</a>
        <% } else { %>
            <a href="../14MVCBoard/Logout.jsp">로그아웃</a>
        <% } %>
            <!-- login페이지를 mvcboard와 연결할 링크 -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../mvcboard/list.do">MVC게시판</a>
        </td>
    </tr>
</table>

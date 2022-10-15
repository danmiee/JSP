<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String chkVal = request.getParameter("inactiveToday");

if (chkVal != null && chkVal.equals("1")) {
	/* null은 문자열과 비교불가하므로 !=null 조건이 들어가야함 */
	Cookie cookie = new Cookie("PopupClose", "off");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	out.println("쿠키 : 하루 동안 열지 않음");
}
%>
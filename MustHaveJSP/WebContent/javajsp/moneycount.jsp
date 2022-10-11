<%@page import="org.apache.coyote.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최소 지폐 수 계산</title>
</head>
<body>
<%
String snum = request.getParameter("num");

int num = Integer.parseInt(snum);

int fiveM = num/50000;
int oneM = (num-(fiveM*50000))/10000;
int fiveTh = (num-((fiveM*50000)+(oneM*10000)))/5000;
int oneTh = (num-((fiveM*50000)+(oneM*10000)+(fiveTh*5000)))/1000;
int discount = num%1000;

out.print("5만원 * " + fiveM + "장<br />");
out.print("1만원 * " + oneM + "장<br />");
out.print("5천원 * " + fiveTh + "장<br />");
out.print("1천원 * " + oneTh + "장<br />");
out.print(discount + "원 할인");
%>



</body>
</html>
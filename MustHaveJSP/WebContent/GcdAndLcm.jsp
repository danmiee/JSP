<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
try {
	
	String snum1 = request.getParameter("num1");
	String snum2 = request.getParameter("num2");
	
	int num1 = Integer.parseInt(snum1);
	int num2 = Integer.parseInt(snum2);
	
	int max,min;
	max = (num1>num2) ? num1 : num2;
	min = (num1>num2) ? num2 : num1;
	
	int rem=max%min;
	
	while(rem!=0) {
		max = min;
		min = rem;
		rem = max%min;
	}
	
	int gcd, lcm;
	gcd = min;
	lcm = num1*num2/gcd;
	
	out.print("�Է°�: " + num1 + ", " + num2 + "<br>");
	out.print("�ִ�����: " + gcd + "<br>");
	out.print("�ּҰ����: " + lcm + "<br>");
	
} catch(Exception e) {
	out.println(e.getMessage());
}

%>
</body>
</html>
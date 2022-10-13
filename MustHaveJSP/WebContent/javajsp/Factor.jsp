<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>팩토리얼 구하기</title>
</head>
<body>
<%
try {
	
	String snum = request.getParameter("num");
	
	int num = Integer.parseInt(snum);
	int fac = 1;
	
	for(int i=num; i>0; i--) {
		fac *= i;
	}
	
	out.print("팩토리얼 값은 " + fac + "입니다.");
	
	
} catch (Exception e) {
	out.print(e.getMessage());
}
%>

</body>
</html>
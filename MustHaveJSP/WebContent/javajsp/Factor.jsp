<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���丮�� ���ϱ�</title>
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
	
	out.print("���丮�� ���� " + fac + "�Դϴ�.");
	
	
} catch (Exception e) {
	out.print(e.getMessage());
}
%>

</body>
</html>
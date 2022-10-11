<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<%
	String snum = request.getParameter("num");

	int num = Integer.parseInt(snum);

	for (int i = 2; i < 10; i+=num) {
		for (int j = 1; j < 10; j++) {
			for (int k = 0; k < num; k++) {
				out.print((i + k) + "x" + j + "=" + (i + k) * j);
				if (k < num - 1)
					out.print(" ");
				else
					out.print("<br/>");
				if (i + k >= 10)
					break;
			}
		}
		out.print("<br/>");
	}
	%>
</body>
</html>
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

	int[] money = { 50000, 10000, 5000, 1000 };
	int[] cnt = new int[4];				// 지폐수
	int[] cntcash = new int[4];			// 지폐별 금액
	int[] sumcash = new int[4];			// 누적금액

	// 배열로 받아서 배열로 출력하기
	for(int i=0; i<4; i++) {
		if(i==0) {
			cnt[i] = num/money[i];
			cntcash[i] = cnt[i]*money[i];
			sumcash[i] = cntcash[i];
			out.print(money[i] + " * " + cnt[i] + "장<br />");
		} else {
			cnt[i] = (num-sumcash[i-1])/money[i];
			cntcash[i] = cnt[i]*money[i];
			sumcash[i] = sumcash[i-1] + cntcash[i];
			out.print(money[i] + " * " + cnt[i] + "장<br />");
		}
	}
	%>

</body>
</html>
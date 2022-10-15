<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("exp")) {
				pageContext.setAttribute("pexp", c.getValue());
				break;
			}
		}
	}
	else {
		pageContext.setAttribute("pexp", "0");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<style>
input{
	width:50px;
	height:50px;
}
.output{
	width:200px;
	height:50px;
	background: #e9e9e9;
	font-size:24px;
	font-weight: bold;
	text-align: right;
	padding: 0px 5px;
}
</style>
<script>
// 테이블에 input 태그를 만들어서 하는 방법
function clickButton(clkVal) {
	
	console.log("눌려진 키:" + clkVal);
	
	let expvalue = document.forms["form"].elements["exp"].value;
	
	switch(clkVal) {
	case '0': case '1': case '2': case '3': case '4':
	case '5': case '6': case '7': case '8': case '9':
		if (expvalue == '0')	expvalue = clkVal;
		else					expvalue += clkVal;
		break;
	case '+': case '-': case '*': case '/':
		if (expvalue != '0')	expvalue += clkVal;
		break;
	case 'C':
		expvalue = "0";
		break;
	}
	document.forms["form"].elements["exp"].value = expvalue;
	console.log("expvalue1:" + expvalue);
}
</script>
</head>
<body>
	<form action="calc2" method="post" name="form">
		<table>
			<tr>
				<td class="output" colspan="4">
					<input class="output" type="text" readonly name="exp" value="${pexp }">
				</td>
			</tr>
			<tr>
				<td><input type="button" onclick="onClick=clickButton('7')"	value="7"/> </td>
				<td><input type="button" onclick="onClick=clickButton('8')"	value="8"/> </td>
				<td><input type="button" onclick="onClick=clickButton('9')"	value="9"/> </td>
				<td><input type="button" onclick="onClick=clickButton('/')" value="/"/> </td>
			</tr>
			<tr>
				<td><input type="button" onclick="onClick=clickButton('4')"	value="4"/> </td>
				<td><input type="button" onclick="onClick=clickButton('5')"	value="5"/> </td>
				<td><input type="button" onclick="onClick=clickButton('6')"	value="6"/> </td>
				<td><input type="button" onclick="onClick=clickButton('*')" value="*"/> </td>
			</tr>
			<tr>
				<td><input type="button" onclick="onClick=clickButton('1')"	value="1"/> </td>
				<td><input type="button" onclick="onClick=clickButton('2')"	value="2"/> </td>
				<td><input type="button" onclick="onClick=clickButton('3')"	value="3"/> </td>
				<td><input type="button" onclick="onClick=clickButton('-')" value="-"/> </td>
			</tr>
			<tr>
				<td><input type="button" onclick="onClick=clickButton('C')" value="C"/> </td>
				<td><input type="button" onclick="onClick=clickButton('0')"	value="0"/> </td>
				<td><input type="submit" value="="/> </td>
				<td><input type="button" onclick="onClick=clickButton('+')" value="+"/> </td>
			</tr>
		</table>
	</form>
</body>
</html>
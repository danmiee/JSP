<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 입력 폼</title>
</head>
<body>
	<h2>멤버 입력 폼</h2>
	<!-- 
String id
String pass
String name
String regidate : 자동입력
>> id, pass, id 입력 폼만 만들면 됨
 -->
 <form action="MemberInputProcess.jsp" method="post">
	<table>
		<tr>
			<td>id</td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td>pass</td>
			<td><input type="text" name="pass" /></td>
		</tr>
		<tr>
			<td>name</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
		<td colspan="2"><input style="width:100%" type="submit" value="저장" /></td>
		</tr>
	</table>
	</form>
</body>
</html>
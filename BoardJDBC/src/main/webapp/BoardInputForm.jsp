<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 입력 폼</title>
</head>
<body>
	<h2>게시판 입력 폼</h2>
	<!-- 
int num : 데이터베이스에서 자동입력(h2는 자동입력기능없음)
String title
String content
String id
String postdate : 자동입력
int visitcount : 자동입력
>> title, content, id 입력 폼만 만들면 됨
 -->
	<form action="InputBoardProcess.jsp" method="post">
		<table>
			<tr>
				<td>num</td>
				<td><input type="text" name="num" /></td>
			</tr>
			<tr>
				<td>title</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td>content</td>
				<td><input type="text" name="content" /></td>
			</tr>
			<tr>
				<td>id</td>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td colspan="2"><input style="width: 100%" type="submit"
					value="저장" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
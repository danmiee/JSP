<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/FileUpload/uploadfile" enctype="multipart/form-data">
		<input type="text" name="title" value="타이틀"><br>
		<input type="file" name="fname"><br>
		<input type="file" name="fname"><br>
		<input type="submit" value="업로드">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./IsLoggedIn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<!-- 부트스트랩 삽입 -->
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
	a { text-decoration: none; }
</style>
<script type="text/javascript">
	function validateForm(form) { // 필수 항목 입력 확인
		if (form.name.value == "") {
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
		if (form.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<!-- mvcboard와 연결하기 위해 link페이지 include -->
	<jsp:include page="../Common/Link_H2_MVC.jsp" />
	<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
	<!-- 작성 완료(submit) 누르면 write.do(action) post 방식 호출 -->
	<form name="writeFrm" method="post" enctype="multipart/form-data"
		action="../mvcboard/write.do" onsubmit="return validateForm(this);">
		<table class="table table-striped" border="1" style="width: 90%">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" style="width: 150px;" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width: 90%; height: 100px;">
					</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td><input type="file" name="ofile" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" style="width: 100px;" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">RESET</button>
					<button type="button" onclick="location.href='../mvcboard/list.do';">
						목록 바로가기
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
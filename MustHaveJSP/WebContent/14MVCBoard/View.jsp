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
</head>
<body>
	<!-- mvcboard와 연결하기 위해 link페이지 include -->
	<jsp:include page="../Common/Link_H2_MVC.jsp" />
	<!-- WriteController, EditController에서 set한 데이터를 불러오는 EL 활용 -->
	<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>
	
	<table class="table table-striped" border="1" style="width: 90%">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>

		<!-- 게시글 정보 -->
		<tr>
			<td>번호</td>
			<td>${ dto.idx }</td>
			<td>작성자</td>
			<td>${ dto.name }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${ dto.postdate }</td>
			<td>조회수</td>
			<td>${ dto.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${ dto.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${ dto.content }</td>
		</tr>

		<!-- 첨부파일 -->
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${ not empty dto.ofile }">
            		${ dto.ofile }
            		<a href="../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }">
						[다운로드]
					</a>
				</c:if>
			</td>
			<td>다운로드수</td>
			<td>${ dto.downcount }</td>
		</tr>

		<!-- 하단 메뉴(버튼) -->
		<tr>
			<td colspan="4" align="center">
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${ param.idx }';">
					수정하기
				</button>
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${ param.idx }';">
					삭제하기
				</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">
					목록 바로가기
				</button>
			</td>
		</tr>
	</table>
</body>
</html>

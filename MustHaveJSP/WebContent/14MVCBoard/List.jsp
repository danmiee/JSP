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
	<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

	<!-- 검색 폼 -->
	<!-- action 속성 생략 : 자기자신 호출 -->
	<form method="get">
		<table class="table table-striped" border="1" style="width: 90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>
	</form>

	<!-- 목록 테이블 -->
	<table class="table table-striped" border="1" style="width: 90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		<c:choose>
			<c:when test="${ empty boardLists }">
				<!-- 게시물이 없을 때 -->
				<tr>
					<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 게시물이 있을 때 -->
				<c:forEach items="${ boardLists }" var="row" varStatus="loop">
					<tr align="center">
						<td>
							<!-- 번호 -->
							${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
						</td>
						<td align="left">
							<!-- 제목(링크) -->
							<a href="../mvcboard/view.do?idx=${ row.idx }">
								${ row.title }
							</a>
						</td>
						<td>${ row.name }</td>
						<!-- 작성자 -->
						<td>${ row.visitcount }</td>
						<!-- 조회수 -->
						<td>${ row.postdate }</td>
						<!-- 작성일 -->
						<td>
							<!-- 첨부 파일 -->
							<c:if test="${ not empty row.ofile }">
								<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">
									[Down]
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<!-- 하단 메뉴(바로가기, 글쓰기) -->
	<table class="table table-striped" border="1" style="width: 90%">
		<tr align="center">
			<td>${ map.pagingImg }</td>
			<!-- <form> 미설정 : write.do(onclick) get방식 호출
				∵ method 속성 기본값: get-->
			<td width="100">
				<button type="button" onclick="location.href='../mvcboard/write.do';">
					글쓰기
				</button>
			</td>
		</tr>
	</table>
</body>
</html>
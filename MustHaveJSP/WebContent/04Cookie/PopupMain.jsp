<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String popupMode = "on";

Cookie[] cookies = request.getCookies();
if (cookies!=null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if (cookieName.equals("PopupClose")) {
			popupMode = cookieValue;
			// cookieName이 PopupClose인 것이 존재하면 popupMode를 해당 cookieValue로 바꾼다?
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>

<!-- CSS로 팝업레이어 위치 설정 -->
<style>
div#popup {
	position: absolue;
	top: 100px;
	left: 50px;
	color: yellow;
	width: 270px;
	height: 100px;
	background-color: gray;
}

div#popup>div {
	position: relative;
	background-color: #ffffff;
	top: 0px;
	border: 1px solid gray;
	padding: 10px;
	color: black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>

<!-- jQuery : close버튼 누르면 팝업창 숨기기 -->
<script>
	$(function() {
		$('#closeBtn').click(function() {
			$('#popup').hide();
			/* 하루동안 열지않음 체크여부 확인 */
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
				/* id가 inactiveToday인 체크박스의 체크된 값을 읽어와서(val()) chkVal 변수에 저장 */
			
			/* jQuery의 ajax()함수 : 비동기요청 */
			$.ajax({											/* 비동기로 요청 보냄 */
				url : './PopupCookies.jsp',						/* PopupCookies.jsp 파일에 */
				type : 'get',									/* http get 방식으로 */
				data : {inactiveToday : chkVal},				/* 하루동안 열지않음 체크된 데이터 */
				dataType : "text",								/* 응답 데이터타입 : 일반 텍스트 */
				success : function(resData) {					/* 응답 데이터가 있으면 */
					if (resData != '') location.reload();		/* 페이지 새로고침 */
				}
			});
		});
	})
</script>
</head>
<body>
	<h2>팝업 메인 페이지(ver 0.1)</h2>
	<%
		for(int i=1; i<=10; i++) {
			out.print("현재 팝업창은 " + popupMode + "상태입니다.<br/>");
		}
	
		if (popupMode.equals("on")) {
	%>
			<!-- html요소는 선언부 밖으로 기재 -->
			<div id="popup">
				<h2 align="center">공지사항 팝업입니다.</h2>
				<div align="right">
					<form name="popFrm">
						<input type="checkbox" id="inactiveToday" value="1" />
						하루 동안 열지 않음
						<input type="button" value="닫기" id="closeBtn" />
					</form>	
				</div>
			</div>
	<%
		}
	%>
</body>
</html>
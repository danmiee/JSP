<%@ page import="java.util.Date"%>
<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL core태그 사용 지시어 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - set 1</title></head>
<body>
    <!-- core태그를 활용한 변수 선언 -->
    <!-- directVar 값 100 -->
    <c:set var="directVar" value="100" />
    <!-- elVar 값 directVar을 5로 나눈 나머지 -->
    <c:set var="elVar" value="${ directVar mod 5}" />
    <!-- expVar 값 날짜로 가져오기 -->
    <c:set var="expVar" value="<%= new Date() %>" />
    <!-- betweenVar 시작태그와 종료태그 구분하여 "변수값 요렇게 설정" 문구 기재 -->
    <c:set var="betweenVar">변수값 요렇게 설정</c:set>

    <h4>EL을 이용해 변수 출력</h4>
    <ul>
    	<!-- EL태그를 활용하여 값 가져오기 -->
    	<!-- directVar : 값 -->
        <li>directVar : ${ pageScope.directVar }</li>
        <!-- elVar : 값 -->
        <li>elVar : ${ elVar }</li>
        <!-- expVar : 값 -->
        <li>expVar : ${ expVar }</li>
        <!-- betweenVar : 값 -->
        <li>betweenVar : ${ betweenVar }</li>
    </ul>
    
    <h4>자바빈즈 생성 1 - 생성자 사용</h4>
    <c:set var="personVar1" value='<%= new Person("박문수", 50) %>'
           scope="request" />
    <ul>
        <li>이름 : ${ requestScope.personVar1.name }</li>
        <li>나이 : ${ personVar1.age}</li>
    </ul>
 
    <h4>자바빈즈 생성 2 - target, property 사용</h4>
    <c:set var="personVar2" value="<%= new Person() %>" scope="request" />
    <c:set target="${personVar2 }" property="name" value="정약용" />
    <c:set target="${personVar2 }" property="age" value="60" />
    <ul>
        <li>이름 : ${ personVar2.name }</li>
        <li>나이 : ${ requestScope.personVar2.age }</li>
    </ul>
</body>
</html>
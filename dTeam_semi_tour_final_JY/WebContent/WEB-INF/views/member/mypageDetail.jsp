<%@page import="kr.co.kosmo.mvc.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<style>
.center {
	text-align: center;
}

th {
	background-color: aliceblue;
}

h3 {
	color: #6495ed;
}

table {
	border-collapse: collapse;
	width: 55%;
}

#calendar {
	max-width: 900px;
	min-height: 400px;
	margin: 40px auto;
}
</style>

<header>
	<h1>MY PAGE</h1>
</header>
<ul class="list-unstyled" class="center">
	<li class="border-top my-3"></li>
</ul>

<div>
	<h3 align="center">상세 정보</h3>
	<table border="1" align="center" class="center">
		<!-- 멤버 출력(ResultMap) -->
		<c:forEach var="e" items="${mbsvo.member }">
			<tr>
				<th>아이디</th>
				<td>${e.mid }</td>
				<th>이름</th>
				<td>${e.mname }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${e.mphone }</td>
				<th>이메일 주소</th>
				<td>${e.memail }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${e.gender }</td>
				<th>(만) 나이</th>
				<td>${e.mage }</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>${e.mdate }</td>
				<th>주소</th>
				<td>${e.maddr }</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="container mt-3" align="center">
	<a href="upmemForm"><button type="button" class="btn btn-secondary">
			회원 수정</button></a>
</div>
<div class="container mt-3" align="center">
	<a href="delmem?mid=${sessionScope.sessionID}"><button
			type="button" class="btn btn-warning">회원 탈퇴</button></a>
</div>

<br>
<!-- ================================================== -->

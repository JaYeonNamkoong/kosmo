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
	<h3 align="center">�� ����</h3>
	<table border="1" align="center" class="center">
		<!-- ��� ���(ResultMap) -->
		<c:forEach var="e" items="${mbsvo.member }">
			<tr>
				<th>���̵�</th>
				<td>${e.mid }</td>
				<th>�̸�</th>
				<td>${e.mname }</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td>${e.mphone }</td>
				<th>�̸��� �ּ�</th>
				<td>${e.memail }</td>
			</tr>
			<tr>
				<th>����</th>
				<td>${e.gender }</td>
				<th>(��) ����</th>
				<td>${e.mage }</td>
			</tr>
			<tr>
				<th>��������</th>
				<td>${e.mdate }</td>
				<th>�ּ�</th>
				<td>${e.maddr }</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="container mt-3" align="center">
	<a href="upmemForm"><button type="button" class="btn btn-secondary">
			ȸ�� ����</button></a>
</div>
<div class="container mt-3" align="center">
	<a href="delmem?mid=${sessionScope.sessionID}"><button
			type="button" class="btn btn-warning">ȸ�� Ż��</button></a>
</div>

<br>
<!-- ================================================== -->

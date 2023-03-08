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

<!-- ================================================== -->

<div>
	<h3 align="center">�ֱ� �̿� ����</h3>
	<h3 align="center">������ Ŭ���ϸ� Ajax�� �ؿ� ������ ��µǵ���??</h3>
	<table border="1" align="center" class="center">
		<tr>
			<th>���� �Ͻ�</th>
			<th>�̿� �Ͻ�</th>
			<th>�̿� ����</th>
			<th>���� ���</th>
			<th>���� �ݾ�</th>
		</tr>
		<c:forEach var="e" items="${blist }">
		<tr>
			<td>${e.bdate }</td>
			<td>${e.sdate } ~ ${e.edate }</td>
			<td>*****</td>
			<td>${e.charge.chtype }</td>
			<td>${e.charge.chpay }</td>
		</tr>
		</c:forEach>
	</table>
</div>
<div class="container mt-3" align="center">
	<a href="UseHistoryList?mnum=${sessionScope.sessionNum}&chk=2"><button type="button" class="btn btn-secondary">
			�� ����</button></a>
</div>

<br>
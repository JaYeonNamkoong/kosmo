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
	<h3 align="center">${sessionScope.sessionName}님 예약 내역</h3>
	<table border="1" align="center" class="center">
		<tr>
			<th>번호</th>
			<th>예약 일시</th>
			<th>이용 일시</th>
			<th>이용 숙소</th>
			<th>결제 방법</th>
			<th>결제 금액</th>
			<th>변경</th>
		</tr>
		<c:forEach var="e" items="${blist }" >
		<c:set var="index" value="${index + 1}" />
			<tr>
				<td>${index}</td>
				<td>${e.bdate }</td>
				<td>${e.sdate }~ ${e.edate }</td>
				<td>*****</td>
				<td>${e.charge.chtype }</td>
				<td>${e.charge.chpay }</td>
				<td>
					<a href="${ctrpath}/book/bookUpdateForm?bid=${e.bid }"><button
						type="button" class="btn btn-primary item">예약 수정</button></a>
					<a	href="${ctrpath}/book/delBook?bid=${e.bid }&mid=${sessionScope.sessionNum}"><button
						type="button" class="btn btn-primary item">예약 취소</button></a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<br>
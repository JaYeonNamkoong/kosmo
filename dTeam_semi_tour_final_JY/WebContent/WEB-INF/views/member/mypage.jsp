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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<header>
	<h1>MY PAGE</h1>
</header>
<ul class="list-unstyled" align="center">
	<li class="border-top my-3"></li>
</ul>

<div>
	<!-- 멤버+멤버쉽 : name 출력(세션/ResultMap) -->
	<h3 align="center">${sessionScope.sessionName}님 회원정보</h3>
	<!-- name 출력(세션) -->
	<table border="1" align="center" class="center">
		<!-- name 출력(ResultMap) -->
		<c:forEach var="e" items="${mbsvo.member }">
			<tr>
				<th>${e.mname }님의 등급</th>
				<th>${e.mname }님의 포인트</th>
			</tr>
			<tr>
				<td>${mbsvo.mbsname }</td>
				<td>${e.mpoint } P</td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="2">다음 등급까지</th>
		</tr>
		<tr>
			<td colspan="2">이만큼 남음!(+도넛차트?)<!-- 차트 -->

			</td>
		</tr>
	</table>
</div>

<br>
<!-- ================================================== -->
<ul class="list-unstyled" align="center">
	<li class="border-top my-3"></li>
	<button data-tab="mypageDetail" type="button" class="btn btn-secondary tabmenu" id="default">회원 상세 정보</button>
	<button data-tab="tab2" type="button" class="btn btn-secondary tabmenu">최근 이용 내역</button>
	<button	data-tab="tab3" type="button" class="btn btn-secondary tabmenu">나의 이용 차트</button>
	<!--  	-->
	
	<li class="border-top my-3">TEST</li>
	<a href="mypageDetail?mid=${sessionScope.sessionID}"><button
			type="button" class="btn btn-secondary">회원 상세 정보</button></a>
	<a href="UseHistoryList?mnum=${sessionScope.sessionNum}&chk=1"><button
			type="button" class="btn btn-secondary">최근 이용 내역</button></a>
	<a href="mypageChart?mid=${sessionScope.sessionID}"><button
			type="button" class="btn btn-secondary">나의 이용 차트</button></a>
</ul>

<br>

<div>
	<div align="center" class="center" id="tabcontent"></div>
	<br>
	<table border="1" align="center" class="center">
		<tr>
			<td>Ajax로 변경되는 공간</td>
		</tr>
		<tr>
			<td rowspan="6" align="center" width="500" height="400">
				<div id="tabcontent"></div>
			</td>
		</tr>
	</table>
</div>

<br>
<!-- ================================================== -->



<!-- ================================================== -->

<script>
	$(function() {
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('button').css('background-color', 'gray');
			$(this).css({'background-color':'aliceblue', 'color':'black'});
			$.ajax({
				type : 'GET', //get방식으로 통신
				url : activeTab + '.jsp', //탭의 data-tab속성의 값으로 된
				dataType : "jsp", //html형식으로 값 읽기
				error : function() { //통신 실패시
					alert('통신실패!');
				},
				success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();
	});
</script>
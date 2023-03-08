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
	<!-- ���+����� : name ���(����/ResultMap) -->
	<h3 align="center">${sessionScope.sessionName}�� ȸ������</h3>
	<!-- name ���(����) -->
	<table border="1" align="center" class="center">
		<!-- name ���(ResultMap) -->
		<c:forEach var="e" items="${mbsvo.member }">
			<tr>
				<th>${e.mname }���� ���</th>
				<th>${e.mname }���� ����Ʈ</th>
			</tr>
			<tr>
				<td>${mbsvo.mbsname }</td>
				<td>${e.mpoint } P</td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="2">���� ��ޱ���</th>
		</tr>
		<tr>
			<td colspan="2">�̸�ŭ ����!(+������Ʈ?)<!-- ��Ʈ -->

			</td>
		</tr>
	</table>
</div>

<br>
<!-- ================================================== -->
<ul class="list-unstyled" align="center">
	<li class="border-top my-3"></li>
	<button data-tab="mypageDetail" type="button" class="btn btn-secondary tabmenu" id="default">ȸ�� �� ����</button>
	<button data-tab="tab2" type="button" class="btn btn-secondary tabmenu">�ֱ� �̿� ����</button>
	<button	data-tab="tab3" type="button" class="btn btn-secondary tabmenu">���� �̿� ��Ʈ</button>
	<!--  	-->
	
	<li class="border-top my-3">TEST</li>
	<a href="mypageDetail?mid=${sessionScope.sessionID}"><button
			type="button" class="btn btn-secondary">ȸ�� �� ����</button></a>
	<a href="UseHistoryList?mnum=${sessionScope.sessionNum}&chk=1"><button
			type="button" class="btn btn-secondary">�ֱ� �̿� ����</button></a>
	<a href="mypageChart?mid=${sessionScope.sessionID}"><button
			type="button" class="btn btn-secondary">���� �̿� ��Ʈ</button></a>
</ul>

<br>

<div>
	<div align="center" class="center" id="tabcontent"></div>
	<br>
	<table border="1" align="center" class="center">
		<tr>
			<td>Ajax�� ����Ǵ� ����</td>
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
				type : 'GET', //get������� ���
				url : activeTab + '.jsp', //���� data-tab�Ӽ��� ������ ��
				dataType : "jsp", //html�������� �� �б�
				error : function() { //��� ���н�
					alert('��Ž���!');
				},
				success : function(data) { //��� ������ �� ������ div�� �о���� ������ ä���.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();
	});
</script>
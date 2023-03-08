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



<link href="fullcalendar/main.css" rel="stylesheet" />
<script src="fullcalendar/main.js"></script>

<!-- ��Ʈ -->
<!-- Load c3.css -->
<link href="${path }/css/c3.css" rel="stylesheet">
<!-- Load d3.js and c3.js -->
<script src="${path }/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${path }/js/c3.min.js"></script>

<!-- ================================================== -->

<div>
	<h3 align="center">���� �׷���</h3>

	<table border="1" align="center" class="center">
		<tr>
			<td>COUNT : ����Ƚ��</td>
		</tr>
		<tr>
			<td rowspan="6" align="center" width="500" height="400">
				<div id="tourCountChart"></div>
			</td>
		</tr>
		<!--  
	<tr>
		<td>COUNT : �� �� ����Ƚ��</td> => �� �� ����Ƚ��
		<td>MAX : �ִ� ���� �Ⱓ or ���</td>
		<td>SUM : ���� �� �Ⱓ �ջ� ���</td>
		<td>AVG : ���� ��� �Ⱓ</td>
		<td>AVG : ������ ���ؼ� ���� �� ���� �� ���</td>
	</tr>
	<tr>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
		<td rowspan="6" align="center" width="500" height="400"><img
			src="img/blood.png" width="800" height="400"></td>
	</tr>
	-->

	</table>
	<div class="container mt-3" align="center">
		<a href="pro.kosmo?cmd=patient&scmd=chdetails"><button
				type="button" class="btn btn-secondary">��Ʈ����</button></a>
	</div>
</div>

<br>
<!-- ================================================== -->

<script>
	$.ajaxSetup({
		cache : false
	//ĳ�û���
	});
	$.ajax({
		//�����͸� �ְ���� ���� �ּ� �Է�
		url : "../tourCountJson?mnum=${sessionScope.sessionNum}",
		//�۾��� ���������� �߻����� ���
		success : function(jsondata) {
			$('#tourCountChart').html(""); //����
			console.log(jsondata);
			//====================================
			var chart = c3.generate({
				bindto : '#tourCountChart', //��Ʈ ǥ�õ� �κ�(id)
				data : { //success�ؼ� �޾ƿ� jsondata������ �ڵ鸵
					json : [ jsondata[1] ], //1����
					keys : {
						value : Object.keys(jsondata[1]),
					},
					type : 'donut'
				},
				donut : {
					title : jsondata[0].sub, //0����
				},
			});
			//====================================
		},
		//������ ���� ��� �����ų �ڵ�
		error : function(e) {
			console.log("error:" + e);
		}
	});
	$.ajax({
		//�����͸� �ְ���� ���� �ּ� �Է�
		url : "../tourCountJson?mid=${sessionScope.sessionID}",
		//�۾��� ���������� �߻����� ���
		success : function(jsondata) {
			$('#tourCountChart').html(""); //����
			console.log(jsondata);
			//====================================
		},
		//������ ���� ��� �����ų �ڵ�
		error : function(e) {
			console.log("error:" + e);
		}
	});
</script>
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

<!-- 차트 -->
<!-- Load c3.css -->
<link href="${path }/css/c3.css" rel="stylesheet">
<!-- Load d3.js and c3.js -->
<script src="${path }/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${path }/js/c3.min.js"></script>

<!-- ================================================== -->

<div>
	<h3 align="center">나의 그래프</h3>

	<table border="1" align="center" class="center">
		<tr>
			<td>COUNT : 여행횟수</td>
		</tr>
		<tr>
			<td rowspan="6" align="center" width="500" height="400">
				<div id="tourCountChart"></div>
			</td>
		</tr>
		<!--  
	<tr>
		<td>COUNT : 매 월 여행횟수</td> => 매 년 여행횟수
		<td>MAX : 최대 여행 기간 or 비용</td>
		<td>SUM : 여행 간 기간 합산 비용</td>
		<td>AVG : 여행 평균 기간</td>
		<td>AVG : 데이터 비교해서 여행 갈 시즌 등 비용</td>
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
				type="button" class="btn btn-secondary">차트내역</button></a>
	</div>
</div>

<br>
<!-- ================================================== -->

<script>
	$.ajaxSetup({
		cache : false
	//캐시삭제
	});
	$.ajax({
		//데이터를 주고받을 파일 주소 입력
		url : "../tourCountJson?mnum=${sessionScope.sessionNum}",
		//작업이 성공적으로 발생했을 경우
		success : function(jsondata) {
			$('#tourCountChart').html(""); //비우기
			console.log(jsondata);
			//====================================
			var chart = c3.generate({
				bindto : '#tourCountChart', //차트 표시될 부분(id)
				data : { //success해서 받아온 jsondata데이터 핸들링
					json : [ jsondata[1] ], //1번지
					keys : {
						value : Object.keys(jsondata[1]),
					},
					type : 'donut'
				},
				donut : {
					title : jsondata[0].sub, //0번지
				},
			});
			//====================================
		},
		//에러가 났을 경우 실행시킬 코드
		error : function(e) {
			console.log("error:" + e);
		}
	});
	$.ajax({
		//데이터를 주고받을 파일 주소 입력
		url : "../tourCountJson?mid=${sessionScope.sessionID}",
		//작업이 성공적으로 발생했을 경우
		success : function(jsondata) {
			$('#tourCountChart').html(""); //비우기
			console.log(jsondata);
			//====================================
		},
		//에러가 났을 경우 실행시킬 코드
		error : function(e) {
			console.log("error:" + e);
		}
	});
</script>
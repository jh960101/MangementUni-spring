<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>나의 수강 페이지</title>
<link href="${path}/resources/css/courses.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 380px">
			<ul id="menulist">
				<li><a href="studentstatus">학적조회</a></li>
				<li><a href="passwordchange">비밀번호 변경</a></li>
				<li><a href="studentinformation">정보변경</a></li>
				<li><a href="objection">성적조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="courseregistrationpage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">모바일 학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 650px; margin-top:100px;">
		<div id="content">

			<!-- title view -->
			<div id="pageTitle">
				<h1>나의 수강 페이지</h1>
			</div>

			<!-- content view -->
			<div id="pageContent">
				<div id="improtant">총 조회 건수 ${ count }건</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">학년도</th>
								<th scope="col">학기</th>
								<th scope="col">학과</th>
								<th scope="col">강좌명</th>
								<th scope="col">교수명</th>

							
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="list" items="${courlist}" varStatus="status">
								<tr>
									<th>${status.index + 1}</th>
									<td>${list.YEAR}</td>
									<td>${list.SMT}</td>
									<td>${list.DEPT_NAME}</td>
									<td><a href="myCoursesList?sub_code=${list.SUB_CODE}">${list.SUB_NAME}</a></td>
									<td>${list.PROF_NAME}</td>
								</tr>
							</c:forEach>

							</tr>
						</thead>
						
					</table>
				</div>
				<!-- table-responsive div -->
			</div>
			<!-- pageContent div -->
		</div>
		<!-- content div -->
	</div>
	<!-- container div -->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>

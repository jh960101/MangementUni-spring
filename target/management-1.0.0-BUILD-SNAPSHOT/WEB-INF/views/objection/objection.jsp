<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 관리</title>
<link href="${path}/resources/css/objection.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 380px">
			<ul id="menulist">
				<li><a href="studentstatus">학적 조회</a></li>
				<li><a href="passwordchange">학생 비밀번호 변경</a></li>
				<li><a href="studentinformation">학생 정보 변경</a></li>
				<li><a href="objection">성적 조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="courseregistrationpage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: auto; margin-top: 100px;">

		<div id="content">
			<div id="pagetitle">
				<h1>성적 조회</h1>
			</div>

			<div id="selecttable">
				<div id="tablelist">
					<h5 id="midtitle">&gt; 2024-1학기</h5>
					<div>
						<table class="table mt-2 mb-4"
							style="text-align: center; margin-top: 15px;">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">학기</th>
									<th scope="col">학과</th>
									<th scope="col">과목명</th>
									<th scope="col">담당교수</th>
									<th scope="col">성적</th>
									<th scope="col">이의 신청</th>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<c:forEach var="result" items="${resultList}">
									<tr>
										<th scope="row">${result.num}</th>
										<td>${result.smt}</td>
										<td>${result.dept_name}</td>
										<td>${result.sub_name}</td>
										<td>${result.prof_name}</td>
										<td>${result.grade}</td>
										<td>
											<button type="button" class="btn btn-xs"
												onclick="location.href='${path}/objectionWrite?sub_code=${result.sub_code}'"
												style="background-color: #024C86; color: white; padding: 2px 0 10px 0;">신청</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="tablelist">
					<h5 id="midtitle" style="margin-top: 40px">&gt; 2023학년도</h5>
					<form id="select_sem" method="POST">
						<select name="subject" required
							style="padding: 5px; margin-top: 15px;">
							<option value="1">1학기</option>
							<option value="2">2학기</option>
						</select>

					</form>
					<table class="table mt-4 mb-2" style="text-align: center;">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">학기</th>
								<th scope="col">학과</th>
								<th scope="col">과목명</th>
								<th scope="col">담당교수</th>
								<th scope="col">성적</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<tr>
								<th scope="row">1</th>
								<td>Otto</td>
								<td>@mdo</td>
								<td>@mdo</td>
								<td>@mdo</td>
								<td>A</td>
							</tr>
							<tr>
								<th scope="row">1</th>
								<td>Otto</td>
								<td>@mdo</td>
								<td>@mdo</td>
								<td>@mdo</td>
								<td>B</td>
							</tr>
							<tr>
								<th scope="row">1</th>
								<td>Otto</td>
								<td>@mdo</td>
								<td>@mdo</td>
								<td>@mdo</td>
								<td>A+</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- tableList -->
			</div>
			<!-- selectTable -->
		</div>
	</div>
	<!-- content -->
	<!-- container -->

</body>
</html>
<jsp:include page="../common/footer.jsp" />
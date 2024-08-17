2<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path"
	value="${pageContext
	   		   .request
	   		   .contextPath}" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수강신청 페이지</title>
<link rel="stylesheet" type="text/css" href="courses.css">

</head>

<body>
<div style="margin-top:76px"></div>
	<jsp:include page="../common/header.jsp" />
	<form id="dataForm" action="${path}/courInfo" method="post">
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 380px;margin-top: 182px;">
			<ul id="menulist">
				<li><a href="studentstatus">학적조회</a></li>
				<li><a href="passwordchange">비밀번호 변경</a></li>
				<li><a href="studentinformation">정보변경</a></li>
				<li><a href="objection">성적조회</a></li>
				<li><a href="myCoursesPage">나의 수강 목록</a></li>
				<li><a href="courseregistrationpage">수강신청</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">모바일 학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 1000px; margin-top: 76px;">

		<div id="content">
			<!-- title view -->
			<h2 style="margin-top: 0px; text-align: center">
				<strong>수강신청</strong>
			</h2>
			<div style="width: 70px; height: 5px; background-color: #024C86; margin:0px auto;"></div>
			<div class="summary" style="margin-top: 80px;">개설 과목 총: ${courCount}건</div>
			<div class="filters">
				<!-- Filter options can be added here -->
			</div>
			<table class="table2">
				<thead>
					<tr>
						<th>번호</th>
						<th>강좌명</th>
						<th>교수명</th>
						<th>인원제한</th>
						<th>학점</th>
						<th>신청</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stuinfo" items="${courlist}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${stuinfo.SUB_NAME}</td>
							<td>${stuinfo.PROF_NAME}</td>
							<td>${stuinfo.CLASS_CAP}</td>
							<td>${stuinfo.SUB_POINT}</td>
							<input type="hidden" id="SUB_CODE" name="sub_code" />
							<input type="hidden" id="SUB_NAME" name="SUB_NAME" />
							<input type="hidden" id="PROF_NAME" name="PROF_NAME" />
							<input type="hidden" id="DEPT_NAME" name="DEPT_NAME" />
							<input type="hidden" id="CO_CONTENT" name="CO_CONTENT" />
							<input type="hidden" id="SMT" name="SMT" />
							<input type="hidden" id="YEAR" name="YEAR" />
							<input type="hidden" id="SUB_STATUS" name="SUB_STATUS" />
							<td><c:if test="${stuinfo.SUB_STATUS eq 'n'}">
									<button type="button" class="apply2"
										onclick="submitForm('${stuinfo.SUB_STATUS}','${stuinfo.SUB_CODE}','${stuinfo.SUB_NAME}', '${stuinfo.PROF_NAME}', '${deptname}', '${stuinfo.CO_CONTENT}','${stuinfo.SMT}','${stuinfo.YEAR}')">신청</button>

								</c:if> <c:if test="${stuinfo.SUB_STATUS eq 'y'}">
									<button type="button" class="apply2"
										onclick="submitForm('${stuinfo.SUB_STATUS}','${stuinfo.SUB_CODE}','${stuinfo.SUB_NAME}', '${stuinfo.PROF_NAME}', '${deptname}', '${stuinfo.CO_CONTENT}','${stuinfo.SMT}','${stuinfo.YEAR}')">취소</button>
								</c:if></td>

						</tr>
					</c:forEach>
					<tr>

						<td>학점: ${total }</td>

					</tr>



				</tbody>
			</table>
		</div>
	</div>
	</form>
	<script>
		function submitForm(sub_status, sub_Code, subName, profName, deptName,
				coContent, smt, year) {
			document.getElementById('SUB_STATUS').value = sub_status;
			document.getElementById('SUB_CODE').value = sub_Code;
			document.getElementById('SUB_NAME').value = subName;
			document.getElementById('PROF_NAME').value = profName;
			document.getElementById('DEPT_NAME').value = deptName;
			document.getElementById('CO_CONTENT').value = coContent;
			document.getElementById('SMT').value = smt;
			document.getElementById('YEAR').value = year;
			document.getElementById('dataForm').submit();
		}
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>교수진 소개</title>
<link href="${path}/resources/css/professor.css" rel="stylesheet" />
<script defer src="${path}/resources/js/scrollbtn.js"></script>
<link href="${path}/resources/css/scrollbtn.css" rel="stylesheet" />
</head>
<body>
	<p class="top_scrollbtn" onclick="location.href='#'">TOP</p>
	<div>
		<jsp:include page="../common/header.jsp" />
		<h2 style="margin-top: 150px; text-align: center">
			<strong>교수진 소개</strong>
		</h2>
		<div
			style="width: 70px; height: 5px; background-color: #024C86; margin: 0px auto;"></div>
	</div>


	<main>
		<div class="main-content">
			<div class="filters">
				<form action="professor" method="get">
					<select name="department" id="professor-select"
						onchange="this.form.submit()">
						<option value="COMP" ${department=='COMP'? 'selected' :''}>컴퓨터공학과</option>
						<option value="CHEM" ${department =='CHEM'? 'selected' :''}>화학공학과</option>
						<option value="INSE" ${department =='INSE'? 'selected' :''}>정보보호</option>
						<option value="MATH" ${department =='MATH'? 'selected' :''}>수학과</option>
						<option value="APPL" ${department =='APPL'? 'selected' :''}>응용소프트웨어학과</option>
						<option value="COMM" ${department =='COMM'? 'selected' :''}>정보통신학과</option>
						<option value="AIIN" ${department =='AIIN'? 'selected' :''}>AI인공지능과</option>
						<option value="PHYS" ${department =='PHYS'? 'selected' :''}>물리학과</option>
					</select>
				</form>
			</div>
			<hr>
			<div class="professor-grid">
				<!-- 교수 정보 카드 -->
				<c:forEach var="prolist" items="${list}">
					<div class="professor-card">
						<div class="professor-photo">
							<img src="${path}/resources/img/${prolist.PROF_IMG}" width="100%"
								height="100%" />
						</div>
						<div class="professor-info">
							<h2>${prolist.PROF_NAME}</h2>
							<div class="professor-details">
								<p>부서명:&emsp;&emsp;${prolist.DEPT_NAME}</p>
							</div>
							<div class="professor-details">
								<p>과목명:&emsp;&emsp;${prolist.SUB_NAME}</p>
							</div>
							<div class="professor-details">
								<p>이메일:&emsp;&emsp;${prolist.PROF_EMAIL}</p>
							</div>
							<div class="professor-details">
								<p>전화번호:&emsp;${prolist.PROF_PHONE}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

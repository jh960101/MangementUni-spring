<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>총장님께 부탁드립니다.</title>

<link href="${path}/resources/css/courses.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
.sub {
	color: red;
}

.input-group-text {
	background-color: #f8f9fa;
	border-color: black;
}

.form-control {
	border-color: black;
}

.custom {
	max-width: 1100px;
	margin: 0 auto;
	text-align: center;
}

.btn-wide {
	width: 30%;
}

.custom-button {
	background-color: rgb(2, 76, 134);
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	width: 300px;
	margin-top:20px;
	text-align:center;
}

.custom-container {
	max-width: 900px;
}

h1 {
	width: 700px;
}

.containerask {
	margin-top: 100px;
}

.privacy-box {
	border: 1px solid #ccc;
	padding: 20px;
	margin-top: 20px;
	text-align: left;
}

row row-cols-1 {
	margin-top: 50px;
}
</style>
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
	<div class="container" style="height: 1000px; margin-top: 100px;">
		<div id="content">
			<!-- title view -->
			<div id="pageTitle">
				<h1>총장님께 바랍니다</h1>
			</div>
			<div class="custom">
				<h5 class="mt-4" style="text-align: left; color: red;">이 글은
					익명성이 보장됩니다.</h5>
				<!-- Privacy Notice Section -->
				<div class="privacy-box">
					<h2>개인정보 활용 동의</h2>
					<p>총장님께 바랍니다에 수집된 개인정보는 목적 이외의 용도로는 이용되지 않으며, 수집 목적 외 이용 및
						제3자 제공 시에는 사전에 알리고 동의를 받을 예정입니다.</p>
					<ol>
						<li>개인정보 수집목적: 제안 의견 처리</li>
						<li>개인정보 수집항목: 성명, 이메일 주소, 연락처</li>
						<li>개인정보 보유 및 이용기간: 관련 법령이 정한 기간 동안</li>
						<li>거부권 및 불이익: 개인정보 수집 이용에 동의하지 않을 권리가 있으며 동의하지 않는 경우에는 '총장님께
							바랍니다' 제안 서비스를 이용하실 수 없습니다.</li>
					</ol>
					<p>위와 같이 본인의 개인정보를 수집·이용하는 것에 동의합니다.</p>
				</div>

				<div class="col input-background" style= "margin-top:50px;">
					<div class="container text-center">
						<div id="pageContent">
							<div class="row row-cols-1">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">제목</span> <input
											type="text" class="form-control"
											aria-describedby="basic-addon1">
									</div>
								</div>
								<div class="col">
									<div class="input-group">
										<span class="input-group-text">내용</span>
										<textarea class="form-control" aria-label="With textarea"
											rows="9"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div style="height: 50px;"></div>

					<button type="button" class="button btn-wide custom-button"
						onclick="popup()">글 올리기</button>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

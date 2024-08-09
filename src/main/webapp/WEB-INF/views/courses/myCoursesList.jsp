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
<title>수강 강의 목록 페이지</title>

<!-- 구글 아이콘 링크  -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link href="${path}/resources/css/courses.css" rel="stylesheet" />

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar">
			<ul id="menulist">
				<li><a href="studentstatus">학적 조회</a></li>
				<li><a href="passwordchange">학생 정보 변경</a></li>
				<li><a href="objection">성적 조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="myCoursesPage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 2500px; margin-top: 100px;">
		<div id="content">
			<!-- title view -->
			<div id="pageTitle">
				<h1>파이썬 프로그래밍 실무</h1>
				<h1>${title}</h1>
			</div>

			<!-- content view -->
			<div id="pageContent">

				<!-- 강의 개요 작성 -->
				<div id="improtant2">
					<div id="SubjectTitle">
						<h3>강의개요</h3>
					</div>
					<hr>
					<div id="SubjectContent">
						<p>강의 개요가 들어갈 텍스트</p>
						<p>${ content }</p>
					</div>
				</div>

				<!-- 출석률 퍼센트 바 -->
				<div id="atten">
					<h5>출석률 현황</h5>
					<div class="present">
						<progress value="22" max="100" id="bar"></progress>
					</div>
				</div>

				<!--  주차별 목록 출력 -->
				<div id="comm">주차 별 학습 활동</div>

				<div id="onlineList">
					<div id="online">
						<p id="online-title">1주차(2022-02-28 ~ 2022-03-01)</p>
						<div id="onlien-cont">
							<p>
								<a href= onlineviedeo
									onclick="openPage(this.href, 1000px, 800px); return false;">
									<span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목
								</a>
							</p>

							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>

					</div>
					<div id="online">
						<h5>2주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
					<div id="online">
						<h5>3주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
					<div id="online">
						<h5>4주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
					<div id="online">
						<h5>5주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
					<div id="online">
						<h5>6주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
					<div id="online">
						<h5>7주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
					<div id="online">
						<h5>8주차(2022-02-28 ~ 2022-03-01)</h5>
						<div id="onlien-cont">
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<p>
								<a href="#"><span class="material-symbols-outlined icon">play_circle
								</span> 1. 동영상 강의 제목</a>
							</p>
							<span class="material-symbols-outlined icon">description</span>[강의
							자료]
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script>
	function openPage() {
        // 새 창의 크기와 위치 설정
        const width = 1200;
        const height = 700;
        const screenWidth = window.screen.availWidth;
        const screenHeight = window.screen.availHeight;
        const left = (screenWidth - width) / 2;
        const top = (screenHeight - height) / 2;

        // 새 창 옵션
        const options = `width=${width},height=${height},left=${left},top=${top},resizable=yes,scrollbars=yes`;

        // 새 창 열기
        const newWindow = window.open('', '_blank', options);
	</script>
</body>
</html>
<jsp:include page="../common/footer.jsp" />

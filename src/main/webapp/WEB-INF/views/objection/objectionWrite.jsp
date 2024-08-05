<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 이의 신청</title>
<link href="${path}/resources/css/objection.css" rel="stylesheet" />
<style>
.contentView {
	text-align: left;
}

.contentView table {
	align: center;
}

.wirteTable {
	margin-top: 100px;
	margin-left: 400px;
	border: 2px solid #024C86;
	border-radius: 50px;
	text-align: top !important;
}

.contentbox {
	width: auto !important;
}

.titlebox {
	width: auto !important;
}

.btnbox {
	margin-right: 250px;
}
</style>
</head>
<body>
	<div id="menuBar">
		<div id="sub-menubar">
			<ul id="menulist">
				<li><a href="studentstatus">학적 조회</a></li>
				<li><a href="passwordchange">학생 정보 변경</a></li>
				<li><a href="objection">성적 조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="#">시간표</a></li>
				<li><a href="#">학생증</a></li>
			</ul>
		</div>
	</div>

	<div class="container" style="height: 500px;">

		<div id="content">
			<div id="pagetitle">
				<h1>성적 이의 신청</h1>
			</div>

			<div class="contentView"
				style="margin: 50px; margin-left: 300px; text-align: center; font-size: 20px;">
				<form action="/" method="post">
					<div class="row mb-3">
						<label for="subjectTitle" class="col-sm-2 col-form-label"
							style="text-align: left;"><b>&gt; 수강 과목</b></label>
						<div class="col-sm-10 titlebox">
							<label for="subjectTitle"
								style="text-align: left; margin-top: 5px;">C언어 프로그래밍 활용</label>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label"
							style="text-align: left; font-weight: 700;"><b>&gt;
								신청 내용</b></label>
						<div class="col-sm-10 contentbox">
							<textarea rows="5" cols="60" style="width: 500px;"
								placeholder="이의 신청 내용을 입력하세요" name="detail"></textarea>
						</div>
					</div>

					<div class="btnbox">
						<button type="submit" class="btn btn-primary" value="등록"
							style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">등록</button>
						<button type="reset" class="btn btn-primary" value="다시쓰기"
							style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">다시쓰기</button>
						<button type="button" class="btn btn-primary" value="돌아가기"
							onclick="history.back()"
							style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">돌아가기</button>
					</div>
				</form>
			</div>
			<!-- contentView -->
		</div>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>
<jsp:include page="../common/footer.jsp" />
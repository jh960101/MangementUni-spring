<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 이의 신청 변경</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menubar">
			<ul id="menulist">
				<li><a href="infoboard">공지사항 관리</a></li>
				<li><a href="scholarlist">장학금 관리</a></li>
				<li><a href="objectionlist">성적 관리</a></li>
			</ul>
		</div>
	</div>

	<div class="container" style="height: 750px; margin-top: 50px;">
		<div id="content">
			<!-- title view -->
			<div id="pagetitle">
				<h1>이의 신청 성적 변경</h1>
			</div>
			<div id="pageContent">
				<div class="contentView"
					style="margin: 50px; margin-left: 300px; text-align: center; font-size: 20px;">
					<form action="${path}/objectionWritePro" method="post"
						id="objectionForm">
						<input type="hidden" name="sub_code" value="${sub_code}" /> <input
							type="hidden" name="sub_name" value="${sub_name}" />
						<div class="row mb-3">
							<label for="subjectTitle" class="col-sm-2 col-form-label"
								style="text-align: left;"><b>&gt; 수강 과목</b></label>
							<div class="col-sm-10 titlebox">
								<label for="subjectTitle"
									style="text-align: left; margin-top: 5px;">${sub_name}</label>
							</div>
						</div>
						<div class="row mb-3">
							<label for="input" class="col-sm-2 col-form-label"
								style="text-align: left; font-weight: 700;"><b>&gt;
									신청 내용</b></label>
							<div class="col-sm-10 contentbox">
								<textarea rows="6" cols="60" style="width: 500px;"
									id="objectionContent" placeholder="이의 신청 내용을 입력하세요"
									name="content"></textarea>
							</div>
						</div>

						<div class="btnbox">
							<button type="submit" class="btn " value="등록"
								onclick="${path}/objectionWritePro?sub_code=${sub_code}"
								id="submitButton"
								style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">등록</button>
							<button type="reset" class="btn " value="다시쓰기"
								style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">다시쓰기</button>
							<button type="button" class="btn " value="돌아가기" id="backButton"
								style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">돌아가기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- pageContent -->
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
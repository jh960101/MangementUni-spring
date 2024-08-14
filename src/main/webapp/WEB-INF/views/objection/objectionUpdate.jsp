<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 이의 신청 변경</title>
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
	text-align: left;
}

.titlebox {
	width: auto !important;
}

.btnbox {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	width: 500px;
	margin-left: 180px;
}

.btn {
	padding: 10px;
	text-align: center;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
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

	<div class="container" style="height: auto; margin-top: 50px;">
		<div id="content">
			<!-- title view -->
			<div id="pagetitle">
				<h1>이의 신청 상세내용</h1>
			</div>
			<div id="pageContent">
				<div class="contentView"
					style="margin: 50px; margin-left: 300px; text-align: center; font-size: 20px;">
					<form action="${path}/objectionUpdatePro" method="POST"
						id="objectionForm">
						<input type="hidden" name="sub_code" value="${sub_code}" /> 
						<input type="hidden" name="sub_name" value="${sub_name}" />
						<input type="hidden" name="stu_no" value="${stu_no}"/>
						<c:forEach var="item" items="${objectlist}">
							<div class="row mb-3">
								<label for="subjectTitle" class="col-sm-2 col-form-label"
									style="text-align: left;"><b>&gt; 학번</b></label>
								<div class="col-sm-10 titlebox">
									<label for="subjectTitle"
										style="text-align: left; margin-top: 5px;">${stu_no}</label>
								</div>
							</div>
							<div class="row mb-3">
								<label for="subjectTitle" class="col-sm-2 col-form-label">
									<b>&gt; 학생명</b>
								</label>
								<div class="col-sm-10 titlebox">
									<label for="subjectTitle"
										style="text-align: left; margin-top: 5px;">${item.stu_name}</label>
								</div>
							</div>
						
						<div class="row mb-3">
								<label for="subjectTitle" class="col-sm-2 col-form-label"
									style="text-align: left;"><b>&gt; 이의 과목</b></label>
								<div class="col-sm-10 titlebox">
									<label for="subjectTitle"
										style="text-align: left; margin-top: 5px;">${item.sub_name}</label>
								</div>
						</div>
							<div class="row mb-3">
								<label for="subjectTitle" class="col-sm-2 col-form-label"
									style="text-align: left;"><b>&gt; 과목 성적</b></label>
								<div class="col-sm-10 titlebox">
									<c:if test="${not empty item.grade_p}">
										<input type="text" name="grade_p" value="${item.grade_p}"
											style="text-align: left; margin-top: 5px; width: 100px;" />
									</c:if>
								</div>
							</div>
							<div class="row mb-3">
								<label for="input" class="col-sm-2 col-form-label"
									style="text-align: left; font-weight: 700; width:200px;">
									<b>&gt; 이의 신청 내용</b></label>
							</div>
							<div class="col-sm-10 contentbox">
								<c:if test="${not empty item.obj_content}">
									<textarea rows="6" cols="60" style="width: 500px;" readonly="readonly"
										id="objectionContent" name="content">${item.obj_content}</textarea>
								</c:if>
							</div>
						</c:forEach>

						<div class="btnbox">
							<button type="submit" class="btn" value="저장하기"
<%-- 								onclick="${path}/objectionUpdatePro?sub_code=${sub_code}&stu_no=${stu_no}" --%>
								id="submitButton"
								style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">저장하기</button>
							<button type="button" class="btn " value="돌아가기" id="backButton" onclick="history.back();"
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
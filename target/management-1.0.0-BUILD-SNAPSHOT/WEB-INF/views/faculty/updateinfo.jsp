<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 및 삭제</title>
<link href="${path}/resources/css/objection.css" rel="stylesheet" />
<link href="${path}/resources/css/infodetail.css" rel="stylesheet" />

<style>
#tbl-board {
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
	border-collapse: collapse;
}

#tbl-board th, #tbl-board td {
	padding: 15px;
	border: 1px solid #ddd;
	text-align: left;
	font-size: 16px;
	height: 50px;
}

#tbl-board th {
	background-color: #f2f2f2;
	font-weight: bold;
}

#tbl-board input[type="text"], #tbl-board textarea, #tbl-board input[type="file"]
	{
	width: calc(100% - 20px); /* padding과 border를 고려한 width */
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

#tbl-board textarea {
	resize: none; /* 텍스트 영역 크기 조절 비활성화 */
}

.button-group {
	display: flex;
	justify-content: space-between;
}

.button-group button {
	font-size: 18px;
	padding: 10px 38px;
	margin: auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #024C86;
	color: white;
	margin-right: 55px;
}

.button-group button:hover {
	opacity: 0.8;
}

.backbtn {
	margin-top: 30px;
	text-align: center;
}

.backbtn .btn {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 110px;
	height: 65px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<c:set var="searchType" value="${param.searchType}" />
	<c:if test="${empty searchType}">
		<c:set var="searchType" value="title" />
	</c:if>



	<div class="container" style="height: 1100px; margin-top: 100px;">
		<div id="content">
			<div id="pageTitle">
				<h1>공지사항 수정</h1>
			</div>
			<div id="pageContent">
				<form action="updateinfoPro" method="post style="margin-bottom: 20px;" enctype="multipart/form-data">
					<input type="hidden" name="bo_no" value="${board.bo_no}" />
					<!-- hidden으로 bo_no를 추가 -->
					<table id="tbl-board">
						<tr>
							<th>글번호</th>
							<td><label>${board.bo_no}</label></td>
						</tr>
						<tr>
							<th>제 목</th>
							<td><input type="text" name="title" value="${board.title}" /></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><c:out value="${board.emp_name}" /></td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="uploadFile" /> <c:if
									test="${!empty board.originalFilename}">
									<a
										href="javascript:fileDownload('${board.originalFilename}', '${board.originalFilename}')">
										<c:out value="${board.originalFilename}"></c:out>
									</a>
								</c:if></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><textarea name="content" rows="15">${board.content}</textarea></td>
						</tr>
					</table>
					<div class="button-group">
						<button type="submit" id="btnUpdate btn">수정</button>
						<button type="button" id="btnDelete btn"
							onclick="deleteFunc(${board.bo_no})">삭제</button>
					</div>
					<div class="backbtn">
						<button type="button" id="btnCancel" class="btn"
							onclick="window.history.back()"
							style="color: white; font-weight: bold; font-size: 16px;">돌아가기</button>
					</div>
				</form>
			</div>
			<!-- pageContent  -->
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>
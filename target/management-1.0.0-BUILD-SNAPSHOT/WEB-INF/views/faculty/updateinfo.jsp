<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

.button-group .btnlist {
	margin-left: 0;
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

.table-secondary {
	margin-top: 20px;
	justify-content: right;
	display: flex;
}

.table-secondary .btnlist {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	display: right;
	margin-left: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100px;
	height: 40px;
}

.backbtn .btnlist {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	border: none;
	margin-left: 0;
	border-radius: 4px;
	cursor: pointer;
	width: 120px;
	height: 60px;
}

.button-group {
	justify-content: right;
	text-align: right;
	margin: 20px 50px;
}

.button-group button {
	font-size: 18px;
	font-weight: bold;
	padding: 10px 38px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #024C86;
	color: white;
	margin-right: 55px;
	padding: 10px 38px;
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

	<div class="container" style="height: auto; margin-top: 100px;">
		<div id="content">
			<div id="pageTitle">
				<h1>공지사항 수정</h1>
			</div>
			<div id="pageContent">
				<form action="${path}/updateinfoPro" method="post"
					enctype="multipart/form-data" style="margin-bottom: 20px;">
					<input type="hidden" name="bo_no" value="${board.bo_no}" />
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
							<td><input type="file" name="uploadFile"
								value="${board.originalFilename}" /> <c:if
									test="${!empty board.originalFilename}">
									<c:out value="${board.originalFilename}"></c:out>
								</c:if></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td>
								<div id="contentLabel"
									style="padding: 10px; width: 100%; height: auto;">
									<textarea name="content" rows="10"
										style="width: 100%; height: auto;">${board.content}</textarea>
									<input type="file" id="imageUpload" accept="image/*"
										name="imageUpload" style="margin-top: 10px;" />
									<div id="imagePreview" style="margin-top: 10px;"></div>
								</div>
							</td>

						</tr>
					</table>
					<div class="button-group">
						<button type="submit" id="btnUpdate" class="btnlist">수정</button>
						<button type="button" id="btnDelete" class="btnlist"
							onclick="deleteFunc(${board.bo_no})">삭제</button>
					</div>
					<div class="backbtn">
						<button type="button" id="btnCancel" class="btn btnlist"
							onclick="window.history.back()"
							style="color: white; font-weight: bold; font-size: 16px;">돌아가기</button>
					</div>
				</form>
			</div>
			<!-- pageContent -->
		</div>
	</div>
	<script>
		document.getElementById('imageUpload').addEventListener('change', function(event) {
	        const file = event.target.files[0]; // 선택한 첫 번째 파일
	
	        // 파일이 있는 경우
	        if (file) {
	            const fileName = file.name; // 파일의 이름
	            const extension = fileName.split('.').pop().toLowerCase(); // 파일 확장자 가져오기
	
	            // 유효한 이미지 확장자인지 확인
	            if (!['jpg', 'jpeg', 'png', 'gif'].includes(extension)) {
	                alert('이미지 파일만 선택할 수 있습니다. JPG, JPEG, PNG, GIF 형식의 이미지를 선택해 주세요.');
	                event.target.value = ''; // 선택한 파일 초기화
	                return; // 함수 종료
	            }
	
	            // Image preview 처리
	            const reader = new FileReader();
	            reader.onload = function(e) {
	                const img = document.createElement('img');
	                img.src = e.target.result;
	                img.style.maxWidth = '100%';
	                img.style.maxHeight = '300px';
	                img.style.marginTop = '10px';
	                document.getElementById('imagePreview').innerHTML = ''; // 이전 미리보기 초기화
	                document.getElementById('imagePreview').appendChild(img); // 미리보기 추가
	            };
	
	            reader.readAsDataURL(file); // 선택한 파일 읽기
	        }
	    });
	
		function fileDownload(oriname, rename) {
			const url = "${path}/board/fileDown";
			let oName = encodeURIComponent(oriname);
			let rName = encodeURIComponent(rename);
			location.assign(url + "?oriname=" + oName + "&rename=" + rName);
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>

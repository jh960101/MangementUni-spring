<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성</title>

<link
	href="${pageContext.request.contextPath}/resources/css/courses.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/everytime2.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


</head>
<c:if test="${loginname == null}">
	<script>
		alert('교직원 및 재학생만 접근이 가능합니다.');
		window.location.href = "login";
	</script>
</c:if>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 150px;">
			<ul id="menulist">
				<li><a href="everytimehot">HOT게시판</a></li>
				<li><a href="etmainpage">자유게시판</a></li>
				<li><a href="etmypage?stuno=${studentno}">내글 보기</a></li>
			</ul>
		</div>
	</div>
	<div class="container"
		style="height: 1000px; width: 1000px; margin-top: 100px;">
		<div id="content">
			<form action="${pageContext.request.contextPath}/insertBoard" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <div class="input-group mb-0">
        <input type="text" name="title" class="form-control1" placeholder="글 제목" maxlength="50">
    </div>
    <div class="input-group mb-0" style="border-bottom: none;">
        <input type="text" name="content" class="form-control2" placeholder="글을 작성하시오" maxlength="1000">
    </div>
    <div class="form-controls-container">
					<div class="file-upload-section">
						<label for="file-upload" class="file-upload-button">
							<span>첨부파일</span>
							<input type="file" id="file-upload" name="file-upload" onchange="updateFilePath()">
						</label>
						<span id="file-path" class="file-upload-path">첨부된 파일이 없습니다</span>
					</div>
					<div class="오른쪽정렬">
						<div class="form-check d-inline">
							<input class="form-check-input"
								style="font-weight: bolder; border: 2px solid rgb(2, 76, 134)"
								type="checkbox" name="anonymous" value="true" id="flexCheckDefault"> 
							<label class="form-check-label" style="font-weight: bolder;" for="flexCheckDefault">익명</label>
						</div>
						<div class="d-flex align-items-center">
							<button class="custom-submit-button" type="submit" id="button-addon2">글 작성</button>
						</div>
					</div>
				</div>
			</form>
			<div class="btn-container">
				<button type="button" class="btn1" onclick="history.back()">◀뒤로가기</button>
			</div>
		</div>
	</div>

	<script>
		function updateFilePath() {
			const fileInput = document.getElementById('file-upload');
			const filePath = document.getElementById('file-path');
			if (fileInput.files.length > 0) {
				filePath.textContent = fileInput.files[0].name;
			} else {
				filePath.textContent = '첨부된 파일이 없습니다';
			}
		}
	</script>
	
	<!-- 글자수제한 -->
<script>
    function validateForm() {
        const title = document.querySelector('input[name="title"]').value;
        const content = document.querySelector('input[name="content"]').value;

        if (title.length > 50) {
            alert("제목은 50자 이하로 작성해야 합니다.");
            return false;  =
        }

        if (content.length > 1000) {
            alert("내용은 1000자 이하로 작성해야 합니다.");
            return false;  =
        }

        return true;  // 폼 제출 허용
    }
</script>
<%-- etmainpage.jsp 또는 etnew.jsp --%>
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<jsp:include page="../common/footer.jsp" />

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
<title>presidentplslist</title>

<link href="${path}/resources/css/courses.css" rel="stylesheet" />
<link href="${path}/resources/css/everytime.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container" style="height: 1000px; margin-top: 100px;">
		<div id="content">
			<!-- title view -->
			<div class="list-group">
				<div class="dropdown-container">
					<div class="dropdown">
						<button class="dropbtn" id="dropdownButton">제목&nbsp;&nbsp;▼</button>
						<div class="dropdown-content">
							<a href="#" onclick="setDropdownText('제목')">제목</a> <a href="#"
								onclick="setDropdownText('작성자')">작성자</a>

						</div>
					</div>
					<input type="text" id="searchBox" class="search-box"
						value="검색어를 입력해주세요" onfocus="clearPlaceholder()"
						onblur="setPlaceholder()">
				</div>
				<input type="text" id="Box" class="box" value="총장님께.." readonly>
			</div>
			



			<div class="list-group">
				<a href="etdetailview"
					class="list-group-item list-group-item-action list-group-item-large"
					aria-current="true" style="margin-top: 5px;"> 총장님..</a>
			</div>

			<button type="button" class="btn1">▼&nbsp;더보기</button>
		</div>
	</div>

	<script>
		function clearPlaceholder() {
			var searchBox = document.getElementById('searchBox');
			if (searchBox.value === '검색어를 입력해주세요') {
				searchBox.value = '';
				searchBox.style.color = 'black';
			}
		}

		function setPlaceholder() {
			var searchBox = document.getElementById('searchBox');
			if (searchBox.value === '') {
				searchBox.value = '검색어를 입력해주세요';
				searchBox.style.color = 'grey';
			}
		}

		function setDropdownText(selectedText) {
			var dropdownButton = document.getElementById('dropdownButton');
			dropdownButton.innerHTML = selectedText + '&nbsp;&nbsp;▼';
		}
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<jsp:include page="../common/footer.jsp" />
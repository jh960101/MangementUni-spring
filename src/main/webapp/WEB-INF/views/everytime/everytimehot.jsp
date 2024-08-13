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
<title>everytimemain</title>

<link href="${path}/resources/css/courses.css" rel="stylesheet" />
<link href="${path}/resources/css/everytime.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script defer src="${path}/resources/js/scrollbtn.js"></script>
<link href="${path}/resources/css/scrollbtn.css" rel="stylesheet" />
</head>

<body>

	<p class="top_scrollbtn" onclick="scrollbtn('main-img')">TOP</p>

	<div>
		<img id="main-img" src="${path}/resources/img/eta_img.png"
			style="margin-top: 130px; width: 100%" />

	</div>
	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 150px;">
			<ul id="menulist">
				<li><a href="etmainpage">자유게시판</a></li>
				<li><a href="etmypage?stuno=${studentno}">내글 보기</a></li>
				<li><a href="everytimehot">HOT게시판</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 1000px;">
		<div id="content">
			<!-- title view -->
			<div class="list-group">
				<div class="dropdown-container">
					<div class="dropdown">
						<button class="dropbtn" id="dropdownButton">제목&nbsp;&nbsp;▼</button>
						<div class="dropdown-content">
							<a href="#" onclick="setDropdownText('제목')">제목</a> <a href="#"
								onclick="setDropdownText('작성자')">작성자</a> <a href="#"
								onclick="setDropdownText('내용')">내용</a>
						</div>
					</div>
					<input type="text" id="searchBox" class="search-box"
						value="검색어를 입력해주세요" onfocus="clearPlaceholder()"
						onblur="setPlaceholder()">
				</div>
				<input type="text" id="Box" class="box" value="&nbsp;🔥HOT 게시판🔥"
					readonly>
			</div>

			<c:forEach var="board" items="${list}" varStatus="status">
				<div class="list-group">
					<a href="etdetailview?no=${board.bo_no }"
						class="list-group-item list-group-item-action list-group-item-large"
						aria-current="true" style="margin-top: 5px;"> <span
						style="font-size: 20px; vertical-align: middle;">👑</span> ${status.count}st ${board.title}
					</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-small disabled">
						${board.content} </a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-small2 disabled">
						<div style="display: flex; align-items: center;">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">글
								작성 1초전</div>
							<img src="${path}/resources/img/msg.png" width="15" height="15">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">20</div>
							<img src="${path}/resources/img/조회수.png" width="15" height="15">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.readCount}</div>
							<img src="${path}/resources/img/추천버튼.png" width="15" height="15">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.boLike}</div>
						</div>
					</a>
				</div>
			</c:forEach>

<!-- 			<button type="button" class="btn1">▼&nbsp;더보기</button> -->
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
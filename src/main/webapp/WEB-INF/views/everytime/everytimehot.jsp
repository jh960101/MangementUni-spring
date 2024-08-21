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
<title>HOT 게시판</title>

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
	<c:if test="${loginname == null}">
		<script>
			alert('교직원 및 재학생만 접근이 가능합니다.');
			window.location.href = "login";
		</script>
	</c:if>
	<p class="top_scrollbtn" onclick="scrollbtn('main-img')">TOP</p>

	<div>
		<img id="main-img" src="${path}/resources/img/eta_img.png"
			style="width: 100%" />

	</div>
	<jsp:include page="../common/homeheader.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 150px;">
			<ul id="menulist">
				<li><a href="everytimehot">🔥HOT 게시판🔥</a></li>
				<li><a href="etmainpage">자유 게시판</a></li>
				<li><a href="etmypage">내글 보기</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 1000px;">
		<div id="content" style="margin-top: 60px;">
			<!-- title view -->
			<div class="list-group">
				<input type="text" id="Box" class="box" value="&nbsp;🔥HOT 게시판🔥"
					readonly>
			</div>

			<c:forEach var="board" items="${list}" varStatus="status">
				<div class="list-group" style="border: 1px solid black;margin-top: 20px;margin-bottom: 20px;cursor: pointer" onclick="location.href='etdetailview?no=${board.bo_no}'">
					<a href="etdetailview?no=${board.bo_no}"
						class="list-group-item list-group-item-action list-group-item-large"
						aria-current="true" style="border-bottom: 1px solid #333;background-color: #eee"> <span
						style="font-size: 20px; vertical-align: middle;"> <c:if
								test="${status.count<=3 }">
								<img src="${path}/resources/img/etahotimg${status.count}.png" />
								<strong>${board.title}</strong>
							</c:if>
					</span> <c:if test="${status.count>3 }">${status.count}th ${board.title}</c:if>
					</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-small disabled" style="border: none;font-size: 18px;">
						${board.content} </a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-small2 disabled" style="border: none">
						<div style="display: flex; align-items: center;">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:parseNumber value="${board.create_date.time / (1000*60*60*24)}" var="prevDate" integerOnly="true" />
								<fmt:parseNumber value="${now.time  / (1000*60*60*24)}" var="nowDate" integerOnly="true" />
								<c:if test="${nowDate-prevDate-1 < 0}">
									오늘
								</c:if>
								<c:if test="${nowDate-prevDate-1 > 0}">
									${nowDate-prevDate-1}일전
								</c:if>
								
							</div>
							<img src="${path}/resources/img/msg.png" width="15" height="15">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.replyCount}</div>
							<img src="${path}/resources/img/조회수.png" width="15" height="15">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.readCount}</div>
							<img src="${path}/resources/img/추천버튼.png" width="15" height="15">
							<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.bo_Like}</div>
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

<jsp:include page="../common/footer.jsp" />
</html>

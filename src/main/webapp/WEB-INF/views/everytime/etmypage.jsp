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
<title>내글 보기</title>

<link
	href="${pageContext.request.contextPath}/resources/css/courses.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/everytime.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script defer src="${path}/resources/js/scrollbtn.js"></script>
<link href="${path}/resources/css/scrollbtn.css" rel="stylesheet" />

<style>
.page-link {
	color: black !important;
}

.page-item.active .page-link {
	z-index: 1;
	font-weight: bold;
	color: white !important;
	background-color: #024C86;
	border: 1px solid white;
	border-radius: 5px;
}

.page-link:focus, .page-link:hover {
	color: #024C86;
}
</style>
</head>

<body>

	<c:if test="${not empty msg}">

		<script>
		alert('${msg}');
		history.back();
	</script>
		<c:remove var=" msg" />
	</c:if>

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
		<div id="content" style="height: 60px;">
			<!-- title view -->
			<div class="list-group">
				<input type="text" id="Box" class="box" value="&nbsp;내글 보기" readonly>
			</div>

			<div class="input-group mb-0" style="margin-top: 5px;">
				<input type="text" class="form-control" placeholder="새 게시글을 작성해주세요"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button"
					id="button-addon2" onclick="location.href='etnew'">글작성</button>
			</div>


			<c:if test="${list.size()!=0 }">
				<c:forEach var="board" items="${list}">
					<div class="list-group"
						style="border: 1px solid black; margin-top: 20px; margin-bottom: 20px;">
						<a href="etaupdate?bo_no=${board.bo_no}"
							class="list-group-item list-group-item-action list-group-item-large"
							aria-current="true" style="background-color: #eee">
							${board.title}</a> <a href="#"
							class="list-group-item list-group-item-action list-group-item-small disabled"
							style="border: none; font-size: 18px;"> ${board.content}</a> <a
							href="#"
							class="list-group-item list-group-item-action list-group-item-small2 disabled"
							style="border: none;">
							<div style="display: flex; align-items: center;">
								<div style="padding: 1px; margin-right: 10px; font-size: 15px;">글
									작성 1초전</div>
								<img
									src="${pageContext.request.contextPath}/resources/img/msg.png"
									width="15" height="15">
								<div style="padding: 1px; margin-right: 10px; font-size: 15px;">20</div>
								<img
									src="${pageContext.request.contextPath}/resources/img/조회수.png"
									width="15" height="15">
								<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.readCount}</div>
								<img
									src="${pageContext.request.contextPath}/resources/img/추천버튼.png"
									width="15" height="15">
								<div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.bo_Like}</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${list.size()!=0 }">
				<div class="btn-container" style="display: flex;justify-content: center;margin-top: 50px;">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<!-- 이전 페이지 -->
							<li
								class="page-item <c:if test="${pageInfo.prevPage == 0}">disabled</c:if>">
								<button class="page-link" type="button"
									onclick="if(${pageInfo.prevPage} > 0) { window.location.href='${path}/etmypage?page=${pageInfo.prevPage}'; } else { return false; }"
									aria-label="Previous"
									<c:if test="${pageInfo.prevPage == 0}">disabled</c:if>>
									<span aria-hidden="true">&laquo;</span>
								</button>
							</li>

							<!-- 페이지 목록 -->
							<c:forEach begin="${pageInfo.startPage}"
								end="${pageInfo.lastPage}" step="1" var="page">
								<c:if test="${page == pageInfo.currentPage}">
									<li class="page-item active"><span class="page-link">${page}</span></li>
								</c:if>
								<c:if test="${page != pageInfo.currentPage}">
									<li class="page-item"><span class="page-link"
										style="cursor: pointer;"
										onclick="window.location.href='${path}/etmypage?page=${page}';">
											${page}</span></li>
								</c:if>
							</c:forEach>

							<!-- 다음 페이지 -->
							<li
								class="page-item <c:if test="${pageInfo.nextPage == 0}">disabled</c:if>">
								<button class="page-link" type="button"
									onclick="if(${pageInfo.nextPage} > 0) { window.location.href='${path}/etmypage?page=${pageInfo.nextPage}'; } else { return false; }"
									aria-label="Next"
									<c:if test="${pageInfo.nextPage == 0}">disabled</c:if>>
									<span aria-hidden="true">&raquo;</span>
								</button>
							</li>
						</ul>
					</nav>
				</div>
			</c:if>

			<c:if test="${list.size()==0 }">
				<div style="text-align: center; padding-top: 300px">
					<h2>게시글이 존재하지 않습니다</h2>
				</div>
			</c:if>
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
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<jsp:include page="../common/footer.jsp" />

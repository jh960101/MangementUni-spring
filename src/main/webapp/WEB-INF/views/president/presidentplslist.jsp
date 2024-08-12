<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<style>
#menulist {
	text-decoration: none;
	list-style: none;
	font-weight: bold;
	align-items: center;
	margin-top: 10px;
}

#menulist a {
	text-decoration: none;
	color: white;
}

#menulist a:hover {
	border-bottom: 1px solid;
	border-bottom-color: white;
}

.sch_smit {
	border: none;
	border-radius: 5px;
	background-color: #024C86;
	color: white;
	padding: 5px 10px 5px 10px;
}

#listtitle {
	text-decoration: none;
	color: black;
}

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
<title>공지사항</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- 만약 아무것도 없다면 checked를 타이틀로 지정하기 위해서 if문을 작성한 것이다.  -->
	<c:set var="searchType" value="${param.searchType}" />
	<c:if test="${empty searchType }">
		<c:set var="searchType" value="${'title'}" />
	</c:if>

	<!-- 없는 게시글을 상세 페이지로 이동하기 위해 클릭할 때, alert창 띄우기 위해 코드 작성 -->
	<c:if test="${not empty msg}">
		<script>
        alert('${msg}');
    </script>
		<c:remove var="msg" />
	</c:if>

	<c:if test="${not empty sessionScope.msg}">
		<script>
        alert('${fn:escapeXml(sessionScope.msg)}');
    </script>
		<c:remove var="msg" scope="session" />
	</c:if>


	<c:if test="${login == '미르총장'}">
		<div id="menuBar">
			<div id="sub-menubar" style="height: 150px;">
				<ul id="menulist">
					<li><a href="infoboard">공지사항 관리</a></li>
					<li><a href="scholarlist">장학금 관리</a></li>
					<li><a href="objectionlist">성적 관리</a></li>
				</ul>
			</div>
		</div>
	</c:if>

	<div class="container" style="height: 750px; margin-top: 100px;">
		<div id="content">
			<!-- title view -->
			<div id="pageTitle">
				<h1>총장님부탁드립니다</h1>
			</div>

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">

						<c:if test="${empty boardList}">
							<tr>
								<td colspan="6">조회된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty boardList}">
							<c:forEach var="board" items="${boardList}">
								<!-- C 타입인 항목만 출력 -->
								<c:if test="${board.type == 'C'}">
									<tr>
										<td><a id="listtitle"
											href="${path}/infodetail?bo_no=${board.bo_no}"> <c:out
													value="${board.title}" />
										</a></td>
										<td><fmt:formatDate value="${board.create_date}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>
			<!-- table-responsive div -->
		</div>
		<!-- pageContent div -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<!-- 이전 페이지 -->
				<li class="page-item <c:if test="${pageInfo.prevPage == 0}">disabled</c:if>">
					<button class="page-link" type="button"
						onclick="if(${pageInfo.prevPage} > 0) { window.location.href='${path}/infoboard?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.prevPage}'; } else { return false; }"
						aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</button>
				</li>

				<!-- 페이지 목록 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.lastPage}" step="1" var="page">
					<c:if test="${page == pageInfo.currentPage}">
						<li class="page-item active"><span class="page-link">${page}</span></li>
					</c:if>
					<c:if test="${page != pageInfo.currentPage}">
						<li class="page-item"><span class="page-link"
							style="cursor: pointer;"
							onclick="window.location.href='${path}/infoboard?searchType=${searchType}&searchValue=${searchValue}&page=${page}';">
								${page}</span></li>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 -->
				<li class="page-item <c:if test="${pageInfo.nextPage == 0}">disabled</c:if>">
					<button class="page-link" type="button"
						onclick="if(${pageInfo.nextPage} > 0) { window.location.href='${path}/infoboard?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.nextPage}'; } else { return false; }"
						aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</button>
				</li>
			</ul>
		</nav>
	</div>
	<!-- container div -->

	<jsp:include page="../common/footer.jsp" />
	<script>
		// 현재 URL에서 쿼리 매개변수 추출
		function getQueryParams() {
			const params = new URLSearchParams(window.location.search);
			return params.toString(); // 쿼리 문자열을 반환
		}

		// 페이지 변경 시 호출되는 함수
		function goToPage(page) {
			let newUrl = `${window.location.pathname}?page=${page}`; // 기본 URL 구성

			// searchType과 searchValue가 비어 있지 않은 경우에만 추가
			const searchType = document.querySelector('input[name="searchType"]:checked').value;
			const searchValue = document.getElementById('searchValue').value.trim();

			if (searchValue) {
				newUrl += `&searchType=${searchType}&searchValue=${searchValue}`;
			} else {
				newUrl += `&searchType=${searchType}`; // searchType만 추가
			}

			window.location.href = newUrl; // 새로운 URL로 이동
		}

		document.getElementById('searchForm').onsubmit = function(event) {
			const searchType = document.querySelector('input[name="searchType"]:checked').value;
			const searchValue = document.getElementById('searchValue').value.trim();

			// 검색어가 비어있을 경우
			if (searchValue.length === 0) {
				// searchType만 포함, searchValue는 없음
				const url = `${path}/infoboard`;
				window.location.href = url; // 새로운 URL로 이동
				event.preventDefault(); // 폼 제출 방지
				return; // 함수 종료
			}
		};
	</script>
</body>
</html>

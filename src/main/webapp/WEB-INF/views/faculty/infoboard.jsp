<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
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

a {
	text-decoration: none;
	color: black;
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
		<c:remove var=" msg" />
	</c:if>

	<c:if test="${login == 'Employee'}">
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
				<h1>공지사항 목록</h1>
			</div>

			<!-- content view -->
			<div id="pageContent">
				<!-- 검색창 시작 -->
				<form id="searchForm" action="${path}/infoboard" method="get">
					<div style="text-align: center;">
						<label> <input type="radio" name="searchType"
							value="title" ${searchType == 'title' ? 'checked' : ''}>
							제목
						</label> <label> <input type="radio" name="searchType"
							value="writer" ${searchType == 'writer' ? 'checked' : ''}>
							작성자
						</label> <span class="blue_window"> <input type="text"
							id="searchValue" name="searchValue" class="input_text"
							value="${param.searchValue}" />
						</span>
						<button type="submit" class="sch_smit">검색</button>
					</div>
				</form>

				<!-- 검색창 종료 -->

				<div id="improtant">총 조회 건수 ${ count }건</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
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
									<tr>
										<td><c:out value="${board.bo_no}" /></td>
										<td><a href="${path}/infodetail?bo_no=${board.bo_no}">
												<c:out value="${board.title}" />
										</a></td>
										<td><c:out value="${board.emp_name}" /></td>
										<td><fmt:formatDate type="date"
												value="${board.create_date}" /></td>
										<td><c:out value="${board.readCount}" /></td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
					<c:if test="${login == 'Employee'}">
						<button onclick="location.href='writeinfo'"
							style="float: right; width: 80px; background-color: #024C86; color: white; border: none; padding: 5px; border-radius: 10px">글작성</button>
					</c:if>
				</div>
				<!-- table-responsive div -->
			</div>
			<!-- pageContent div -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 페이지 -->
					<li
						class="page-item <c:if test="${pageInfo.prevPage == 0}">disabled</c:if>">
						<button class="page-link" type="button"
							onclick="if(${pageInfo.prevPage} > 0) { window.location.href='${path}/infoboard?page=${pageInfo.prevPage}'; } else { return false; }"
							aria-label="Previous"
							<c:if test="${pageInfo.prevPage == 0}">disabled</c:if>>
							<span aria-hidden="true">&laquo;</span>
						</button>
					</li>

					<!-- 페이지 목록 -->
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.lastPage}"
						step="1" var="page">
						<c:if test="${page == pageInfo.currentPage}">
							<li class="page-item active"><span class="page-link">${page}</span></li>
						</c:if>
						<c:if test="${page != pageInfo.currentPage}">
							<li class="page-item">
								<button class="page-link" type="button"
									onclick="window.location.href='${path}/infoboard?page=${page}'">
									${page}</button>
							</li>
						</c:if>
					</c:forEach>

					<!-- 다음 페이지 -->
					<li
						class="page-item <c:if test="${pageInfo.nextPage == 0}">disabled</c:if>">
						<button class="page-link" type="button"
							onclick="if(${pageInfo.nextPage} > 0) { window.location.href='${path}/infoboard?page=${pageInfo.nextPage}'; } else { return false; }"
							aria-label="Next"
							<c:if test="${pageInfo.nextPage == 0}">disabled</c:if>>
							<span aria-hidden="true">&raquo;</span>
						</button>
					</li>
				</ul>
			</nav>


		</div>
		<!-- content div -->
	</div>
	<!-- container div -->

	<jsp:include page="../common/footer.jsp" />
	<script>
	document.getElementById('searchForm').onsubmit = function(event) {
	    const searchType = document.querySelector('input[name="searchType"]:checked');
	    const searchValue = document.getElementById('searchValue').value.trim();

	    // 값이 비어있으면 예외 처리
	    if (searchType && searchType.value === 'title' && searchValue.length === 0) {
	        alert('제목 검색 시 키워드를 입력해야 합니다.');
	        event.preventDefault(); // 폼 제출 방지
	    }
	    
	    if (searchType && searchType.value === 'writer' && searchValue.length === 0) {
	        alert('작성자 검색 시 키워드를 입력해야 합니다.');
	        event.preventDefault(); // 폼 제출 방지
	    }
	};
	
	
	</script>
</body>
</html>

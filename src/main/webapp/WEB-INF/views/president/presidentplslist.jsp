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
<link href="${path}/resources/css/objection.css" rel="stylesheet" />
<link href="${path}/resources/css/infodetail.css" rel="stylesheet" />
<style>

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}





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
	color: white important;
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
	<jsp:include page="../common/header.jsp" />
	<div class="container" style="height: 650px; margin-top: 100px;">
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

						<c:if test="${empty list}">
							<tr>
								<td colspan="2">조회된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list}">
							<c:forEach var="board" items="${list}">
								<tr>
									<td><a id="listtitle"
										href="${path}/presidentplsdetail?bo_no=${board.bo_no}"> <c:out
												value="${board.title}" />
									</a></td>
									<td><fmt:formatDate value="${board.create_date}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>
			<!-- table-responsive div -->
		</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li
					class="page-item <c:if test='${currentPage == 1}'>disabled</c:if>'">
					<a class="page-link"
					href="?page=${currentPage - 1}&recordsPerPage=${recordsPerPage}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a>
				</li>
				<c:forEach var="i" begin="1" end="${totalPages}">
					<li
						class="page-item <c:if test='${i == currentPage}'>active</c:if>'">
						<a class="page-link"
						href="?page=${i}&recordsPerPage=${recordsPerPage}">${i}</a>
					</li>
				</c:forEach>
				<li
					class="page-item <c:if test='${currentPage == totalPages}'>disabled</c:if>'">
					<a class="page-link"
					href="?page=${currentPage + 1}&recordsPerPage=${recordsPerPage}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a>
				</li>
			</ul>
		</nav>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>

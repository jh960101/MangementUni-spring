<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- currentPage 변수가 null이거나 0인 경우 1로 설정 -->
<c:set var="currentPage" value="${currentPage != null && currentPage > 0 ? currentPage : 1}" />

<html>
<head>
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet" />

<style>
.pagination {
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

.pagination .page-item.active .page-link {
    background-color: #024C86 !important;
    color: white !important;
    border-color: #024C86 !important;
}


.page-link {
    background-color: white ;
    border-color: gray ;
    color: black !important;
}

.sch_smit {
    border: none;
    border-radius: 5px;
    background-color: #024C86;
    color: white;
    padding: 5px 10px;
}

#listtitle {
    text-decoration: none;
    color: black;
}

.작성일 {
    height: 50px;
    width: 500px;
}

.content {
    height: 400px;
}

.table {
    margin-top: 80px;
    padding: 100px;
}

.table-responsive {
    width: 1000px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.under {
    margin-left: 150px;
}

td {
    height: 50px;
}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <h2 style="margin-top: 100px; text-align: center">
        <strong>총장님께 바랍니다</strong>
    </h2>
    <div style="width: 70px; height: 5px; background-color: #024C86; margin: 0px auto;"></div>

    <div class="container" style="height: 600px;">
        <div class="content">
            <div class="under">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                
                                <th scope="col">제목</th>
                                <th scope="col" class="작성일">작성일</th>
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
            </div>
        </div>

        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}"><a
                    class="page-link" style="color: black;"
                    href="?page=${currentPage > 1 ? currentPage - 1 : 1}&recordsPerPage=${recordsPerPage}"
                    aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                </a></li>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${i == currentPage ? 'active' : ''}"><a
                        class="page-link ${i == currentPage ? 'active-link' : ''}"
                        href="?page=${i}&recordsPerPage=${recordsPerPage}">${i}</a></li>
                </c:forEach>
                <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                    <a class="page-link"
                    href="?page=${currentPage < totalPages ? currentPage + 1 : totalPages}&recordsPerPage=${recordsPerPage}"
                    aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
            </ul>
        </nav>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>

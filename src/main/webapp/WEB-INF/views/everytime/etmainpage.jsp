<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>everytimemain</title>

    <link href="${path}/resources/css/courses.css" rel="stylesheet"/>
    <link href="${path}/resources/css/everytime.css" rel="stylesheet"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
    <script defer src="${path}/resources/js/scrollbtn.js"></script>
    <link href="${path}/resources/css/scrollbtn.css" rel="stylesheet"/>
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
<c:if test="${loginname == null}">
    <script>
        alert('교직원 및 재학생만 접근이 가능합니다.');
        window.location.href = "login";
    </script>
</c:if>

<p class="top_scrollbtn" onclick="scrollbtn('main-img')">TOP</p>

<div>
    <img id="main-img" src="${path}/resources/img/eta_img.png" style="width: 100%"/>

</div>

<jsp:include page="../common/homeheader.jsp"/>
<div id="menuBar">
    <div id="sub-menuBar" style="height: 150px;">
        <ul id="menulist">
            <li><a href="everytimehot">🔥HOT 게시판🔥</a></li>
            <li><a href="etmainpage">자유 게시판</a></li>
            <li><a href="etmypage">내글 보기</a></li>
        </ul>
    </div>
</div>
<div class="container" style="height: 1000px; ">
    <div id="content">
        <!-- title view -->
        <div class="list-group">
            <div class="dropdown-container">
                <div class="dropdown">
                    <button class="dropbtn" id="dropdownButton">제목&nbsp;&nbsp;▼</button>
                    <div class="dropdown-content">
                        <a href="#" onclick="setDropdownText('제목')">제목</a> <a href="#"
                                                                              onclick="setDropdownText('작성자')">작성자</a>
                        <a href="#"
                           onclick="setDropdownText('내용')">내용</a>
                    </div>
                </div>
                <input type="text" id="searchBox" class="search-box"
                       value="검색어를 입력해주세요" onfocus="clearPlaceholder()"
                       onblur="setPlaceholder()">
                <button id="actionButton" style="width: 100px;" onclick="performAction()">검색</button>
            </div>
            <input type="text" id="Box" class="box" value="&nbsp;자유게시판" readonly>
        </div>

        <div class="input-group mb-0" style="margin-top: 5px;">
            <input class="form-control" placeholder="새 게시글을 작성해주세요" aria-label="Recipient's username"
                   aria-describedby="button-addon2" readonly>
            <button class="btn btn-outline-secondary" style="width: 100px;" type="button"
                    id="button-addon2" onclick="location.href='etnew'">글작성
            </button>
        </div>

        <%--        eta 게시물 리스트 가져와서 for문으로 출력--%>

        <c:forEach var="board" items="${list}">
            <div class="list-group">
                <a href="etdetailview?no=${board.bo_no}"
                   class="list-group-item list-group-item-action list-group-item-large"
                   aria-current="true" style="margin-top: 5px;"> ${board.title} </a> <a href="#"
                                                                                        class="list-group-item list-group-item-action list-group-item-small disabled">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.content}</a> <a href="#"
                                                                      class="list-group-item list-group-item-action list-group-item-small2 disabled">
                <div style="display: flex; align-items: center;">
                    <div style="padding: 1px; margin-right: 10px; font-size: 15px;">
                        <c:set var="now" value="<%=new java.util.Date()%>"/>
                        <fmt:parseNumber value="${board.create_date.time / (1000*60*60*24)}" var="prevDate"
                                         integerOnly="true"/>
                        <fmt:parseNumber value="${now.time  / (1000*60*60*24)}" var="nowDate" integerOnly="true"/>
                        <c:if test="${nowDate-prevDate-1 eq 0}">
                            오늘
                        </c:if>
                        <c:if test="${nowDate-prevDate-1 > 0}">
                            ${nowDate-prevDate-1}일전
                        </c:if>


                    </div>
                    <img src="${path}/resources/img/msg.png" width="15" height="15">
                    <div style="padding: 1px; margin-right: 10px; font-size: 15px;">20</div>
                    <img src="${path}/resources/img/조회수.png" width="15" height="15">
                    <div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.readCount}</div>
                    <img src="${path}/resources/img/추천버튼.png" width="15" height="15">
                    <div style="padding: 1px; margin-right: 10px; font-size: 15px;">${board.bo_Like}</div>
                </div>
            </a>
            </div>

        </c:forEach>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <!-- 이전 페이지 -->
            <li
                    class="page-item <c:if test="${pageInfo.prevPage == 0}">disabled</c:if>">
                <button class="page-link" type="button"
                        onclick="if(${pageInfo.prevPage} > 0) { window.location.href='${path}/etmainpage?page=${pageInfo.prevPage}'; } else { return false; }"
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
                    <li class="page-item"><span class="page-link"
                                                style="cursor: pointer;"
                                                onclick="window.location.href='${path}/etmainpage?page=${page}';">
                            ${page}</span></li>
                </c:if>
            </c:forEach>

            <!-- 다음 페이지 -->
            <li
                    class="page-item <c:if test="${pageInfo.nextPage == 0}">disabled</c:if>">
                <button class="page-link" type="button"
                        onclick="if(${pageInfo.nextPage} > 0) { window.location.href='${path}/etmainpage?page=${pageInfo.nextPage}'; } else { return false; }"
                        aria-label="Next"
                        <c:if test="${pageInfo.nextPage == 0}">disabled</c:if>>
                    <span aria-hidden="true">&raquo;</span>
                </button>
            </li>
        </ul>
    </nav>
</div>


<%-- etmainpage.jsp 또는 etnew.jsp --%>
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>
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
<jsp:include page="../common/footer.jsp"/>
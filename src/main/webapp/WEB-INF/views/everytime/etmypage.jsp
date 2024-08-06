<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>everytimemain</title>

    <link href="${pageContext.request.contextPath}/resources/css/courses.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/everytime.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>

    </style>
</head>

<body>
    <div id="menuBar">
        <div id="sub-menuBar" style="height: 150px;">
            <ul id="menulist">
                <li><a href="passwordchange">자유게시판</a></li>
                <li><a href="#">내글 보기</a></li>
                <li><a href="management">HOT게시판</a></li>
            </ul>
        </div>
    </div>
    <div class="container" style="height: 500px;">
        <div id="content">
            <!-- title view -->
            <div class="list-group">
                <div class="dropdown-container">
                    <div class="dropdown">
                        <button class="dropbtn">제목&nbsp;&nbsp;▼</button>
                        <div class="dropdown-content">
                            <a href="#">제목</a>
                            <a href="#">작성자</a>
                            <a href="#">내용</a>
                        </div>
                    </div>
                    <input type="text" id="searchBox" class="search-box" value="검색어를 입력해주세요"
                        onfocus="clearPlaceholder()" onblur="setPlaceholder()">
                </div>
                <input type="text" id="Box" class="box" value="&nbsp;내가 작성한 글">
            </div>

            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action list-group-item-large" aria-current="true"
                    style="margin-top: 5px;">제목이었던 것</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-small disabled">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용이었던 것 내용이었던 것 내용이었던 것 내용이었던 것
                </a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-small2 disabled">
                    <div style="display: flex; align-items: center;">
                        <div style="padding: 1px; margin-right: 5px; font-size: 15px;">1초전</div>
                        <img src="${pageContext.request.contextPath}/resources/images/msg.png" width="15" height="15">
                        <div style="padding: 1px; margin-right: 5px; font-size: 15px;">20</div>
                    </div>
                </a>
            </div>

            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action list-group-item-large"
                    aria-current="true">제목이었던 것</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-small disabled">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용이었던 것 내용이었던 것 내용이었던 것 내용이었던 것
                </a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-small2 disabled">
                    <div style="display: flex; align-items: center;">
                        <div style="padding: 1px; margin-right: 5px; font-size: 15px;">1초전</div>
                        <img src="${pageContext.request.contextPath}/resources/images/msg.png" width="15" height="15">
                        <div style="padding: 1px; margin-right: 5px; font-size: 15px;">20</div>
                    </div>
                </a>
            </div>

            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action list-group-item-large"
                    aria-current="true">제목이었던 것</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-small disabled">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용이었던 것 내용이었던 것 내용이었던 것 내용이었던 것
                </a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-small2 disabled">
                    <div style="display: flex; align-items: center;">
                        <div style="padding: 1px; margin-right: 5px; font-size: 15px;">1초전</div>
                        <img src="${pageContext.request.contextPath}/resources/images/msg.png" width="15" height="15">
                        <div style="padding: 1px; margin-right: 5px; font-size: 15px;">20</div>
                    </div>
                </a>
            </div>

            <div class="btn-container">
                <button type="button" class="btn2">▼&nbsp;더보기</button>
                <div class="btn-list">
                    <button type="button" class="btn3"><img src="${pageContext.request.contextPath}/resources/images/글목록.png" width="25" height="25">&nbsp;글 목록</button>
                </div>
            </div>
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>

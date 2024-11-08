<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script defer src="${path}/resources/js/homepage.js"></script>
    <link href="${path}/resources/css/main.css" rel="stylesheet"/>
    <link href="${path}/resources/css/home.css?힣" rel="stylesheet"/>
    <link rel="icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">
</head>
<div class="header">
    <div class="opq-header">
        <div class="container">
            <div class="menu">
                <div class="row">
                    <div class="col col-2 logo">
                        <div class="logo-box">
                            <a href="/management"> <img class="logo-img"
                                                        src="${path}/resources/img/logo.png" width="100%"
                                                        height="100%"/>
                            </a>
                        </div>
                    </div>
                    <c:if test="${loginname == null}">
                        <div class="col col-9">
                            <ul>
                                <li id="uni-detail"><a href="#" style="color: white">대학소개</a></li>
                                <li><a href="infoboard" style="color: white">공지사항</a></li>
                                <li><a href="everytimehot" style="color: white">에타게시판</a></li>
                            </ul>
                        </div>
                        <div class="col col-1">
                            <button id="login-btn" onclick="location.href='login'"
                                    style="color: white">LOGIN
                            </button>
                        </div>
                    </c:if>

                    <c:if test="${loginname != null}">
                        <div class="col col-9">
                            <ul>
                                <c:choose>
                                    <c:when test="${empNO == '300'}">
                                        <!-- 미르총장이 로그인했을 때 -->
                                        <li><a href="${path}/presidentplslist">총장페이지</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 다른 사용자가 로그인했을 때 -->
                                        <li id="uni-detail"><a href="#">대학소개</a></li>
                                        <li><a href="infoboard">공지사항</a></li>
                                        <li><a href="everytimehot">에타게시판</a></li>
                                        <li><c:if test="${login eq 'Employee'}">
                                            <a
                                                    href=infoboard>관리페이지</a>
                                        </c:if>
                                            <c:if test="${login eq 'Student' }">
                                                <a
                                                        href=studentstatus>마이페이지</a>
                                            </c:if>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        <div class="col col-1">
                            <button id="login-btn" onclick="location.href='logout'"
                                    style="color: white">LOGOUT
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="opq-header-sub">
    <div class="container">
        <div class="menu">
            <div class="row">
                <div class="col col-12">
                    <ul>
                        <li class="divide"><a href="ideology" id="ideo"
                                              style="margin-left: 40px">학교 이념</a></li>
                        <li class="divide"><a href="department" id="dept">학과 소개</a></li>
                        <li class="divide"><a href="professor" id="prof">교수진 소개</a></li>
                        <li class="divide"><a href="calendar" id="calendar">학사 일정</a></li>
                        <li><a href="waytocome" id="way">오시는 길</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</html>

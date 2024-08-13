<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script defer src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="${path}/resources/js/homepage.js"></script>
    <link href="${path}/resources/css/main.css?흔" rel="stylesheet"/>
    <link href="${path}/resources/css/home.css?야소" rel="stylesheet"/>
    <link href="${path}/resources/css/courses.css" rel="stylesheet"/>
</head>
<body>
<div class="header">
    <div class="opq-header2" style="background-color: white">
        <div class="container">
            <div class="menu">
                <div class="row">
                    <div class="col col-2 logo">
                        <div class="logo-box">
                            <a href="/management">
                                <img src="${path}/resources/img/logo2.png" width="100%" height="100%"/>
                            </a>
                        </div>
                    </div>
                    <c:if test="${loginname == null}">
                        <div class="col col-9">
                            <ul>
                                <li id="uni-detail"><a href="#">대학소개</a></li>
                                <li><a href="infoboard">공지사항</a></li>
                                <li><a href="etmainpage">에타게시판</a></li>
                            </ul>
                        </div>
                        <div class="col col-1">
                            <button id="login-btn" onclick="location.href='login'" style="color: white">LOGIN</button>
                        </div>
                    </c:if>
                    <c:if test="${loginname != null}">
                        <div class="col col-9">
                            <ul>
                                <c:choose>
                                    <c:when test="${loginname == '미르총장'}">
                                        <li><a href="${path}/presidentplslist">총장페이지</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li id="uni-detail"><a href="#">대학소개</a></li>
                                        <li><a href="infoboard">공지사항</a></li>
                                        <li><a href="etmainpage">에타게시판</a></li>
                                        <li><a href="${login eq 'Employee'? 'infoboard':'myCoursesPage' }">마이페이지</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        <div class="col col-1">
                            <button id="login-btn" onclick="location.href='logout'" style="color: white">LOGOUT</button>
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
                        <li class="divide"><a href="ideology" id="ideo" style="margin-left: 40px">학교 이념</a></li>
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
</body>
</html>

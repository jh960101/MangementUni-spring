<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세 페이지</title>


    <link
            href="${pageContext.request.contextPath}/resources/css/courses.css"
            rel="stylesheet"/>
    <link
            href="${pageContext.request.contextPath}/resources/css/everytime2.css"
            rel="stylesheet"/>
    <link
            href="${pageContext.request.contextPath}/resources/css/everytime3.css"
            rel="stylesheet"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.5.1/uicons-bold-rounded/css/uicons-bold-rounded.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <script defer src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
    <style>

    </style>
</head>
<c:if test="${loginname eq null}">
    <script>
        alert('교직원 및 재학생만 접근이 가능합니다.');
        window.location.href = "login";
    </script>
</c:if>

<c:if test="${board eq null}">
    <script>
        alert('게시물이 존재하지 않습니다.');
        history.back();
    </script>
</c:if>

<body>
<jsp:include page="../common/header.jsp"/>
<div id="menuBar">
    <div id="sub-menuBar" style="height: 150px;">
        <ul id="menulist">
            <li><a href="everytimehot">🔥HOT 게시판🔥</a></li>
            <li><a href="etmainpage">자유 게시판</a></li>
            <li><a href="etmypage">내글 보기</a></li>
        </ul>
    </div>
</div>
<div class="container"
     style="height: 1900px; margin-top: 100px; margin-left: 450px;">
    <div type="box" id="content" class="header2">
        <input type="text" id="Box" class="box" value="&nbsp;상세 페이지" readonly>


        <div class="input-group">
            <input type="hidden" id="boardNo" value="${board.bo_no}"/>
            <input type="hidden" id="stuNo" value="${board.stu_no}"/>
            <input type="hidden" id="path" value="${pageContext.request.contextPath}"/>

            <input type="text" class="form-control1" value="${board.title}"
                   readonly style="padding-left: 15px;">
        </div>

        <div class="horizontal-container">
            <div class="profile-section" style="padding-left: 15px;">
                <img
                        src="${pageContext.request.contextPath}/resources/img/프로필사진.png"
                        class="프로필사진" alt="Profile Image"> <span
                    class="username">${board.bo_status eq 'Y'?"익명":student[0].STU_NAME}</span>
            </div>
            <div class="stats-section">
                <div class="stat-item">
                    <img
                            src="${pageContext.request.contextPath}/resources/img/조회수.png"
                            class="button-img" id="contentButton1">
                    <div class="counter" id="contentCounter1">${board.readCount}</div>
                </div>
                <div class="stat-item">
                    <img
                            src="${pageContext.request.contextPath}/resources/img/추천버튼.png"
                            class="button-img recommend-button" id="contentButton2"
                            onclick="window.location.href='etaLikeUp?bo_no=${board.bo_no}'">
                    <div class="counter" id="contentCounter2">${board.bo_Like}</div>
                </div>
            </div>
        </div>
        <hr style="width: 1000px;">
    </div>
    <div class="container container2">
        <div>
            <div class="input-group">
					<textarea class="form-control2" rows="30" id="mainContent" readonly
                              style="padding-left: 10px;">${board.content}
                    </textarea>

            </div>

            <div class="form-controls-container">
                <div class="file-upload-section">
								<textarea id="commentInput" class="form-control" rows="3"
                                          cols="80" placeholder="댓글 작성" maxlength="100"
                                          style="width: 100%;"></textarea>
                </div>
                <%--                    <hr style="width: 1000px;">--%>

                <div class="form-check d-inline">
                    <%--                        <input class="form-check-input" style="font-weight: bolder;"--%>
                    <%--                               type="checkbox" value="" id="flexCheckDefault"> <label--%>
                    <%--                            class="form-check-label" style="font-weight: bolder;"--%>
                    <%--                            for="flexCheckDefault">익명</label>--%>
                </div>
                <div class="d-flex align-items-center">
                    <button class="custom-submit-button" type="button"
                            id="insertReply">댓글 작성
                    </button>
                </div>
            </div>
            <div class="downbtn">
                <button type="button" class="btn3" onclick="window.location.href='etmainpage'">
                    <img
                            src="${pageContext.request.contextPath}/resources/img/글목록.png"
                            width="20" height="20">&nbsp;글 목록
                </button>
            </div>
            <div id="commentsContainer" style=" height: auto;
                 min-height: 100%;
                 padding-bottom: 500px;
            ">
                <c:forEach var="reply" items="${list}">
                    <input type="hidden" id="re_no" value="${reply.re_No}"/>
                    <div class="comment">
                        <div class="horizontal-container">
                            <div class="profile-section">
                                <img src="${pageContext.request.contextPath}/resources/img/프로필사진.png" class="프로필사진"
                                     alt="Profile Image">
                                <span class="username">익명</span>
                            </div>
                            <div class="stats-section">
                                <div class="stat-item"></div>
                            </div>
                        </div>
                        <div class="input-group" style="gap: 90px;">
                            <textarea class="replycontent" class="form-control-3" rows="3"
                                      cols="70" placeholder="댓글 작성" maxlength="100"
                                      style="width: 750px;margin: 10px 0 20px 20px;border-radius: 5px;border: none;outline: none;padding:10px;  "
                                      readonly>${reply.reply_Content}</textarea>
                            <div class="d-flex align-items-center">
                                <button id="update-btn" class="custom-submit-button"
                                        style="display: none">댓글 수정
                                </button>
                            </div>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <button style="background-color: white;border:none;" class="nestedreply"><i
                                    class="fi fi-br-redo"></i> 댓글달기
                            </button>
                            <button style="background-color: white;border:none;" class="updatereply"><i
                                    class="fi fi-br-edit-message" style="position: relative; top: 2px;"></i> 수정하기
                            </button>
                            <button style="background-color: white;border:none;" class="deletereply"><i
                                    class="fi fi-rr-delete" style="position: relative; top: 2px;"></i> 삭제하기
                            </button>
                        </div>
                        <div class="nestedreplybox" style="display: none;transition: all 0.5ms;">
                            <div class="form-controls-container"
                                 style="margin-top: 10px;padding-left: 20px;display: flex;background-color: white;border: none">
                                <div>
								<textarea id="nestedreplytext" class="form-control" rows="3"
                                          cols="80" placeholder="대댓글 작성" maxlength="100"
                                          style="width: 100%;"></textarea>
                                </div>
                                <div class="d-flex align-items-center">
                                    <button class="custom-submit-button" type="button"
                                            id="insertNestedReply">답글 작성
                                    </button>
                                </div>
                            </div>
                        </div>
                        <hr style="width: 1000px;">
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>

<jsp:include page="../common/footer.jsp"/>
</html>

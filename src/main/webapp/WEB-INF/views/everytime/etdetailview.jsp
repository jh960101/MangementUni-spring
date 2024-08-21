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
        .comment {
            margin-bottom: 10px; /* Space between comments */
        }

        .nested-replies-container {
            margin-left: 20px; /* Indentation for nested replies */
        }

        .nested-comment {
            margin-bottom: 10px; /* Space between nested comments */
        }

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
     style="margin-top: 100px; margin-left: 450px;">
    <div type="box" id="content" class="header2">
        <input type="text" id="Box" class="box" value="&nbsp;상세 페이지" readonly>


        <div class="input-group">
            <input type="hidden" id="boardNo" value="${board.bo_no}"/>
            <input type="hidden" id="stuNo" value="${studentno}"/>
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
                 padding-bottom: 100px;
            ">
                <c:forEach var="reply" items="${list}">
                    <c:if test="${reply.re_Plus == -1}">
                        <div class="comment" data-re-no="${reply.re_No}">
                            <input type="hidden" class="replyId" value="${reply.re_No}"/>
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
                            <div style="display: flex">
                        <textarea class="replycontent"
                                  style="width: 780px;border: none;border-radius: 5px;height: 80px;outline: none;padding: 10px"
                                  maxlength="100" readonly>${reply.reply_Content}</textarea>
                                <button class="replyupdate"
                                        style="display: none; background-color: #024C86;color: white;border: none; border-radius: 5px;padding: 0px 20px;margin-left: 80px;">
                                    수정하기
                                </button>
                            </div>
                            <div style="display: flex; gap: 10px;margin-top: 20px;">
                                    <%--                            대댓글 구현 --%>
                                <button style="background-color: white;border:none;" class="nestedreply"><i
                                        class="fi fi-br-redo"></i> 댓글달기
                                </button>
                                    <%--                                    --%>
                                <c:if test="${studentno == reply.stu_No}">
                                    <button class="updatereply" style="background-color: white;border: none"><i
                                            class="fi fi-br-edit-message" style="vertical-align: -2px;"></i> 수정하기
                                    </button>
                                    <button class="deletereply" style="background-color: white;border: none"><i
                                            class="fi fi-rr-delete" style="vertical-align: -2px;"></i> 삭제하기
                                    </button>
                                </c:if>
                            </div>
                                <%--                        답글 작성 빈칸--%>
                            <div class="nestedreplybox" style="display: none; margin-top: 20px;">
                                        <textarea class="form-control nested-reply-text" rows="3" cols="80"
                                                  placeholder="대댓글 작성" style="width: 980px;"></textarea>
                                <button class="custom-submit-button insert-nested-reply" style="margin-top: 20px;">답글 작성</button>
                            </div>
                            <hr style="width: 980px;">

                                <%--                        --%>
                                <%--                        대댓글 출력--%>
                            <div class="nested-replies-container" style="margin-top: 10px;">
                                <c:forEach var="nestedReply" items="${reply.nestedReplies}">
                                    <div class="profile-section" style="margin-top: 10px">
                                        <i class="fi fi-br-arrow-turn-down-right"></i>
                                        <img src="${pageContext.request.contextPath}/resources/img/프로필사진.png"
                                             class="프로필사진"
                                             alt="Profile Image" style="margin-left: 10px;">
                                        <span class="username">익명</span>
                                    </div>
                                    <div class="nested-comment" style="margin-left: 40px; margin-top: 10px;">
                                        <textarea class="nestedreplycontent"
                                                  style="border: none;width:800px;height: 80px; outline: none;"
                                                  readonly>${nestedReply.reply_Content}</textarea>
                                    </div>
                                    <hr style="width: 980px;">
                                </c:forEach>
                            </div>
                                <%--                        --%>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>

<jsp:include page="../common/footer.jsp"/>
</html>

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
    <title>자유게시판</title>

    <link href="${pageContext.request.contextPath}/resources/css/courses.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/everytime2.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/everytime3.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    
</head>

<body>
    <jsp:include page="../common/header.jsp" />
	    <div id="menuBar">
        <div id="sub-menuBar" style="height: 150px;">
            <ul id="menulist">
                <li><a href="etmainpage">자유게시판</a></li>
                <li><a href="etmypage">내글 보기</a></li>
                <li><a href="everytimehot">HOT게시판</a></li>
            </ul>
        </div>
    </div>
	<div class="container" style="height: 1000px; margin-top:100px;">
        <div type="box" id="content" class="header2">
            <input type="text" id="Box" class="box" value="&nbsp;자유게시판" readonly>

            <div class="input-group mb-0">
                <input type="text" class="form-control1" value="졸립다" readonly>
            </div>

            <div class="horizontal-container">
                <div class="profile-section">
                    <img src="${pageContext.request.contextPath}/resources/images/프로필사진.png" class="프로필사진" alt="Profile Image">
                    <span class="username">ghdgns82</span>
                </div>
                <div class="stats-section">
                    <div class="stat-item">
                        <img src="${pageContext.request.contextPath}/resources/images/조회수.png" class="button-img" id="contentButton1">
                        <div class="counter" id="contentCounter1">0</div>
                    </div>
                    <div class="stat-item">
                        <img src="${pageContext.request.contextPath}/resources/images/추천버튼.png" class="button-img recommend-button" id="contentButton2">
                        <div class="counter" id="contentCounter2">0</div>
                    </div>
                </div>
            </div>
            <hr style="width: 1000px;">
        </div>
    </div>
    <div class="detailchang">
        <div class="input-group mb-0">
            <input type="text" class="form-control2" value="정훈아 졸려죽겄다" readonly>
        </div>
        <hr style="width: 1000px;">
        <div id="commentsContainer">
            <div class="comment">
                <div class="horizontal-container">
                    <div class="profile-section">
                        <img src="${pageContext.request.contextPath}/resources/images/프로필사진.png" class="프로필사진" alt="Profile Image">
                        <span class="username">익명</span>
                    </div>
                    <div class="stats-section">
                        <div class="stat-item">
                            <img src="${pageContext.request.contextPath}/resources/images/추천버튼.png" class="button-img recommend-button">
                            <div class="counter">0</div>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-0">
                    <input type="text" class="form-control3" value="정훈아 졸려죽겄다 나좀살려줘" readonly>
                </div>
                <hr style="width: 1000px;">
            </div>
            <div class="comment">
                <div class="horizontal-container">
                    <div class="profile-section">
                        <img src="${pageContext.request.contextPath}/resources/images/프로필사진.png" class="프로필사진" alt="Profile Image">
                        <span class="username">기민경</span>
                    </div>
                    <div class="stats-section">
                        <div class="stat-item">
                            <img src="${pageContext.request.contextPath}/resources/images/추천버튼.png" class="button-img recommend-button">
                            <div class="counter">0</div>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-0">
                    <input type="text" class="form-control3" value="정훈아 졸려죽겄다 나좀살려줘" readonly>
                </div>
                <hr style="width: 1000px;">
            </div>
            <div class="comment">
                <div class="horizontal-container">
                    <div class="profile-section">
                        <img src="${pageContext.request.contextPath}/resources/images/프로필사진.png" class="프로필사진" alt="Profile Image">
                        <span class="username">김희망</span>
                    </div>
                    <div class="stats-section">
                        <div class="stat-item">
                            <img src="${pageContext.request.contextPath}/resources/images/추천버튼.png" class="button-img recommend-button">
                            <div class="counter">0</div>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-0">
                    <input type="text" class="form-control3" value="정훈아 졸려죽겄다 나좀살려줘" readonly>
                </div>
                <hr style="width: 1000px;">
            </div>
        </div>

        <div class="form-controls-container">
            <div class="file-upload-section">
                <form>
                    <textarea id="commentInput" class="form-control" rows="1" placeholder="댓글 작성"></textarea>
                </form>
            </div>

            <div class="form-check d-inline">
                <input class="form-check-input" style="font-weight: bolder;" type="checkbox" value=""
                    id="flexCheckDefault">
                <label class="form-check-label" style="font-weight: bolder;" for="flexCheckDefault">익명</label>
            </div>
            <div class="d-flex align-items-center">
                <button class="custom-submit-button" type="button" id="postCommentButton">글 작성</button>
            </div>
        </div>
        <div class="downbtn">
            <button type="button" class="btn3"><img src="${pageContext.request.contextPath}/resources/images/글목록.png" width="20" height="20">&nbsp;글 목록</button>
        </div>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('postCommentButton').addEventListener('click', function () {
            const commentInput = document.getElementById('commentInput');
            const commentText = commentInput.value.trim();

            if (commentText !== '') {
                const commentContainer = document.createElement('div');
                commentContainer.classList.add('comment');

                const horizontalContainer = document.createElement('div');
                horizontalContainer.classList.add('horizontal-container');

                const profileSection = document.createElement('div');
                profileSection.classList.add('profile-section');

                const profileImage = document.createElement('img');
                profileImage.src = '${pageContext.request.contextPath}/resources/images/프로필사진.png';
                profileImage.classList.add('프로필사진');
                profileImage.alt = 'Profile Image';

                const usernameSpan = document.createElement('span');
                usernameSpan.classList.add('username');
                usernameSpan.textContent = document.getElementById('flexCheckDefault').checked ? '익명' : 'ghdgns82';

                profileSection.appendChild(profileImage);
                profileSection.appendChild(usernameSpan);

                const statsSection = document.createElement('div');
                statsSection.classList.add('stats-section');

                const statItem = document.createElement('div');
                statItem.classList.add('stat-item');

                const recommendButton = document.createElement('img');
                recommendButton.src = '${pageContext.request.contextPath}/resources/images/추천버튼.png';
                recommendButton.classList.add('button-img', 'recommend-button');

                const counterDiv = document.createElement('div');
                counterDiv.classList.add('counter');
                counterDiv.textContent = '0';

                statItem.appendChild(recommendButton);
                statItem.appendChild(counterDiv);
                statsSection.appendChild(statItem);

                horizontalContainer.appendChild(profileSection);
                horizontalContainer.appendChild(statsSection);

                const inputGroup = document.createElement('div');
                inputGroup.classList.add('input-group', 'mb-0');

                const commentBox = document.createElement('input');
                commentBox.type = 'text';
                commentBox.classList.add('form-control3');
                commentBox.value = commentText;
                commentBox.readOnly = true;

                inputGroup.appendChild(commentBox);

                commentContainer.appendChild(horizontalContainer);
                commentContainer.appendChild(inputGroup);

                const hr = document.createElement('hr');
                hr.style.width = '1000px';

                commentContainer.appendChild(hr);

                const commentsContainer = document.getElementById('commentsContainer');
                commentsContainer.insertBefore(commentContainer, commentsContainer.firstChild);

                commentInput.value = '';
                commentInput.placeholder = '댓글 작성';

                // 추천 버튼 기능 추가
                recommendButton.addEventListener('click', function () {
                    if (!recommendButton.classList.contains('clicked')) {
                        const counter = recommendButton.nextElementSibling;
                        counter.textContent = parseInt(counter.textContent) + 1;
                        recommendButton.classList.add('clicked');
                    }
                });
            }
        });

        document.querySelectorAll('.recommend-button').forEach(button => {
            button.addEventListener('click', function () {
                if (!button.classList.contains('clicked')) {
                    const counter = button.nextElementSibling;
                    counter.textContent = parseInt(counter.textContent) + 1;
                    button.classList.add('clicked');
                }
            });
        });
    </script>
</body>

</html>
<jsp:include page="../common/footer.jsp" />
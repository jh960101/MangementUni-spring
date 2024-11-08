<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 강의 목록 페이지</title>

<!-- 구글 아이콘 링크  -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.5.1/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link href="${path}/resources/css/courses.css" rel="stylesheet" />
<script src="${path}/resources/js/myCoursesList.js" defer></script>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar">
			<ul id="menulist">
				<li><a href="studentstatus">학적 조회</a></li>
				<li><a href="passwordchange">학생 정보 변경</a></li>
				<li><a href="objection">성적 조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="myCoursesPage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 2500px; margin-top: 100px;">
		<div id="content">
			<!-- title view -->
			<div id="pageTitle">
				<h1>${sub_name }</h1>
				<h1>${title}</h1>
			</div>

			<!-- content view -->
			<div id="pageContent">

				<!-- 강의 개요 작성 -->
				<div id="improtant2">
					<div id="SubjectTitle">
						<h3>강의개요</h3>
					</div>
					<hr>
					<div id="SubjectContent">
						<p>${coment}</p>
					</div>
				</div>

				<!-- 출석률 퍼센트 바 -->
				<div id="atten">
					<div style="display: flex">
						<div style="padding-top: 2px;">
							<i class="fi fi-br-checkbox"></i>
						</div>
						<h5 style="margin-left: 8px;">출석률 현황</h5>
					</div>
					<div class="present" style="margin-top: 10px;">
						<label>${AttendanceRate}%</label>
						<progress value="0" max="100" id="bar"></progress>
					</div>
				</div>

				<!--  주차별 목록 출력 -->
				<div id="comm">주차 별 학습 활동</div>
				<div id="onlineList">
					<c:forEach var="list" items="${lmslist}" varStatus="status">
						<div id="online">
							<div id="onlien-cont">
								<p id="online-title">${list.LMS_TITLE }(${list.LMS_Period})
								</p>
								<a id="lmsvideo-link" href="online?lms_no=${list.LMS_NO}"
									target="_blank"
									onclick="return openPagePopup(this.href,190,700);"
									data-week=${list. LMS_DATE }
									style="color: #2872ec; font-weight: bold;"> <span
									class="material-symbols-outlined icon"></span> 영상 강의
								</a> <a href="${path}/resources/pdf/${list.LMS_FILE}" download>
									<span class="material-symbols-outlined icon">description</span>[강의
									자료]
								</a>
							</div>
							<!--출석 미반영  -->
							<div id="lavel-position">
								<c:if test="${list.LMS_CHECK eq 'N'}">
									<label id="attendanceStatus-${status.index+1}"
										class="lable-box" style="color: black;">출석 <img
										src="${path}/resources/img/fail.png" width="20%" height="20%" />
									</label>

								</c:if>
								<!-- 출석 반영 -->
								<c:if test="${list.LMS_CHECK eq 'Y'}">
									<label id="attendanceStatus-${status.index+1}"
										class="lable-box" style="color: black">출석 <img
										src="${path}/resources/img/Success.png" width="20%"
										height="20%" />
									</label>

								</c:if>
							</div>
						</div>
					</c:forEach>


				</div>

			</div>
		</div>
	</div>
	<script>
    function openPagePopup(url, width, height) { //동영상강의 설정
        const screenWidth = window.screen.width;
        const screenHeight = window.screen.height;
        const left = (screenWidth - width) / 2;
        const top = (screenHeight - height) / 2;
        const popup = window
            .open(url, 'popupWindow',
                `width=1280,height=720,top=100,left=200,scrollbars=no,resizable=no`);
        return false;
    }

    document.addEventListener('DOMContentLoaded', function () { // 수강과목　주차별　조건설정
        const startDate = new Date('2024-08-01'); // 2학기시작 날짜
        const links = document.querySelectorAll('#online #lmsvideo-link');
     
        const currentDate = new Date();
        const startDate2 = new Date('2024-03-02'); //1학기 시작 날짜
        if (${smt}==2
    )
        { //2학기
            links.forEach(link => {
                const weekText = link.getAttribute('data-week');
                const weekNumber = parseInt(weekText); // "1주차"에서 "1" 추출

                const weekStartDate = new Date(startDate);
                weekStartDate.setDate(startDate.getDate() + (weekNumber - 1) * 7); // 주차별 시작날짜를 추출
                console.log(weekStartDate);
      			const labelById = `#attendanceStatus-\${weekNumber}`;   //강의주차별 출석여부사항 라벨 id가져오기
                const attendanceStatusLabel = document.querySelector(labelById); //출석여부사항 라벨 id 요소값 가져오기
      
                // 활성화 조건: 주차별 시작 날짜 보다 같거나 크면 강의 링크 활성화 style를 첨부,강의 출석여부사항 표시 
                if (currentDate >= weekStartDate) { 
                    link.classList.remove('inactive');
                    if (attendanceStatusLabel) {
                        attendanceStatusLabel.style.display = 'inline-block'; 
                    }
                } else { //현재날짜가 아직 주차별 시작 날짜 이전이라면 강의링크 비활성 style를 첨부,강의 출석여부사항 비표시
                    link.classList.add('inactive');
                    if (attendanceStatusLabel) {
                        attendanceStatusLabel.style.display = 'none'; 
                    }
                }
            });
        }
    else
        if (${smt}==1
    )
        {//1학기
            links.forEach(link => {
                const weekText = link.getAttribute('data-week');
                const weekNumber = parseInt(weekText); // "1주차"에서 "1" 추출
                const weekStartDate = new Date(startDate2);
                weekStartDate.setDate(startDate2.getDate() + (weekNumber - 1) * 7);            	
                const labelById = `#attendanceStatus-\${weekNumber}`;  
                const attendanceStatusLabel = document.querySelector(labelById);                
                // 활성화 조건
                if (currentDate >= weekStartDate) {
                    link.classList.remove('inactive');
                    if (attendanceStatusLabel) {
                        attendanceStatusLabel.style.display = 'inline-block'; 
                    }ㄴ
                } else {
                    link.classList.add('inactive');
                    if (attendanceStatusLabel) {
                        attendanceStatusLabel.style.display = 'none'; 
                    }
                }
            });
        }
    });
    document.addEventListener('DOMContentLoaded', function () { // 출석률 애니메이션
        var progressBar = document.getElementById('bar');
        var targetValue = ${AttendanceRate}; // 애니메이션을 원하는 목표 값으로 설정

        function animateProgressBar(element, start, end, duration) {
            let startTime = null;

            function step(currentTime) {
                if (startTime === null) startTime = currentTime;
                const progress = Math.min((currentTime - startTime) / duration, 1);
                element.value = Math.round(progress * (end - start) + start);
                if (progress < 1) {
                    window.requestAnimationFrame(step);
                } else {
                    element.value = end; // 목표 값으로 정확히 종료
                }
            }

            window.requestAnimationFrame(step);
        }

        animateProgressBar(progressBar, 0, targetValue, 1000); // 1000ms = 1초
    });
</script>


</body>
</html>
<jsp:include page="../common/footer.jsp" />

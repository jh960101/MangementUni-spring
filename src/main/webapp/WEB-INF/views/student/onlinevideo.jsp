<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>강의 플레이어</title>
<link href="${path}/resources/css/video.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="player-container">
		<div class="header">
			<img src="${path}/resources/img/logo2.png" type="img/png" alt="로고">
			<div class="header-title">
				<h1>${lms.LMS_TITLE}</h1>
			</div>
		</div>
		<div class="content-section">
			<div class="video-section">
				<video id="videoPlayer" class="video-player" controls>
					<source src="${path}/resources/video/${lms.LMS_TITLE}.mp4"
						type="video/mp4">

				</video>
				<div id="timeDisplay">
					<p id="currentTime">현재 시간: 0:00</p>
					<p id="totalTime">총 시간: 0:00</p>
				</div>
			</div>
			<div class="controls-section">
				<button class="button" id="saveProgress">학습 종료</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        $(document).ready(function() {
            var videoPlayer = document.getElementById("videoPlayer");
            var totalTime = 0;
            var lastKnownTime = 0;
            var isSeeking = false;
            var strdate = `${lms.LMS_DATE}`;
             var numberStr = strdate.replace("주차", "");
             var number = parseInt(numberStr, 10);
           
            // 비디오의 총 길이를 가져와서 표시
            videoPlayer.addEventListener('loadedmetadata', function() {
                totalTime = videoPlayer.duration;
                $('#totalTime').text('총 시간: ' + formatTime(totalTime));
                lastKnownTime = videoPlayer.currentTime; // 초기 시간 저장
            });

            // 비디오 재생 중 현재 시간을 업데이트
            videoPlayer.addEventListener('timeupdate', function() {
                $('#currentTime').text('현재 시간: ' + formatTime(videoPlayer.currentTime));
                lastKnownTime = videoPlayer.currentTime; // 재생 중인 시간 업데이트
            });

            // 사용자가 시간을 이동하기 시작할 때
            videoPlayer.addEventListener('seeking', function() {
                isSeeking = true;
            });

            // 사용자가 시간이 이동된 후
            videoPlayer.addEventListener('seeked', function() {
                if (isSeeking) {
                    window.location.reload();
                }
            });

            // 학습 종료 버튼 클릭 시 처리
            $('#saveProgress').on('click', function() {
                if (Math.floor(videoPlayer.currentTime) === Math.floor(totalTime)) {
                    sendCompletionStatus();
                } else {
                    alert('영상이 끝나지 않았습니다. 학습을 완료해 주세요.');
                }
            });

            // 시간 포맷 함수
            function formatTime(seconds) {
                var minutes = Math.floor(seconds / 60);
                var secs = Math.floor(seconds % 60);
                return minutes + ':' + (secs < 10 ? '0' : '') + secs;
            }

            // 완료 상태를 서버로 전송하는 함수
            function sendCompletionStatus() {	
                $.ajax({
                    url: '${path}/onlinestatus', // 여기에 실제 컨트롤러 URL을 입력하세요.
                    type: 'POST',
                    data: { y: 1, lms_no: ${lms.LMS_NO} ,lms_date:number},
                    success: function(response) {
                        alert('출석 완료!');
                        console.log(response);
                        window.close(); // 창 닫기
                    },
                    error: function(xhr, status, error) {
                    	 window.close(); // 창 닫기
                    }
                });
            }
        });
        
        
        
        
    </script>
</body>
</html>

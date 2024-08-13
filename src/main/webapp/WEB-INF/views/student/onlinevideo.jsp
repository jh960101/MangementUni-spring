<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<link href="${path}/resources/css/video.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<title>강의 플레이어</title>
<style>
</style>
</head>

<body>

	<div class="player-container">
		
		<div class="header">
			<img src="${path}/resources/img/logo2.png" type="img/png">
			<div class="header-title">
				<h1>${lms.LMS_TITLE }</h1>
			</div>
		</div>
		<div class="content-section">
			<div class="video-section">
				<video id="videoPlayer" class="video-player" controls>
					<source src="${path}/resources/video/${lms.LMS_TITLE}.mp4" type="video/mp4">
					
				</video>
			</div>
			<div class="controls-section">
				
				<button class="button" id="saveProgress">진도저장 후 학습종료</button>
			</div>
		</div>
	
	</div>

	<script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const videoPlayer = document.getElementById('videoPlayer');
                                    const saveProgressButton = document.getElementById('saveProgress');
                                    const moveButton = document.getElementById('moveButton');
                                    const dropdown = document.querySelector('.dropdown');
                                    const indexItems = document.querySelectorAll('.info-box p');

                                  

                                    // 목차 클릭 시 해당 시간으로 이동
                                    indexItems.forEach(item => {
                                        item.addEventListener('click', function () {
                                            const time = this.getAttribute('data-time');
                                            videoPlayer.currentTime = time;
                                            videoPlayer.play();
                                        });
                                    });
                                });
                                
                                
                                
                                
                            </script>

</body>

</html>
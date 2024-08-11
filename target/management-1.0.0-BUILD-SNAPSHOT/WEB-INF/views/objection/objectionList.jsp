<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 이의 신청 목록</title>

<script defer src="https://code.jquery.com/jquery-latest.min.js"></script>
<%-- <script defer src="${path}/resources/js/.js"></script> --%>

<style>
#sub-menubar {
	margin-left: 50px;
	background-color: #024C86;
	margin-top: 160px;
	width: 200px;
	height: 150px;
	float: left;
}

#menulist {
	text-decoration: none;
	list-style: none;
	font-weight: bold;
	align-items: center;
	margin-top: 10px;
}

#menulist a {
	text-decoration: none;
	color: white;
}

#menulist a:hover {
	border-bottom: 1px solid;
	border-bottom-color: white;
}

#menulist li {
	margin: 20px 0px;
}

#pagetitle {
	margin-top: 50px;
	border-bottom: 3px solid;
	border-bottom-color: #024C86;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menubar">
			<ul id="menulist">
				<li><a href="infoboard">공지사항 관리</a></li>
				<li><a href="scholarlist">장학금 관리</a></li>
				<li><a href="objectionlist">성적 관리</a></li>
			</ul>
		</div>
	</div>

	<div class="container" style="height: 750px; margin-top: 50px;">
		<div id="content">
		<!-- title view -->
			<div id="pagetitle">
				<h1>성적 이의 신청 목록</h1>
			</div>
			<div id="pageContent">
				<div id="selectbox">
					<form id="filterForm" method="POST">
						<select name="department" required onchange="categoryChange(this)"
							style="padding: 5px;">
							<option value="" disabled selected>학과 선택</option>
							<option value="AI인공지능학과">AI인공지능학과</option>
							<option value="정보보호학과">정보보호학과</option>
							<option value="정보통신학과">정보통신학과</option>
							<option value="응용소프트웨어학과">응용소프트웨어학과</option>
							<option value="수학과">수학과</option>
							<option value="컴퓨터공학과">컴퓨터공학과</option>
							<option value="화학과">화학과</option>
							<option value="물리학과">물리학과</option>
						</select> <select name="subject" required style="padding: 5px;">
							<option disabled selected value="">과목 선택</option>
						</select> <select name="grade" required style="padding: 5px;">
							<option value="" disabled selected>학년 선택</option>
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
						</select>

						<button type="button" class="btn btn-primary" value="검색"
							id="search"
							style="font-size: 15px; width: 100px; height: 40px; background-color: #024C86; color: white; text-align: center; border: none !important;">검색</button>
					</form>
				</div>
			</div>

			<div id="selectTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">학기</th>
							<th scope="col">학과</th>
							<th scope="col">학년</th>
							<th scope="col">이름</th>
							<th scope="col">신청 과목</th>
							<th scope="col">점수</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody id="results" class="table-group-divider">
						<!-- 검색 결과가 들어올 부분 -->
					</tbody>
				</table>
			</div>
			<!-- selectTable -->
		</div>
		<!-- pageContent -->
	</div>
	<script>
        function categoryChange(selectElement) {
            const subjects = {
                "컴퓨터공학과": [
                    '프로그래밍 기초', '객체지향 프로그래밍', '알고리즘 해석과 설계', '데이터 구조', '컴퓨터 구조',
                    '컴퓨터 그래픽스', '웹 프로그래밍', '소프트웨어 공학', '시스템 프로그래밍', '분산 시스템',
                    '자료구조와 알고리즘', '데이터베이스 설계 및 구현', '인공지능 개론', '기계 학습', '네트워크 보안',
                    '클라우드 컴퓨팅', '로봇공학', '신호 및 시스템', '컴퓨터 비전', '모바일 컴퓨팅'
                ],
                "화학공학과": [
                    '화학공학 입문', '열역학', '물리화학', '유체역학', '전달 현상',
                    '화학 반응공학', '고분자 공학', '화공과학', '재료 공학', '환경화학',
                    '촉매 공학', '분석화학', '화학 공정 제어', '고체 물리화학', '화학 산업',
                    '산업화학', '응용화학', '화학 실험', '화학 공정 설계', '화학 물질 안전'
                ],
                "정보통신학과": [
                    '회로 기초 I', '전자기학 I', '디지털 논리 설계', '전자 회로', '신호 및 시스템',
                    '회로 기초 II', '전자기학 II', '통신 시스템', '디지털 신호 처리', '전력전자',
                    '제어 시스템', '전자기장 이론', '집적 회로 설계', '통신 네트워크', '전자기기 실험',
                    '고급 제어 시스템', '무선 통신', '반도체 신호', '전자기기 설계', '전력 시스템'
                ],
                "AI인공지능학과": [
                    '인공지능 기초', '기계학습 기초', '데이터 분석 기초', '알고리즘 기반', '인공지능 스위치',
                    '딥러닝', '자연어 처리', '로봇 공학', '강화학습', '인공지능 응용',
                    '인공지능 모델링', '인공지능 시스템 설계', '머신 비전', 'AI 연구 동향', '지능형 에이전트',
                    '인공지능 프로젝트', 'AI 경영전략', 'AI 시스템 평가', 'AI 예외 및 처리', '인공지능 연구 프로젝트'
                ],
                "응용소프트웨어학과": [
                    '소프트웨어 기초', '데이터베이스 기초', '프로그래밍 언어', '웹 개발 기초', '알고리즘',
                    '모바일 애플리케이션 개발', '시스템 소프트웨어', '소프트웨어 설계', '클라우드 컴퓨팅', '소프트웨어 품질 관리',
                    '대규모 소프트웨어 개발', '인공지능', '소프트웨어 개발 프로세스', '인터넷 보안', '소프트웨어 유지보수',
                    '소프트웨어 프로젝트 관리', '빅 데이터 분석', '소프트웨어 설계 패턴', '데이터베이스 설계', '소프트웨어 엔지니어링'
                ],
                "물리학과": [
                    '고전역학 I', '양자역학 I', '열역학', '물리실험 I', '전자기학 I',
                    '고전역학 II', '양자역학 II', '입자물리학', '물리 실험 II', '광학',
                    '전산물리학', '고체물리학', '천체물리학', '물리학 연구 방법론', '비선형 동역학',
                    '물리학 프로젝트', '물리학 경영전략', '첨단 물리학', '물리학 논문 작성', '물리학 연구 동향'
                ],
                "정보보호학과": [
                    '정보보안 기초', '네트워크 보안', '암호학', '해킹과 역공학', '정보 시스템 보안',
                    '정보보호 소프트웨어', '디지털 포렌식', '보안 프로그래밍', '침해 사고 대응', '보안 관리',
                    '클라우드 보안', '침입 탐지 시스템', '사이버 공격', '정보보호 법과 정책', '모바일 보안',
                    '정보보안 프로젝트', '암호 시스템 설계', '보안 상황 인식', '사이버 보안 정책', '보안 연구'
                ],
                "수학과": [
                    '미적분학 I', '선형대수학', '기하학', '확률과 통계', '미적분학 II',
                    '미분방정식', '위상수학', '대수학', '수리논리학', '해석학',
                    '복소수 함수론', '미적분학 III', '수치해석', '미분기하학', '확률론',
                    '정수론', '대수적 기하학', '복소해석학', '미적분학 IV', '수학적 방법론'
                ]
            };

            const selectedDepartment = selectElement.value;
            const subjectSelect = document.querySelector('select[name="subject"]');
            subjectSelect.innerHTML = '<option disabled selected value="">과목 선택</option>'; // Clear previous options

            if (subjects[selectedDepartment]) {
                subjects[selectedDepartment].forEach(subject => {
                    const option = document.createElement('option');
                    option.value = subject;
                    option.textContent = subject;
                    subjectSelect.appendChild(option);
                });
            }
        }

        // 검색 버튼 클릭 시 데이터 가져오기
        document.getElementById('search').addEventListener('click', function() {
            const form = document.getElementById('filterForm');
            const formData = new FormData(form);

            $.ajax({
                url: '/objectionSearch', // 실제 서버 측 경로로 변경
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    const resultsTable = document.getElementById('results');
                    resultsTable.innerHTML = ''; 

                    data.forEach((item, index) => {
                        const row = document.createElement('tr');
                        
                        row.innerHTML = `
                            <th scope="row">${index + 1}</th>
                            <td>${item.semester}</td>
                            <td>${item.department}</td>
                            <td>${item.grade}</td>
                            <td>${item.name}</td>
                            <td>${item.subject}</td>
                            <td>${item.score}</td>
                            <td>
                                <button type="button" class="btn btn-xs btn-primary" style="background-color: #024C86; color: white; padding: 2px 0 10px 0;">승인</button>
                            </td>
                        `;
                        resultsTable.appendChild(row);
                    });
                },
                error: function(error){
                    console.error('Error:', error);
                }
            });
        });
    </script>
</body>
</html>
<jsp:include page="../common/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>학사 일정</title>
<style>
.container1 {
	background-color: #fff;
	width: 1200px;
	text-align: center;
	margin: 100px auto 100px auto;
}

th, td {
	border: 1px solid RGB(231, 240, 254);
	padding: 8px;
	
}
table {
	width: 100%;
	border: 1px solid RGB(231, 240, 254);
}


th {
	background-color: RGB(231, 240, 254);
}

.dropdown {
	text-align: right;
	margin-bottom: 10px;
}

.dropdown select {
	padding: 8px;
	font-size: 16px;
}
</style>

<script defer src="${path}/resources/js/scrollbtn.js"></script>
<link href="${path}/resources/css/scrollbtn.css" rel="stylesheet" />
</head>
<body>
<p class="top_scrollbtn" onclick="location.href='#'">TOP</p>
	<div>  <jsp:include page="../common/header.jsp"/>
      <h2 style="margin-top: 150px; text-align: center">
          <strong>학사 일정</strong>
      </h2>
      <div style="width: 70px; height: 5px; background-color: #024C86; margin:0px auto;"></div>
  </div>
	<div class="container1">
		
		<div class="dropdown">
			<select id="semester" onchange="showSemester()">
				<option value="1">2024년 1학기</option>
				<option value="2">2024년 2학기</option>
			</select>
		</div>
		<div id="semester1">
			<table>
				<thead>
					<tr>
						<th>월</th>
						<th>기간</th>
						<th>일정</th>
					</tr>
				</thead>
				<tbody>
					<!-- 2024년 1학기 일정 -->
					<tr>
						<td rowspan="1">1월</td>
						<td>1(목)~26(월)</td>
						<td>휴복학 신청</td>
					</tr>
					<tr>
						<td rowspan="7">2월</td>
						<td>9(금)~12(월)</td>
						<td>설날(공휴일)</td>
					</tr>
					<tr>
						<td>2(금)~5(월)</td>
						<td>2024학년도 제1학기 수강희망과목 등록(재입학생 포함)</td>
					</tr>
					<tr>
						<td>13(화)~17(토)</td>
						<td>2024학년도 제1학기 수강신청</td>
					</tr>
					<tr>
						<td>20(화)~27(월)</td>
						<td>2024학년도 제1학기 등록</td>
					</tr>
					<tr>
						<td>23(금)~24(토)</td>
						<td>2024학년도 제1학기 신입·편입생 수강신청</td>
					</tr>
					<tr>
						<td>23(금)</td>
						<td>2023학년도 전기 학위수여식</td>
					</tr>
					<tr>
						<td>29(목)</td>
						<td>2024학년도 입학식</td>
					</tr>
					<tr>
						<td rowspan="7">3월</td>
						<td>1(금)</td>
						<td>삼일절(공휴일)</td>
					</tr>
					<tr>
						<td>4(월)</td>
						<td>2024학년도 제1학기 개강</td>
					</tr>
					<tr>
						<td>4(월)~22(금)</td>
						<td>조기졸업 신청</td>
					</tr>
					<tr>
						<td>6(화)~8(목)</td>
						<td>수강신청 정정 및 확인</td>
					</tr>
					<tr>
						<td>25(화)~27(목)</td>
						<td>수강포기 신청</td>
					</tr>
					<tr>
						<td>29(금)</td>
						<td>제1학기 1/4 시점(4주차)</td>
					</tr>
					<tr>
						<td>1(월)~30(금)</td>
						<td>학생설계전공 신청</td>
					</tr>
					<tr>
						<td rowspan="4">4월</td>
						<td>1(월)~30(금)</td>
						<td>제1학기 미르장학금(면학 및 미래로) 2차 신청</td>
					</tr>
					<tr>
						<td>10(수)</td>
						<td>22대 국회의원선거일</td>
					</tr>
					<tr>
						<td>22(월)~26(금)</td>
						<td>제1학기 중간고사</td>
					</tr>
					<tr>
						<td>26(금)</td>
						<td>제1학기 1/2 시점(8주차)</td>
					</tr>
					<tr>
						<td rowspan="5">5월</td>
						<td>5(일)</td>
						<td>어린이날(공휴일)</td>
					</tr>
					<tr>
						<td>6(월)</td>
						<td>어린이날 대체휴일</td>
					</tr>
					<tr>
						<td>14(화)~17(목)</td>
						<td>이중전공 신청</td>
					</tr>
					<tr>
						<td>15(수)</td>
						<td>부처님오신날(공휴일)</td>
					</tr>
					<tr>
						<td>24(금)</td>
						<td>제1학기 3/4 시점(12주차)</td>
					</tr>
					<tr>
						<td rowspan="4">6월</td>
						<td>6(목)</td>
						<td>현충일(공휴일)</td>
					</tr>
					<tr>
						<td>17(월)~21(금)</td>
						<td>제1학기 기말고사</td>
					</tr>
					<tr>
						<td>21(금)</td>
						<td>제1학기 종강(16주차)</td>
					</tr>
					<tr>
						<td>24(월)</td>
						<td>여름방학 시작, 여름계절수업 개강</td>
					</tr>
					<tr>
						<td rowspan="3">7월</td>
						<td>1(월)~31(수)</td>
						<td>제2학기 미르장학금 1차 신청</td>
					</tr>
					<tr>
						<td>19(금)</td>
						<td>여름계절수업 종강</td>
					</tr>
					<tr>
						<td>1(목)~26(월)</td>
						<td>휴복학 신청</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div id="semester2" style="display: none;">
			<table>
				<thead>
					<tr>
						<th>월</th>
						<th>기간</th>
						<th>일정</th>
					</tr>
				</thead>
				<tbody>
					<!-- 2024년 2학기 일정 -->
					<tr>
						<td rowspan="6">8월</td>
						<td>2(금)~5(월)</td>
						<td>2024학년도 제2학기 수강희망과목 등록(재입학생 포함)</td>
					</tr>
					<tr>
						<td>12(월)~17(토)</td>
						<td>2024학년도 제2학기 수강신청(재입학생 포함)</td>
					</tr>
					<tr>
						<td>15(목)</td>
						<td>광복절(공휴일)</td>
					</tr>
					<tr>
						<td>22(목)</td>
						<td>개교기념일 파티</td>
					</tr>
					<tr>
						<td>26(월)~28(수)</td>
						<td>2024학년도 제2학기 신입생 수강신청</td>
					</tr>
					<tr>
						<td>28(수)~30(금)</td>
						<td>2024학년도 제2학기 등록</td>
					</tr>
					<tr>
						<td rowspan="6">9월</td>
						<td>2(월)</td>
						<td>2024학년도 제2학기 개강</td>
					</tr>
					<tr>
						<td>2(월)~20(금)</td>
						<td>조기졸업 신청</td>
					</tr>
					<tr>
						<td>4(수)~6(금)</td>
						<td>수강신청 정정 및 확인</td>
					</tr>
					<tr>
						<td>16(월)~18(수)</td>
						<td>추석(공휴일)</td>
					</tr>
					<tr>
						<td>23(월)~25(수)</td>
						<td>수강포기 신청</td>
					</tr>
					<tr>
						<td>24(화)~26(목)</td>
						<td>복수전공 신청</td>
					</tr>
					<tr>
						<td rowspan="6">10월</td>
						<td>27(금)</td>
						<td>제2학기 1/4 시점(4주차)</td>
					</tr>
					<tr>
						<td>1(화)~31(목)</td>
						<td>학생설계전공 신청</td>
					</tr>
					<tr>
						<td>2(목)~31(금)</td>
						<td>제2학기 미르장학금 2차 신청</td>
					</tr>
					<tr>
						<td>3(목)</td>
						<td>개천절(공휴일)</td>
					</tr>
					<tr>
						<td>9(수)</td>
						<td>한글날(공휴일)</td>
					</tr>
					<tr>
						<td>15(화)~17(목)</td>
						<td>융합전공 신청</td>
					</tr>
					<tr>
						<td rowspan="5">11월</td>
						<td>21(월)~25(금)</td>
						<td>제2학기 중간고사</td>
					</tr>
					<tr>
						<td>25(금)</td>
						<td>제2학기 1/2 시점(8주차)</td>
					</tr>
					<tr>
						<td>1(금)~5(화)</td>
						<td>캠퍼스 내 소속변경(전과) 신청</td>
					</tr>
					<tr>
						<td>13(수)~15(금)</td>
						<td>이중전공 신청</td>
					</tr>
					<tr>
						<td>22(금)</td>
						<td>제2학기 3/4 시점(12주차)</td>
					</tr>
					<tr>
						<td rowspan="5">12월</td>
						<td>4(수)~6(금)</td>
						<td>재입학 신청</td>
					</tr>
					<tr>
						<td>16(월)~20(금)</td>
						<td>제2학기 기말고사</td>
					</tr>
					<tr>
						<td>20(금)</td>
						<td>제2학기 종강(16주차)</td>
					</tr>
					<tr>
						<td>23(월)</td>
						<td>겨울방학 시작, 겨울계절수업 개강</td>
					</tr>
					<tr>
						<td>25(수)</td>
						<td>성탄절(공휴일)</td>
					</tr>
					<tr>
						<td rowspan="4">1월</td>
						<td>1(수)</td>
						<td>신정(공휴일)</td>
					</tr>
					<tr>
						<td>2(목)~31(금)</td>
						<td>제1학기 미르장학금 1차 신청</td>
					</tr>
					<tr>
						<td>17(금)</td>
						<td>겨울계절수업 종강</td>
					</tr>
					<tr>
						<td>28(화)~30(목)</td>
						<td>설날(공휴일)</td>
					</tr>
					<tr>
						<td rowspan="7">2월</td>
						<td>3(월)~25(화)</td>
						<td>휴복학 신청</td>
					</tr>
					<tr>
						<td>4(화)~6(목)</td>
						<td>2025학년도 제1학기 수강희망과목 등록(재입학생 포함)</td>
					</tr>
					<tr>
						<td>11(화)~15(토)</td>
						<td>2025학년도 제1학기 수강신청(재입학생 포함)</td>
					</tr>
					<tr>
						<td>19(수)~20(목)</td>
						<td>2025학년도 제1학기 신입·편입생(외국인전형) 수강신청</td>
					</tr>
					<tr>
						<td>20(목)~27(목)</td>
						<td>2025학년도 제1학기 등록</td>
					</tr>
					<tr>
						<td>25(화)</td>
						<td>2024학년도 전기 학위수여식</td>
					</tr>
					<tr>
						<td>28(금)</td>
						<td>2024학년도 입학식</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script>
	function showSemester() {
		var semester = document.getElementById("semester").value;
		if (semester == "1") {
			document.getElementById("semester1").style.display = "block";
			document.getElementById("semester2").style.display = "none";
		} else {
			document.getElementById("semester1").style.display = "none";
			document.getElementById("semester2").style.display = "block";
		}
	}
</script>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

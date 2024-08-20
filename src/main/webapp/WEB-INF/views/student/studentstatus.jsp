<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학적조회</title>
    <link href="${path}/resources/css/studentinfo.css" rel="stylesheet"/>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.5.1/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.5.1/uicons-bold-straight/css/uicons-bold-straight.css'>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
<div id="menuBar">
    <div id="sub-menuBar" style="height: 380px;margin-top: 182px;">
        <ul id="menulist">
            <li><a href="studentstatus">학적조회</a></li>
            <li><a href="passwordchange">비밀번호 변경</a></li>
            <li><a href="studentinformation">정보변경</a></li>
            <li><a href="objection">성적조회</a></li>
            <li><a href="myCoursesPage">나의 수강 목록</a></li>
            <li><a href="courseregistrationpage">수강신청</a></li>
            <li><a href="askpresident">총장님께 바랍니다</a></li>
            <li><a href="idcard">모바일 학생증</a></li>
        </ul>
    </div>
</div>
<div class="container" style="height: auto; margin-top: 100px;">

    <div id="content">

        <!-- title view -->
        <h2 style="margin-top: 0px; text-align: center">
            <strong>학적조회</strong>
        </h2>
        <div style="width: 70px; height: 5px; background-color: #024C86; margin:0px auto;"></div>

        <div id="contentview" style="margin-top: 80px;">

            <!--  학적 카드  -->
            <div id="statuscard">
                <div class="card">
                    <div class="info">
                        <div class="card-body">
                            <table style="text-align: left;">
                                <c:forEach var="stuinfo" items="${studentInfo}">
                                    <tr>
                                        <img src="${path}/resources/img/idcard.png" alt="student img"/>
                                    </tr>
                                    <tr>
                                        <th>이　　름</th>
                                        <td>${stuinfo.STU_NAME}</td>
                                        <th>학적상태</th>
                                        <td>${status}</td>
                                        <th>생년월일</th>
                                        <td>${stuinfo.STU_JUMIN}</td>
                                    </tr>
                                    <tr>
                                        <th>소속학과</th>
                                        <td>${stuinfo.DEPT_NAME}</td>
                                        <th style="letter-spacing :7.5px;">연락처</th>
                                        <td>${stuinfo.STU_PHONE}</td>
                                        <th style="letter-spacing :7.5px;">입학일</th>
                                        <td>${stuinfo.STU_ADMISSION_DATE}</td>

                                    </tr>
                                    <tr>


                                    </tr>
                                    <tr>
                                        <th>학　　번</th>
                                        <td>${stuinfo.STU_NO}</td>
                                        <th style="letter-spacing :7.5px;">이메일</th>
                                        <td>${stuinfo.STU_EMAIL}</td>
                                        <th style="letter-spacing :7.5px;">거주지</th>
                                        <td>${stuinfo.STU_ADDRESS}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="courselist1" style="margin-top: 100px;">

                <h5 id="midtitle" style="display: flex; margin-bottom: 20px">
                    <div
                            style="display: flex; justify-content: center; align-items: center;margin-right: 5px;">
                        <i class="fi fi-rr-coins"></i>
                    </div>
                    <strong>&nbsp;등록금 조회</strong>
                </h5>
                <div>
                    <table class="table mt-2 mb-4">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">학년도</th>
                            <th scope="col">학기</th>
                            <th scope="col">학과</th>
                            <th scope="col">등록금액</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="list" items="${tuitionlist}" varStatus="status">
                            <tr>
                                <th>${status.index + 1}</th>
                                <td>${list.YEAR}</td>
                                <td>${list.SMT}</td>
                                <td>${list.DEPT_NAME}</td>
                                <td>${list.TU_PRICE}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div id="courselist1" style="margin-top: 100px;">
                <h5 id="midtitle" style="display: flex; margin-bottom: 20px">
                    <div
                            style="display: flex; justify-content: center; align-items: center;margin-right: 5px;">
                        <i class="fi fi-rs-trophy-star"></i>
                    </div>
                    <strong>&nbsp;장학금 수혜 조회</strong>
                </h5>
                <div>
                    <table class="table mt-2 mb-4">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">학년도</th>
                            <th scope="col">학기</th>
                            <th scope="col">장학명</th>
                            <th scope="col">면제율</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="list" items="${StuScholarlist}"
                                   varStatus="status">
                            <tr>
                                <th>${status.index + 1}</th>
                                <td>${list.YEAR}</td>
                                <td>${list.SMT}</td>
                                <td>${list.SCH_NAME}</td>
                                <td>${list.SCH_DISCOUNT}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="courselist1" style="margin-top: 100px;">
                <h5 id="midtitle" style="display: flex; margin-bottom: 20px">
                    <div
                            style="display: flex; justify-content: center; align-items: center;margin-right: 5px;">
                        <i class="fi fi-rs-e-learning"></i>
                    </div>
                    <strong>&nbsp;수강 과목 조회</strong>
                </h5>
                <div>
                    <table class="table mt-2 mb-4">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">학년도</th>
                            <th scope="col">학기</th>
                            <th scope="col">과목명</th>
                            <th scope="col">담당교수</th>
                            <th scope="col">출석률</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="list" items="${courlist}" varStatus="status">
                            <tr>
                                <th>${status.index + 1}</th>
                                <td>${list.YEAR}</td>
                                <td>${list.SMT}</td>
                                <td><a href="myCoursesList?sub_code=${list.SUB_CODE}">${list.SUB_NAME}</a></td>
                                <td>${list.PROF_NAME}</td>
                                <td>${list.attendanceRate }%</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- courselist1 -->

            <div id="courselist2" style="margin-top: 100px;">
                <h5 id="midtitle" style="display: flex; margin-bottom: 20px;">
                    <div
                            style="display: flex; justify-content: center; align-items: center;margin-right: 5px;">
                        <i class="fi fi-bs-time-quarter-past"></i>
                    </div>
                    <strong>&nbsp;이전 수강 과목 조회</strong>
                </h5>
                <div>
                    <table class="table mt-2 mb-4">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">학년도</th>
                            <th scope="col">학기</th>
                            <th scope="col">과목명</th>
                            <th scope="col">담당교수</th>
                            <th scope="col">출석률</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="courlist" items="${coursesbeforlist}"
                                   varStatus="status">
                            <tr>
                                <th>${status.index + 1}</th>
                                <td>${courlist.YEAR}</td>
                                <td>${courlist.SMT}</td>
                                <td>${courlist.SUB_NAME}</td>
                                <td>${courlist.PROF_NAME}</td>
                                <td>${courlist.attendanceRate }%</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- courselist2 -->
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
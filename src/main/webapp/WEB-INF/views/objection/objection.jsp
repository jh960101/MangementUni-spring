<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>성적조회</title>
    <link href="${path}/resources/css/objection.css" rel="stylesheet"/>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.5.1/uicons-solid-straight/css/uicons-solid-straight.css'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <h2 style="margin-top: 0px; text-align: center">
            <strong>성적조회</strong>
        </h2>
        <div style="width: 70px; height: 5px; background-color: #024C86; margin:0px auto;"></div>

        <div id="selecttable" style="margin-top: 90px; margin-bottom: 20px;">
            <div id="tablelist">
                <h5 id="midtitle" style="display: flex; margin-bottom: 20px">
                    <div
                            style="display: flex; justify-content: center; align-items: center;">
                        <i class="fi fi-ss-book"></i>
                    </div>
                    <strong>&nbsp;2024학년도</strong>
                </h5>
                <div>
                    <table class="table mt-2 mb-4"
                           style="text-align: center; margin-top: 20px;">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">학기</th>
                            <th scope="col">학과</th>
                            <th scope="col">과목명</th>
                            <th scope="col">담당교수</th>
                            <th scope="col">성적</th>
                            <th scope="col">이의 신청</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="result" items="${resultList}">
                            <tr>
                                <th scope="row">${result.num}</th>
                                <td>${result.smt}</td>
                                <td>${result.dept_name}</td>
                                <td>${result.sub_name}</td>
                                <td>${result.prof_name}</td>
                                <td>${result.grade}</td>
                                <td>
                                    <button type="button" class="btn btn-xs objection-btn"
                                            id="objectionButton" data-sub-code="${result.sub_code}"
                                            onclick="location.href='${path}/objectionWrite?sub_code=${result.sub_code}&sub_name=${result.sub_name}'"
                                            style="background-color: #024C86; color: white; padding: 2px 0 10px 0;"
                                            <c:if test="${result.obj_yn == 'Y'}"> disabled </c:if>>
                                        신청
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="selecttable">
                <div id="tablelist">
                    <h5 id="midtitle" style="display: flex; margin-bottom: 20px">
                        <div
                                style="display: flex; justify-content: center; align-items: center;">
                            <i class="fi fi-ss-book"></i>
                        </div>
                        <strong>&nbsp;2023학년도</strong>
                    </h5>
                    <form id="smt1Form" method="GET">
                        <select name="smt2023" id="smt2023" onchange="loadResults(this.value, '2023')"
                                style="padding: 5px; margin-top: 15px;">
                            <option value="1" <c:if test="${smt == 1}">selected</c:if>>1학기</option>
                            <option value="2" <c:if test="${smt == 2}">selected</c:if>>2학기</option>
                        </select>
                    </form>
                    <table id="resultTable2023" class="table mt-2 mb-4"
                           style="text-align: center; margin-top: 15px;">
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">학기</th>
                            <th scope="col">학과</th>
                            <th scope="col">과목명</th>
                            <th scope="col">담당교수</th>
                            <th scope="col">성적</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>

                <div id="tablelist">
                    <h5 id="midtitle" style="display: flex; margin-bottom: 20px">
                        <div
                                style="display: flex; justify-content: center; align-items: center;">
                            <i class="fi fi-ss-book"></i>
                        </div>
                        <strong>&nbsp;2022학년도</strong>
                    </h5>
                    <form id="smt1Form" method="GET">
                        <select name="smt2022" id="smt2022" onchange="loadResults(this.value, '2022')"
                                style="padding: 5px; margin-top: 15px;">
                            <option value="1" <c:if test="${smt == 1}">selected</c:if>>1학기</option>
                            <option value="2" <c:if test="${smt == 2}">selected</c:if>>2학기</option>
                        </select>
                    </form>
                    <table id="resultTable2022" class="table mt-2 mb-4"
                           style="text-align: center;">
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">학기</th>
                            <th scope="col">학과</th>
                            <th scope="col">과목명</th>
                            <th scope="col">담당교수</th>
                            <th scope="col">성적</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- selectTable -->
        </div>
    </div>
    <!-- content -->
</div>
<!-- container -->
<script>

    function loadResults(value, year) {
        //const smt = $("#smt").val(); // 현재 선택된 학기

        $.ajax({
            type: "GET",
            url: "${path}/objectionPro",
            data: {smt: value},
            dataType: "json", // 응답 데이터 타입을 JSON으로 설정
            success: function (response) {
                // 서버로부터 받아온 결과 데이터로 테이블 업데이트


                if (year === '2023') {
                    updateResultTable2023(response.results23);
                }

                if (year === '2022') {
                    updateResultTable2022(response.results22);
                }

            },
            error: function (xhr, status, error) {
                console.error("Error fetching data:", error);
            }
        });
    }

    // 테이블 업데이트 함수
    // 2022학년도 결과 업데이트 함수
    function updateResultTable2022(results22) {
        const resultTable2022 = $('#resultTable2022 tbody');
        resultTable2022.empty(); // 기존 데이터 삭제
        if (results22.length) { // 데이터가 있을 경우
            results22.forEach(function (response) {
                resultTable2022.append('<tr><th>' + response.num + '</th>'
                    + '<td>' + response.smt + '</td>' + '<td>'
                    + response.dept_name + '</td>' + '<td>'
                    + response.sub_name + '</td>' + '<td>'
                    + response.prof_name + '</td>' + '<td>'
                    + response.grade + '</td>' + '</tr>');
            });
        } else {
            resultTable2022
                .append('<tr><td colspan="6">결과가 없습니다.</td></tr>');
        }
    }

    // 2023학년도 결과 업데이트 함수
    function updateResultTable2023(results23) {
        const resultTable2023 = $('#resultTable2023 tbody');
        resultTable2023.empty(); // 기존 데이터 삭제
        if (results23.length) { // 데이터가 있을 경우
            results23.forEach(function (response) {
                resultTable2023.append('<tr><th>' + response.num + '</th>'
                    + '<td>' + response.smt + '</td>' + '<td>'
                    + response.dept_name + '</td>' + '<td>'
                    + response.sub_name + '</td>' + '<td>'
                    + response.prof_name + '</td>' + '<td>'
                    + response.grade + '</td>' + '</tr>');
            });
        } else {
            resultTable2023
                .append('<tr><td colspan="6">결과가 없습니다.</td></tr>');
        }
    }


    // 문서가 준비되면 결과 로드
    $(document).ready(function () {
        // 각 버튼의 상태 확인
        $('.objection-btn').each(function () {
            const subCode = $(this).data('sub-code');
            const isDisabled = localStorage.getItem('buttonDisabled-' + subCode);
            if (isDisabled === 'true') {
                $(this).prop('disabled', true); // 상태가 true이면 버튼 비활성화
            }
        });

        loadResults(1, '2023'); // 2023학년도 1학기 데이터 로드
        loadResults(1, '2022'); // 2022학년도 1학기 데이터 로드

        // 학기 선택이 변경되면 데이터 로드
        $("#smt2023").change(function () {
            loadResults(this.value, '2023');
        });

        $("#smt2022").change(function () {
            loadResults(this.value, '2022');
        });
    });
</script>
</body>
</html>
<jsp:include page="../common/footer.jsp"/>
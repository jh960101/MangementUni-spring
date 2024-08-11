<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학과 소개</title>
    <link href="${path}/resources/css/department.css" rel="stylesheet"/>
</head>

<body>

<div>
		<jsp:include page="../common/header.jsp" />
		<h2 style="margin-top: 150px; text-align: center">
			<strong>학과 소개</strong>
		</h2>
		<div
			style="width: 70px; height: 5px; background-color: #024C86; margin: 0px auto;"></div>
	</div>
<!-- Spacer -->
<%--<div class="spacer"><img src="${path}/resources/img/학과소개.png"></div>--%>

<!-- Main Content -->
<div class="main-content">
    <div class="filters">
        <label for="professor-select" class="minititle"></label>
        <form action="${path}/department" method="post">
            <select name="department" id="professor-select"
                    onchange="this.form.submit()">
                <option value="" ${department==''? 'selected' :''}>전체</option>
                <option value="COMP" ${department=='COMP'? 'selected' :''}>컴퓨터공학과</option>
                <option value="CHEM" ${department =='CHEM'? 'selected' :''}>화학공학과</option>
                <option value="INSE" ${department =='INSE'? 'selected' :''}>정보보호</option>
                <option value="MATH" ${department =='MATH'? 'selected' :''}>수학과</option>
                <option value="APPL" ${department =='APPL'? 'selected' :''}>응용소프트웨어학과</option>
                <option value="COMM" ${department =='COMM'? 'selected' :''}>정보통신학과</option>
                <option value="AIIN" ${department =='AIIN'? 'selected' :''}>AI인공지능과</option>
                <option value="PHYS" ${department =='PHYS'? 'selected' :''}>물리학과</option>
            </select>
        </form>
    </div>
    <hr>
    <div class="professor-list">
        <c:forEach var="deptlist" items="${list}">
            <div class="professor-card">
                <div class="professor-photo"><img src="${path}/resources/img/${deptlist.DEPT_IMG}" width="100%" height="100%"/></div>
                <div class="professor-info">
                    <h2>${deptlist.DEPT_NAME}</h2>
                    <p>${deptlist.DEPT_COM}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div style="margin-bottom: 130px;"></div>
</body>

</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
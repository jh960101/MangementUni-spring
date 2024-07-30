<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<main class="container school-ideology">
	<div class="row">
		<div class="col col-5 title">
			<h2>
				<strong>학교 이념</strong>
			</h2>
			<img src="${path}/resources/img/image.png" style="margin-bottom: 100px;" />
			<h2>
				<strong>미르 정신</strong>
			</h2>
		</div>
	</div>
	<div class="row goal-row">
		<div class="col col-8 goal">
			<div>
				<h2>01</h2>
			</div>
			<div>
				<p>비판적,저항적 전통</p>
				<h5>미르의 긍지와 자부심을 가슴에 품고 세계속의 자부심으로 도약</h5>
			</div>
		</div>
	</div>
	<div class="row goal-row">
		<div class="col col-8 goal">
			<div>
				<h2>02</h2>
			</div>
			<div>
				<p>민족적, 민주적 전통</p>
				<h5>불의에 대항하고 부패를 배격하며 거짓을 용납하지 않는 저항정신</h5>
			</div>
		</div>
	</div>
	<div class="row goal-row">
		<div class="col col-8 goal">
			<div>
				<h2>03</h2>
			</div>
			<div>
				<p>의리적, 화합적 전통</p>
				<h5>강한 화합과 단결을 통해 범조직적 포용력과 조화, 흡인력을 지향</h5>
			</div>
		</div>
	</div>
	<div class="row goal-row">
		<div class="col col-8 goal">
			<div>
				<h2>04</h2>
			</div>
			<div>
				<p>행동적, 야성적 전통</p>
				<h5>단순히 연구와 교육의 명문이 아니라 나라와 민족의 장래를 계획하고 이를 행동에 옮기는 실천적 지성의
					전진기지</h5>
			</div>
		</div>
	</div>
	<div class="row goal-row">
		<div class="col col-8 goal">
			<div>
				<h2>05</h2>
			</div>
			<div>
				<p>서민적, 대중적 전통</p>
				<h5>민족대학으로서 전통문화와 외래문화의 주체적인 조화를 지향</h5>
			</div>
		</div>
	</div>

</main>
<jsp:include page="../common/footer.jsp" />
</html>
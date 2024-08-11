<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>

<link
	href="${pageContext.request.contextPath}/resources/css/courses.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/everytime2.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/everytime3.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container"
		style="height: 1150px; margin-top: 100px; margin-left: 450px;">
		<div type="box" id="content" class="header2">
			<input type="text" id="Box" class="box" value="총장님 부탁드립니다" readonly>

			<div class="input-group">
				<input type="text" class="form-control1" value="총장님..." readonly>
			</div>


			<hr style="width: 1000px;">
		</div>
		<div class="container2" style="height: 800px; margin-bottom: 100px;">
			<div>
				<div class="input-group">
					<textarea class="form-control2" rows="30" id="mainContent" readonly
						style="overflow: hidden;">
총장님께,

안녕하십니까? 저는 미르대학교의 재학생 김경수입니다. 바쁘신 와중에도 학교의 발전과 학생들의 복지 향상을 위해 힘써주시는 총장님께 깊은 감사의 말씀을 드립니다.

저는 오늘 총장님께 우리 대학의 일부 정책이나 시설에 대해 개선을 요청드리고자 글을 올립니다. 먼저, 우리 대학의 학문적 성취와 다양한 프로그램들이 학생들에게 많은 혜택을 주고 있다는 점에 대해서는 의심의 여지가 없습니다. 그러나 최근 몇몇 학생들 사이에서 제기된 의견을 바탕으로, 보다 나은 교육 환경을 위해 몇 가지 건의사항을 말씀드리고자 합니다.

첫째, 강의실의 냉난방 시스템 개선을 부탁드립니다. 계절에 따라 불편함을 겪는 학생들이 많아 학업에 집중하기 어렵다는 의견이 자주 제기되고 있습니다. 적절한 온도를 유지할 수 있도록 시스템의 개선이 필요하다고 생각합니다.

둘째 학생들과의 소통 창구를 더욱 활성화해 주시면 좋겠습니다. 정기적인 간담회나 온라인 의견 수렴 채널을 통해 학생들이 학교에 대해 자유롭게 의견을 표현할 수 있는 기회가 주어지면, 보다 투명하고 민주적인 학교 운영이 가능할 것이라 생각합니다.

총장님께서 이러한 사항들을 검토해 주신다면, 우리 미르대학교가 더욱 발전하는 데 큰 도움이 될 것입니다. 언제나 학생들을 위한 최선의 결정을 내리시는 총장님께 다시 한번 감사드리며, 긍정적인 검토를 부탁드립니다.

감사합니다.

김경수 드림
                    </textarea>






				</div>
				<hr style="width: 1000px;">
				<div class="downbtn">
					<button type="button" class="btn3"
						onclick="location.href='${path}/views/president/presidentplslist'">
						<img
							src="${pageContext.request.contextPath}/resources/img/글목록.png"
							width="20" height="20">&nbsp;글 목록
					</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script>
		// 자동 길이 조정을 위한 스크립트
		document.getElementById('mainContent').addEventListener('input',
				function() {
					this.style.height = 'auto';
					this.style.height = (this.scrollHeight) + 'px';
				});
	</script>
</body>

</html>
<jsp:include page="../common/footer.jsp" />

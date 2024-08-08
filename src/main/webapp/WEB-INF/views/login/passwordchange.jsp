<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="pw" value="${password}" />
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.sub {
	color: red;
}

.form-control {
	border-color: black;
}

.input-background {
	width: 600px;
	margin: 0 auto;
}

.pageContent {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.custom {
	max-width: 900px;
	margin: 0 auto;
	text-align: center;
}

.btn-wide {
	width: 30%;
}

.custom-button {
	background-color: rgb(2, 76, 134);
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	width: 300px;
}

.containerpass {
	height: 100%;
	margin-top: 50px;
}

header, footer {
	padding: 20px 0;
}
</style>
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
				<li><a href="courseregistrationpage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 750px; margin-top: 100px;">
		<form id="passwordChangeForm" action="${path}/passwordchangeInfo"
			method="post" onsubmit="return chkpw()">
			<div id="content">
				<!-- title view -->
				<div id="pageTitle">
					<h1>학생 정보 변경</h1>
				</div>
				<div id="pageContent">
					<!-- content view -->
					<div class="input-background">
						<div class="container text-center">
							<div class="row row-cols-1">
								<div class="input-group mb-3">
									<span class="input-group-text">학번</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										name="STU_NO" placeholder="${id}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">사용자명</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${name}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">학과명</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${deptname}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">이메일</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${email}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">전화번호</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${phone}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">이전PW</span> <input
										type="password" class="form-control"
										aria-describedby="basic-addon1" id="pwcheck">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">변경할PW</span> <input
										type="password" class="form-control"
										aria-describedby="basic-addon1" id="password"
										name="STU_PASSWORD">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">PW확인</span> <input
										type="password" class="form-control"
										aria-describedby="basic-addon1" id="confirmPassword">
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-4">
							<button type="submit" class="button btn-wide custom-button">
								암호변경</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	function chkpw() {
	    // 입력 필드 값 가져오기
	    var password = document.getElementById("password").value;
	    var confirmPassword = document.getElementById("confirmPassword").value;
		var pw = "${pw}";
		var pwcheck = document.getElementById("pwcheck").value;

	    // 비밀번호와 확인 비밀번호가 일치하는지 확인
	    if (pw !== pwcheck) {
	        alert("이전 비밀번호가 일치하지 않습니다.");
	        return false;
	    }
		
	    // 비밀번호와 확인 비밀번호가 모두 입력되었는지 확인
	    if (!password || !confirmPassword) {
	        alert("비밀번호와 확인 비밀번호를 모두 입력해주세요.");
	        return false;
	    }

	    // 비밀번호와 확인 비밀번호가 일치하는지 확인
	    if (password !== confirmPassword) {
	        alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
	        return false;
	    }

	    // 비밀번호 유효성 검사
	    var num = password.search(/[0-9]/g);
	    var eng = password.search(/[a-z]/ig);
	    var spe = password.search(/[`~!@#$%^&*|₩'";:/?]/gi);

	    if (password.length < 10 || password.length > 20) {
	        alert("비밀번호는 10자리 ~ 20자리 이내로 입력해주세요.");
	        return false;
	    } else if (password.search(/\s/) != -1) {
	        alert("비밀번호는 공백 없이 입력해주세요.");
	        return false;
	    } else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) {
	        alert("영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	        return false;
	    } else {
	        // 비밀번호가 성공적으로 변경됨을 알리고 폼을 제출합니다.
	        alert("비밀번호가 성공적으로 변경되었습니다.");
	        return true;
	    }
	}
    </script>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>

</html>

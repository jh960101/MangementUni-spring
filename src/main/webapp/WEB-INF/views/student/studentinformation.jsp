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
<title>회원 번호 변경</title>

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
		<div id="sub-menuBar" style="height: 380px">
			<ul id="menulist">
				<li><a href="studentstatus">학적 조회</a></li>
				<li><a href="passwordchange">학생 비밀번호 변경</a></li>
				<li><a href="studentinformation">학생 정보 변경</a></li>
				<li><a href="objection">성적 조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="courseregistrationpage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 750px; margin-top: 100px;">
		<form id="passwordChangeForm" action="${path}/studnetInformationchg"
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
										name="STU_NO" placeholder="${id}" disabled="disabled">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">사용자명</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${name}"  disabled="disabled">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">학과명</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${deptname}"  disabled="disabled">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">이메일</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${email}" id="email" name="email" value="${email}"maxlength='20'>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">전화번호</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${phone}"oninput="oninputPhone(this)" maxlength="14"
										id="phone" name="phone"value="${phone}">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">주소</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${address}" id="address" name="address"value="${address}"maxlength='30'>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-4">
							<button type="submit" class="button btn-wide custom-button">
								저장</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	function chkpw() {
	    // 입력 필드 값 가져오기
	    var email = document.getElementById("email").value;
	    var phone = document.getElementById("phone").value;
		var address = document.getElementById("address").value;

	    // 비밀번호와 확인 비밀번호가 일치하는지 확인
	    if (pw !== pwcheck) {
	        alert("이전 비밀번호가 일치하지 않습니다.");
	        return false;
	    }
		
	    // 비밀번호와 확인 비밀번호가 모두 입력되었는지 확인
	    if (!email || !phone || !address) {
	        alert("이메일과 전화번호와 주소를 모두 입력해주세요.");
	        return false;
	    }

	  else {
	        // 비밀번호가 성공적으로 변경됨을 알리고 폼을 제출합니다.
	        alert("정보가 성공적으로 변경되었습니다.");
	        return true;
	    }
	}
    </script>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>

</html>

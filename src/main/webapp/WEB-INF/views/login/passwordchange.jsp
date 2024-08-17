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
	width: 500px;
	margin: 0 auto;
}

.pageContent {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 50px;
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
	<div class="container" style="height: 700px; margin-top: 100px;">
		<form id="passwordChangeForm" action="${path}/passwordchangeInfo"
			method="post" onsubmit="return chkpw()">
			<div id="content">
				<!-- title view -->
				<h2 style="margin-top: 0px; text-align: center">
					<strong>비밀번호 변경</strong>
				</h2>
				<div style="width: 70px; height: 5px; background-color: #024C86; margin:0px auto;"></div>
				<div id="pageContent" style="margin-top: 80px">
					<!-- content view -->
					<div class="input-background">
						<div class="container text-center">
							<div class="row row-cols-1" style="display: flex; flex-direction: column; gap:10px;">
								<div class="input-group mb-2">
									<span class="input-group-text">사용자명</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										placeholder="${name}" style="font-weight: bold;"
										disabled="disabled">
								</div>
								<div class="input-group mb-2">
									<span class="input-group-text">학　　번</span> <input type="text"
										class="form-control" aria-describedby="basic-addon1"
										name="STU_NO" placeholder="${id}" disabled="disabled"
										style="font-weight: bold;"">
								</div>

								<div class="input-group mb-2">
									<span class="input-group-text" style="letter-spacing: 0.7px;">이전PW</span>
									<input type="password" class="form-control"
										aria-describedby="basic-addon1" id="pwcheck"
										placeholder="기존 비밀번호를 입력해주세요">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" style="letter-spacing: 0.7px;">변경PW</span>
									<input type="password" class="form-control"
										aria-describedby="basic-addon1" id="password"
										name="STU_PASSWORD" placeholder="새 비밀번호를 입력해주세요"
										oninput="pwdCheck()">
								</div>
								<span id="pwdch"
									style="color: red; font-size: 14.5px;padding-bottom: 10px;">※ 비밀번호 8자리 이상 영문, 숫자, 특수문자 중 2가지 이상을 혼합해주세요.</span>
								<div class="input-group mb-3">
									<span class="input-group-text" style="letter-spacing: 0.7px;">PW확인</span>
									<input type="password" class="form-control"
										aria-describedby="basic-addon1" id="confirmPassword"
										placeholder="새 비밀번호를 입력해주세요" oninput="pwdCheck()">
								</div>
								<span id="pwdConfirm"></span>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-4" style="margin-top: 0px;">
							<button type="submit" class="button btn-wide custom-button">
								비밀번호 변경</button>
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
	    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	    if (password.length < 8 || password.length > 20) {
	        alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
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
	
	
	
	 function pwdCheck(){
		var password =$('#password').val();
		var pw = "${pw}";
		const length = $('#confirmPassword').val().length;
	    var num = password.search(/[0-9]/g);
	    var eng = password.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
				if ((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) {
					 $('#pwdch').text('※ 비밀번호 8자리 이상 영문, 숫자, 특수문자 중 2가지 이상을 혼합해주세요').css('color', 'red')
				    }else{
				    	 $('#pwdch').text('비밀번호 통과').css('color', 'green')
				    }
		
			if( length !== 0 ){

				

		      if($('#password').val() == $('#confirmPassword').val()){
		         $('#pwdConfirm').text('비밀번호 일치').css('color', 'green')
		      }else{
		         $('#pwdConfirm').text('확인 비밀번호 불일치').css('color', 'red')
		      }
			} else {
		         $('#pwdConfirm').text('').css('color', 'black')
			}
		   
		  }
	  
    </script>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path"
	value="${pageContext
	   		   .request
	   		   .contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />


<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="${path}/resources/css/login.css"
	type="text/css">

<c:if test="${not empty msg }">

	<script>
		alert('${msg}');
	</script>
	<c:remove var=" msg" />
</c:if>
<section id="content" style="height: 550px;margin-bottom: 150px;">


	<!--  html 전체 영역을 지정하는 container -->
	<div id="container" style="margin-top: 150px;">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox" style="margin-bottom: 150px;">

			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle">비밀번호 찾기</div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form action="${path}/findpasswordinfo" method="post">
				<div id="inputBox">
					<div class="input-form-box">
						<span>아이디 </span><input type="text" id="loginId" name="loginid"
							class="form-control"maxlength="10" />
					</div>
					<div class="input-form-box">
						<span>이메일 </span><input type="email" id="loginemail" name="email"
							class="form-control" maxlength="20"/>
					</div>
					<div>
						<input type='radio' name='login' value='Student'
							checked="checked" /> 학생 &nbsp;&nbsp;<input type='radio' name='login'
							value='Employee' /> 교직원

					</div>

					<div class="button-login-box" >
						<button type="submit" class="btn btn-xs"
							style="width: 100%; background-color: #024C86; color: white; height: 40px;">비밀번호
							찾기</button>
					</div>
				</div>
			</form>

		</div>

	</div>
</section>


<!-- Bootstrap Bundle with Popper -->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
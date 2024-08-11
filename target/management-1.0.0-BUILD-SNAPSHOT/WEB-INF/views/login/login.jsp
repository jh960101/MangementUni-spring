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
<section id="content" style="height: 700px;">

	<!--  html 전체 영역을 지정하는 container -->
	<div id="container" style="margin-top: auto; margin-bottom: auto;">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox"  >

			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle">학사관리 로그인</div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form action="${path}/loginpro" method="post">
				<div id="inputBox">
					<div class="input-form-box">
						<span>아이디 </span><input type="text" id="loginId" name="loginid"
							class="form-control">
					</div>
					<div class="input-form-box">
						<span>비밀번호 </span><input type="password" id="loginPassword"
							name="loginPassword" class="form-control"> 
					</div>
					<div>
						교직원 <input type='radio' name='login' value='Employee'  checked="checked"/>
						 학생<input	type='radio' name='login' value='Student' />
					</div>
						<button type="submit" class="btn btn-xs"
							style="width: 100%;background-color:  #024C86;color: white;">로그인</button>
			<div class="button-login-box">

				<button type="button" class="btn btn-xs"
					style="width: 100%; background-color:  #024C86;color: white;" onclick="location.href='findpassword'">비밀번호
					찾기</button>
			</div>
					</div>
			</form>

		</div>
	</div>
	</div>
</section>


<!-- Bootstrap Bundle with Popper -->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
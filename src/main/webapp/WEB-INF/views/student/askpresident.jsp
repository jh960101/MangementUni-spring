<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="${path}/resources/css/objection.css" rel="stylesheet" />
<link href="${path}/resources/css/infodetail.css" rel="stylesheet" />
<title>총장님께 바랍니다</title>
<style>
#tbl-board {
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
	border-collapse: collapse;
}

#tbl-board th, #tbl-board td {
	padding: 15px;
	border: 1px solid #ddd;
	text-align: left;
	font-size: 16px;
	height: 50px;
}

#tbl-board th {
	background-color: #f2f2f2;
	font-weight: bold;
}

#tbl-board input[type="text"], #tbl-board textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

#tbl-board textarea {
	resize: none;
}

.button-group {
	display: flex;
	justify-content: space-between;
	margin: auto;
}

.button-group button {
	font-size: 18px;
	padding: 10px 38px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #024C86;
	color: white;
	margin: auto;
}

.button-group button:last-child {
	margin-right: 0;
}

.button-group button:hover {
	opacity: 0.8;
}

.table-secondary {
	margin-top: 20px;
	justify-content: right;
	display: flex;
}

.table-secondary .btnlist {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	display: right;
	margin-left: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100px;
	height: 40px;
}

.backbtn {
	margin-top: 30px;
	text-align: center;
}

.backbtn .btnlist {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 120px;
	height: 60px;
}
</style>
</head>
<body>
	<c:if test="${not empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>

	<jsp:include page="../common/header.jsp" />
	<div id="menuBar">
		<div id="sub-menuBar" style="height: 380px">
			<ul id="menulist">
				<li><a href="studentstatus">학적조회</a></li>
				<li><a href="passwordchange">비밀번호 변경</a></li>
				<li><a href="studentinformation">정보변경</a></li>
				<li><a href="objection">성적조회</a></li>
				<li><a href="myCoursesPage">나의 수강 페이지</a></li>
				<li><a href="courseregistrationpage">수강신청 페이지</a></li>
				<li><a href="askpresident">총장님께 바랍니다</a></li>
				<li><a href="idcard">모바일 학생증</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="height: 1000px; margin-top: 100px;">
		<div id="content">
			<!-- title view -->
			<div id="pageTitle">
				<h1>총장님께 바랍니다</h1>
			</div>
			<div class="custom">
				<h5 class="mt-4" style="text-align: left; color: red;">이 글은
					익명성이 보장됩니다. 단 비방이나 혐오 욕설을 사용하면 처벌받을수 있습니다.</h5>
				<div id="pageContent">
					<form action="presidentplsWrite" method="post" style="margin-bottom: 20px;"
						onsubmit="return validateForm()">
						<table id="tbl-board">
							<tr>
								<th><span>제목</span></th>
								<td><input type="text" placeholder="제목을 입력하세요" name="title"></td>
							</tr>

							<tr>
								<th width="50"><span>내용</span></th>
								<td><textarea placeholder="내용을 입력하세요" name="content"
										id="textBox"
										style="border: 1px solid #ccc; padding: 10px; width: 100%; height: 300px; overflow-y: auto;"></textarea></td>
							</tr>
						</table>
						<div class="table-secondary">
							<div class="textLengthWrap"
								style="display: flex; align-items: center;">
								<p class="textCount"
									style="margin-bottom: 0; display: flex; align-items: center;">0자</p>
								<p class="textTotal"
									style="margin-bottom: 0; display: flex; align-items: center;">/500자</p>
							</div>
							<input class="btn btnlist" type="submit" value="등록"
								style="color: white; font-weight: bold; font-size: 16px;" /> <input
								class="btn btnlist" type="reset" value="다시 작성"
								style="color: white; font-weight: bold; font-size: 16px; margin-right: 95px;" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="../common/footer.jsp" /> --%>

	<script>
		function validateForm() {
			var title = document.getElementsByName("title")[0].value.trim(); // 제목 필드의 값 가져오기 및 공백 제거
			var detail = document.getElementsByName("detail")[0].value.trim(); // 내용 필드의 값 가져오기 및 공백 제거

			if (title === "") {
				alert("제목을 입력하세요.");
				return false; // 폼 제출 중단
			}

			if (detail === "") {
				alert("내용을 입력하세요.");
				return false; // 폼 제출 중단
			}

			return true; // 모든 조건을 만족하면 폼 제출
		}
		/*  글자수 체크*/
		$('#textBox').keyup(function(e) {
			let content = $(this).val();

			// 글자수 세기
			if (content.length == 0 || content == '') {
				$('.textCount').text('0자');
			} else {
				$('.textCount').text(content.length + '자');
			}

			// 글자수 제한
			if (content.length > 500) {
				$(this).val($(this).val().substring(0, 500));

				alert('글자수는 500자까지 입력 가능합니다.');
			}
			;
		});
	</script>


</body>
</html>

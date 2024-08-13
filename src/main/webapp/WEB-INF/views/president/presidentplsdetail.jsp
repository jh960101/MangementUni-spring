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
<title>공지사항 상세조회</title>
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
	border: 1px solid #ddd;
}

#tbl-board input[type="text"], #tbl-board textarea, #tbl-board input[type="file"]
	{
	width: calc(100% - 20px); /* padding과 border를 고려한 width */
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

#tbl-board textarea {
	resize: none; /* 텍스트 영역 크기 조절 비활성화 */
}

.button-group {
	justify-content: center;
	text-align: right;
	margin: 20px 50px;
}

.button-group button {
	font-size: 18px;
	font-weight: bold;
	padding: 10px 38px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #024C86;
	color: white;
	margin-right: 55px;
	padding: 10px 38px;
}

.button-group button:hover {
	opacity: 0.8;
}

.backbtn {
	margin-top: 30px;
	text-align: center;
}

.backbtn .btn {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 110px;
	height: 65px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	

	

	<c:if test="${login == 'Employee'}">
		
	</c:if>

	<div class="container" style="height: auto; margin-top: 100px;">
		<div id="content">
			<div id="pageTitle" style="margin-bottom: 50px;">
				<h1>총장님께부탁드립니다</h1>
			</div>
			<div id="pageContent">
				<table id="tbl-board">
					<tr>
						<th>제 목</th>
						<td>
							<label name="title" value="${board.title}">${board.title}</label>
						</td>
					</tr>
					
					
					
					
					<tr>
						<th>내 용</th>
						<td>
							<div id="contentLabel"
								style="padding: 10px; width: 100%; height: 300px; overflow-y: auto; display: block;">
								${board.content}</div>
						</td>
					</tr>
				</table>
				<c:if test="${login == 'Employee'}">
					<div class="button-group">
						<button type="button" id="btnUpdate btn"
							onclick="window.location.href='${path}/updateinfo?bo_no=${board.bo_no}'">수정</button>
						<button type="button" id="btnDelete btn"
							onclick="deleteFunc(${board.bo_no})">삭제</button>
					</div>
				</c:if>
					<div class="backbtn">
						<button type="button" id="btnCancel" class="btn"
							onclick="window.history.back()"
							style="color: white; font-weight: bold; font-size: 16px;">돌아가기</button>
					</div>
			</div>
		</div>
	</div>
	<script>
		 

	        // 확인 버튼을 누른 경우
	        if (confirmation) {
	            // 페이지 이동
	            window.location.href = '${path}/deletePro?bo_no=' + boardNo; 
	        	//window.location.href = '${path}/deletePro'; 
	        }
			
		}
	
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>

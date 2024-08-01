<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 뷰페이지 설정
    1. 태그 라이브러리 가져와서 경로 설정
    2. 헤더와 푸터 include
    3.드라이브 22일 상세페이지 확인 디자인하기
    
     -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path"
	value="${pageContext
      .request
      .contextPath}" />



<script>
	//리플 삭제를 눌렀을 때 
	// 게시글의 번호,댓글의 번호를 매개변수
	// 컨트롤러로 호출 
	// 프로젝트명/board/replyDel?매개변수
	// 받아서 url을 완성해서 새로운 호출하기

	function deleteReply(replyNo, boardNo) {
		var url = "${path}/board/replyDel?replyNo=";
		var requestURL = url + replyNo + "&boardNo=" + boardNo;
		console.log(requestURL);
		location.href = requestURL;

	}
</script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link href="${path}/resources/css/infodetail.css" rel="stylesheet"/> 
<h2 align="center">공지사항 상세조회</h2>
<section id="board-write-cont">


	<table id="tbl-board">
		<tr>
			<th>글번호</th>
			<td>${board.no}</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><c:out value="${board.title}" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${board.writerId}" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><c:out value="${board.readCount}" /></td>
		</tr>
		<tr>
			<th>작성 시간</th>
			<td><fmt:formatDate type="both" value="${board.createDate}" /></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><c:if test="${ !empty board.originalFileName }">
					<a
						href="javascript:fileDownload('${board.originalFileName}', '${board.renamedFileName}')">
						<img src="${path}/resources/images/file.png" width="20"
						height="20" /> <c:out value="${board.originalFileName}"></c:out>
					</a>
					<script>
						function fileDownload(oriname, rename) {
							const url = "${path}/board/fileDown";

							let oName = encodeURIComponent(oriname);
							let rName = encodeURIComponent(rename);

							location.assign(url + "?oriname=" + oName
									+ "&rename=" + rName);
						}
					</script>
				</c:if> <c:if test="${empty board.originalFileName}">
					<span> - </span>
				</c:if></td>
		</tr>


		<tr>
			<th>내 용</th>
			<td><textarea rows="15" cols="50" readonly><c:out
						value="${board.content}" /></textarea></td>
		</tr>

		<!-- 수정 / 삭제 기능 -->
		<tr>
			<th colspan="2"><c:if
					test="${not empty loginMember && (loginMember.id == board.writerId 
 || loginMember.role == 'ROLE_ADMIN')}">
					<button type="button" id="btnUpdate">수정</button>
					<button type="button" id="btnDelete">삭제</button>
				</c:if></th>
		</tr>
	</table>

	<!-- 리플 작성 Form -->
	<div id="comment-container">
		<div class="comment-editor" align="center">
			<form action="${path}/board/reply" method="post">
				<input type="hidden" name="boardNo" value="${board.no}" /> <input
					type="hidden" name="writerId" value="${loginMember.id}" />
				<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
				<button type="submit" id="btn-insert">등록</button>
			</form>
		</div>
	</div>

	<!-- 리플 출력 -->
	<table id="tbl-comment">
		<c:if test="${!empty replyList}">
			<c:forEach var="reply" items="${replyList}">
				<tr>
					<td><sub class="comment-writer">${reply.writerId}</sub> <sub
						class="comment-date"><fmt:formatDate type="both"
								value="${reply.createDate}" /></sub> <br> <c:out
							value="${reply.content}" /></td>
					<td><c:if
							test="${ !empty loginMember && (loginMember.id == reply.writerId || loginMember.role == 'ROLE_ADMIN') }">
							<button class="btn-delete"
								onclick="deleteReply('${reply.no}','${board.no}');">삭제</button>
						</c:if></td>
				</tr>
			</c:forEach>
		</c:if>

		<c:if test="${empty replyList}">
			<tr>
				<td colspan="3" style="text-align: center;">등록된 리플이 없습니다.</td>
			</tr>
		</c:if>
	</table>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

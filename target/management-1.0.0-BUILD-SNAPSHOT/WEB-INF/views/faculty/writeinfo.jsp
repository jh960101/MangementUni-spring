<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<link href="${path}/resources/css/objection.css" rel="stylesheet" />
<link href="${path}/resources/css/infodetail.css" rel="stylesheet" />
<title>공지사항 게시글 작성</title>
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

	<jsp:include page="../common/header.jsp" />

	<c:set var="searchType" value="${param.searchType}" />
	<c:if test="${empty searchType}">
		<c:set var="searchType" value="title" />
	</c:if>

	<div id="menuBar">
		<div id="sub-menubar" style="height: 150px; font-size:16px;">
			<ul id="menulist">
				<li><a href="infoboard">공지사항 관리</a></li>
				<li><a href="scholarlist">장학금 관리</a></li>
				<li><a href="objectionlist">성적이의 관리</a></li>
			</ul>
		</div>
	</div>

	<div class="container" style="height: auto; margin-top: 100px;">
		<div id="content">
			<div id="pageTitle">
				<h1>공지사항 게시글 작성</h1>
			</div>
			<div id="pageContent">
				<form action="writeinfoPro" method="post"
					enctype="multipart/form-data" style="margin-bottom: 20px;"
					onsubmit="return validateForm()">
					<table id="tbl-board">
						<tr>
							<th><span>제목</span></th>
							<td><input type="text" placeholder="제목을 입력하세요" name="title"></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="uploadFile" /> <c:if
									test="${!empty board.originalFilename}">
									<a
										href="javascript:fileDownload('${board.originalFilename}', '${board.originalFilename}')">
										<img src="${path}/resources/images/file.png" width="20"
										height="20" /> <c:out value="${board.originalFilename}"></c:out>
									</a>
									<script>
										function fileDownload(oriname, rename) {
											const url = "${path}/board/fileDown";
											let oName = encodeURIComponent(oriname);
											let rName = encodeURIComponent(rename);
											location.assign(url + "?oriname="
													+ oName + "&rename="
													+ rName);
										}
									</script>
								</c:if></td>
						</tr>
						<tr>
							<th width="50"><span>내용</span></th>
							<td>
								<!-- <div id="contentLabel"
									style="padding: 10px; width: 100%; height: auto;">
									<textarea placeholder="내용을 입력하세요" name="detail" id="summernote"
										style="border: 1px solid #ccc; padding: 5px; width: 100%; height: 200px; overflow-y: auto;"></textarea>
									<input type="file" id="imageUpload" accept="image/*"
										name="imageUpload" style="margin-top: 10px;" />
									<div id="imagePreview" style="margin-top: 10px;"></div>
								</div> -->
								<textarea id="summernote" name="editordata"></textarea>
								
							</td>
						</tr>
					</table>
					<div class="table-secondary">
						<input class="btn btnlist" type="submit" value="등록"
							style="color: white; font-weight: bold; font-size: 16px;" /> <input
							class="btn btnlist" type="reset" value="다시 작성"
							style="color: white; font-weight: bold; font-size: 16px; margin-right: 95px;" />
					</div>
					<div class="backbtn">
						<input class="btn btnlist" type="button" value="작성 취소"
							onclick="history.back()"
							style="color: white; font-weight: bold; font-size: 16px;" />
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
		/* document.getElementById('imageUpload').addEventListener('change',
						function(event) {
							const file = event.target.files[0]; // 선택한 첫 번째 파일

							// 파일이 있는 경우
							if (file) {
								const fileName = file.name; // 파일의 이름
								const extension = fileName.split('.').pop()
										.toLowerCase(); // 파일 확장자 가져오기

								// 유효한 이미지 확장자인지 확인
								if (![ 'jpg', 'jpeg', 'png', 'gif' ]
										.includes(extension)) {
									alert('이미지 파일만 선택할 수 있습니다. JPG, JPEG, PNG, GIF 형식의 이미지를 선택해 주세요.');
									event.target.value = ''; // 선택한 파일 초기화
									return; // 함수 종료
								}

								// Image preview 처리
								const reader = new FileReader();
								reader.onload = function(e) {
									const img = document.createElement('img');
									img.src = e.target.result;
									img.style.maxWidth = '100%';
									img.style.maxHeight = '300px';
									img.style.marginTop = '10px';
									document.getElementById('imagePreview').innerHTML = ''; // 이전 미리보기 초기화
									document.getElementById('imagePreview')
											.appendChild(img); // 미리보기 추가
								};

								reader.readAsDataURL(file); // 선택한 파일 읽기
							}
						});

		// textarea - summernote
		$('#summernote').summernote(
				{
					// 에디터 크기 설정
					height : 800,
					// 에디터 한글 설정
					lang : 'ko-KR',
					// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
					toolbar : [
							// 글자 크기 설정
							[ 'fontsize', [ 'fontsize' ] ],
							// 글자 [굵게, 기울임, 밑줄, 취소 선, 지우기]
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							// 글자색 설정
							[ 'color', [ 'color' ] ],
							// 표 만들기
							[ 'table', [ 'table' ] ],
							// 서식 [글머리 기호, 번호매기기, 문단정렬]
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							// 줄간격 설정
							[ 'height', [ 'height' ] ],
							// 이미지 첨부
							[ 'insert', [ 'picture' ] ] ],
					// 추가한 글꼴
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체',
							'바탕체' ],
					// 추가한 폰트사이즈
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72',
							'96' ],
					// focus는 작성 페이지 접속시 에디터에 커서를 위치하도록 하려면 설정해주세요.
					focus : true,
					// callbacks은 이미지 업로드 처리입니다.
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							// 다중 이미지 처리를 위해 for문을 사용했습니다.
							for (var i = 0; i < files.length; i++) {
								imageUploader(files[i], this);
							}
						}
					}

				});
		
		// 서머노트에 text 쓰기
		$('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);

		// 서머노트 쓰기 비활성화
		$('#summernote').summernote('disable');

		// 서머노트 쓰기 활성화
		$('#summernote').summernote('enable');

		// 서머노트 리셋
		$('#summernote').summernote('reset');

		// 마지막으로 한 행동 취소 ( 뒤로가기 )
		$('#summernote').summernote('undo');
		// 앞으로가기
		$('#summernote').summernote('redo');
		
		
		function imageUploader(file, el) {
			var formData = new FormData();
			formData.append('file', file);
		  
			$.ajax({                                                              
				data : formData,
				type : "POST",
		        // url은 자신의 이미지 업로드 처리 컨트롤러 경로로 설정해주세요.
				url : '/post/image-upload',  
				contentType : false,
				processData : false,
				enctype : 'multipart/form-data',                                  
				success : function(data) {   
					$(el).summernote('insertImage', "${pageContext.request.contextPath}/assets/images/upload/"+data, function($image) {
						$image.css('width', "100%");
					});
		            // 값이 잘 넘어오는지 콘솔 확인 해보셔도됩니다.
					console.log(data);
				}
			});
		} */
		
		
		// 폼 빈칸일 경우 alert창 띄우기
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
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>

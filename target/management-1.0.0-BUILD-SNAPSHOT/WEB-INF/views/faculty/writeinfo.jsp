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
<title>공지사항 게시글 작성</title>
<jsp:include page="../common/header.jsp" />
<!-- include summernote css/js-->
<script type="text/javascript" src='${path}/resources/js/summernote/summernote-lite.js'></script>
<script type="text/javascript" src='${path}/resources/js/summernote/lang/summernote-ko-KR.js'></script>
<link rel="stylesheet" href="${path}/resources/css/summernote/summernote-lite.css">

<link href="${path}/resources/css/objection.css" rel="stylesheet" />
<link href="${path}/resources/css/infodetail.css" rel="stylesheet" />
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


	<c:set var="searchType" value="${param.searchType}" />
	<c:if test="${empty searchType}">
		<c:set var="searchType" value="title" />
	</c:if>

	<div id="menuBar">
		<div id="sub-menubar" style="height: 150px; font-size: 16px;">
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
								<textarea id="summernote" name="detail" style="height: auto;"></textarea>
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
		
	function fn_summernote(element) {
	    $("#" + element).summernote({
	        toolbar: [
	            ['fontname', ['fontname']],
	            ['fontsize', ['fontsize']],
	            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
	            ['color', ['forecolor', 'color']],
	            ['table', ['table']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['height', ['height']],
	            ['insert', ['picture', 'link', 'video']],
	            ['view', ['fullscreen', 'help']]
	        ],
	        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
	        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
	        width: 850,
	        height: 200,
	        minHeight: null,
	        maxHeight: null,
	        focus: false,
	        lang: "ko-KR",
	        placeholder: '내용을 작성하십시오.',
	        callbacks: {
	            onImageUpload: function(files, editor, welEditable) {
	                // 다중 이미지 처리를 위해 for문을 사용했습니다.
	                for (var i = 0; i < files.length; i++) {
	                    imageUploader(files[i], this);
	                }
	            },
	            onInit: function() {
	                // 모달창의 스타일 또는 속성을 변경
	            	$('.note-modal-header').css({
	            	    'padding': '20px',
	            	    'margin-top': '30px',
	            	    'border': '1px solid #ededef'
	            	});

	            	$('.note-modal-footer').css({
	            	    'padding-right': '20px !improtant',
	            	    'padding': '0px',
	            	    'margin-right': '20px',
	            	    'height': '60px',
	            	    'text-align': 'center'
	            	});

	            	$('.note-modal-footer .note-btn').css({
	            	    'height': '35px',
	            	    'float': 'right',
	            	    'margin': '10px',
	            	    'padding': '5px',
	            	    'text-align': 'center',
	            	    'width': '100px',
	            	    'font-size': 'medium',
	            	    'background-color': '#024C86',
	            	    'border': 'none'
	            	});
	            }
	        }
	    });
	}
	
		// 페이지 로딩시 호출
		$(document).ready(function () {
		    fn_summernote("summernote");
		});
		
		/* $('#summernote').summernote(
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

				}); */
		
		/* // 서머노트에 text 쓰기
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
		*/ 
		
		function imageUploader(imageUpload, el) {
			
			console.log("imageUploader 실행");
			
			var formData = new FormData();
			formData.append('imageUpload', imageUpload);
		  
			$.ajax({                                                              
				data : formData,
				type : "POST",
				url : '${path}/summernoteUpload',  
				contentType : false,
				processData : false,
				cache: false,
				enctype : 'multipart/form-data',                                  
				success : function(data) {   
					console.log("imageUploader 실행 - success");
					console.log("path : " + "${path}");
						$(el).summernote('insertImage', "${path}/resources/upload/"+decodeURIComponent(data), function($image) {
						$image.css('width', "100%");
						}); 
					console.log(data);
				},
				error: function(jqXHR, textStatus, errorThrown) {
				    console.error('AJAX Error: ' + textStatus + ' : ' + errorThrown);
				    console.log('Response Text:', jqXHR.responseText);
				    alert('오류 발생: ' + textStatus);
				}
			});
		}  
		
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

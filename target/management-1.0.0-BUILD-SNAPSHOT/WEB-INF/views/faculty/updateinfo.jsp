<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 및 삭제</title>
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

.button-group .btnlist {
	margin-left: 0;
}

.button-group button {
	font-size: 18px;
	padding: 10px 38px;
	margin: auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #024C86;
	color: white;
	margin-right: 55px;
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

.backbtn .btnlist {
	background-color: #024C86 !important;
	font-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 10px 20px;
	border: none;
	margin-left: 0;
	border-radius: 4px;
	cursor: pointer;
	width: 120px;
	height: 60px;
}

.button-group {
	justify-content: right;
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

	<c:set var="searchType" value="${param.searchType}" />
	<c:if test="${empty searchType}">
		<c:set var="searchType" value="title" />
	</c:if>

	<div class="container" style="height: auto; margin-top: 100px;">
		<div id="content">
			<div id="pageTitle">
				<h1>공지사항 수정</h1>
			</div>
			<div id="pageContent">
				<form action="${path}/updateinfoPro" method="post"
					enctype="multipart/form-data" style="margin-bottom: 20px;">
					<input type="hidden" name="bo_no" value="${board.bo_no}" />
					<input type="hidden" name="originalFilename" value="${board.originalFilename}" />
					<table id="tbl-board">
						<tr>
							<th>글번호</th>
							<td><label>${board.bo_no}</label></td>
						</tr>
						<tr>
							<th>제 목</th>
							<td><input type="text" name="title" value="${board.title}" /></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><c:out value="${board.emp_name}" /></td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="uploadFile"
								value="${board.originalFilename}" /> <c:if
									test="${!empty board.originalFilename}">
									<c:out value="${board.originalFilename}"></c:out>
								</c:if></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td>
								<div id="contentLabel"
									style="padding: 10px; width: 100%; height: auto;">
									<textarea name="content" rows="10" id="summernote"
										style="width: 100%; height: auto;" >${board.content}</textarea>
									
								</div>
							</td>

						</tr>
					</table>
					<div class="button-group">
						<button type="submit" id="btnUpdate" class="btnlist">수정</button>
						<button type="button" id="btnDelete" class="btnlist"
							onclick="deleteFunc(${board.bo_no})">삭제</button>
					</div>
					<div class="backbtn">
						<button type="button" id="btnCancel" class="btn btnlist"
							onclick="window.history.back()"
							style="color: white; font-weight: bold; font-size: 16px;">돌아가기</button>
					</div>
				</form>
			</div>
			<!-- pageContent -->
		</div>
	</div>
	<script>
	
		// textarea - summernote
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
		
	
		function fileDownload(oriname, rename) {
			const url = "${path}/board/fileDown";
			let oName = encodeURIComponent(oriname);
			let rName = encodeURIComponent(rename);
			location.assign(url + "?oriname=" + oName + "&rename=" + rName);
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>

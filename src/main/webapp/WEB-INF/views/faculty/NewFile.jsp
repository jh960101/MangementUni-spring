<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Summernote 사용 예제</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Summernote CSS & JS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote.min.js"></script>
</head>
<body>

<div class="container">
    <h1>Summernote 사용 예제</h1>
    <div id="summernote"></div>
    <button id="saveBtn" class="btn btn-primary">저장</button>
</div>

<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,   // 에디터 높이 설정
            toolbar: [     // 툴바 옵션
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });

        // 저장 버튼 클릭 시
        $('#saveBtn').click(function() {
            var markup = $('#summernote').summernote('code');
            console.log(markup); // 서버에 데이터 전송 로직 추가 가능
            // 예를 들어, Ajax를 사용하여 서버에 데이터를 보낼 수 있습니다.
        });
    });
    
    $('#saveBtn').click(function() {
        var markup = $('#summernote').summernote('code');
        
        $.ajax({
            type: "POST",
            url: "yourServletURL", // 데이터 전송할 서블릿 URL
            data: { content: markup },
            success: function(response) {
                alert("저장 완료!");
                // 저장 후 처리 로직
            },
            error: function() {
                alert("저장 실패!");
                // 오류 처리 로직
            }
        });
    });

</script>

</body>
</html>

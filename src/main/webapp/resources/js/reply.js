$().ready(function () {
        console.log('reply.js running');

        $('#insertReply').on("click", function () {

            let reply_Content = $('#commentInput').val();
            let bo_No = $('#boardNo').val();
            let stu_No = $('#stuNo').val();
            let path = $('#path').val();

            $.ajax({
                method: 'POST',
                url: `${path}/insertReply/`,
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify({bo_No, stu_No, reply_Content}),
                success: (result) => {

                },
                error: (e) => {
                    alert('전송실패!!');
                }
            })

            $.ajax({
                method: 'GET',
                url: `${path}/selectAllReply/`+bo_No,
                contentType: 'application/json',
                dataType: 'json',
                success: (result) => {
                    $('#commentsContainer').append(JSON.stringify(result));
                },
                error: (e) => {
                    alert('전송실패!!');
                }
            })
        })

        function resultHtml(result) {

            let html;
            let reply_content = "";
            $.each(result, function (key, value) {
                html += value.bo_No;
                html += value.reply_Content;
                reply_content = value.reply_Content;
            });
            console.log(reply_content);
            $('#commentsContainer').empty();
            $('#commentsContainer').append(html);

        }
    }
)
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
            data: JSON.stringify({ bo_No, stu_No, reply_Content }),
            success: (result) => {
                let newReplyHtml = `
                <div class="comment">
                    <div class="horizontal-container">
                        <div class="profile-section">
                            <img src="${path}/resources/img/프로필사진.png" class="프로필사진" alt="Profile Image">
                            <span class="username">익명</span>
                        </div>
                        <div class="stats-section">
                            <div class="stat-item"></div>
                        </div>
                    </div>
                    <div class="input-group">
                        <input type="text" class="form-control3" value="${reply_Content}" readonly>
                    </div>
                    <hr style="width: 1000px;">
                </div>
                `;

                // Insert the new reply at the top or bottom of the comments section
                $("#commentsContainer").prepend(newReplyHtml); // Adds at the top
                // $("#commentsContainer").append(newReplyHtml); // Adds at the bottom

                // Optionally Clear the input field after successful insertion
                $('#commentInput').val('');
            },
            error: (e) => {
                alert('전송실패!!');
            }
        });

        $.ajax({
            method: 'GET',
            url: `${path}/selectAllReply/` + bo_No,
            contentType: 'application/json',
            dataType: 'json',
            success: (result) => {
                let outhtml = '';
                $.each(result, function (index, item) {
                    outhtml += `
                    <div class="comment">
                        <div class="horizontal-container">
                            <div class="profile-section">
                                <img src="${path}/resources/img/프로필사진.png" class="프로필사진" alt="Profile Image">
                                <span class="username">익명</span>
                            </div>
                            <div class="stats-section">
                                <div class="stat-item"></div>
                            </div>
                        </div>
                        <div class="input-group">
                            <input type="text" class="form-control3" value="${item.reply_Content}" readonly>
                        </div>
                        <hr style="width: 1000px;">
                    </div>
                    `;
                });

                $("#commentsContainer").empty();
                $("#commentsContainer").html(outhtml);

            },
            error: (e) => {
                alert('전송실패!!');
            }
        });
    });
});

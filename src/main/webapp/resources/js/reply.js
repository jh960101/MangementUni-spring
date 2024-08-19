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
                alert('댓글작성을 완료하였습니다.');
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
                        <div style="display: flex;">
                            <button style="background-color: white;border:none;"><i class="fi fi-br-redo">댓글달기</i></button>
                        </div>
                        <hr style="width: 1000px;">
                    </div>
                    `;
                });

                $("#commentsContainer").empty();
                $("#commentsContainer").html(outhtml);
                $('#commentInput').val('');
            },
            error: (e) => {
                alert('전송실패!!');
            }
        });

    });

    $(document).on("click",'.nestedreply',()=>{
        $('.nestedreplybox').slideToggle();
    })

    $(document).on("click",'.updatereply',()=>{
        $('.replycontent').removeAttr('readonly');
        $('.custom-submit-button').css('display','block');
        $('.replycontent').css('outline','1px solid #333');
    })
});




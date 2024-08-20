$().ready(function () {
    console.log('reply.js running');

    $('#insertReply').on("click", function () {

        let reply_Content = $('#commentInput').val();
        let bo_No = $('#boardNo').val();
        let stu_No = $('#stuNo').val();
        let path = $('#path').val();

        if (reply_Content === '') {
            alert('댓글을 입력해주세요!');
        } else {
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
                    <input type="hidden" id="re_no" value="${item.re_No}"/>
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
                        <div class="input-group" style="gap: 90px;">
                            <textarea class="replycontent" class="form-control-3" rows="3"
                                      cols="70" placeholder="댓글 작성" maxlength="100"
                                      style="width: 750px;margin: 10px 0 20px 20px;border-radius: 5px;border: none;outline: none;padding:10px;  " readonly>${item.reply_Content}</textarea>
                            <div class="d-flex align-items-center">
                                <button class="custom-submit-button" type="button"
                                        id="update-btn" style="display: none">댓글 수정
                                </button>
                            </div>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <button style="background-color: white;border:none;" class="nestedreply"><i
                                    class="fi fi-br-redo"></i> 댓글달기
                            </button>
                            <button style="background-color: white;border:none;" class="updatereply"><i
                                    class="fi fi-br-edit-message" style="position: relative; top: 2px;"></i> 수정하기
                            </button>
                            <button style="background-color: white;border:none;" class="deletereply"><i
                                    class="fi fi-rr-delete" style="position: relative; top: 2px;"></i> 삭제하기
                            </button>
                        </div>
                        <div class="nestedreplybox" style="display: none;transition: all 0.5ms;">
                            <div class="form-controls-container"
                                 style="margin-top: 10px;padding-left: 20px;display: flex;background-color: white;border: none">
                                <div>
<textarea id="nestedreplytext" class="form-control" rows="3"
                                          cols="80" placeholder="대댓글 작성" maxlength="100"
                                          style="width: 100%;"></textarea>
                                </div>
                                <div class="d-flex align-items-center">
                                    <button class="custom-submit-button" type="button"
                                            id="insertNestedReply">답글 작성
                                    </button>
                                </div>
                            </div>
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
                    alert('댓글 삭제에 실패하였습니다.');
                }
            });
        }
    });

    $(document).on("click", '.nestedreply', () => {
        $('.nestedreplybox').slideToggle();
    })

    $(document).on("click", '.updatereply', () => {
        $('.replycontent').removeAttr('readonly');
        $('.custom-submit-button').css('display', 'block');
        $('.replycontent').css('outline', '1px solid #333');
    })

    $(document).on("click", '.deletereply', () => {

        const re_No = $('#re_no').val();
        const bo_No = $('#boardNo').val();
        const path = $('#path').val();

        $.ajax({
            method: 'POST',
            url: `${path}/deleteReply/`,
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({re_No, bo_No}),
            success: (result) => {

                alert('댓글삭제를 완료하였습니다.');
                let outhtml = '';
                $.each(result, function (index, item) {
                    outhtml += `
                    <input type="hidden" id="re_no" value="${item.re_No}"/>
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
                        <div class="input-group" style="gap: 90px;">
                            <textarea class="replycontent" class="form-control-3" rows="3"
                                      cols="70" placeholder="댓글 작성" maxlength="100"
                                      style="width: 750px;margin: 10px 0 20px 20px;border-radius: 5px;border: none;outline: none;padding:10px;  " readonly>${item.reply_Content}</textarea>
                            <div class="d-flex align-items-center">
                                <button class="custom-submit-button" type="button"
                                        id="update-btn" style="display: none">댓글 수정
                                </button>
                            </div>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <button style="background-color: white;border:none;" class="nestedreply"><i
                                    class="fi fi-br-redo"></i> 댓글달기
                            </button>
                            <button style="background-color: white;border:none;" class="updatereply"><i
                                    class="fi fi-br-edit-message" style="position: relative; top: 2px;"></i> 수정하기
                            </button>
                            <button style="background-color: white;border:none;" class="deletereply"><i
                                    class="fi fi-rr-delete" style="position: relative; top: 2px;"></i> 삭제하기
                            </button>
                        </div>
                        <div class="nestedreplybox" style="display: none;transition: all 0.5ms;">
                            <div class="form-controls-container"
                                 style="margin-top: 10px;padding-left: 20px;display: flex;background-color: white;border: none">
                                <div>
<textarea id="nestedreplytext" class="form-control" rows="3"
                                          cols="80" placeholder="대댓글 작성" maxlength="100"
                                          style="width: 100%;"></textarea>
                                </div>
                                <div class="d-flex align-items-center">
                                    <button class="custom-submit-button" type="button"
                                            id="insertNestedReply">답글 작성
                                    </button>
                                </div>
                            </div>
                        </div>
                        <hr style="width: 1000px;">
                    </div>
                    `;
                });

                $("#commentsContainer").empty();
                $("#commentsContainer").html(outhtml);
            },
            error: (e) => {
                alert('삭제실패!!');
            }

        });

    })
    $(document).on("click", '#update-btn', () => {

        const re_No = $('#re_no').val();
        const bo_No = $('#boardNo').val();
        const path = $('#path').val();
        const reply_Content = $('.replycontent').val();

        if (reply_Content === '') {
            alert('수정할 댓글을 입력해주세요!');
        } else {
            $.ajax({
                method: 'POST',
                url: `${path}/updateReply/`,
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify({re_No, bo_No, reply_Content}),
                success: (result) => {
                    alert('댓글이 수정되었습니다.');

                    let outhtml = '';
                    $.each(result, function (index, item) {
                        outhtml += `
                    <input type="hidden" id="re_no" value="${item.re_No}"/>
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
                        <div class="input-group" style="gap: 90px;">
                            <textarea class="replycontent" class="form-control-3" rows="3"
                                      cols="70" placeholder="댓글 작성" maxlength="100"
                                      style="width: 750px;margin: 10px 0 20px 20px;border-radius: 5px;border: none;outline: none;padding:10px;  " readonly>${item.reply_Content}</textarea>
                            <div class="d-flex align-items-center">
                                <button class="custom-submit-button" type="button"
                                        id="update-btn" style="display: none">댓글 수정
                                </button>
                            </div>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <button style="background-color: white;border:none;" class="nestedreply"><i
                                    class="fi fi-br-redo"></i> 댓글달기
                            </button>
                            <button style="background-color: white;border:none;" class="updatereply"><i
                                    class="fi fi-br-edit-message" style="position: relative; top: 2px;"></i> 수정하기
                            </button>
                            <button style="background-color: white;border:none;" class="deletereply"><i
                                    class="fi fi-rr-delete" style="position: relative; top: 2px;"></i> 삭제하기
                            </button>
                        </div>
                        <div class="nestedreplybox" style="display: none;transition: all 0.5ms;">
                            <div class="form-controls-container"
                                 style="margin-top: 10px;padding-left: 20px;display: flex;background-color: white;border: none">
                                <div>
<textarea id="nestedreplytext" class="form-control" rows="3"
                                          cols="80" placeholder="대댓글 작성" maxlength="100"
                                          style="width: 100%;"></textarea>
                                </div>
                                <div class="d-flex align-items-center">
                                    <button class="custom-submit-button" type="button"
                                            id="insertNestedReply">답글 작성
                                    </button>
                                </div>
                            </div>
                        </div>
                        <hr style="width: 1000px;">
                    </div>
                    `;
                    });

                    $("#commentsContainer").empty();
                    $("#commentsContainer").html(outhtml);


                },
                error: (e) => {
                    alert('댓글 수정에 실패하였습니다.');
                }
            });
        }
    })

});




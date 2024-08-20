$().ready(function () {
    console.log('reply.js running');

    $('#insertReply').on('click', function () {
        const replyContent = $('#commentInput').val();
        const boardNo = $('#boardNo').val();
        const stuNo = $('#stuNo').val();
        const path = $('#path').val();

        $.ajax({
            url: `${path}/reply/insert`,
            type: 'POST',
            data: {
                bo_No: boardNo,
                stu_No: stuNo,
                reply_Content: replyContent
            },
            success: function (data) {
                if (data === 'success') {
                    alert('댓글이 등록되었습니다.');
                    location.reload();
                }
            }
        });
    });

    // $('.nestedreply').on('click', function() {
    //     // Find the closest parent `.comment` to ensure we only toggle the relevant reply box
    //     let comment = $(this).closest('.comment');
    //     // Toggle the display of the `.nestedreplybox` within the found comment
    //     comment.find('.nestedreplybox').slideToggle();
    // });
    //
    // $(document).on('click', '.insert-nested-reply', function() {
    //     let comment = $(this).closest('.comment');
    //     let nestedReplyContent = comment.find('.nested-reply-text').val();
    //     let parentReplyId = comment.data('re-no');
    //     const stuNo = $('#stuNo').val();
    //     const boardNo = $('#boardNo').val();
    //     const path = $('#path').val();
    //
    //     console.log(nestedReplyContent);
    //     console.log(parentReplyId);
    //
    //
    //     $.ajax({
    //         url: `${path}/reply/insertNestedReply`,
    //         type: 'POST',
    //         data: {
    //             rePlus: parentReplyId,
    //             reply_Content: nestedReplyContent,
    //             bo_No: boardNo,
    //             stu_No: stuNo
    //         },
    //         success: function(response) {
    //             if (response === 'success') {
    //                 alert('대댓글이 등록되었습니다.');
    //                 location.reload(); // Optionally reload to update the list of replies
    //             } else {
    //                 alert('대댓글 등록에 실패했습니다.');
    //             }
    //         }
    //     });
    // });

    // $('.deletereply').on('click', function() {
    //     // Find the closest parent `.comment` to ensure we only toggle the relevant reply box
    //     let comment = $(this).closest('.comment');
    //     // Toggle the display of the `.nestedreplybox` within the found comment
    //     comment.find('.nestedreplybox').slideToggle();
    // });
    $('.deletereply').on('click', function() {
        let comment = $(this).closest('.comment');
        const stuNo = $('#stuNo').val();
        const path = $('#path').val();
        const reNo = comment.find('.replyId').val();

        $.ajax({
            url: `${path}/reply/delete`,
            type: 'POST',
            data: {
                re_no: reNo
            },
            success: function(response) {
                if (response === 'success') {
                    alert('댓글이 삭제되었습니다.');
                    location.reload(); // Optionally reload to update the list of replies
                } else {
                    alert('댓글 삭제에 실패했습니다.');
                }
            }
        });
    });
    $('.updatereply').on('click', function() {
        // Find the closest parent `.comment` to ensure we only toggle the relevant reply box
        let comment = $(this).closest('.comment');
        // Toggle the display of the `.nestedreplybox` within the found comment
        comment.find('.replycontent').removeAttr('readonly');
        comment.find('.replycontent').css('border','1px solid black');
        comment.find('.replyupdate').css('display','block');
    });
    $('.replyupdate').on('click', function() {
        let comment = $(this).closest('.comment');
        const replycontent = comment.find('.replycontent').val();
        const path = $('#path').val();
        const reNo = comment.find('.replyId').val();

        $.ajax({
            url: `${path}/reply/update`,
            type: 'POST',
            data: {
                re_No: reNo,
                reply_Content: replycontent
            },
            success: function (response) {
                if (response === 'success') {
                    alert('댓글이 수정되었습니다.');
                    location.reload(); // Optionally reload to update the list of replies
                } else {
                    alert('댓글 수정에 실패했습니다.');
                }
            }
        });
    });

});




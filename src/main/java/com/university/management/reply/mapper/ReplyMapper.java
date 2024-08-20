package com.university.management.reply.mapper;

import com.university.management.reply.dto.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {


    void insertReply(Reply replyVO);

    void updateReply(Reply replyVO);

    void deleteReply(int re_no);

    List<Reply> getReplyList(int bo_no);

    void insertNestedReply(Reply replyVO);

    List<Reply> getRepliesByBoardNo(int boNo);
    
    List<Reply> getNestedReplies(int boNo);

//    int insertReply(Reply reply);
//
//    List<Reply> selectAllReply(int bo_no);
//
//    void deleteReplies(int bo_no);
//
//    void deleteReply(int re_No);
//
//    void updateReply(Reply reply);
}

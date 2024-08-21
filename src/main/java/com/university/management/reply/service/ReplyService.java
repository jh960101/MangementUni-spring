package com.university.management.reply.service;

import com.university.management.reply.dto.Reply;
import com.university.management.reply.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyService {
    @Autowired
    private ReplyMapper mapper;


    public void insertReply(Reply replyVO) {
        mapper.insertReply(replyVO);
    }

    public void updateReply(Reply replyVO) {
        mapper.updateReply(replyVO);
    }

    public void deleteReply(int re_no) {
        mapper.deleteReply(re_no);
    }

    public List<Reply> getReplyList(int bo_no) {
        return mapper.getReplyList(bo_no);
    }

    public void insertNestedReply(Reply replyVO) throws Exception {
        mapper.insertNestedReply(replyVO);
    }

    public List<Reply> getRepliesWithNested(int boNo) {
        List<Reply> replies = mapper.getRepliesByBoardNo(boNo);
        for (Reply reply : replies) {
            List<Reply> nestedReplies = mapper.getNestedReplies(reply.getRe_No());
            reply.setNestedReplies(nestedReplies);
        }
        return replies;
    }

    public List<Reply> getNestedReplies(int re_No) {
        return mapper.getNestedReplies(re_No);
    }

    public void deleteReplyByBoard(int bo_No) {
        mapper.deleteReplyByBoard(bo_No);
    }
}

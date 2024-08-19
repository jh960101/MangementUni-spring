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

    public int insertReply(Reply reply) {

        return mapper.insertReply(reply);
    }

    public List<Reply> selectAllReply(int bo_no) {
        return mapper.selectAllReply(bo_no);
    }
}

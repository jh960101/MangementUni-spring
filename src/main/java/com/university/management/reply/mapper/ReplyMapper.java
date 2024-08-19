package com.university.management.reply.mapper;

import com.university.management.reply.dto.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {
    int insertReply(Reply reply);

    List<Reply> selectAllReply(int bo_no);

    void deleteReplies(int bo_no);

    void deleteReply(int re_No);
}

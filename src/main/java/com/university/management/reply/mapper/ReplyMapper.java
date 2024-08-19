package com.university.management.reply.mapper;

import com.university.management.reply.dto.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {
    int insertReply(Reply reply);

    List<Reply> selectAllReply(int bo_no);
}

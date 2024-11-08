package com.university.management.president.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.university.management.board.dto.Board;

@Mapper
public interface PresidentMapper {

    /** 총장게시판 목록을 출력하는 메서드입니다. */
    List<Board> getAllList();

    Board getBoardByNo(int bo_no);

    int insertboard(Board board);

    int getBoardCount();

    List<Board> getPagedList(@Param("recordsPerPage") int recordsPerPage, @Param("offset") int offset);

}

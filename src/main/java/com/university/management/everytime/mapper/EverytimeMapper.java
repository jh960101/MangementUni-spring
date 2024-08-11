package com.university.management.everytime.mapper;

import com.university.management.board.dto.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EverytimeMapper {

    /** eta전체 리스트 가져오기 **/
    List<Board> getAllEtaList();

    /** eta 게시판 번호 기준으로 하나 가져오기 **/
    Board getEtaBoardByNo(int no_no);
}

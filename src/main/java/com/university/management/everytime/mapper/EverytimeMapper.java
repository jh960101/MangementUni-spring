package com.university.management.everytime.mapper;

import com.university.management.board.dto.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EverytimeMapper {

    /** eta전체 리스트 가져오기 **/
    List<Board> getAllEtaList(Map<String, Object> params);

    /** eta 게시판 번호 기준으로 하나 가져오기 **/
    Board getEtaBoardByNo(int no_no);

    /** eta 리스트 학생번호 기준으로 가져오기 **/
	List<Board> getAllEtaListByStuNo(int stu_no);

	List<Board> getAllEtaHotList();

    int getListCount();

    int insertBoard(Board board);

    int updateBoard(Board board);

    void readCountUp(int boNo);
}

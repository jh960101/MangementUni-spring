package com.university.management.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.board.dto.Board;
import com.university.management.board.dto.BoardDTO;



@Mapper
public interface BoardMapper {
	
	// 에타글작성(create) 
		 void insertBoard(BoardDTO boardDTO);
		 
	// 게시글 갯수
	//int selectBoardCount(Map<String, String> boardlist);
	int selectBoardCount();
	
	int getBoardListCount(Map<String,String> map);

	// 게시글 전체 조회
	List<Board> selectBoardList();

	// page 기능으로 공지사항 목록 출력
	List<Board> selectBoardList(Map<String, Object> map);
	
	// 게시글 번호 조회 - 상세 페이지
	Board findByNo(int no);
	
	// 조회수
	int readCount(int no);

	// 공지사항 추가
	int insertWrite(Board board);

	int empSelect(String loginname);

	// 게시글 삭제하기
	int deleteByNo(int no);

	// 게시글 업로드
	int updateByNoList(Map<String, Object> map);
	
	

}

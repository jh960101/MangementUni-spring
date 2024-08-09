package com.university.management.faculty.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.university.management.board.dto.Board;
import com.university.management.board.dto.PageInfo;
import com.university.management.board.mapper.BoardMapper;

@Service
public class FacultyService {

	@Autowired
	private BoardMapper mapper;

	// 총 게시글 갯수
	public int getBoardCount() {
		return mapper.selectBoardCount();
	}

	public int getBoardListCount(Map<String, String> map) {
		return mapper.getBoardListCount(map);
	}

	// 전체 게시글 중에 첫번째 페이지에서 10개의 게시글 반환
	public List<Board> getBoardList() {
		System.out.println("FacultyService-getBoardList");
		return mapper.selectBoardList();
	}

	public Board findByNo(int no) {
		return mapper.findByNo(no);
	}

	// 조회수
	public int readCount(int no) {
		return mapper.readCount(no);
	}

	// 공지사항 추가
	public int insertWrite(Board board) {
		return mapper.insertWrite(board);
	}

	// emp_name으로 emp_id 추출
	public int empSelect(String loginname) {
		return mapper.empSelect(loginname);
	}

	// 공지사항 리스트 추출 및 페이징 처리
	public List<Board> selectBoardList(Map<String, String> params) {
		System.out.println("service selectBoardList : " + params);

		// 값이 제대로 있는지 확인
		if (params.get("firstRow") == null) {
			throw new IllegalArgumentException("firstRow 값 = null");
		} else if (params.get("listLimit") == null) {
			throw new IllegalArgumentException("listLimit 값 =  null");
		}

		String searchType = params.get("searchType");
		String searchValue = params.get("searchValue");
		
		if ("title".equals(searchType) && (searchValue == null || searchValue.trim().isEmpty())) {
	        throw new IllegalArgumentException("제목 검색 시 키워드를 입력해야 합니다.");
	    } 
		
		if ("writer".equals(searchType) && (searchValue == null || searchValue.trim().isEmpty())) {
	    	throw new IllegalArgumentException("작성자 검색 시 키워드를 입력해야 합니다.");
	    }
		
		int firstRow = Integer.parseInt(params.get("firstRow"));
		int listLimit = Integer.parseInt(params.get("listLimit"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("firstRow", firstRow);
		map.put("listLimit", listLimit);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);

		System.out.println("Parsed firstRow: " + firstRow);
		System.out.println("Parsed listLimit: " + listLimit);

		return mapper.selectBoardList(map);
	}

	// 게시글 삭제하기
	public int deleteByNo(int no) {
		return mapper.deleteByNo(no);
	}

	// 게시글 업데이트
	public int updateByNoList(Board board, int no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bo_no", no);
		map.put("title", board.getTitle());
		map.put("content", board.getContent());
		map.put("uploadFile", board.getRenamedFilename());
		map.put("loginname", board.getEmp_name());
		map.put("loginNo", board.getEmp_no());
		
		return mapper.updateByNoList(map);
	}

}

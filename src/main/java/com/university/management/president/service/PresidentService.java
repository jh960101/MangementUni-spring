package com.university.management.president.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.board.dto.Board;
import com.university.management.president.mapper.PresidentMapper;

@Service
public class PresidentService {

	@Autowired
	private PresidentMapper mapper;
	
	public List<Board> getAllList() {
		return mapper.getAllList();
	}

	public Board getBoardByNo(int bo_no) {
		return mapper.getBoardByNo(bo_no) ;
	}

}

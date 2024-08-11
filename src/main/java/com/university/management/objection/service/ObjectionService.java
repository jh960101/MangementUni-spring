package com.university.management.objection.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.board.mapper.BoardMapper;
import com.university.management.objection.dto.Objection;
import com.university.management.objection.mapper.ObjectionMapper;

@Service
public class ObjectionService {
	
	@Autowired
	private ObjectionMapper mapper;
	
	// 성적 조회
	public List<Objection> selectObjList(int studentno) {
		return mapper.selectObjList(studentno);
	}

	// 과목 조회
	public List<Objection> selectBySub(String sub_code) {
		return mapper.selectBySub(sub_code);
	}

}

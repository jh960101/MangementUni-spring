package com.university.management.objection.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

	public int objInsert(Map<String, String> objInsertList) {
		return mapper.objInsert(objInsertList);
	}

	public List<Objection> selectLastResultList(int year, int smt, int studentno) {
		System.out.println("ObjectionService - selectLastResultList() 실행 ");
		Map<String, Integer> lastResultList = new HashMap<String, Integer>();
		lastResultList.put("year", year);
		lastResultList.put("smt", smt);
		lastResultList.put("studentno", studentno);
		
		System.out.println("year : " + year);
		System.out.println("smt : " + smt);
		
		return mapper.selectLastResultList(lastResultList);
	}

	// 성적 조회 - 교직원
	public List<Objection> selectObjListEmp() {
		return  mapper.selectObjListEmp();
	}

	//성적 조회 - 교직원(필터)
	public List<Objection> objectionFilterData(String department, String subject, String grade) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("department", department);
		map.put("subject", subject);
		map.put("grade", grade);
		
		return mapper.objectionFilterData(map);
	}

}

package com.university.management.scholar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.scholar.dto.Scholar;
import com.university.management.scholar.dto.ScholarList;
import com.university.management.scholar.dto.StuScholar;
import com.university.management.scholar.mapper.ScholarMapper;

@Service
public class ScholarService {
    @Autowired
	ScholarMapper mapper;
	
	public List<ScholarList> scholarlistSelect(Map<String, Object> params) {
	
		return mapper.scholarlistSelect(params);
	}

	public int scholarInsert(Scholar sch) {
		System.out.println("ScholarService안에scholarInsert실행");
		return mapper.scholarInsert(sch);
	}

	public List<StuScholar> stuScholarList(Integer loginNo) {
		
		return mapper.stuScholarList(loginNo);
	}

    public int getListCount(Map<String, Object> params) {
		return mapper.getListCount(params);
    }
}

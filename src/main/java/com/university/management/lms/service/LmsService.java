package com.university.management.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.lms.dto.Lms;
import com.university.management.lms.mapper.LmsMapper;

@Service
public class LmsService {

	@Autowired
	LmsMapper mapper;
	
	public List<Lms> lmsSelect(String sub_code) {
		System.out.println("LmsService안에lmsSelect실행");
		return mapper.lmsSelect(sub_code);
	}

	public Lms lmsSelectNO(String lms_no) {
	
		return mapper.lmsSelectNO(lms_no);
	}

}

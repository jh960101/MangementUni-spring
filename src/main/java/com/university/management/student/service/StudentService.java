package com.university.management.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.student.dto.Student;
import com.university.management.student.mapper.StudentMapper;

@Service
public class StudentService {
	@Autowired
	private StudentMapper mapper;
	
	public List<Student> stuInfoSelect(Integer loginNo) {
		
		return mapper.stuInfoSelect(loginNo);
	}

	public void studentUpdate(int stuNo) {
		mapper.studentUpdate(stuNo);
		
	}

	public void studentInfochange(Map<String, Object> params) {
		System.out.println("studentservice안에studentInfochange실행");
		mapper.studentInfochange(params);
		
	}

}

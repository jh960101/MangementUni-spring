package com.university.management.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.courses.dto.Courses;
import com.university.management.student.dto.Student;
import com.university.management.student.mapper.StudentMapper;
import com.university.management.tuition.dto.Tuition;

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

	public List<Tuition> tuitionSelect(Integer loginNo) {
		System.out.println("studentservice안에tuitionSelect실행");
		return mapper.tuitionSelect(loginNo);
	}

	public List<Student> stuselect(int id) {
		
		return mapper.stuselect(id);
	}

	

}

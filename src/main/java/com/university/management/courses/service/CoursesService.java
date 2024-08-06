package com.university.management.courses.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.courseregistrationpage.dto.Courseregistrationpage;
import com.university.management.courses.dto.Courses;
import com.university.management.courses.dto.CoursesList;
import com.university.management.courses.mapper.CoursesMapper;

@Service
public class CoursesService {

	@Autowired
	CoursesMapper mapper;
	
	public ArrayList<Courses> coursesSelect(Courseregistrationpage cour) {
	System.out.println("coursesSelect 실행");
		return mapper.coursesSelect(cour);
	}

	public void courInsert(Courses course) {
		mapper.courInsert(course);
		
	}

	public void coustatusupdate(String sub_code) {
		mapper.coustatusupdate(sub_code);
		
	}

	public void courdelete(String sub_name) {
		System.out.println("courdelete실행");
		mapper.courdelete(sub_name);
		
	}

	public List<CoursesList> coursesList(int loginNo) {
		System.out.println("CoursesList실행");
		return mapper.coursesList(loginNo);
	}

}
package com.university.management.courses.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		System.out.println("CoursesService안에courdelete실행");
		mapper.courdelete(sub_name);
		
	}

	public List<CoursesList> coursesList(CoursesList cour) {
		System.out.println("CoursesService안에CoursesList실행");
		return mapper.coursesList(cour);
	}

	public void classcapup(String sub_name) {
		mapper.classcapup(sub_name);
		
	}

	public void classcapdown(String sub_name) {
		mapper.classcapdown(sub_name);
		
	}

	public List<Courses> coursesbeforlist(Map<String, Object> params) {
		
		return mapper.coursesbeforlist(params);
	}

	public CoursesList attendanceRate(CoursesList cour) {
		
		return mapper.attendanceRate(cour);
	}

}

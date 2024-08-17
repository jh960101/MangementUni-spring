package com.university.management.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.courses.dto.Courses;
import com.university.management.student.dto.Student;
import com.university.management.tuition.dto.Tuition;


@Mapper
public interface StudentMapper {

	List<Student> stuInfoSelect(Integer loginNo);

	void studentUpdate(int stuNo);

	void studentInfochange(Map<String, Object> params);

	List<Tuition> tuitionSelect(Integer loginNo);

	List<Student> stuselect(int id);

	



}

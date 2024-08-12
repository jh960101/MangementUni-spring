package com.university.management.login.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.employee.dto.Employee;
import com.university.management.student.dto.Student;

@Mapper
public interface Loginmapper {

	//직원 로그인 
	Employee emplogin(Map<String, String> params);
	
	//학생 로그인
	Student studentLogin(Map<String, String> params);

	//학생 비밀번호 찾기
	void pwschange(Map<String, Object> params);

	Student studentpwfind(Map<String, String> params);

}

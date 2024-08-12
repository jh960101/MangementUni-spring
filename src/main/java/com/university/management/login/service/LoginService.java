package com.university.management.login.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.management.employee.dto.Employee;
import com.university.management.login.mapper.Loginmapper;
import com.university.management.student.dto.Student;


@Service
public class LoginService {
   @Autowired
	Loginmapper mapper;
	
//교직원 로그인
	public Employee emplogin(Map<String, String> params) {
		System.out.println("loginService안에 emplogin실행");
		return mapper.emplogin(params);
	}

//학생 로그인
	public Student studentLogin(Map<String, String> params) {
		System.out.println("loginService안에 studentLogin실행");
		return mapper.studentLogin(params);
	}
//비밀번호 변경
	public void pwschange(Map<String, Object> params) {
		System.out.println("loginService안에 pwschange실행");
		mapper.pwschange(params);
	}
//비밀번호 찾기
	public Student studentpwfind(Map<String, String> params) {
		
		return mapper.studentpwfind(params);
	}

}

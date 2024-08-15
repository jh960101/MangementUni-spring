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
	public List<Objection> objectionFilterData(Map<String, Object> params) {
		return mapper.objectionFilterData(params);
	}

	// 성적 이의신청 화면의 정보 출력
	public List<Objection> objectionUpSelect(String sub_code, int stu_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sub_code", sub_code);
		map.put("stu_no", stu_no);
		
		return mapper.objectionUpSelect(map);
	}

	// 성적 업데이트
	public int objUpdate(String sub_code, int stu_no, int grade_p) {
		System.out.println("ObjectionService-objUpdate() 실행");
		System.out.println("sub_code : " + sub_code);
		System.out.println("stu_no : " + stu_no);
		System.out.println("grade_p : " + grade_p);
		
		// 등급 변수
		String grade;
		
		// 등급 처리
		if (grade_p >= 90) {
		    grade = "A+";
		} else if (grade_p >= 85) {
		    grade = "A";
		} else if (grade_p >= 80) {
		    grade = "A-";
		} else if (grade_p >= 75) {
		    grade = "B+";
		} else if (grade_p >= 70) {
		    grade = "B";
		} else if (grade_p >= 65) {
		    grade = "B-";
		} else if (grade_p >= 60) {
		    grade = "C+";
		} else if (grade_p >= 55) {
		    grade = "C";
		} else if (grade_p >= 50) {
		    grade = "C-";
		} else {
		    grade = "F"; // 0~49
		}
		
		System.out.println("grade : " + grade);
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sub_code", sub_code);
		map.put("stu_no", stu_no);
		map.put("grade_p", grade_p);
		map.put("grade", grade);
		
		System.out.println("map : " + map);
		return mapper.objUpdate(map);
	}

	public int getListCount(Map<String, Object> params) {
		return mapper.getListCount(params);
	}

}

package com.university.management.courses.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CoursesList {
	private int STU_NO; // 학번 참조
	private int YEAR; // -- 학년도
	private int SMT; // -- 학기
	private String DEPT_NAME; // -- 학과명
	private String PROF_NAME; // -- 교수명
	private String SUB_NAME; // -- 과목명
	private String CO_CONTENT; // -- 강의계획서 내용
	private String SUB_CODE;// 과목 코드
	private double AttendanceRate; // 출석률
}
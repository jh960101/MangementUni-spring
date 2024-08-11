package com.university.management.courses.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Courses {
    private int  STU_NO;//학번
    private String SUB_CODE; //과목코드
	private String DEPT_NAME; //학과이름
	private String SUB_NAME; //과목이름
	private String PROF_NAME; //교수이름
	private int CLASS_CAP ;  //정원
	private String SUB_ST_TIME; //시작교시
	private String SUB_END_TIME; // 끝나는 교시
	private String CO_CONTENT; //강의 계획서 내용
	private int SMT;  //학기
	private int YEAR; //학년도
	private int SUB_POINT; //학점
	private String SUB_STATUS; //상태값 (y,n)
	private double AttendanceRate; // 출석률
}

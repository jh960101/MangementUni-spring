package com.university.management.objection.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Objection {

	private int num;			// 성적 출력 시 번호
	private int year; 			// 학년도
	private int smt; 			// 학기
	private String grade; 		// 등급(A+)
	private int grade_p;		// 점수		
	private String obj_no; 		// 성적 이의 신청 인덱스 번호
	private String stu_no; 		// 학번
	private String dept_code; 	// 학과코드
	private String dept_name; 	// 학과명
	private String prof_no; 	// 교수번호
	private String prof_name; 	// 교수번호
	private String sub_code; 	// 과목 코드
	private String sub_name; 	// 과목 이름
	private String obj_content; // 작성 내용
	private Date create_Date; 	// 작성 날짜

}

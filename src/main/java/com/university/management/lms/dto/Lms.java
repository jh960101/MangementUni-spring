package com.university.management.lms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Lms {

	private int LMS_NO;// 강의 인덱스
	private String SUB_CODE;// 과목코드
	private String LMS_TITLE; // 강의 제목
	private String LMS_FILE;// 강의자료 업로드
	private String LMS_DATE;// 온라인 강의 1,2,3,4,5,6,7,8 주차
	private String LMS_CHECK; // 출석 상태 y,n
	private String CO_CONTENT;//강의 개요
    private String SUB_NAME; //과목 명
}

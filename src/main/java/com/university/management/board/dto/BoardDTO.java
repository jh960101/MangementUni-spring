package com.university.management.board.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
    private Integer boNo; // 게시글 번호
    private Integer stuNo; // 학생 번호
    private Integer empNo; // 교직원 번호
    private String title; // 제목
    private String content; // 내용
    private String type; // 게시글 타입
    private String originalFilename; // 원본 파일 이름
    private String renameFilename; // 변경된 파일 이름
    private Integer readCount; // 조회수
    private Boolean BO_STATUS; // 익명 여부
    private Integer bo_Like; // 좋아요 수
    private Date create_date; // 작성 날짜
	private Date modify_date; // 수정 날짜
	private List<Reply> replies; // 댓글 
	
	
	
   
}

package com.university.management.board.dto;

import java.util.Date;
import java.util.List;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private int bo_no; // 게시판 인덱스
	private int stu_no; // 학번
	private int emp_no; // 교직원 번호
	private String emp_name; // 교직원 이름
	private String title; // 제목
	private String content; // 내용
	private String type; // 타입 (공지사항, 에타, 총장님께전합니다)
	private String originalFilename; // 파일 업로드
	private String renameFilename; // 수정 파일 업로드
	private int readCount; // 조회수
	private Date create_date; // 작성 날짜
	private Date modify_date; // 수정 날짜
	private int bo_Like; // 좋아요 버튼
	private String bo_status;
	private List<Reply> replies; // 댓글
	
		
	

}

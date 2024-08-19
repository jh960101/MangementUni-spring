package com.university.management.reply.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

	private int re_No;				// 댓글 인덱스
	private int bo_No;				// 게시판 인덱스
	private int stu_No;				// 학번
	private int emp_No;				// 교직원 번호
	private String reply_Content;	// 댓글 내용
	private Date create_Date;		// 작성날짜
	private Date modifyDate;		// 수정날짜
	private int rePlus;				// 대댓글

}

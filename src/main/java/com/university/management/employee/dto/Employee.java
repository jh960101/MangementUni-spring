package com.university.management.employee.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

	
	private int EMP_NO; // 직원번호
	private String EMP_NAME; // 직원명
	private String EMP_PASSWORD; // 비밀번호
	private String EMP_EMAIL;// 이메일

}

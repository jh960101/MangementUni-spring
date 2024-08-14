package com.university.management.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.lms.dto.Lms;

@Mapper
public interface LmsMapper {

	List<Lms> lmsSelect(String sub_code);

	Lms lmsSelectNO(String lms_no);

	void lmsstatusUpdate(int lms_no);

}

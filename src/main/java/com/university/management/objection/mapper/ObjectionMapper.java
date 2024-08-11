package com.university.management.objection.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.objection.dto.Objection;

@Mapper
public interface ObjectionMapper {

	List<Objection> selectObjList(int studentno);

	List<Objection> selectBySub(String sub_code);

}

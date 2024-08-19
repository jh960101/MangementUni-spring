package com.university.management.objection.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.objection.dto.Objection;

@Mapper
public interface ObjectionMapper {

	List<Objection> selectObjList(int studentno);

	int objInsert(Map<String, String> objInsertList);

	List<Objection> selectLastResultList(Map<String, Integer> lastResultList);

	List<Objection> selectObjListEmp();

	List<Objection> objectionUpSelect(Map<String, Object> map);

	int objUpdate(Map<String, Object> map);

	int getListCount(Map<String, Object> params);

	List<Objection> objectionFilterData(Map<String, Object> params);

	int objStatusUpdate(Map<String, Object> map);

}

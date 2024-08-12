package com.university.management.scholar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.university.management.scholar.dto.Scholar;
import com.university.management.scholar.dto.ScholarList;
import com.university.management.scholar.dto.StuScholar;

@Mapper
public interface ScholarMapper {

	List<ScholarList> scholarlistSelect(Map<String, Object> params);

	int scholarInsert(Scholar sch);

	List<StuScholar> stuScholarList(Integer loginNo);

    int getListCount(Map<String, Object> params);
}

package com.university.management.everytime.service;

import com.university.management.board.dto.Board;
import com.university.management.everytime.mapper.EverytimeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EverytimeService {

    @Autowired
    private EverytimeMapper mapper;

    public List<Board> getAllEtaList(Map<String, Object> params) {
        return mapper.getAllEtaList(params);
    }

    public Board getEtaBoardByNo(int bo_no) {
        return mapper.getEtaBoardByNo(bo_no);
    }

	public List<Board> getAllEtaListByStuNo(int stu_no) {
		return mapper.getAllEtaListByStuNo(stu_no);
	}

	public List<Board> getAllEtaHotList() {
		return mapper.getAllEtaHotList();
	}

    public int getListCount() {
        return mapper.getListCount();
    }
}

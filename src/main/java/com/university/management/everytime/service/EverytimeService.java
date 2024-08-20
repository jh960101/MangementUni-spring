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

	public List<Board> getAllEtaListByStuNo(Map<String, Object> params) {
		return mapper.getAllEtaListByStuNo(params);
	}

	public List<Board> getAllEtaHotList() {
		return mapper.getAllEtaHotList();
	}

    public int getListCount() {
        return mapper.getListCount();
    }

    public int insertBoard(Board board) {
        return mapper.insertBoard(board);
    }

    public int updateBoard(Board board) {
        return mapper.updateBoard(board);
    }

    public void readCountUp(int boNo) {
        mapper.readCountUp(boNo);
    }

    public void etaLikeUp(int boNo) {
        mapper.etaLikeUp(boNo);
    }

    public int deleteBoard(int bo_no) {
         return mapper.deleteBoard(bo_no);
    }
}

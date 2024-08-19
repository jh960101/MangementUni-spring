package com.university.management.president.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.university.management.board.dto.Board;
import com.university.management.president.mapper.PresidentMapper;

@Service
public class PresidentService {

    @Autowired
    private PresidentMapper mapper;

    public List<Board> getAllList() {
        return mapper.getAllList();
    }

    public List<Board> getPagedList(int page, int recordsPerPage) {
        int offset = (page - 1) * recordsPerPage;
        return mapper.getPagedList(recordsPerPage, offset);
    }

    public int getBoardCount() {
        return mapper.getBoardCount();
    }

    public Board getBoardByNo(int bo_no) {
        return mapper.getBoardByNo(bo_no);
    }

    public int insertboard(int stu_no, String title, String content) {
        Board board = new Board();
        board.setStu_no(stu_no);
        board.setTitle(title);
        board.setContent(content);
        return mapper.insertboard(board);
    }
}

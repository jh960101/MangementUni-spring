package com.university.management.board.service;

import com.university.management.board.dto.BoardDTO;
import com.university.management.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

    private final BoardMapper boardMapper;

    @Autowired
    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public void writePost(Integer stuNo, Integer empNo, String title, String content, String type,
                          String originalFilename, String renameFilename, Boolean BO_STATUS) {
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setStuNo(stuNo);
        boardDTO.setEmpNo(empNo);
        boardDTO.setTitle(title);
        boardDTO.setContent(content);
        boardDTO.setType(type);
        boardDTO.setOriginalFilename(originalFilename);
        boardDTO.setRenameFilename(renameFilename);
        boardDTO.setBO_STATUS(BO_STATUS);

        // 게시글 DB 저장
        boardMapper.insertBoard(boardDTO);
    }
}

package com.university.management.board.controller;

import com.university.management.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/views")
public class BoardController {

    private final BoardService boardService;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @PostMapping("/etnew")
    public String handleEtnewPost(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("type") String type,
            @RequestParam(value = "file-upload", required = false) MultipartFile file,
            @RequestParam(value = "anonymous", required = false) Boolean anonymous,
            HttpSession session) {

        // 세션에서 사용자 정보 가져오기 (예: 학번 또는 교직원 번호)
        Integer stuNo = (Integer) session.getAttribute("studentno");
        Integer empNo = (Integer) session.getAttribute("empno");

        // 파일 업로드 처리
        String originalFilename = file != null ? file.getOriginalFilename() : null;
        String renameFilename = null;
        if (originalFilename != null) {
            renameFilename = System.currentTimeMillis() + "_" + originalFilename;
            try {
                file.transferTo(new File("C:/Fullstack/" + renameFilename)); // 파일 저장 경로
            } catch (IOException e) {
                e.printStackTrace();
                // 예외 처리 로직
            }
        }

        // 게시글 작성 서비스 호출
        boardService.writePost(stuNo, empNo, title, content, type, originalFilename, renameFilename, anonymous);

        // 글 작성 후 etmainpage로 리다이렉트
        return "redirect:/views/etmainpage";
    }

  

    	@PostMapping("/everytime/etmainpage")
    	public String handleEtmainpagePost() {
    	    return "etmainpage";
    	}
    }




    
    




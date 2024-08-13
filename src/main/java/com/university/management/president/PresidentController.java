package com.university.management.president;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.university.management.board.dto.Board;
import com.university.management.president.service.PresidentService;

@Controller

public class PresidentController {

	@Autowired
	private PresidentService service;

	@RequestMapping("/presidentplslist")
	public String showPresidentPlsList(Model model) {

		List<Board> list = service.getAllList();
		System.out.println(list);
		model.addAttribute("list", list);

		return "/president/presidentplslist";
	}

	@RequestMapping("/presidentplsdetail")
	public String showDetailPage(Model model, @RequestParam("bo_no") int bo_no) {
		
		Board board =  service.getBoardByNo(bo_no);
		
		model.addAttribute("board", board);
		
		return "/president/presidentplsdetail";
	}

}

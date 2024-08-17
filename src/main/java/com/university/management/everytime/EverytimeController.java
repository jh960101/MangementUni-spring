package com.university.management.everytime;


import com.university.management.board.dto.Board;
import com.university.management.board.dto.PageInfo;
import com.university.management.everytime.service.EverytimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class EverytimeController {

	@Autowired
	private EverytimeService service;

	@Autowired
	private HttpSession session;

	@RequestMapping("/etmainpage")
	public String etmainpage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		Map<String, Object> params = new HashMap<>();

		int listLimit = 4; // 한 페이지에 보여질 게시글 수
		int totalRowCount = service.getListCount(); // 전체 게시글의 수

		// 페이지네이션 설정
		PageInfo pageSettings = new PageInfo(page, totalRowCount, listLimit);
		pageSettings.pageSetting(totalRowCount);

		int firstRow = pageSettings.getFirstRow();

		params.put("firstRow", firstRow);
		params.put("listLimit", listLimit);

		// 데이터 가져오기
		List<Board> list = service.getAllEtaList(params);


		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageSettings);
		model.addAttribute("count", totalRowCount);

		return "everytime/etmainpage";
	}

	@RequestMapping("/etaupdate")
	public String etamend() {
		return "everytime/evereytimeupdate";
	}

	@RequestMapping("/etdetailview")
	public String etdetailview(Model model, @RequestParam("no") int boNo) {

        Board etaboard = service.getEtaBoardByNo(boNo);

		model.addAttribute("board", etaboard);

		return "everytime/etdetailview";
	}

	@RequestMapping("/everytimehot")
	public String everytimehot(Model model) {

		List<Board> list = service.getAllEtaHotList();
		model.addAttribute("list", list);
		System.out.println(list);

		return "everytime/everytimehot";
	}

	@RequestMapping("/etmypage")
	public String etmypage(Model model, @RequestParam("stuno") int stu_no) {

		List<Board> list = service.getAllEtaListByStuNo(stu_no);

		model.addAttribute("list", list);

		return "everytime/etmypage";

	}

	@RequestMapping("/etnew")
	public String etnew() {
		return "everytime/etnew";
	}

}
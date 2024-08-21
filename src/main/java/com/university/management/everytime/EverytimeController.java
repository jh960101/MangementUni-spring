package com.university.management.everytime;

import com.university.management.board.dto.Board;
import com.university.management.board.dto.PageInfo;
import com.university.management.everytime.service.EverytimeService;
import com.university.management.reply.dto.Reply;
import com.university.management.reply.service.ReplyService;
import com.university.management.student.dto.Student;
import com.university.management.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Calendar;
import java.util.Date;
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

	@Autowired
	private StudentService studentService;

	@Autowired
	private ReplyService replyService;

	@RequestMapping("/etmainpage")
	public String etmainpage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		session.removeAttribute("readCheck");
		session.removeAttribute("likeCheck");

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

		for(Board board:list){
			int count = replyService.getReplyList(board.getBo_no()).size();
			board.setReplyCount(count);
		}

		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageSettings);
		model.addAttribute("count", totalRowCount);

		return "everytime/etmainpage";
	}

	@RequestMapping("/etaupdate")
	public String etamend(@RequestParam("bo_no") int bo_no, Model model) {

		Board etaboard = service.getEtaBoardByNo(bo_no);

		model.addAttribute("board", etaboard);

		return "everytime/evereytimeupdate";
	}

	@RequestMapping("/updateBoard")
	public String updateBoard(Board board, Model model) {

		int stu_no = (int) session.getAttribute("studentno");

		int result = service.updateBoard(board);

		if (result == 1) {
			model.addAttribute("msg", "글 수정이 완료되었습니다.");
		} else {
			model.addAttribute("msg", "글 수정에 실패하였습니다.");
		}

		return "redirect:/etmypage?stuno=" + stu_no;
	}

	@RequestMapping("/etdetailview")
	public String etdetailview(Model model, @RequestParam("no") int boNo) {

		if (session.getAttribute("readCheck") == null) {
			session.setAttribute("readCheck", true);
			service.readCountUp(boNo);
		}

		Board etaboard = service.getEtaBoardByNo(boNo);

		int stu_no = etaboard.getStu_no();

		List<Student> students = studentService.stuselect(stu_no);

		List<Reply> list = replyService.getReplyList(boNo);
		System.out.println(list);

		for(Reply reply:list){
			 reply.setNestedReplies(replyService.getNestedReplies(reply.getRe_No()));
		}

		model.addAttribute("board", etaboard);
		model.addAttribute("student", students);
		model.addAttribute("list", list);

		return "everytime/etdetailview";
	}

	@RequestMapping("/everytimehot")
	public String everytimehot(Model model) {

		session.removeAttribute("readCheck");
		session.removeAttribute("likeCheck");

		List<Board> list = service.getAllEtaHotList();

		for(Board board:list){
			int count = replyService.getReplyList(board.getBo_no()).size();
			board.setReplyCount(count);
		}

		model.addAttribute("list", list);

		return "everytime/everytimehot";
	}

	@RequestMapping("/etmypage")
	public String etmypage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		String login = (String) session.getAttribute("login");

		if (login.equals("Employee")) {
			model.addAttribute("msg", "교직원은 사용할 수 없는 메뉴입니다!");
			return "everytime/etmypage";
		}

		int stu_no = (int) session.getAttribute("studentno");

		Map<String, Object> params = new HashMap<>();

		int listLimit = 4; // 한 페이지에 보여질 게시글 수
		int totalRowCount = service.getListCount(); // 전체 게시글의 수

		// 페이지네이션 설정
		PageInfo pageSettings = new PageInfo(page, totalRowCount, listLimit);
		pageSettings.pageSetting(totalRowCount);

		int firstRow = pageSettings.getFirstRow();

		params.put("firstRow", firstRow);
		params.put("listLimit", listLimit);
		params.put("stu_no",stu_no);

		// 데이터 가져오기

		List<Board> list = service.getAllEtaListByStuNo(params);

		for(Board board:list){
			int count = replyService.getReplyList(board.getBo_no()).size();
			board.setReplyCount(count);
		}

		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageSettings);
		model.addAttribute("count", totalRowCount);

		return "everytime/etmypage";

	}

	@RequestMapping("/etnew")
	public String etnew(Model model) {

		String login = (String) session.getAttribute("login");

		if (login.equals("Employee")) {

			model.addAttribute("msg", "교직원은 사용할 수 없는 메뉴입니다!");
		}

		return "everytime/etnew";
	}

	@RequestMapping("/insertBoard")
	public String insertBoard(RedirectAttributes rttr, @RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("bo_status") String bo_status) {

		Board board = new Board();
		int stu_no = (int) session.getAttribute("studentno");
		Date date = Calendar.getInstance().getTime();

		System.out.println("익명상태: "+bo_status);
		board.setStu_no(stu_no);
		board.setTitle(title);
		board.setContent(content);
		board.setBo_status(bo_status);
		board.setCreate_date(date);
		
		int result = service.insertBoard(board);

		if (result == 1) {
			rttr.addAttribute("msg", "게시물 작성이 완료되었습니다.");
		} else {
			rttr.addAttribute("msg", "게시물 작성에 실패하였습니다.");
		}
		return "redirect:/etmypage?stuno=" + stu_no;
	}

	@RequestMapping("/etaLikeUp")
	public String etaLikeUp(@RequestParam("bo_no") int bo_no) {

		if (session.getAttribute("likeCheck") == null) {
			session.setAttribute("likeCheck", true);
			service.etaLikeUp(bo_no);
		}

		return "redirect:/etdetailview?no=" + bo_no;
	}

	@RequestMapping("/deleteBoard")
	public String deleteBoard(@RequestParam("bo_no") int bo_no, RedirectAttributes rttr) {

		int stu_no = (int) session.getAttribute("studentno");

//		replyService.deleteReplyByBoNo(bo_no);

		int result = service.deleteBoard(bo_no);

		if (result == 1) {
			rttr.addAttribute("msg", "게시물 삭제가 완료되었습니다.");
		} else {
			rttr.addAttribute("msg", "게시물 삭제에 실패하였습니다.");
		}

		return "redirect:/etmypage?stuno=" + stu_no;
	}
}
//package com.university.management.everytime;
//
//
//import com.university.management.board.dto.BoardDTO;
//import com.university.management.board.dto.PageInfo;
//import com.university.management.board.service.BoardService;
//import com.university.management.everytime.service.EverytimeService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class EverytimeController {
//
//	@Autowired
//	private EverytimeService service;
//
//	@Autowired
//	private HttpSession session;
//
//	@RequestMapping("/etmainpage")
//	public String etmainpage(Model model) {
//
//		List<BoardDTO> list = service.getAllEtaList();
//
//		model.addAttribute("list", list);
//
//		return "everytime/etmainpage";
//	}
//
//	@RequestMapping("/etaupdate")
//	public String etamend() {
//		return "everytime/evereytimeupdate";
//	}
//
//	@RequestMapping("/etdetailview")
//	public String etdetailview(Model model, @RequestParam("no") int boNo) {
//
//		BoardDTO etaboard = service.getEtaBoardByNo(boNo);
//
//		model.addAttribute("board", etaboard);
//
//		return "everytime/etdetailview";
//	}
//
//	@RequestMapping("/everytimehot")
//	public String ethot(Model model) {
//
//		List<BoardDTO> list = service.getAllEtaHotList();
//		model.addAttribute("list", list);
//		System.out.println(list);
//
//		return "everytime/everytimehot";
//	}
//
//	@RequestMapping("/etmypage")
//	public String etmypage(Model model, @RequestParam("stuno") int stu_no) {
//
//		List<BoardDTO> list = service.getAllEtaListByStuNo(stu_no);
//
//		model.addAttribute("list", list);
//
//		return "everytime/etmypage";
//
//	}
//
//	@RequestMapping("/etnew")
//	public String etnew() {
//		return "everytime/etnew";
//	}
//
//	/*-------------------------기능---------------*/
//
//	@PostMapping("/insertBoard")
//	public String insertBoard(HttpSession session, @RequestParam("title") String title,
//			@RequestParam("content") String content, Model model) {
//		try {
//			// 세션에서 stuNo와 empNo 값 가져오기
//			Integer stuNo = (Integer) session.getAttribute("studentno");
//			Integer empNo = (Integer) session.getAttribute("empNO");
//
//			// BoardDTO 객체 생성 및 필드 설정
//			BoardDTO boardDTO = new BoardDTO();
//			boardDTO.setStuNo(stuNo);
//			boardDTO.setEmpNo(empNo);
//			boardDTO.setTitle(title);
//			boardDTO.setContent(content);
//			boardDTO.setType("E"); // 타입 고정
//
//			// 게시글 저장
//			service.insertBoard(boardDTO);
//
//			// 성공 메시지 설정
//			model.addAttribute("message", "게시글이 성공적으로 등록되었습니다.");
//			return "redirect:/everytime/etmainpage"; // 리디렉션 없이 바로 뷰를 반환
//
//		} catch (Exception e) {
//			// 실패 시 예외 처리
//			e.printStackTrace();
//			model.addAttribute("message", "게시글 등록에 성공했습니다.");
//			return "/everytime/etnew"; // 리디렉션 없이 바로 뷰를 반환
//		}
//	}
//
//	/*
//	 * // 일반 파일 저장 File dest = new File(uploadDir + File.separator + fileReadName);
//	 * file.transferTo(dest); // 파일 저장
//	 *
//	 * // 이미지 파일 저장 if (!imageFile.isEmpty()) { //String uniqueImgName =
//	 * System.currentTimeMillis() + "_" + imgReadName; // 고유한 이름 File destImg = new
//	 * File(uploadDir + File.separator + imgReadName);
//	 * imageFile.transferTo(destImg); // 이미지 파일 저장
//	 * board.setRenameFilename(imgReadName); }
//	 *
//	 * board.setOriginalFilename(fileReadName); // 일반 파일명 설정
//	 * System.out.println("파일 저장 성공"); } catch (IOException e) {
//	 * e.printStackTrace(); // 오류 처리 추가 redirectAttributes.addFlashAttribute("msg",
//	 * "파일 업로드 중 오류가 발생했습니다."); return "redirect:/infoboard"; // 오류 발생 시 리디렉션 } }
//	 * else { fileReadName = "-";
//	 *
//	 *
//	 * // param의 값을 Board 객체에 설정 board.setEmp_no(loginNo); board.setTitle(title);
//	 * board.setContent(detail); board.setOriginalFilename(fileReadName);
//	 *
//	 * int res = service.insertWrite(board);
//	 *
//	 * if (res > 0) { System.out.println("res :  " + res);
//	 * session.setAttribute("msg", "정상적으로 업로드되었습니다."); } else {
//	 * session.setAttribute("msg", "정상적으로 업로드되지 않았습니다."); }
//	 *
//	 * } else { // 빈칸일 경우 alert창 띄움 model.addAttribute("msg", "내용을 입력해주세요."); }
//	 *
//	 * return "redirect:/infoboard"; // 리디렉션 }
//	 */
//	/*
//	 * // 게시글 조회
//	 *
//	 * @GetMapping("/view/{BO_NO}") public String viewBoard(("BO_NO") int boNo,
//	 * Model model) { BoardDTO boardDTO = Service.getEtaBoardByNo(boNo);
//	 * Service.incrementReadCount(boNo); // 조회수 증가 model.addAttribute("board",
//	 * boardDTO); return "etdetailview"; }
//	 */
//
//	// 게시글 수정 폼 이동
//
//	@GetMapping("/edit/{BO_NO}")
//	public String editForm(@PathVariable("BO_NO") int boNo, Model model) {
//	    // 게시글 정보 가져오기
//	    BoardDTO boardDTO = service.getEtaBoardByNo(boNo);
//
//	    // 모델에 게시글 정보 추가
//	    model.addAttribute("boardDTO", boardDTO);
//
//	    // 수정 페이지로 이동
//	    return "evereytimeupdate";
//	}
//
//
//	// 게시글 수정
//	@PostMapping("/editBoard")
//	public String editBoard(@ModelAttribute BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
//	    try {
//	        service.updateBoard(boardDTO);
//	        redirectAttributes.addFlashAttribute("message", "게시글이 성공적으로 수정되었습니다.");
//	        return "redirect:/etmypage?stuno=" + boardDTO.getStuNo();
//	    } catch (Exception e) {
//	        redirectAttributes.addFlashAttribute("message", "게시글 수정에 실패했습니다.");
//	        return "everytimeupdate";
//	    }
//	}
//
//	// 게시글 삭제
//	@PostMapping("/deleteBoard/{boNo}")
//	public String deleteBoard(@PathVariable("boNo") int boNo, RedirectAttributes redirectAttributes) {
//	    try {
//	        service.deleteBoard(boNo);
//	        redirectAttributes.addFlashAttribute("message", "게시글이 성공적으로 삭제되었습니다.");
//	        return "redirect:/etmypage";
//	    } catch (Exception e) {
//	        redirectAttributes.addFlashAttribute("message", "게시글 삭제에 실패했습니다.");
//	        return "everytimeupdate";
//	    }
//	}
//
//	// 게시글 신고
//	@PostMapping("/report/{boNo}")
//	public String reportBoard(@PathVariable("boNo") int BO_NO, HttpSession session) {
//		String user = (String) session.getAttribute("user");
//		service.reportBoard(BO_NO, user);
//		// 팝업으로 신고 접수 메시지 표시
//		return "redirect:/everytime/view/" + BO_NO;
//	}
//
//	// 게시글 좋아요
//	@PostMapping("/like/{boNo}")
//	public String likeBoard(@PathVariable("boNo") int BO_NO, HttpSession session) {
//		String user = (String) session.getAttribute("user");
//		service.likeBoard(BO_NO, user);
//		return "redirect:/everytime/view/" + BO_NO;
//	}
//
//}
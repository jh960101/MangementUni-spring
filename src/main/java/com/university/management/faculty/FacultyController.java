package com.university.management.faculty;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.Part;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.university.management.board.dto.Board;
import com.university.management.board.dto.PageInfo;
import com.university.management.employee.dto.Employee;
import com.university.management.faculty.service.FacultyService;
import com.university.management.objection.dto.Objection;
import com.university.management.objection.service.ObjectionService;
import com.university.management.scholar.dto.Scholar;
import com.university.management.scholar.dto.ScholarList;
import com.university.management.scholar.service.ScholarService;
import com.university.management.student.service.StudentService;

@Controller
public class FacultyController {

	@Autowired
	private HttpSession session;

	@Autowired
	private FacultyService service;

	@Autowired
	private ObjectionService objservice;

	@Autowired
	private ScholarService scholarservice;

	@Autowired
	private StudentService stuservice;

	// 공지사항 목록처리
	@RequestMapping("/infoboard")
	public String infoboard(Model model, @RequestParam Map<String, String> param,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		System.out.println("FacultyController-infoboard() 실행");

		String login = (String) session.getAttribute("login");
		System.out.println("login : " + login);

		// 검색어 초기화
		if (param.get("searchValue") == null) {
			// searchValue 값이 없을 경우 세션에서 제거
			session.removeAttribute("searchType");
			session.removeAttribute("searchValue");
		}

		Map<String, String> params = new HashMap<String, String>();
		String searchType = param.get("searchType");
		String searchValue = param.get("searchValue");

		try {
			if (searchType != null && searchValue != null && !searchValue.trim().isEmpty()) {
				params.put("searchType", searchType);
				params.put("searchValue", searchValue);
				session.setAttribute("searchType", searchType);
				session.setAttribute("searchValue", searchValue);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		int listLimit = 5; // 한 페이지에 보여질 게시글 수
		int totalRowCount = service.getBoardListCount(params); // 전체 게시글의 수
		System.out.println("totalRowCount : " + totalRowCount);

		// 페이지네이션 설정
		PageInfo pageSettings = new PageInfo(page, totalRowCount, 5);
		pageSettings.pageSetting(totalRowCount);

		int firstRow = pageSettings.getFirstRow();

		System.out.println("firstRow: " + firstRow);

		params.put("firstRow", String.valueOf(firstRow));
		params.put("listLimit", String.valueOf(listLimit));

		// 데이터 가져오기
		List<Board> boardList = service.selectBoardList(params);

		System.out.println("boardlist : " + boardList);

		// 데이터와 페이지 정보 모델에 추가하기
		model.addAttribute("login", login);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageSettings);
		model.addAttribute("count", totalRowCount);
		model.addAttribute("param", param);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);

		return "faculty/infoboard";
	}

	// 공지사항 상세 페이지
	@RequestMapping("/infodetail")
	public String infodetail(Model model, @RequestParam("bo_no") int no) {
		System.out.println("FacultyController-infodetail() 실행");

		String login = (String) session.getAttribute("login");
		System.out.println("login : " + login);

		Board board = service.findByNo(no);
		System.out.println(board);
		System.out.println("파일명 : " + board.getOriginalFilename());

		// 조회 수 증가
		int readCount = service.readCount(no);

		model.addAttribute("board", board);
		model.addAttribute("readCount", readCount);
		model.addAttribute("login", login);
		model.addAttribute("no", no);

		return "faculty/infodetail";
	}

	// 공지사항 작성
	@RequestMapping("/writeinfo")
	public String writeinfo() {
		return "faculty/writeinfo";
	}

	// 공지사항 작성 처리
	@RequestMapping("/writeinfoPro")
	public String writeinfoPro(Model model, @RequestParam Map<String, Object> param, @ModelAttribute Board board,
			@RequestParam("uploadFile") MultipartFile file) throws IOException {
		System.out.println("FacultyController-writeinfoPro() 실행");

		String loginname = (String) session.getAttribute("loginname");
		System.out.println(loginname);

		int loginNo = service.empSelect(loginname);
		System.out.println("loginNO : " + loginNo);

		String title = (String) param.get("title");
		String detail = (String) param.get("detail");

		System.out.println("title : " + title);
		System.out.println("detail : " + detail);

		if (title != null && detail != null) {

			String fileReadName = "";
			if (!file.isEmpty()) {
				// 파일명을 얻어서 출력
				fileReadName = file.getOriginalFilename();
				System.out.println("file : " + file);

				// 폼의 파일 필드에서 파일을 가져옵니다.
				String uploadDir = "C:/uploads";
				File uploadDirFile = new File(uploadDir);

				if (!uploadDirFile.exists()) {
					uploadDirFile.mkdirs(); // 디렉토리가 없으면 생성
				}

				File dest = new File(uploadDir, file.getOriginalFilename());
				file.transferTo(dest); // 파일 저장
			} else {
				fileReadName = "-";
			}

			// param의 값을 Board 객체에 설정
			board.setEmp_no(loginNo);
			board.setTitle(title);
			board.setContent(detail);
			board.setOriginalFilename(fileReadName);

			int res = service.insertWrite(board);

			if (res > 0) {
				session.setAttribute("msg", "정상적으로 업로드되었습니다.");
			} else {
				session.setAttribute("msg", "정상적으로 업로드되지 않았습니다.");
			}

		} else {
			// 빈칸일 경우 alert창 띄움
			model.addAttribute("msg", "내용을 입력해주세요.");
		}

		return "redirect:/infoboard"; // 리디렉션
	}

	@RequestMapping("/updateinfo")
	public String updateinfo(Model model, @RequestParam("bo_no") int no) {
		System.out.println("FacultyController-updateinfo() 실행");

		String login = (String) session.getAttribute("login");
		System.out.println("login : " + login);

		Board board = service.findByNo(no);

		model.addAttribute("login", login);
		model.addAttribute("board", board);

		return "faculty/updateinfo";
	}

	@RequestMapping("/updateinfoPro")
	public String updateinfoPro(Model model, @RequestParam("bo_no") int no, @RequestParam Map<String, Object> param,
			@ModelAttribute Board board, // Board DTO로 받아오기
			@ModelAttribute("uploadFile") MultipartFile uploadFile, RedirectAttributes redirectAttributes) {
		System.out.println("FacultyController-updateinfoPro() 실행");

		System.out.println("bo_no : " + no);

		// 세션에서 로그인 정보 가져오기
		String loginname = (String) session.getAttribute("loginname");
		if (loginname == null) {
			// 로그인하지 않은 경우 처리 - redirect 등 수행
			return "redirect:/login"; // 로그인 페이지로 리디렉션
		}

		System.out.println("로그인 이름: " + loginname);

		// 로그인한 사원 정보 가져오기
		int loginNo = service.empSelect(loginname);
		System.out.println("로그인 번호 : " + loginNo);

		// 파라미터에서 값을 가져오기
		String title = (String) param.get("title");
		String content = (String) param.get("content");

		System.out.println("제목 : " + title);
		System.out.println("파일 : " + uploadFile);
		System.out.println("내용 : " + content);

		String fileReadName = "";
		if (!uploadFile.isEmpty()) {
			try {
				// 파일명을 얻어서 출력
				fileReadName = uploadFile.getOriginalFilename();
				System.out.println("file : " + uploadFile);

				// 폼의 파일 필드에서 파일을 가져옵니다.
				String uploadDir = "C:/uploads";
				File uploadDirFile = new File(uploadDir);

				if (!uploadDirFile.exists()) {
					uploadDirFile.mkdirs(); // 디렉토리가 없으면 생성
				}

				File dest = new File(uploadDir, uploadFile.getOriginalFilename());
				uploadFile.transferTo(dest); // 파일 저장

				board.setOriginalFilename(fileReadName); // 파일명 설정
			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리 추가 (예: redirect 에러 메시지 추가)
				redirectAttributes.addFlashAttribute("msg", "파일 업로드 중 오류가 발생했습니다.");
				return "redirect:/infoboard"; // 오류 발생 시 리디렉션
			}
		} else {
			board.setOriginalFilename(""); // 파일이 선택되지 않았다면 적절한 처리
		}

		// Board 객체에 파라미터 값 설정
		board.setEmp_name(loginname);
		board.setEmp_no(loginNo);
		board.setBo_no(no); // bo_no 설정
		board.setTitle(title);
		board.setContent(content);

		// 업데이트 수행
		int res = service.updateByNoList(board, no);

		if (res > 0) {
			System.out.println("글이 수정되었습니다.");
			session.setAttribute("msg", "정상적으로 업로드되었습니다.");
		} else {
			System.out.println("글 수정을 실패하였습니다.");
			session.setAttribute("msg", "정상적으로 업로드되지 않았습니다.");
		}

		return "redirect:/infoboard"; // 리디렉션
	}

	@RequestMapping("/deletePro")
	public String deletePro(Model model, @RequestParam("bo_no") int no, HttpSession session) {
		System.out.println("FacultyController-deletePro() 실행");
		System.out.println("deletePro no : " + no);

		int res = service.deleteByNo(no);

		if (res > 0) {
			session.setAttribute("msg", "정상적으로 삭제되었습니다.");
		} else {
			session.setAttribute("msg", "정상적으로 삭제되지 않았습니다.");
		}

		return "redirect:/infoboard";
	}

	// 성적
	@RequestMapping("/objectionlist")
	public String objectionList(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			String department, String subject, String grade) {
		System.out.println("facultycontroller-objectionList() 실행");

		String login = (String) session.getAttribute("login");
		System.out.println("login : " + login);

		Map<String, Object> params = new HashMap<>();
		params.put("department", department);
		params.put("subject", subject);
		params.put("grade", grade);

		int listLimit = 5; // 한 페이지에 보여질 게시글 수
		int totalRowCount = objservice.getListCount(params); // 전체 게시글의 수

		// 페이지네이션 설정
		PageInfo pageSettings = new PageInfo(page, totalRowCount, 5);
		pageSettings.pageSetting(totalRowCount);

		int firstRow = pageSettings.getFirstRow();

		params.put("firstRow", firstRow);
		params.put("listLimit", listLimit);

		// 데이터 가져오기
		List<Objection> objListEmp = objservice.objectionFilterData(params);
		System.out.println("objListEmp : " + objListEmp);

		// 데이터와 페이지 정보 모델에 추가하기
		model.addAttribute("objListEmp", objListEmp);
		model.addAttribute("department", department);
		model.addAttribute("subject", subject);
		model.addAttribute("grade", grade);
		model.addAttribute("pageInfo", pageSettings);
		model.addAttribute("count", totalRowCount);

		return "objection/objectionlist";
	}

	// 성적이의신청 데이터 목록 받아오기
	@PostMapping("/objectionSearch")
	@ResponseBody
	public List<Objection> objectionSearch(@RequestBody Map<String, Object> requestData) {
		System.out.println("facultycontroller-objectionSearch() 실행");

		String department = (String) requestData.get("department");
		String subject = (String) requestData.get("subject");
		String grade = (String) requestData.get("grade");
		int page = Integer.valueOf((String) requestData.get("page"));

		System.out.println("department : " + department);
		System.out.println("subject : " + subject);
		System.out.println("grade : " + grade);
		System.out.println("page : " + page);

		Map<String, Object> params = new HashMap<>();
		params.put("department", department);
		params.put("subject", subject);
		params.put("grade", grade);

		int listLimit = 5; // 한 페이지에 보여질 게시글 수
		int totalRowCount = objservice.getListCount(params); // 전체 게시글의 수

		// 페이지네이션 설정
		PageInfo pageSettings = new PageInfo(page, totalRowCount, 5);
		pageSettings.pageSetting(totalRowCount);

		int firstRow = pageSettings.getFirstRow();

		params.put("firstRow", firstRow);
		params.put("listLimit", listLimit);

		return objservice.objectionFilterData(params);
	}

	// 이의 신청 업데이트
	@RequestMapping("/objectionUpdate")
	public String objectionupdate(Model model, @RequestParam("sub_code") String sub_code,
			@RequestParam("sub_name") String sub_name, @RequestParam("stu_no") int stu_no) {
		System.out.println("facultycontroller-objectionupdate() 실행");

		String login = (String) session.getAttribute("login");
		System.out.println("login : " + login);

		List<Objection> objectlist = new ArrayList<>();

		objectlist = objservice.objectionUpSelect(sub_code, stu_no);

		model.addAttribute("sub_code", sub_code);
		model.addAttribute("sub_name", sub_name);
		model.addAttribute("stu_no", stu_no);
		model.addAttribute("objectlist", objectlist);

		return "objection/objectionUpdate";
	}

	// 업데이트 처리
	@RequestMapping("/objectionUpdatePro")
	public String objectionupdatePro(Model model, @RequestParam("sub_code") String sub_code,
			@RequestParam("sub_name") String sub_name, @RequestParam("stu_no") int stu_no,
			@RequestParam("grade_p") int grade_p, HttpSession session) {
		System.out.println("facultycontroller-objectionUpdatePro() 실행");

		String login = (String) session.getAttribute("login");
		System.out.println("login : " + login);
		System.out.println("grade_p : " + grade_p);
		System.out.println("sub_code : " + sub_code);
		System.out.println("sub_name : " + sub_name);
		System.out.println("stu_no : " + stu_no);

		int res = objservice.objUpdate(sub_code, stu_no, grade_p);
		System.out.println("objUpdate res : " + res);

		if (res > 0) {
			session.setAttribute("msg", "저장 되었습니다.");
		} else {
			session.setAttribute("msg", "정상적으로 저장되지 않았습니다.");
		}
		return "redirect:/objectionlist";
	}

	@RequestMapping("/scholarlist")
	public String scholarList(Model model, String scholarship_type, String department_type, String grade,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		System.out.println("facultycontroller안에scholarlist실행");

		// Map 생성
		Map<String, Object> params = new HashMap<>();
		params.put("scholarship_type", scholarship_type);
		params.put("DEPT_CODE", department_type);
		params.put("STU_GRADE", grade);

//	============= 페이지 네이션 ================ 희만

		int listLimit = 5; // 한 페이지에 보여질 게시글 수
		int totalRowCount = scholarservice.getListCount(params); // 전체 게시글의 수

		// 페이지네이션 설정
		PageInfo pageSettings = new PageInfo(page, totalRowCount, 5);
		pageSettings.pageSetting(totalRowCount);

		int firstRow = pageSettings.getFirstRow();

		params.put("firstRow", firstRow);
		params.put("listLimit", listLimit);

		// 데이터 가져오기
		List<ScholarList> scholarList = scholarservice.scholarlistSelect(params);

		// 데이터와 페이지 정보 모델에 추가하기
		model.addAttribute("scholarList", scholarList);
		model.addAttribute("department", department_type);
		model.addAttribute("scholarship_type", scholarship_type);
		model.addAttribute("grade", grade);
		model.addAttribute("pageInfo", pageSettings);
		model.addAttribute("count", totalRowCount);
//		model.addAttribute("param", param);
//		model.addAttribute("searchType", searchType);
//		model.addAttribute("searchValue", searchValue);

		System.out.println("장학금 리스트: " + scholarList);

		return "scholarship/scholarlist";
	}

	@PostMapping("/scholarlistInfo")
	@ResponseBody
	public Map<String, Object> scholarlistInfo(@RequestBody Map<String, String> requestBody) {
		Map<String, Object> response = new HashMap<>();
		try {
			String schStatus = requestBody.get("SCH_STATUS");
			int year = Integer.parseInt(requestBody.get("YEAR"));
			int smt = Integer.parseInt(requestBody.get("SMT"));
			int stuNo = Integer.parseInt(requestBody.get("STU_NO"));
			int schNo = Integer.parseInt(requestBody.get("SCH_NO"));
			String deptCode = requestBody.get("DEPT_CODE");

			// 장학금 승인/취소 처리 로직 추가
			boolean success = processScholarlistInfo(schStatus, year, smt, stuNo, schNo, deptCode);
			response.put("success", success);

		} catch (NumberFormatException e) {
			response.put("success", false);
			response.put("error", "잘못된 데이터 형식입니다.");
		} catch (Exception e) {
			response.put("success", false);
			response.put("error", "처리 중 오류가 발생했습니다.");
		}
		return response;
	}

	private boolean processScholarlistInfo(String schStatus, int year, int smt, int stuNo, int schNo, String deptCode) {
		// 장학금 승인/취소 처리 로직 (예: 데이터베이스 업데이트)
		System.out.println("확인" + schStatus + " " + year + " " + smt + " " + stuNo + " " + schNo + " " + deptCode);
		// 성공적으로 처리되었으면 true, 실패하면 false를 반환
		Scholar sch = new Scholar(stuNo, deptCode, schNo, year, smt, schStatus);
		boolean success = false;
		int result = scholarservice.scholarInsert(sch);
		if (result == 1) {
			stuservice.studentUpdate(stuNo);
			success = true;
		}
		return success;
	}

}

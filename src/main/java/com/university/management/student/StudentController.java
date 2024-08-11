package com.university.management.student;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.university.management.board.dto.Board;
import com.university.management.courseregistrationpage.dto.Courseregistrationpage;
import com.university.management.courses.dto.Courses;
import com.university.management.courses.dto.CoursesList;
import com.university.management.courses.service.CoursesService;
import com.university.management.lms.dto.Lms;
import com.university.management.lms.service.LmsService;

import com.university.management.objection.dto.Objection;
import com.university.management.objection.service.ObjectionService;
import com.university.management.scholar.dto.StuScholar;
import com.university.management.scholar.service.ScholarService;
import com.university.management.student.dto.Student;
import com.university.management.student.service.StudentService;
import com.university.management.tuition.dto.Tuition;

@Controller
public class StudentController {
	@Autowired
	private HttpSession session;

	@Autowired
	private StudentService stuservice;

	@Autowired
	private CoursesService courservice;

	@Autowired
	private ScholarService schservice;
	
	@Autowired
	private LmsService lmsservice;
	
	@Autowired
	private ObjectionService objservice;


	@RequestMapping("/askpresident")
	public String askpresident() {
		return "student/askpresident";
	}

	@RequestMapping("/studentstatus")
	public String studentstatus(Model model) {
		Tuition tuition = new Tuition();
		System.out.println("studentstatus실행");

		// 세션에서 loginname을 가져옴
		Integer loginNo = (Integer) session.getAttribute("studentno");
		System.out.println(loginNo);
		// 세션에 loginname이 저장되어 있는지 확인
		if (loginNo != null) {
			System.out.println("실행");
			// 모델에 loginName을 추가
			List<Student> studentInfo = stuservice.stuInfoSelect(loginNo);

			if (studentInfo.get(0).getSCH_DISCOUNT() == null) {
				studentInfo.get(0).setSCH_DISCOUNT("해당없음");
			}
			if (studentInfo.get(0).getSCH_NAME() == null) {
				studentInfo.get(0).setSCH_DISCOUNT("해당없음");
			}
			if (studentInfo.get(0).getR_STATUS() == null) {
				studentInfo.get(0).setR_STATUS("재학");
			}

			// 주민등록번호에서 앞자리 부분 추출
			String str = studentInfo.get(0).getSTU_JUMIN();
			String birthPrefix = str.substring(0, 6);

			System.out.println(birthPrefix);
			// 생년월일 형식: YYMMDD
			// 연도 처리 없이 그대로 사용
			String year = birthPrefix.substring(0, 2);
			String month = birthPrefix.substring(2, 4);
			String day = birthPrefix.substring(4, 6);

			// 연도 앞에 '20'을 붙여 2000년대 생년월일로 가정
			// 연도가 00~21로 시작하면 2000년대, 그 외는 1900년대
			int yearInt = Integer.parseInt(year);
			if (yearInt <= 21) {
				year = "20" + year;
			} else {
				year = "19" + year;
			}
			studentInfo.get(0).setSTU_JUMIN(year + "-" + month + "-" + day);

			System.out.println(studentInfo);
			model.addAttribute("studentInfo", studentInfo);
			model.addAttribute("status", studentInfo.get(0).getR_STATUS());
		} else {
			return "login/login";
		}

		CoursesList cour = new CoursesList();

		// 현재 날짜를 가져옵니다.
		LocalDate today = LocalDate.now();
		// 현재 월을 가져옵니다.
		int month = today.getMonthValue();

		// 월에 따라서 값을 결정합니다
		int smt = 0;
		if (month >= 1 && month <= 7) {
			smt = 1;
		} else if (month >= 8 && month <= 12) {
			smt = 2;
		}
		int year = today.getYear();

		cour.setSTU_NO(loginNo);
		cour.setSMT(smt);
		cour.setYEAR(year);

		List<CoursesList> coursesList = courservice.coursesList(cour);
		System.out.println("myCoursesPage실행:" + coursesList);
		model.addAttribute("courlist", coursesList);

		List<Tuition> tuitionlist = stuservice.tuitionSelect(loginNo);
		model.addAttribute("tuitionlist", tuitionlist);

		Map<String, Object> params = new HashMap<>();
		params.put("loginNo", loginNo);
		params.put("year", year);

        params.put("smt", smt);
		List<Courses> coursesbeforlist= courservice.coursesbeforlist(params);
		model.addAttribute("coursesbeforlist", coursesbeforlist);
		
		List<StuScholar>StuScholarlist=schservice.stuScholarList(loginNo);

		model.addAttribute("StuScholarlist", StuScholarlist);
		System.out.println("장학금 목록" + StuScholarlist);
		return "student/studentstatus";
	}

	@RequestMapping("/idcard")
	public String idcard(Model model) {

		int stuno = (int) session.getAttribute("studentno");
		String name = (String) session.getAttribute("loginname");
		String deptname = (String) session.getAttribute("studeptname");

		model.addAttribute("stuno", stuno);
		model.addAttribute("name", name);
		model.addAttribute("deptname", deptname);

		return "student/idcard";
	}

	@RequestMapping("/popup")
	public String popup() {
		return "student/popup";
	}

	@RequestMapping("/studentinformation")
	public String studentinformation(Model model) {

		int id = (int) session.getAttribute("studentno");
		String name = (String) session.getAttribute("loginname");
		String deptname = (String) session.getAttribute("studeptname");
		String email = (String) session.getAttribute("email");
		String phone = (String) session.getAttribute("phone");
		String password = (String) session.getAttribute("loginPassword");
		String address = (String) session.getAttribute("address");

		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("deptname", deptname);
		model.addAttribute("email", email);
		model.addAttribute("phone", phone);
		model.addAttribute("password", password);
		model.addAttribute("address", address);
		return "student/studentinformation";
	}

	@RequestMapping("/studnetInformationchg")
	public String studnetInformationchg(Model model, String address, String email, String phone) {

		System.out.println("studnetInformationchg실행" + address + "" + email + "" + phone);
		int STU_NO = (int) session.getAttribute("studentno");
		Map<String, Object> params = new HashMap<>();
		params.put("STU_NO", STU_NO);
		params.put("STU_ADDRESS", address);
		params.put("STU_EMAIL", email);
		params.put("STU_PHONE", phone);
		System.out.println("STUparms:" + params);
		stuservice.studentInfochange(params);
		return "home";
	}

	@RequestMapping("/myCoursesList")
	public String MyCoursesList(Model model,@RequestParam("sub_code") String sub_code) {
		System.out.println("myCoursesList subcode:"+sub_code);
		List<Lms> lmslist= new ArrayList<Lms>();
		lmslist= lmsservice.lmsSelect(sub_code);
		System.out.println("제발해주세요..."+lmslist);
		String coment=lmslist.get(0).getCO_CONTENT();
		String sub_name = lmslist.get(0).getSUB_NAME();
		model.addAttribute("lmslist",lmslist);
		model.addAttribute("coment", coment);
		model.addAttribute("sub_name",sub_name);
		

		return "courses/myCoursesList";
	}

	@RequestMapping("/myCoursesPage")
	public String MyCoursesPage(Model model) {
		int loginNo = (int) session.getAttribute("studentno");

		CoursesList cour = new CoursesList();

		// 현재 날짜를 가져옵니다.
		LocalDate today = LocalDate.now();
		// 현재 월을 가져옵니다.
		int month = today.getMonthValue();

		// 월에 따라서 값을 결정합니다
		int smt = 0;
		if (month >= 1 && month <= 7) {
			smt = 1;
		} else if (month >= 8 && month <= 12) {
			smt = 2;
		}
		int year = today.getYear();

		cour.setSTU_NO(loginNo);
		cour.setSMT(smt);
		cour.setYEAR(year);
		
	  List<CoursesList> coursesList= courservice.coursesList(cour);
		System.out.println("myCoursesPage실행:"+coursesList );
		int count = coursesList.size();
		model.addAttribute("courlist", coursesList);
		model.addAttribute("count",count);
		
		return "courses/myCoursesPage";
	}

	// 성적
	@RequestMapping("/objection")
	public String objection(Model model) {
		System.out.println("StudentController - objection() 실행");
		
		int studentno = (int) session.getAttribute("studentno");
		System.out.println("login : " + studentno);
		
		List<Objection> resultList = objservice.selectObjList(studentno);
		
		model.addAttribute("studentno", studentno);
		model.addAttribute("resultList", resultList);
		
		
		return "objection/objection";
	}

	@RequestMapping("/objectionWrite")
	public String objectionWrite(Model model, @RequestParam("sub_code") String sub_code , @ModelAttribute Objection odj) {
		System.out.println("StudentController-objectionWrite() 실행");
		
		Integer studentno = (Integer) session.getAttribute("studentno");
		System.out.println("studentno : " + studentno);

		System.out.println("sub_code : " + sub_code);
		
		List<Objection> odjection = objservice.selectBySub(sub_code);
		
		model.addAttribute("odjection",odjection);
		
		return "objection/objectionWrite";
	}
	
	@RequestMapping("/objectionWritePro")
	public String objectionWritePro(Model model, @RequestParam("sub_code") String subCode, @ModelAttribute Objection odj) {
		System.out.println("StudentController-objectionWritePro() 실행");
		
		
		
		
		return "objection/objectionWrite";
	}

	@RequestMapping("/courseregistrationpage")
	public String courseregistrationpage(Model model) {
		Integer loginNo = (Integer) session.getAttribute("studentno");
		List<Student> studentInfo = stuservice.stuInfoSelect(loginNo);
		Courseregistrationpage cour = new Courseregistrationpage();
		// 현재 날짜를 가져옵니다.
		LocalDate today = LocalDate.now();

		// 현재 월을 가져옵니다.
		int month = today.getMonthValue();

		// 월에 따라서 값을 결정합니다
		int smt = 0;
		if (month >= 1 && month <= 7) {
			smt = 1;
		} else if (month >= 8 && month <= 12) {
			smt = 2;
		}
		int year = today.getYear();
		cour.setSMT(smt);
		cour.setYEAR(year);
		cour.setDEPT_NAME(studentInfo.get(0).getDEPT_NAME());
		String stuGrade = (String) session.getAttribute("stugrade");
		System.out.println(stuGrade);
		if (stuGrade != null) {
			cour.setSTU_GRADE(stuGrade.replace("학년", "").trim());
		}

		ArrayList<Courses> coursesList = courservice.coursesSelect(cour);
		System.out.println("courseList:" + coursesList);
		int total = 0;
		for (Courses course : coursesList) {
			if ("y".equals(course.getSUB_STATUS())) {
				total += course.getSUB_POINT();
			}
		}
		int courCount = 0;
		courCount = coursesList.size();
		session.setAttribute("courCount", courCount);
		session.setAttribute("courlist", coursesList);
		session.setAttribute("deptname", cour.getDEPT_NAME());
		session.setAttribute("total", total);
		return "student/courseregistrationpage";
	}

	@RequestMapping("/courInfo")
	public String courInfo(String SUB_STATUS, String sub_code, String SUB_NAME, String PROF_NAME, String DEPT_NAME,
			String CO_CONTENT, int SMT, int YEAR) {

		String strsub_code = sub_code.substring(0, sub_code.length() - 4);
		String strsubstatus = SUB_STATUS.substring(0, SUB_STATUS.length() - 4);
		System.out.println(SUB_STATUS);
		if (strsubstatus.equals("y")) {
			System.out.println("수강리스트 취소 실행 " + SUB_NAME);
			String strsubname = SUB_NAME.substring(0, SUB_NAME.length() - 4);
			System.out.println("strsubname:" + strsubname);
			courservice.courdelete(strsubname);
			courservice.classcapup(strsubname);

		}

		System.out.println("courInfo실행" + strsub_code);
		courservice.coustatusupdate(strsub_code);
		Courses course = new Courses();
		course.setSTU_NO((int) session.getAttribute("studentno"));
		course.setSUB_NAME(SUB_NAME.substring(0, SUB_NAME.length() - 4));
		course.setPROF_NAME(PROF_NAME.substring(0, PROF_NAME.length() - 4));
		course.setDEPT_NAME(DEPT_NAME.substring(0, DEPT_NAME.length() - 4));
		course.setCO_CONTENT(CO_CONTENT.substring(0, CO_CONTENT.length() - 4));
		course.setSUB_CODE(strsub_code);
		course.setSMT(SMT);
		course.setYEAR(YEAR);

		System.out.println("확인용중요"+course);
		if(strsubstatus.equals("n")) {
		String strsubname=SUB_NAME.substring(0, SUB_NAME.length() - 4);
		System.out.println("strsubname:"+strsubname);
		System.out.println("제발"+course.getSUB_CODE());
		courservice.courInsert(course);
		courservice.classcapdown(strsubname);

		}

		courseregistrationpage(null);

		return "student/courseregistrationpage";
	}

}

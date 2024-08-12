package com.university.management.login;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.mysql.cj.Session;
import com.university.management.employee.dto.Employee;
import com.university.management.login.service.LoginService;
import com.university.management.student.dto.Student;

@Controller
public class LoginController {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private LoginService loginService;

	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/loginpro")
	public String loginpro(Model model, String loginid, String loginPassword, String login, HttpSession session) {
		if (loginid == null || loginid.isEmpty() || loginPassword == null || loginPassword.isEmpty()) {
			model.addAttribute("msg", "아이디와 비밀번호를 입력해 주세요.");
			return "login/login";
		}

		// Map 생성
		Map<String, String> params = new HashMap<>();
		params.put("loginid", loginid);
		params.put("loginPassword", loginPassword);

		if (login.equals("Employee")) {
			Employee employee = loginService.emplogin(params);
			if (employee != null && employee.getEMP_PASSWORD().equals(loginPassword)) {
				session.setAttribute("loginname", employee.getEMP_NAME());
				model.addAttribute("msg", loginid + "관리자님 로그인 되었습니다.");
				
				session.setAttribute("login",login);
				return "home";
			} else {
				model.addAttribute("msg", "아이디와 비밀번호를 제대로 입력하세요.");
				return "login/login";
			}
		} else if (login.equals("Student")) {
			Student student = loginService.studentLogin(params);
			if (student != null && student.getSTU_PASSWORD().equals(loginPassword)) {
				session.setAttribute("loginname", student.getSTU_NAME());
				session.setAttribute("studentno", student.getSTU_NO());
				session.setAttribute("stugrade", student.getSTU_GRADE());
				session.setAttribute("studeptname", student.getDEPT_NAME());
				session.setAttribute("email", student.getSTU_EMAIL());
				session.setAttribute("phone", student.getSTU_PHONE());
				session.setAttribute("loginPassword", student.getSTU_PASSWORD());
				session.setAttribute("address", student.getSTU_ADDRESS());
				session.setAttribute("login",login);
				if(student.getSTU_PASSWORD().equals("0")) {
					model.addAttribute("msg", student.getSTU_NAME() + "학생 로그인 되었습니다.초기비밀번호를 변경해주세요.");
				}else {
					model.addAttribute("msg", student.getSTU_NAME() + "학생 로그인 되었습니다.");
				}
				
				return "home";
			} else {
				model.addAttribute("msg", "아이디와 비밀번호를 제대로 입력하세요.");
				return "login/login";
			}
		}

		return "home";
	}
	
	
	 @RequestMapping("/logout")
	    public String logout(HttpSession session, Model model) {
	        // 세션 무효화
	        session.invalidate();
	        
	        // 로그아웃 메시지
	        model.addAttribute("msg", "로그아웃 되었습니다.");
	        
	        // 로그인 페이지로 리디렉션
	        return "home";
	    }
	 
	

	 @RequestMapping("/findpassword")
	    public String findpassword() {
System.out.println("실행");
	        return "login/findpassword";
	    }
	 

	@RequestMapping("/findpasswordinfo")
	public String findPasswords(Model model, String loginid, String login ,String email,HttpSession session) {
		System.out.println(loginid+" "+ email);
		if (loginid == null || loginid.isEmpty()  || email == null || email.isEmpty()) {
			model.addAttribute("msg", "아이디와 이메일을 입력해 주세요.");
			return "login/findpassword";
		}
		
		
		// Map 생성
		Map<String, String> params = new HashMap<>();
		params.put("loginid", loginid);
		params.put("loginemail", email);

		if (login.equals("Employee")) {
				model.addAttribute("msg", "직원은 보류~~~~");
				return "login/login";
			}
			else if (login.equals("Student")) {
			Student student = loginService.studentpwfind(params);
			if (student != null  && student.getSTU_EMAIL().equals(email)) {
				
				
				
				
				//api이메일
				System.out.println("email:" + email);
				// 난수의 범위 111111~999999(6자리의 난수 지정)
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				// 이메일 보낼 양식 설정
				// 발신자 이메일 주소
				String setFrom = "ghdgns1226@naver.com";
				// 수진자 이메일 주소
				String toMail = email;
				// 이메일 제목
				String title = "비밀번호 찾기  인증 메일 입니다.";
				String content = "인증코드는" + checkNum + "입니다." + "<br>" + "해당 인증코드를 인증코드확인란에 작성하세요!";

				try {
					// 자바 메일 API 클래스 중에 하나
					// 복합형 이메일 메시지(텍스트,html
					// 첨부파일 등)를 생성하는데 사용된다.
					MimeMessage message = mailSender.createMimeMessage();

					// 위에 MimeMessage클래스에
					// 설정을 하는 클래스
					// message 첫번째 매개변수 위에 매일 생성
					// true 이메일 메시지를 html,텍스트,첨부파일등
					// 함께 포함해서 전송
					// false 무조건 텍스트만 간다.
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);// 발신자 설정
					helper.setTo(toMail); // 수신자 설정
					helper.setSubject(title);// 제목 설정

					// 내용설정(true는 html포맷을 사용한다는 뜻)
					helper.setText(content, true);

					// 이메일 전송
					mailSender.send(message);

				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				model.addAttribute("msg", "입력하신 이메일로 인가 코드를 전송했습니다.");
				session.setAttribute("studentpw", student.getSTU_PASSWORD());
				session.setAttribute("email",email);
				session.setAttribute("checkNum",checkNum);
				return "login/logincode";
			} else {
				model.addAttribute("msg", "아이디와 비밀번호와 이메일을 제대로 입력하세요.");
				return "login/findpassword";
			}
		}
		return "login/findpassword";
	}
	
	
	
	
	@RequestMapping("/logincodecheck")
	public String logincodecheck(Model model ,String pw, String checkNumcode,String pwcode, String email) {
		
		System.out.println("checkNumcode:"+checkNumcode +"  "+"pwcode"+pwcode);
		if(!checkNumcode.equals(pwcode)) {
			model.addAttribute("msg","인가 코드가 맞지 않습니다.");
			return "login/logincode";
		}
		else {

			//api이메일
			System.out.println("email:" + email);
			// 난수의 범위 111111~999999(6자리의 난수 지정)
			Random random = new Random();
		
			// 이메일 보낼 양식 설정
			// 발신자 이메일 주소
			String setFrom = "ghdgns1226@naver.com";
			// 수진자 이메일 주소
			String toMail = email;
			// 이메일 제목
			String title = "비밀번호 알림 메일 입니다.";
			String content = "비밀번호는" + pw + "입니다." ;

			try {
				// 자바 메일 API 클래스 중에 하나
				// 복합형 이메일 메시지(텍스트,html
				// 첨부파일 등)를 생성하는데 사용된다.
				MimeMessage message = mailSender.createMimeMessage();

				// 위에 MimeMessage클래스에
				// 설정을 하는 클래스
				// message 첫번째 매개변수 위에 매일 생성
				// true 이메일 메시지를 html,텍스트,첨부파일등
				// 함께 포함해서 전송
				// false 무조건 텍스트만 간다.
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);// 발신자 설정
				helper.setTo(toMail); // 수신자 설정
				helper.setSubject(title);// 제목 설정

				// 내용설정(true는 html포맷을 사용한다는 뜻)
				helper.setText(content, true);

				// 이메일 전송
				mailSender.send(message);

			} catch (Exception e) {
				// TODO: handle exception
			}
			model.addAttribute("msg","비밀번호를 귀하의 이메일로 보냈습니다.");
			return "login/login";
		}
		
	}
	

	@RequestMapping("/passwordchange")
	public String passwordChange(Model model ) {
		
	int id=(int)session.getAttribute("studentno");
	String name=(String)session.getAttribute("loginname");
	String deptname=(String)session.getAttribute("studeptname");
	String email=(String)session.getAttribute("email");
	String phone=(String)session.getAttribute("phone");
	String password=(String)session.getAttribute("loginPassword");

		model.addAttribute("id",id);
		model.addAttribute("name",name);
		model.addAttribute("password",password);
		
		return "login/passwordchange";
	}
	
	@RequestMapping("/passwordchangeInfo")
	public String passwordchangeInfo(Model model, String STU_PASSWORD) {
		
		System.out.println("passwordchangeInfo실행"+STU_PASSWORD);
		int STU_NO=(int)session.getAttribute("studentno");
		  Map<String, Object> params = new HashMap<>();  
	        params.put("STU_PASSWORD", STU_PASSWORD);
	        params.put("STU_NO", STU_NO);
		System.out.println("params:"+params);
	loginService.pwschange(params);
	logout(session, model);

		return "home";
	}
	
	
}
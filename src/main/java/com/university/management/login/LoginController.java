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
			model.addAttribute("msg", "���̵�� ��й�ȣ�� �Է��� �ּ���.");
			return "login/login";
		}

		// Map ����
		Map<String, String> params = new HashMap<>();
		params.put("loginid", loginid);
		params.put("loginPassword", loginPassword);

		if (login.equals("Employee")) {
			Employee employee = loginService.emplogin(params);
			if (employee != null && employee.getEMP_PASSWORD().equals(loginPassword)) {
				session.setAttribute("loginname", employee.getEMP_NAME());
				session.setAttribute("empNO", employee.getEMP_NO());
				model.addAttribute("msg", employee.getEMP_NAME() + "�����ڴ� �α��� �Ǿ����ϴ�.");

				session.setAttribute("login", login);
				return "home";
			} else {
				model.addAttribute("msg", "���̵�� ��й�ȣ�� ����� �Է��ϼ���.");
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
				session.setAttribute("login", login);
				if (student.getSTU_PASSWORD().equals("0")) {
					model.addAttribute("msg", student.getSTU_NAME() + "�� ȯ���մϴ�. �ʱ��й�ȣ�� �������ּ���.");
				} else {
					model.addAttribute("msg", student.getSTU_NAME() + "�� ȯ���մϴ�.");
				}

				return "home";
			} else {
				model.addAttribute("msg", "���̵�� ��й�ȣ�� ����� �Է��ϼ���.");
				return "login/login";
			}
		}

		return "home";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		// ���� ��ȿȭ
		session.invalidate();

		// �α׾ƿ� �޽���
		model.addAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�.");

		// �α��� �������� ���𷺼�
		return "home";
	}

	@RequestMapping("/findpassword")
	public String findpassword() {
		System.out.println("����");
		return "login/findpassword";
	}

	@RequestMapping("/findpasswordinfo")
	public String findPasswords(Model model, String loginid, String login, String email, HttpSession session) {
		System.out.println(loginid + " " + email + "login" + login);
		if (loginid == null || loginid.isEmpty() || email == null || email.isEmpty()) {
			model.addAttribute("msg", "���̵�� �̸����� �Է��� �ּ���.");
			return "login/findpassword";
		}

		// Map ����
		Map<String, String> params = new HashMap<>();
		params.put("loginid", loginid);
		params.put("loginemail", email);

		if (login.equals("Employee")) {

			Employee employee = loginService.employeepwfind(params);

			if (employee != null && employee.getEMP_EMAIL().equals(email)) {

				// api�̸���
				System.out.println("email:" + email);
				// ������ ���� 111111~999999(6�ڸ��� ���� ����)
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				// �̸��� ���� ��� ����
				// �߽��� �̸��� �ּ�
				String setFrom = "ghdgns1226@naver.com";
				// ������ �̸��� �ּ�
				String toMail = email;
				// �̸��� ����
				String title = "��й�ȣ ã��  ���� ���� �Դϴ�.";
				String content = "�����ڵ��" + checkNum + "�Դϴ�." + "<br>" + "�ش� �����ڵ带 �����ڵ�Ȯ�ζ��� �ۼ��ϼ���!";

				try {
					// �ڹ� ���� API Ŭ���� �߿� �ϳ�
					// ������ �̸��� �޽���(�ؽ�Ʈ,html
					// ÷������ ��)�� �����ϴµ� ���ȴ�.
					MimeMessage message = mailSender.createMimeMessage();

					// ���� MimeMessageŬ������
					// ������ �ϴ� Ŭ����
					// message ù��° �Ű����� ���� ���� ����
					// true �̸��� �޽����� html,�ؽ�Ʈ,÷�����ϵ�
					// �Բ� �����ؼ� ����
					// false ������ �ؽ�Ʈ�� ����.
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);// �߽��� ����
					helper.setTo(toMail); // ������ ����
					helper.setSubject(title);// ���� ����

					// ���뼳��(true�� html������ ����Ѵٴ� ��)
					helper.setText(content, true);

					// �̸��� ����
					mailSender.send(message);

				} catch (Exception e) {
					// TODO: handle exception
				}

				model.addAttribute("msg", "�Է��Ͻ� �̸��Ϸ� �ΰ� �ڵ带 �����߽��ϴ�.");
				session.setAttribute("findpw", employee.getEMP_PASSWORD());
				session.setAttribute("email", email);
				session.setAttribute("checkNum", checkNum);
				return "login/logincode";
			} else {
				model.addAttribute("msg", "���̵�� ��й�ȣ�� �̸����� ����� �Է��ϼ���.");
				return "login/findpassword";
			}
		} else if (login.equals("Student")) {
			Student student = loginService.studentpwfind(params);

			if (student != null && student.getSTU_EMAIL().equals(email)) {

				// api�̸���
				System.out.println("email:" + email);
				// ������ ���� 111111~999999(6�ڸ��� ���� ����)
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				// �̸��� ���� ��� ����
				// �߽��� �̸��� �ּ�
				String setFrom = "ghdgns1226@naver.com";
				// ������ �̸��� �ּ�
				String toMail = email;
				// �̸��� ����
				String title = "��й�ȣ ã��  ���� ���� �Դϴ�.";
				String content = "�����ڵ��" + checkNum + "�Դϴ�." + "<br>" + "�ش� �����ڵ带 �����ڵ�Ȯ�ζ��� �ۼ��ϼ���!";

				try {
					// �ڹ� ���� API Ŭ���� �߿� �ϳ�
					// ������ �̸��� �޽���(�ؽ�Ʈ,html
					// ÷������ ��)�� �����ϴµ� ���ȴ�.
					MimeMessage message = mailSender.createMimeMessage();

					// ���� MimeMessageŬ������
					// ������ �ϴ� Ŭ����
					// message ù��° �Ű����� ���� ���� ����
					// true �̸��� �޽����� html,�ؽ�Ʈ,÷�����ϵ�
					// �Բ� �����ؼ� ����
					// false ������ �ؽ�Ʈ�� ����.
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);// �߽��� ����
					helper.setTo(toMail); // ������ ����
					helper.setSubject(title);// ���� ����

					// ���뼳��(true�� html������ ����Ѵٴ� ��)
					helper.setText(content, true);

					// �̸��� ����
					mailSender.send(message);

				} catch (Exception e) {
					// TODO: handle exception
				}

				model.addAttribute("msg", "�Է��Ͻ� �̸��Ϸ� �ΰ� �ڵ带 �����߽��ϴ�.");
				session.setAttribute("findpw", student.getSTU_PASSWORD());
				session.setAttribute("email", email);
				session.setAttribute("checkNum", checkNum);
				return "login/logincode";
			} else {
				model.addAttribute("msg", "���̵�� ��й�ȣ�� �̸����� ����� �Է��ϼ���.");
				return "login/findpassword";
			}
		}
		return "login/findpassword";
	}

	@RequestMapping("/logincodecheck")
	public String logincodecheck(Model model, String pw, String checkNumcode, String pwcode, String email) {

		System.out.println("checkNumcode:" + checkNumcode + "  " + "pwcode" + pwcode);
		if (!checkNumcode.equals(pwcode)) {
			model.addAttribute("msg", "�ΰ� �ڵ尡 ���� �ʽ��ϴ�.");
			return "login/logincode";
		} else {

			// api�̸���
			System.out.println("email:" + email);
			// ������ ���� 111111~999999(6�ڸ��� ���� ����)
			Random random = new Random();

			// �̸��� ���� ��� ����
			// �߽��� �̸��� �ּ�
			String setFrom = "ghdgns1226@naver.com";
			// ������ �̸��� �ּ�
			String toMail = email;
			// �̸��� ����
			String title = "��й�ȣ �˸� ���� �Դϴ�.";
			String content = "��й�ȣ��" + pw + "�Դϴ�.";

			try {
				// �ڹ� ���� API Ŭ���� �߿� �ϳ�
				// ������ �̸��� �޽���(�ؽ�Ʈ,html
				// ÷������ ��)�� �����ϴµ� ���ȴ�.
				MimeMessage message = mailSender.createMimeMessage();

				// ���� MimeMessageŬ������
				// ������ �ϴ� Ŭ����
				// message ù��° �Ű����� ���� ���� ����
				// true �̸��� �޽����� html,�ؽ�Ʈ,÷�����ϵ�
				// �Բ� �����ؼ� ����
				// false ������ �ؽ�Ʈ�� ����.
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);// �߽��� ����
				helper.setTo(toMail); // ������ ����
				helper.setSubject(title);// ���� ����

				// ���뼳��(true�� html������ ����Ѵٴ� ��)
				helper.setText(content, true);

				// �̸��� ����
				mailSender.send(message);

			} catch (Exception e) {
				// TODO: handle exception
			}
			model.addAttribute("msg", "��й�ȣ�� ������ �̸��Ϸ� ���½��ϴ�.");
			return "login/login";
		}

	}

	@RequestMapping("/passwordchange")
	public String passwordChange(Model model) {

		int id = (int) session.getAttribute("studentno");
		String name = (String) session.getAttribute("loginname");
		String deptname = (String) session.getAttribute("studeptname");
		String email = (String) session.getAttribute("email");
		String phone = (String) session.getAttribute("phone");
		String password = (String) session.getAttribute("loginPassword");

		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("password", password);

		return "login/passwordchange";
	}

	@RequestMapping("/passwordchangeInfo")
	public String passwordchangeInfo(Model model, String STU_PASSWORD) {

		System.out.println("passwordchangeInfo����" + STU_PASSWORD);
		int STU_NO = (int) session.getAttribute("studentno");
		Map<String, Object> params = new HashMap<>();
		params.put("STU_PASSWORD", STU_PASSWORD);
		params.put("STU_NO", STU_NO);
		System.out.println("params:" + params);
		loginService.pwschange(params);
		logout(session, model);

		return "home";
	}

}
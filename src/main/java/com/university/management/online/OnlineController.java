package com.university.management.online;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.university.management.lms.dto.Lms;
import com.university.management.lms.service.LmsService;
import com.university.management.student.StudentController;

@Controller
public class OnlineController {

	@Autowired
	LmsService lmsService;

    // 범위의 시작일과 종료일을 설정합니다
    LocalDate startDate = LocalDate.of(2024, 8, 1);
    LocalDate endDate = LocalDate.of(2024, 8, 7);
	
	
	@RequestMapping("/online")
	public String online(Model modle, @RequestParam("lms_no") String lms_no) {

		Lms lms = lmsService.lmsSelectNO(lms_no);

		System.out.println("lms 주차별" + lms);
		modle.addAttribute("lms", lms);

		return "student/onlinevideo";
	}

	@RequestMapping("/onlinestatus")
	public ResponseEntity<String> onlinestatus(@RequestParam("y") int y, @RequestParam("lms_no") int lms_no,@RequestParam("lms_date") int lms_date) {

		 // 현재 날짜를 가져옵니다
        LocalDate currentDate = LocalDate.now();

     
        
        startDate = LocalDate.of(2024, 8, (7*lms_date)-6);
        endDate = LocalDate.of(2024, 8, 7*lms_date);
  
        
        // 현재 날짜가 범위에 포함되는지 확인합니다
        if (currentDate.isEqual(startDate) || currentDate.isEqual(endDate) ||
            (currentDate.isAfter(startDate) && currentDate.isBefore(endDate))) {
            System.out.println("현재 날짜는 범위에 포함됩니다.");
            
            
        } else {
        	y=0;
            System.out.println("현재 날짜는 범위에 포함되지 않습니다.");
        }


		if (y == 1) {
			System.out.println("온라인 강의 실험중");
			System.out.println(lms_no);
			lmsService.lmsstatusUpdate(lms_no);

			return ResponseEntity.ok("success");
		} else {
			return ResponseEntity.badRequest().body("잘못된 요청입니다.");
		}
	}

}
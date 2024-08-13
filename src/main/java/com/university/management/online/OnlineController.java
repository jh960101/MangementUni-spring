package com.university.management.online;

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
	
    @RequestMapping("/online")
    public String online(Model modle, @RequestParam("lms_no") String lms_no ){
            
    	Lms lms= lmsService.lmsSelectNO(lms_no);
    	
    	System.out.println("lms 주차별"+lms);
    	modle.addAttribute("lms",lms);
    	
        return "student/onlinevideo";
    }
    
    
    @RequestMapping("/onlinestatus")
    public ResponseEntity<String> onlinestatus(@RequestParam("y") int y,@RequestParam("lms_no") int lms_no) {
        // 처리 후 응답 반환
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

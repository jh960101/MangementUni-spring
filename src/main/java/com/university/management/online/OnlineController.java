package com.university.management.online;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.university.management.lms.dto.Lms;
import com.university.management.lms.service.LmsService;

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
}

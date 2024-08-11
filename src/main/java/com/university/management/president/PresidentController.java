package com.university.management.president;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/views/president")
public class PresidentController {

	@GetMapping("/presidentplslist")
	public String presidentplslist() {
		return "president/presidentplslist"; 
	}
	
    @GetMapping("/presidentplsdetail")
    public String showDetailPage() {
        return "president/presidentplsdetail"; 
    }
    
    @GetMapping("/etdetailview")
    public String showEtDetailView() {
        return "president/etdetailview"; 
    }

}


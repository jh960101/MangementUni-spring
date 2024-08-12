package com.university.management.president;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class PresidentController {

	@RequestMapping("/presidentplslist")
    public String showPresidentPlsList() {
        return "/president/presidentplslist";
    }

    @RequestMapping("/presidentplsdetail")
    public String showDetailPage() {
        return "/president/presidentplsdetail"; 
    }

}

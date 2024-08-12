package com.university.management.everytime;

import com.university.management.board.dto.Board;
import com.university.management.everytime.service.EverytimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EverytimeController {

    @Autowired
    private EverytimeService service;

    @RequestMapping("/etmainpage")
    public String etmainpage(Model model) {

        List<Board> list = service.getAllEtaList();

        model.addAttribute("list", list);

        return "everytime/etmainpage";
    }

    @RequestMapping("/etaupdate")
    public String etamend() {
        return "everytime/evereytimeupdate";
    }

    @RequestMapping("/etdetailview")
    public String etdetailview(Model model, @RequestParam("no") int bo_no) {

        Board etaboard = service.getEtaBoardByNo(bo_no);

        model.addAttribute("board", etaboard);

        return "everytime/etdetailview";
    }

    @RequestMapping("/everytimehot")
    public String ethot() {
        return "everytime/everytimehot";
    }

    @RequestMapping("/etmypage")
    public String etmypage() {
        return "everytime/etmypage";
    }

    @RequestMapping("/etnew")
    public String etnew() {
        return "everytime/etnew";
    }

}
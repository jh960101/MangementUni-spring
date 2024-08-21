package com.university.management.reply;

import com.university.management.reply.dto.Reply;
import com.university.management.reply.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @PostMapping("/insert")
    @ResponseBody
    public String insertReply(@ModelAttribute Reply replyVO) {
        replyService.insertReply(replyVO);
        return "success";
    }

    @PostMapping("/update")
    @ResponseBody
    public String updateReply(@ModelAttribute Reply replyVO) {
        System.out.println(replyVO);
        replyService.updateReply(replyVO);
        return "success";
    }

    @PostMapping("/delete")
    @ResponseBody
    public String deleteReply(@RequestParam("re_no") int re_no) {
        replyService.deleteReply(re_no);
        return "success";
    }

//    @GetMapping("/list")
//    @ResponseBody
//    public List<Reply> getReplyList(@RequestParam("bo_no") int bo_no) {
//        return replyService.getReplyList(bo_no);
//    }

    @GetMapping("/list")
    public String listReplies(@RequestParam("bo_no") int boNo, Model model) {
        List<Reply> replies = replyService.getRepliesWithNested(boNo);
        model.addAttribute("list", replies);
        return "reply/list";  // JSP 파일 이름
    }

    @PostMapping("/insertNestedReply")
    @ResponseBody
    public String insertNestedReply(@ModelAttribute Reply replyVO) {
        System.out.println(replyVO.getRe_Plus());
        try {
            replyService.insertNestedReply(replyVO);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();  // 서버 콘솔에 오류를 출력
            return "error";
        }
    }
}
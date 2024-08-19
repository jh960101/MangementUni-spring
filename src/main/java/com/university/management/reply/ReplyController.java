package com.university.management.reply;

import com.university.management.reply.dto.Reply;
import com.university.management.reply.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReplyController {

    @Autowired
    private ReplyService service;

    @Autowired
    private HttpSession session;

    @RequestMapping("/insertReply")
    public ResponseEntity<Reply> insertReply(@RequestBody Reply reply) {

        int stu_no = (int) session.getAttribute("studentno");
        reply.setStu_No(stu_no);


        return ResponseEntity.status(HttpStatus.OK).body(reply);
    }
    @GetMapping("/selectAllReply/{bo_no}")
    public ResponseEntity<List<Reply>> selectAllReply(@PathVariable("bo_no") int bo_no){

        System.out.println(bo_no);

        List<Reply> list = service.selectAllReply(bo_no);

        return ResponseEntity.status(HttpStatus.OK).body(list);

    }
}

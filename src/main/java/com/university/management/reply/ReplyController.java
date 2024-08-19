package com.university.management.reply;

import com.university.management.reply.dto.Reply;
import com.university.management.reply.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class ReplyController {

    @Autowired
    private ReplyService service;

    @Autowired
    private HttpSession session;

    @RequestMapping("/insertReply")
    public ResponseEntity<List<Reply>> insertReply(@RequestBody Reply reply) {

        Date date = Calendar.getInstance().getTime();
        int stu_no = (int) session.getAttribute("studentno");

        reply.setStu_No(stu_no);
        reply.setCreate_Date(date);

        service.insertReply(reply);

        List<Reply> list = service.selectAllReply(reply.getBo_No());
        return ResponseEntity.status(HttpStatus.OK).body(list);
    }

    @GetMapping("/selectAllReply/{bo_no}")
    public ResponseEntity<List<Reply>> selectAllReply(@PathVariable("bo_no") int bo_no){

        System.out.println(bo_no);

        List<Reply> list = service.selectAllReply(bo_no);

        return ResponseEntity.status(HttpStatus.OK).body(list);

    }
    @RequestMapping("/deleteReply")
    public  ResponseEntity<List<Reply>> deleteReply(@RequestBody Reply reply){
        System.out.println(reply);

        service.deleteReply(reply.getRe_No());

        List<Reply> list = service.selectAllReply(reply.getBo_No());

        return ResponseEntity.status(HttpStatus.OK).body(list);
    }
}

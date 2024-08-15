package com.university.management.reply;

// ReplyServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int bo_no = Integer.parseInt(request.getParameter("bo_no"));
        Integer stu_no = request.getParameter("stu_no") != null ? Integer.parseInt(request.getParameter("stu_no")) : null;
        Integer emp_no = request.getParameter("emp_no") != null ? Integer.parseInt(request.getParameter("emp_no")) : null;
        String replyContent = request.getParameter("replyContent");

        ReplyDTO reply = new ReplyDTO();
        reply.setBo_no(bo_no);
        reply.setStu_no(stu_no);
        reply.setEmp_no(emp_no);
        reply.setReply_content(replyContent);

        ReplyDAO dao = new ReplyDAO();
        int result = dao.insertReply(bo_no, stu_no, emp_no, replyContent);

        if (result > 0) {
            response.sendRedirect("yourBoardPage.jsp?bo_no=" + bo_no);
        } else {
            response.sendRedirect("errorPage.jsp");
        }
    }
}

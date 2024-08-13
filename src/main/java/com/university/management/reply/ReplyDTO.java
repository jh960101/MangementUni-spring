package com.university.management.reply;

// ReplyDTO.java
import java.util.Date;

public class ReplyDTO {
    private int re_no;
    private int bo_no;
    private Integer stu_no;
    private Integer emp_no;
    private String reply_content;
    private Date create_date;
    private Date modify_date;
    private int re_plus;

    // Getters and Setters
    public int getRe_no() {
        return re_no;
    }

    public void setRe_no(int re_no) {
        this.re_no = re_no;
    }

    public int getBo_no() {
        return bo_no;
    }

    public void setBo_no(int bo_no) {
        this.bo_no = bo_no;
    }

    public Integer getStu_no() {
        return stu_no;
    }

    public void setStu_no(Integer stu_no) {
        this.stu_no = stu_no;
    }

    public Integer getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(Integer emp_no) {
        this.emp_no = emp_no;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getModify_date() {
        return modify_date;
    }

    public void setModify_date(Date modify_date) {
        this.modify_date = modify_date;
    }

    public int getRe_plus() {
        return re_plus;
    }

    public void setRe_plus(int re_plus) {
        this.re_plus = re_plus;
    }
}

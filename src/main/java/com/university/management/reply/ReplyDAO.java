package com.university.management.reply;

// ReplyDAO.java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ReplyDAO {
    private Connection conn;

    public ReplyDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/UNIVERSITY";
            String dbID = "root";
            String dbPassword = "password";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int insertReply(int bo_no, Integer stu_no, Integer emp_no, String replyContent) {
        String SQL = "INSERT INTO REPLY (BO_NO, STU_NO, EMP_NO, REPLY_CONTENT, CREATE_DATE, RE_PLUS) VALUES (?, ?, ?, ?, NOW(), -1)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bo_no);
            if (stu_no != null) {
                pstmt.setInt(2, stu_no);
            } else {
                pstmt.setNull(2, java.sql.Types.INTEGER);
            }
            if (emp_no != null) {
                pstmt.setInt(3, emp_no);
            } else {
                pstmt.setNull(3, java.sql.Types.INTEGER);
            }
            pstmt.setString(4, replyContent);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}

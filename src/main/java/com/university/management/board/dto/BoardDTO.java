package com.university.management.board.dto;

public class BoardDTO {
    private Integer boNo; // 게시글 번호
    private Integer stuNo; // 학생 번호
    private Integer empNo; // 교직원 번호
    private String title; // 제목
    private String content; // 내용
    private String type; // 게시글 타입
    private String originalFilename; // 원본 파일 이름
    private String renameFilename; // 변경된 파일 이름
    private Integer readCount; // 조회수
    private Boolean anonymous; // 익명 여부
    private Integer boLike; // 좋아요 수

    // Getter와 Setter 메서드들
    public Integer getBoNo() {
        return boNo;
    }

    public void setBoNo(Integer boNo) {
        this.boNo = boNo;
    }

    public Integer getStuNo() {
        return stuNo;
    }

    public void setStuNo(Integer stuNo) {
        this.stuNo = stuNo;
    }

    public Integer getEmpNo() {
        return empNo;
    }

    public void setEmpNo(Integer empNo) {
        this.empNo = empNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    public String getRenameFilename() {
        return renameFilename;
    }

    public void setRenameFilename(String renameFilename) {
        this.renameFilename = renameFilename;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    public Boolean getAnonymous() {
        return anonymous;
    }

    public void setAnonymous(Boolean anonymous) {
        this.anonymous = anonymous;
    }

    public Integer getBoLike() {
        return boLike;
    }

    public void setBoLike(Integer boLike) {
        this.boLike = boLike;
    }

    @Override
    public String toString() {
        return "BoardDTO{" +
                "boNo=" + boNo +
                ", stuNo=" + stuNo +
                ", empNo=" + empNo +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", originalFilename='" + originalFilename + '\'' +
                ", renameFilename='" + renameFilename + '\'' +
                ", readCount=" + readCount +
                ", anonymous=" + anonymous +
                ", boLike=" + boLike +
                '}';
    }
}

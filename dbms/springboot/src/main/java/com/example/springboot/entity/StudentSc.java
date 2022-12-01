package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class StudentSc {
    private String Cno;
    private String Cname;
    private String Tno;
    private String Tname;
    private String Phone;
    private Integer grade;
    private boolean flag;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date StartTime;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date EndTime;
    private String Introduction;
    private String TeacherIntroduction;

}

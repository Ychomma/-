package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Student {
    private String Sno;
    private String Sname;
    private String Ssex;
    private Integer Sage;
    private String Sdept;
    private String Phone;
    private String Address;

    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date SchoolTime;
}

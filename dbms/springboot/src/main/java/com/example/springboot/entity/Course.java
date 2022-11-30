package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Course {
    private String Cno;
    private String Cname;
    private String Place;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date StartTime;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date EndTime;
    private String Introduction;
    private String Tno;
    private String Tname;
}

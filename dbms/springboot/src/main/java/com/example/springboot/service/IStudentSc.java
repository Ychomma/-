package com.example.springboot.service;

import com.example.springboot.entity.Student;
import com.example.springboot.entity.StudentSc;

import java.util.List;

public interface IStudentSc {
    List<StudentSc> list(String sno);
    List<StudentSc> MyScList(String sno);
    List<StudentSc> ScListByCondition(StudentSc obj);


}

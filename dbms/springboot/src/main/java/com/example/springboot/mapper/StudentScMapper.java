package com.example.springboot.mapper;

import com.example.springboot.entity.StudentSc;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface StudentScMapper {
    List<StudentSc> list();
    List<StudentSc> MyScList(String sno);

    List<StudentSc> ScListByCondition(StudentSc obj);
}

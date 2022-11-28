package com.example.springboot.service.impl;

import com.example.springboot.entity.Sc;
import com.example.springboot.entity.StudentSc;
import com.example.springboot.mapper.ScMapper;
import com.example.springboot.mapper.StudentMapper;
import com.example.springboot.mapper.StudentScMapper;
import com.example.springboot.service.IStudentSc;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Component
@Service
public class StudentScService implements IStudentSc {

    @Resource
    StudentScMapper studentScMapper;
    @Resource
    ScMapper scMapper;
    @Override
    public List<StudentSc> list(String sno) {
        List<StudentSc> result=studentScMapper.list();
        List<StudentSc> Result=new ArrayList<>();
        for (StudentSc res:result) {
            String cno=res.getCno();
            String tno=res.getTno();
            List<Sc>list=scMapper.findSc(cno,sno,tno);
            if(list.size()!=0){
                res.setFlag(true);
            }
            Result.add(res);
        }
        return Result;
    }

    @Override
    public List<StudentSc> MyScList(String sno) {
        return studentScMapper.MyScList(sno);
    }

    @Override
    public List<StudentSc> ScListByCondition(StudentSc obj) {
        List<StudentSc> result = studentScMapper.ScListByCondition(obj);
        return  null;
    }
}

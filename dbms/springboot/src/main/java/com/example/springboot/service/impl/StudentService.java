package com.example.springboot.service.impl;

import com.example.springboot.controller.dto.LoginDTO;
import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.controller.request.PasswordRequest;
import com.example.springboot.entity.Student;
import com.example.springboot.entity.Student;
import com.example.springboot.mapper.ScMapper;
import com.example.springboot.mapper.StudentMapper;
import com.example.springboot.service.IScService;
import com.example.springboot.service.IStudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Component
@Service
public class StudentService implements IStudentService {
    @Resource
    StudentMapper studentMapper;
    @Resource
    ScMapper scMapper;
    @Override
    public List<Student> list() {
        return studentMapper.list();
    }

    @Override
    public void save(Student obj) {
        studentMapper.save(obj);
    }

    @Override
    public Student getById(String id) {
        return studentMapper.getById(id);
    }

    @Override
    public void update(Student student) {
        studentMapper.updateById(student);
    }

    @Override
    public void deleteById(String id) {
        scMapper.deleteBySId(id);
        studentMapper.deleteById(id);
    }

    @Override
    public List<Student> listByCondition(Student obj) {
        return studentMapper.listByCondition(obj);
    }

    @Override
    public void Delete(String sno) {
        studentMapper.deleteById(sno);
    }
}

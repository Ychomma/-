package com.example.springboot.service.impl;

import com.example.springboot.controller.dto.LoginDTO;
import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.controller.request.PasswordRequest;
import com.example.springboot.entity.Student;
import com.example.springboot.entity.Student;
import com.example.springboot.mapper.StudentMapper;
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
        studentMapper.deleteById(id);
    }
}

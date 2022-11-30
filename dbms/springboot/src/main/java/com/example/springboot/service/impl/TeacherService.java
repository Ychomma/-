package com.example.springboot.service.impl;

import com.example.springboot.entity.ExtraCourse;
import com.example.springboot.entity.Teacher;
import com.example.springboot.mapper.TeacherMapper;
import com.example.springboot.service.ITeacherService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Component
@Service
public class TeacherService implements ITeacherService {
    @Resource
    TeacherMapper teacherMapper;
    @Override
    public List<Teacher> list() {
        return teacherMapper.list();
    }

    @Override
    public void save(Teacher obj) {
        teacherMapper.save(obj);
    }

    @Override
    public Teacher getById(String id) {
        return teacherMapper.getById(id);
    }

    @Override
    public void update(Teacher obj) {
        teacherMapper.updateById(obj);
    }

    @Override
    public void deleteById(String id) {
        teacherMapper.deleteById(id);
    }

    @Override
    public List<Teacher> listByCondition(Teacher obj) {
        return teacherMapper.listByCondition(obj);
    }


}

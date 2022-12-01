package com.example.springboot.service.impl;

import com.example.springboot.entity.Course;
import com.example.springboot.entity.Teacher;
import com.example.springboot.mapper.CourseMapper;
import com.example.springboot.mapper.ScMapper;
import com.example.springboot.mapper.TeacherMapper;
import com.example.springboot.service.ICourseService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Component
@Service
public class CourseService implements ICourseService {
    @Resource
    CourseMapper courseMapper;
    @Resource
    ScMapper scMapper;
    @Resource
    TeacherMapper teacherMapper;
    @Override
    public List<Course> list() {
        List<Course> res =new ArrayList<>();
        List<Course> list = courseMapper.list();
        for(Course course:list){
            String tno= course.getTno();
            Teacher obj=teacherMapper.getById(tno);
            course.setTname(obj.getTname());
            res.add(course);
        }
        return res;
    }

    @Override
    public void save(Course obj) {
        courseMapper.save(obj);
    }

    @Override
    public Course getById(String id) {
        return courseMapper.getById(id);
    }

    @Override
    public void update(Course obj) {
        courseMapper.updateById(obj);
    }

    @Override
    public void deleteById(String id) {
        scMapper.deleteByCId(id);
        courseMapper.deleteById(id);
    }

    @Override
    public List<Course> listByCondition(Course obj) {
        return courseMapper.listByCondition(obj);
    }

    @Override
    public void endSelect(Course course) {
        courseMapper.endSelect(course);
    }
}

package com.example.springboot.service.impl;

import com.example.springboot.entity.Sc;
import com.example.springboot.entity.Teacher;
import com.example.springboot.mapper.ScMapper;
import com.example.springboot.mapper.TeacherMapper;
import com.example.springboot.service.IScService;
import com.example.springboot.service.ITeacherService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Component
@Service
public class ScService implements IScService {

    @Resource
    ScMapper scMapper;
    @Override
    public List<Sc> list() {
        return scMapper.list();
    }

    @Override
    public void save(Sc obj) {
        scMapper.save(obj);
    }

    @Override
    public List<Sc> getByCId(String id) {
        return scMapper.getByCId(id);
    }

    @Override
    public List<Sc> getBySId(String id) {
        return scMapper.getBySId(id);
    }

    @Override
    public void update(Sc obj) {
        scMapper.updateGrade(obj);
    }

    @Override
    public void deleteBySId(String id) {
        scMapper.deleteBySId(id);
    }

    @Override
    public void deleteByCId(String id) {
        scMapper.deleteByCId(id);
    }

    @Override
    public void delete(String cno, String sno, String tno) {
        scMapper.delete(cno, sno, tno);
    }

}

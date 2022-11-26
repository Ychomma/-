package com.example.springboot.service.impl;

import com.example.springboot.common.Result;
import com.example.springboot.entity.ExtraCourse;
import com.example.springboot.mapper.ExtraCourseMapper;
import com.example.springboot.service.IExtraCourseService;
import com.example.springboot.service.IUnionService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Component
@Service
public class ExtraCourseService implements IExtraCourseService {
    @Resource
    ExtraCourseMapper extraCourseMapper;
    @Override
    public List<ExtraCourse> list(){
        return extraCourseMapper.list();
    }

    @Override
    public List<ExtraCourse> listByCondition(ExtraCourse obj) {
        return extraCourseMapper.listByCondition(obj);
    }
}

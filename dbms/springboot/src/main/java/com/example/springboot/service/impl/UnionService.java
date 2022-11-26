package com.example.springboot.service.impl;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Union;
import com.example.springboot.mapper.UnionMapper;
import com.example.springboot.service.IUnionService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Component
@Service
public class UnionService implements IUnionService {
    @Resource
    UnionMapper unionMapper;
    @Override
    public Result list() {
        return Result.success(unionMapper.list());
    }

    @Override
    public Result listByCondition(Union obj) {
        return Result.success(unionMapper.listByCondition(obj));
    }
}

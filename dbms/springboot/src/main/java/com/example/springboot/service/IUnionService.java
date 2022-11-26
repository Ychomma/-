package com.example.springboot.service;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Teacher;
import com.example.springboot.entity.Union;

import java.util.List;

public interface IUnionService {
    Result list();
    Result listByCondition(Union obj);
}

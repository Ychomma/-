package com.example.springboot.service;

import com.example.springboot.entity.Sc;

import java.util.List;

public interface IScService {
    List<Sc> list();
    void save(Sc obj);

    List<Sc> getByCId(String id);

    List<Sc> getBySId(String id);

    void update(Sc obj);

    void deleteBySId(String id);

    void deleteByCId(String id);
}

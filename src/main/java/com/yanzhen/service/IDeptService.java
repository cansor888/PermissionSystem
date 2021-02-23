package com.yanzhen.service;

import com.yanzhen.po.Dept;
import com.yanzhen.po.Node;

import java.util.List;

public interface IDeptService {
    List<Dept> queryDeptAll();
    void addDept(Dept dept);
    Dept queryDeptByID(Integer id);
    void updateDept(Dept dept);
    void deleteDeptById(Integer id);
    List<Node> queryDeptTree();
}

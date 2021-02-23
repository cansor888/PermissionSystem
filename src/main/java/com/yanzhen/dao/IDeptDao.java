package com.yanzhen.dao;

import com.yanzhen.po.Dept;
import com.yanzhen.po.Node;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("deptDao")
public interface IDeptDao {
    List<Dept> queryDeptAll();
    void addDept(Dept dept);
    Dept queryDeptByID(Integer id);
    void updateDept(Dept dept);
    void deleteDeptById(int id);
    List<Node> queryDeptTree();
}

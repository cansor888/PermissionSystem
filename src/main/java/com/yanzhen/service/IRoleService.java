package com.yanzhen.service;

import com.yanzhen.po.Node;
import com.yanzhen.po.Role;

import java.util.List;

public interface IRoleService {
    public List<Role> queryRoleAll();
    void addRole(Role role);
    public Role queryRoleById(Integer id);
    void updateRole(Role role);
    void deleteRoleById(Integer id);
    void insertForEach(int [] ids,int roleId);
    void deleteRoleMenuByRoleId(int id);
    List<Node> queryRoleTree();
}

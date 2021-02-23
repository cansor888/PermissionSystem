package com.yanzhen.dao;

import com.yanzhen.po.Node;
import com.yanzhen.po.Role;
import com.yanzhen.po.RoleMenu;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("roleDao")
public interface IRoleDao {
    public List<Role> queryRoleAll();
    void addRole(Role role);
    public Role queryRoleById(Integer id);
    void updateRoleSubmit(Role role);
    void deleteRoleById(Integer id);
    void deleteRoleMenuByRoleId(Integer roleId);
    public void insertForEach(List<RoleMenu> list);
    List<Node> queryRoleTree();
}

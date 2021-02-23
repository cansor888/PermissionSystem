package com.yanzhen.service;

import com.yanzhen.po.Menu;
import com.yanzhen.po.Node;
import com.yanzhen.po.RoleMenu;

import java.util.List;

public interface IMenuService {
    List<Menu> queryMenuAll();
    void addMenu(Menu menu);
    void deleteMenuById(Integer id);
    Menu queryMenuByID(Integer id);
    void updateMenuSubmit(Menu menu);
    List<RoleMenu> queryMenuByRoleId(Integer roleID);
    List<Node> queryMenuTree();
}

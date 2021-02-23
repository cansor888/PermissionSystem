package com.yanzhen.dao;

import com.yanzhen.po.Menu;
import com.yanzhen.po.Node;
import com.yanzhen.po.RoleMenu;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("menuDao")
public interface IMenuDao {
    List<Menu> queryMenuAll();
    void addMenu(Menu menu);
    void deleteMenuById(Integer id);
    Menu queryMenuByID(Integer id);
    void updateMenuSubmit(Menu menu);
    List<RoleMenu> queryMenuByRoleId(Integer roleID);
    List<Node> queryMenuTree();
}

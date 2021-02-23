package com.yanzhen.controller;

import com.yanzhen.po.Menu;
import com.yanzhen.po.Node;
import com.yanzhen.po.RoleMenu;
import com.yanzhen.service.IMenuService;
import com.yanzhen.util.JsonObject;
import com.yanzhen.util.R;
import com.yanzhen.util.TreeBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class MenuController {
    @Autowired
    private IMenuService menuService;
    @Autowired
    private TreeBuilder treeBuilder;
    @ResponseBody
    @RequestMapping("menu/menuAll")
    public JsonObject queryMenuAll(){
        JsonObject object = new JsonObject();
        List<Menu> list = menuService.queryMenuAll();
        object.setCode(200);
        object.setCount((long) list.size());
        object.setData(list);
        object.setMsg("ok");
        return object;
    }
    @RequestMapping("menu/addMenuSubmit")
    @ResponseBody
    public R addMenuSubmit(Menu menu){
        menu.setCreateTime(new Date());
        menuService.addMenu(menu);
        return R.ok();
    }
    @RequestMapping("menu/deleteMenuById")
    @ResponseBody
    public R deleteMenuSubmit(Integer id){
        menuService.deleteMenuById(id);
        return R.ok();
    }
    @RequestMapping("menu/updateMenuSubmit")
    @ResponseBody
    public R updateMenuSubmit(Menu menu){
        menuService.updateMenuSubmit(menu);
        return R.ok();
    }
    @RequestMapping("menu/queryMenuTree")
    @ResponseBody
    public Object queryMenuTree(int id){
        List<Node> list = menuService.queryMenuTree();
        List<RoleMenu> roleMenus = menuService.queryMenuByRoleId(id);
        for(RoleMenu rm : roleMenus){
            int menuId = rm.getMenuId();
            for(Node node : list){
                if(node.getId() == menuId){
                    node.setChecked(true);
                }
            }
        }
        String result = treeBuilder.buildTree(list);
        return result;
    }
    @RequestMapping("menu/queryMenuByID")
    public String queryMenuByID(Integer id,Model model){
        Menu menu = menuService.queryMenuByID(id);
        model.addAttribute("menu",menu);
        return "pages/updateMenu";
    }
    @RequestMapping("/menu")
    public String menuIndex(){
        return "pages/menu";
    }
    @RequestMapping("/addMenu")
    public String addMenu(Model model,int type,int parentId){
        if(type==-1){
            type=0;
            parentId=-1;
        }else{
            type=type+1;
        }
        model.addAttribute("type",type);
        model.addAttribute("parentId",parentId);
        return "pages/addMenu";
    }
}

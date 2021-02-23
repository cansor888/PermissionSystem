package com.yanzhen.controller;

import com.yanzhen.po.Role;
import com.yanzhen.service.IRoleService;
import com.yanzhen.util.JsonObject;
import com.yanzhen.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @RequestMapping("role/roleAll")
    @ResponseBody
    public JsonObject queryRoleAll(){
        JsonObject object = new JsonObject();
        List<Role> list = roleService.queryRoleAll();
        object.setCode(200);
        object.setCount((long) list.size());
        object.setData(list);
        object.setMsg("ok");
        return object;
    }
    @RequestMapping("role/addRoleSubmit")
    @ResponseBody
    public R addRole(Role role){
        roleService.addRole(role);
        return R.ok();
    }
    @RequestMapping("role/addPremSubmit")
    @ResponseBody
    public R addPermSubmit(int [] ids,int roleId){
        roleService.insertForEach(ids,roleId);
        return R.ok();
    }
    @RequestMapping("/updateRoleSubmit")
    @ResponseBody
    public R updateRoleById(Role role){
        role.setUpdateTime(new Date());
        roleService.updateRole(role);
        return R.ok();
    }
    @ResponseBody
    @RequestMapping("/queryRoleTree")
    public Object queryRoleTree(){
        return roleService.queryRoleTree();
    }
    @RequestMapping("/role")
    public String RoleMenu(){
        return "pages/role";
    }
    @RequestMapping("/addRole")
    public String addRole(Model model,Integer parentId){
        model.addAttribute("parentId",parentId);
        return "pages/addRole";
    }
    @RequestMapping("role/deleteRoleById")
    @ResponseBody
    public R deleteRoleById(Integer id){
        roleService.deleteRoleById(id);
        return R.ok();
    }
    @RequestMapping("/addPerm")
    public String addPerm(Model model,int id){
        model.addAttribute("roleId",id);
        return "pages/addPerm";
    }
    @RequestMapping("role/queryroleByID")
    public String updateRole(Model model,int id){
        Role role = roleService.queryRoleById(id);
        model.addAttribute("role",role);
        return "pages/updateRole";
    }
}

package com.yanzhen.controller;

import com.yanzhen.po.Dept;
import com.yanzhen.service.IDeptService;
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
public class DeptController {
    @Autowired
    private IDeptService deptService;
    @RequestMapping("dept/deptAll")
    @ResponseBody
    public JsonObject queryDeptAll(){
        List<Dept> list = deptService.queryDeptAll();
        JsonObject object = new JsonObject();
        object.setCode(0);
        object.setMsg("ok");
        object.setCount((long) list.size());
        object.setData(list);
        System.out.println(list);
        return object;
    }
    @RequestMapping("dept/addDeptSubmit")
    @ResponseBody
    public R addDept(Dept dept){
        dept.setCreateTime(new Date());
        deptService.addDept(dept);
        return R.ok();
    }
    @ResponseBody
    @RequestMapping("dept/updateDeptSubmit")
    public R updateDept(Dept dept){
        deptService.updateDept(dept);
        return R.ok();
    }
    @RequestMapping("dept/deleteDeptByID")
    @ResponseBody
    public R deleteDeptByID(int id){
        deptService.deleteDeptById(id);
        return R.ok();
    }
    @RequestMapping("queryDeptTree")
    @ResponseBody
    public Object queryDeptTree(){
        return deptService.queryDeptTree();
    }
    @RequestMapping("/dept")
    public String deptIndex(){
        return"pages/dept";
    }
    @RequestMapping("addDept")
    public String addDept(Integer type, Integer parentId, Model model){
        model.addAttribute("type",type+1);
        model.addAttribute("parentId",parentId);
        return "pages/addDept";
    }
}

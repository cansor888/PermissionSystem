package com.yanzhen.controller;

import com.github.pagehelper.PageInfo;
import com.yanzhen.po.User;
import com.yanzhen.service.IUserService;
import com.yanzhen.util.JsonObject;
import com.yanzhen.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private IUserService userService;

    @RequestMapping("user/userAll")
    @ResponseBody
    public JsonObject queryUserInfo(Model model, User user,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit){
        JsonObject object = new JsonObject();
        PageInfo<User> pageInfo = userService.findUserAll(page,limit,user);
        object.setCode(0);
        object.setCount(pageInfo.getTotal());
        object.setData(pageInfo.getList());
        object.setMsg("ok");
        return object;
    }
    @ResponseBody
    @RequestMapping("/addUserSubmit")
    public R addUserSubmit(@RequestBody User user){
        System.out.println(user);
        userService.addUser(user);
        return R.ok();
    }
    @ResponseBody
    @RequestMapping("/updateUserSubmit")
    public R updateUserSubmit(@RequestBody User user){
        System.out.println(user);
        userService.updateUserSubmit(user);
        return R.ok();
    }
    @RequestMapping("user/deleteUserByIds")
    @ResponseBody
    public R deleteUserByIds(String ids){
        List list = Arrays.asList(ids.split(","));
        System.out.println(list);
        userService.deleteUserInfoByIds(list);
        return R.ok();
    }
    @RequestMapping("/user")
    public String userIndex(){
        return "pages/user";
    }
    @RequestMapping("addUser")
    public String addUser(){
        return "pages/addUser";
    }
    @RequestMapping("/updateUser")
    public String updateUser(Integer id,Model model){
        User user = userService.queryUserById(id);
        model.addAttribute("user",user);
        System.out.println(user);
        return "pages/updateUser";
    }
}

package com.yanzhen.service;

import com.github.pagehelper.PageInfo;
import com.yanzhen.po.User;
import com.yanzhen.po.UserRole;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

public interface IUserService {
    PageInfo<User> findUserAll(int page,int pageSize,User user);
    void addUser(User user);
    void deleteUserInfoByIds(List<Integer> ids);
    User queryUserById(Integer id);
    void updateUserSubmit(User user);
    User queryUserInfoByNameAndPwd(String username,String password);
}

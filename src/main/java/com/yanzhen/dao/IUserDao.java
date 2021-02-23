package com.yanzhen.dao;

import com.yanzhen.po.User;
import com.yanzhen.po.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component("userDao")
public interface IUserDao {
    List<User> queryUserAll(User user);
    void addUser(User user);
    void addUserRole(List<UserRole> list);
    void deleteUserByIds(List<Integer> ids);
    void deleteUserRoleByUserIds(List<Integer> ids);
    User queryUserById(Integer id);
    void updateUserSubmit(User user);
    //根据用户名和密码查询用户信息
    User queryUserInfoByNameAndPwd(@Param("username")String username,@Param("password")String password);
}

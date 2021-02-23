package com.yanzhen.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yanzhen.dao.IUserDao;
import com.yanzhen.po.User;
import com.yanzhen.po.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("userService")
public class IUserServiceImpl implements IUserService{
    @Autowired
    private IUserDao userDao;
    @Override
    public PageInfo<User> findUserAll(int page, int pageSize, User user) {
        PageHelper.startPage(page,pageSize);
        List<User> list = userDao.queryUserAll(user);
        PageInfo<User> pageInfoList = new PageInfo<User>(list);
        return pageInfoList;
    }

    @Override
    public void addUser(User user) {
        List<Integer> ids = user.getRoleList();
        userDao.addUser(user);
        int userId = user.getId();
        List<UserRole> list = new ArrayList<>();
        for(Integer rid:ids){
            list.add(new UserRole(rid,userId));
        }
        userDao.addUserRole(list);
    }

    @Override
    public void deleteUserInfoByIds(List<Integer> ids) {
        userDao.deleteUserByIds(ids);
        userDao.deleteUserRoleByUserIds(ids);
    }

    @Override
    public User queryUserById(Integer id) {
        return userDao.queryUserById(id);
    }

    @Override
    public void updateUserSubmit(User user) {
        userDao.updateUserSubmit(user);
    }

    @Override
    public User queryUserInfoByNameAndPwd(String username, String password) {
        return userDao.queryUserInfoByNameAndPwd(username,password);
    }


}

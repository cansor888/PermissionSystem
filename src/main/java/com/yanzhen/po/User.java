package com.yanzhen.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class User implements Serializable {
    private Integer id;
    private Integer deptId;
    private String username;
    private String password;
    private String realname;
    private String sex;
    private String tel;
    private String email;
    private String avatar;
    private String jobTitle;
    private String status;
    private String sort;
    private Integer delFlag;
    private Integer createBy;
    private Date createTime;
    private Date updateTime;
    private String dname;
    private List roleList;
}

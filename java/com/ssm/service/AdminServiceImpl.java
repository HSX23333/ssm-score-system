package com.ssm.service;

import com.ssm.entity.Admin;
import com.ssm.mapper.AdminMapper;
import com.ssm.util.MD5Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {
        // 先根据用户名查询
        Admin existAdmin = adminMapper.findByUsername(admin.getUsername());
        if (existAdmin != null) {
            // 对用户输入的密码进行 MD5 加密后与数据库密文比对
            String inputEncoded = MD5Util.encode(admin.getPassword());
            if (inputEncoded.equals(existAdmin.getPassword())) {
                return existAdmin;
            }
        }
        return null;
    }

    @Override
    public void register(Admin admin) {
        // 注册时对密码进行 MD5 加密
        admin.setPassword(MD5Util.encode(admin.getPassword()));
        adminMapper.register(admin);
    }

    @Override
    public Admin findByUsername(String username) {
        return adminMapper.findByUsername(username);
    }
}
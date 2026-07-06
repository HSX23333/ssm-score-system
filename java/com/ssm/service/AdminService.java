package com.ssm.service;
import com.ssm.entity.Admin;
public interface AdminService {
    Admin login(Admin admin);

    Admin findByUsername(String username);

    void register(Admin admin);
}
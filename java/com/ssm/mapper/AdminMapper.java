package com.ssm.mapper;

import com.ssm.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Admin login(Admin admin);

    void register(Admin admin);

    Admin findByUsername(@Param("username") String username);
}
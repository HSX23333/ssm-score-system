package com.ssm.mapper;

import com.ssm.entity.Student;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface StudentMapper {
    List<Student> findAll();
    Student findById(Integer id);
    List<Student> searchByName(@Param("keyword") String keyword);   // 按姓名模糊查询
    int add(Student s);
    int update(Student s);
    int delete(Integer id);
    int countAll();
}
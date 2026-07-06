package com.ssm.service;

import java.util.*;
import com.ssm.entity.Student;
import com.ssm.mapper.StudentMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    @Override
    public List<Student> findAll() {
        return studentMapper.findAll();
    }

    @Override
    public Student findById(Integer id) {
        return studentMapper.findById(id);
    }

    @Override
    public int add(Student s) {
        return studentMapper.add(s);
    }

    @Override
    public int update(Student s) {
        return studentMapper.update(s);
    }

    @Override
    public int delete(Integer id) {
        return studentMapper.delete(id);
    }

    @Override
    public int countAll() {
        return studentMapper.countAll();
    }

    @Override
    public List<Student> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return studentMapper.findAll();
        }
        // 判断 keyword 是否为纯数字（完整ID匹配）
        if (keyword.matches("\\d+")) {
            int id = Integer.parseInt(keyword);
            Student stu = studentMapper.findById(id);
            if (stu != null) {
                return Collections.singletonList(stu);
            } else {
                return new ArrayList<>(); // ID不存在，返回空列表
            }
        } else {
            // 姓名模糊匹配
            return studentMapper.searchByName(keyword);
        }
    }
}
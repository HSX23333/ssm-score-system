package com.ssm.service;

import com.ssm.entity.Student;
import java.util.List;

public interface StudentService {
    List<Student> findAll();
    Student findById(Integer id);
    int add(Student s);
    int update(Student s);
    int delete(Integer id);
    int countAll();
    List<Student> search(String keyword);
}
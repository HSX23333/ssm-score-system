package com.ssm.controller;

import com.ssm.entity.Student;
import com.ssm.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService studentService;

    @RequestMapping("/list")
    public String list(@RequestParam(required = false) String keyword, Model model) {
        List<Student> list;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = studentService.search(keyword);
            model.addAttribute("keyword", keyword);
        } else {
            list = studentService.findAll();
        }
        model.addAttribute("stuList", list);
        return "studentList";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "addStu";
    }

    @RequestMapping("/add")
    public String add(Student s, Model model) {
        try {
            studentService.add(s);
            return "redirect:/student/list";
        } catch (Exception e) {
            model.addAttribute("msg", "添加失败：" + e.getMessage());
            return "addStu";
        }
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam Integer id, Model model) {
        Student s = studentService.findById(id);
        model.addAttribute("stu", s);
        return "updateStu";
    }

    @RequestMapping("/update")
    public String update(Student s) {
        studentService.update(s);
        return "redirect:/student/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam Integer id) {
        studentService.delete(id);
        return "redirect:/student/list";
    }
}
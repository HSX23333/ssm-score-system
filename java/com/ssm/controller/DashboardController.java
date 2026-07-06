package com.ssm.controller;

import com.ssm.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class DashboardController {

    @Resource
    private StudentService studentService;

    // 后台首页
    @RequestMapping("/dashboard")
    public String dashboard(Model model) {
        // 统计学生总数
        int totalStudents = studentService.countAll();
        model.addAttribute("totalStudents", totalStudents);
        return "dashboard";
    }
}
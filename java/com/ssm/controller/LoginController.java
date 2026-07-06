package com.ssm.controller;

import com.ssm.entity.Admin;
import com.ssm.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class LoginController {
    @Resource
    private AdminService adminService;

    // 跳转到登录页
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    // 跳转到注册页
    @GetMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    // 登录
    @PostMapping("/login")
    public String login(String username,
                        String password,
                        String code,
                        HttpSession session,
                        Model model) {

        // 控制台输出参数
        System.out.println("===== 登录参数 =====");
        System.out.println("用户名：" + username);
        System.out.println("密码：" + password);
        System.out.println("验证码：" + code);

        // 1. 非空校验
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            model.addAttribute("msg", "账号和密码不能为空！");
            return "login";
        }

        // 2. 判断用户名是否存在（查库）
        Admin existAdmin = adminService.findByUsername(username);
        if (existAdmin == null) {
            model.addAttribute("msg", "用户名不存在！");
            return "login";
        }

        // 3. 校验账号密码（用 Admin 对象传参，和 Service 定义匹配）
        Admin paramAdmin = new Admin();
        paramAdmin.setUsername(username);
        paramAdmin.setPassword(password);
        Admin loginAdmin = adminService.login(paramAdmin);
        if (loginAdmin == null) {
            model.addAttribute("msg", "账号密码错误！");
            return "login";
        }

        // 4. 最后校验验证码
        String saveCode = (String) session.getAttribute("KAPTCHA_SESSION_KEY");
        if (saveCode == null || !code.equalsIgnoreCase(saveCode)) {
            model.addAttribute("msg", "验证码错误！");
            return "login";
        }

        // 登录成功
        session.setAttribute("loginUser", loginAdmin);
        return "redirect:/dashboard";
    }

    // 注册提交
    @PostMapping("/register")
    public String register(String username,
                           String password,
                           String repassword,
                           String code,
                           HttpSession session,
                           Model model) {

        System.out.println("===== 注册参数 =====");
        System.out.println("用户名：" + username);
        System.out.println("密码：" + password);
        System.out.println("确认密码：" + repassword);
        System.out.println("验证码：" + code);

        // 1 非空
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                repassword == null || repassword.trim().isEmpty()) {
            model.addAttribute("msg", "所有项都不能为空");
            return "register";
        }

        // 2 两次密码一致
        if (!password.equals(repassword)) {
            model.addAttribute("msg", "两次密码不一致");
            return "register";
        }

        // 3 用户名是否已存在
        Admin exist = adminService.findByUsername(username);
        if (exist != null) {
            model.addAttribute("msg", "用户名已存在");
            return "register";
        }

        // 4 验证码
        String kaptcha = (String) session.getAttribute("KAPTCHA_SESSION_KEY");
        if (kaptcha == null || !code.equalsIgnoreCase(kaptcha)) {
            model.addAttribute("msg", "验证码错误");
            return "register";
        }

        // 5 注册入库
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        adminService.register(admin);

        model.addAttribute("msg", "注册成功，请登录！");
        return "redirect:/admin/toLogin";
    }

    // 退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/toLogin";
    }
}

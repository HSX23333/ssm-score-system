package com.ssm.interceptor;

import com.ssm.entity.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 登录拦截器：未登录拦截业务页面*/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取登录用户session
        Admin loginUser = (Admin) request.getSession().getAttribute("loginUser");
        // 判断是否登录
        if (loginUser == null) {
            // 未登录，重定向到登录页
            response.sendRedirect(request.getContextPath() + "/admin/toLogin");
            return false; // 中断请求
        }
        // 已登录，放行
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
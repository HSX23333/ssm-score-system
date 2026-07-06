<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>学生管理系统 - 首页</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }
        body {
            background: linear-gradient(135deg, #42a5f5, #478edf);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .dashboard-card {
            background: #fff;
            width: 500px;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            text-align: center;
        }
        .dashboard-card h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }
        .user-info {
            font-size: 14px;
            color: #666;
            margin-bottom: 30px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        .total-box {
            background: #f0f7ff;
            border-radius: 16px;
            padding: 20px;
            margin: 20px 0;
        }
        .total-number {
            font-size: 48px;
            font-weight: bold;
            color: #42a5f5;
        }
        .total-label {
            font-size: 16px;
            color: #555;
            margin-top: 8px;
        }
        .btn {
            display: inline-block;
            padding: 14px 32px;
            background: #42a5f5;
            color: white;
            border: none;
            border-radius: 40px;
            font-size: 18px;
            text-decoration: none;
            margin-top: 20px;
            transition: 0.3s;
            cursor: pointer;
        }
        .btn:hover {
            background: #3393e0;
            transform: translateY(-2px);
        }
        .logout {
            margin-top: 30px;
            font-size: 14px;
        }
        .logout a {
            color: #42a5f5;
            text-decoration: none;
        }
        .current-time {
            font-size: 14px;
            color: #888;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="dashboard-card">
    <h1>📚 学生管理系统</h1>
    <div class="user-info">
        当前登录：${sessionScope.loginUser.username}
    </div>
    <div class="total-box">
        <div class="total-number">${totalStudents}</div>
        <div class="total-label">学生总数</div>
    </div>
    <a href="${pageContext.request.contextPath}/student/list" class="btn">📖 进入学生管理</a>
    <div class="current-time">
        <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm:ss" />
    </div>
    <div class="logout">
        <a href="${pageContext.request.contextPath}/admin/logout">退出系统</a>
    </div>
</div>
</body>
</html>
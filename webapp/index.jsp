<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }

        body {
            background: linear-gradient(135deg, #42a5f5, #478edf);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .welcome-box {
            background: #fff;
            width: 400px;
            padding: 50px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            text-align: center;
        }

        .welcome-box h1 {
            color: #333;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: #42a5f5;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
            margin: 0 10px;
        }

        .btn:hover {
            background: #3393e0;
        }
    </style>
</head>
<body>
<div class="welcome-box">
    <h1>学生管理系统</h1>
    <a href="${pageContext.request.contextPath}/admin/toLogin" class="btn">登录</a>
    <a href="${pageContext.request.contextPath}/admin/toRegister" class="btn">注册</a>
</div>
</body>
</html>
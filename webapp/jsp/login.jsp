<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录</title>
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

        .login-box {
            background: #fff;
            width: 380px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .input-item {
            margin-bottom: 20px;
        }

        .input-item input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: 0.3s;
        }

        .input-item input:focus {
            border-color: #42a5f5;
            box-shadow: 0 0 0 3px rgba(66,165,245,0.2);
        }

        .code-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .code-box input {
            flex: 1;
        }

        .code-box img {
            height: 42px;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn {
            width: 100%;
            padding: 13px;
            background: #42a5f5;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }

        .btn:hover {
            background: #3393e0;
        }

        .msg {
            text-align: center;
            color: #f56c6c;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .link a {
            color: #42a5f5;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>账号登录</h2>

    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/login" method="post">
        <div class="input-item">
            <input type="text" name="username" placeholder="请输入用户名" required>
        </div>
        <div class="input-item">
            <input type="password" name="password" placeholder="请输入密码" required>
        </div>
        <div class="input-item code-box">
            <input type="text" name="code" placeholder="验证码" required>
            <img src="/kaptcha.jpg" onclick="this.src='/kaptcha.jpg?'+Math.random()">
        </div>
        <button class="btn" type="submit">登录</button>
    </form>

    <div class="link">
        没有账号？<a href="${pageContext.request.contextPath}/admin/toRegister">立即注册</a>
    </div>
</div>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增学生</title>
    <style>
        * {margin: 0;padding: 0;box-sizing: border-box;font-family: "Microsoft YaHei", sans-serif;}
        body {background: linear-gradient(135deg, #42a5f5, #478edf);height: 100vh;display: flex;align-items: center;justify-content: center;}
        .form-box {background: #fff;width: 400px;padding: 40px;border-radius: 16px;box-shadow: 0 10px 30px rgba(0,0,0,0.15);}
        h2 {text-align: center;margin-bottom: 30px;color: #333;}
        .input-item {margin-bottom: 20px;}
        .input-item input,
        .input-item select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            background: white;
        }
        .input-item input:focus,
        .input-item select:focus {
            border-color: #42a5f5;
            box-shadow: 0 0 0 3px rgba(66,165,245,0.2);
        }
        .btn {width: 100%;padding: 13px;background: #42a5f5;color: white;border: none;border-radius: 8px;font-size: 16px;cursor: pointer;}
        .btn:hover {background: #3393e0;}
        .back-link {display: block;text-align: center;margin-top: 20px;color: #42a5f5;text-decoration: none;}
        .msg {color: red;text-align: center;margin-bottom: 15px;}
    </style>
</head>
<body>
<div class="form-box">
    <h2>新增学生</h2>
    <form action="${pageContext.request.contextPath}/student/add" method="post">
        <div class="input-item">
            <input type="text" name="stuName" placeholder="姓名" required>
        </div>
        <div class="input-item">
            <select name="gender" required>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="input-item">
            <input type="number" name="age" placeholder="年龄" required>
        </div>
        <div class="input-item">
            <input type="text" name="stuClass" placeholder="班级" required>
        </div>
        <button class="btn" type="submit">提交</button>
    </form>
    <a href="${pageContext.request.contextPath}/student/list" class="back-link">返回列表</a>
</div>
</body>
</html>
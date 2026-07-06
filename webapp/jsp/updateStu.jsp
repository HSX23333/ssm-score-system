<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑学生</title>
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
    <h2>编辑学生</h2>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/student/update" method="post">
        <input type="hidden" name="id" value="${stu.id}">
        <div class="input-item">
            <input type="text" name="stuName" value="${stu.stuName}" required>
        </div>
        <div class="input-item">
            <select name="gender">
                <option value="男" ${stu.gender == '男' ? 'selected' : ''}>男</option>
                <option value="女" ${stu.gender == '女' ? 'selected' : ''}>女</option>
            </select>
        </div>
        <div class="input-item">
            <input type="number" name="age" value="${stu.age}" required>
        </div>
        <div class="input-item">
            <input type="text" name="stuClass" value="${stu.stuClass}" required>
        </div>
        <button class="btn" type="submit">保存修改</button>
    </form>
    <a href="${pageContext.request.contextPath}/student/list" class="back-link">返回列表</a>
</div>
</body>
</html>
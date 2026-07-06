<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改成绩</title>
    <style>
        * {margin:0;padding:0;box-sizing:border-box;font-family:"Microsoft YaHei",sans-serif;}
        body {background:linear-gradient(135deg,#42a5f5,#478edf);height:100vh;display:flex;align-items:center;justify-content:center;}
        .form-box {background:#fff;width:400px;padding:40px;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,0.15);}
        h2 {text-align:center;margin-bottom:30px;color:#333;}
        .input-item {margin-bottom:20px;}
        .input-item input {width:100%;padding:12px 15px;border:1px solid #ddd;border-radius:8px;font-size:15px;outline:none;}
        .input-item input:focus {border-color:#42a5f5;box-shadow:0 0 0 3px rgba(66,165,245,0.2);}
        .input-item input:read-only {background:#f5f5f5;cursor:not-allowed;}
        .btn {width:100%;padding:13px;background:#42a5f5;color:white;border:none;border-radius:8px;font-size:16px;cursor:pointer;}
        .btn:hover {background:#3393e0;}
        .back-link {display:block;text-align:center;margin-top:20px;color:#42a5f5;text-decoration:none;}
    </style>
</head>
<body>
<div class="form-box">
    <h2>修改成绩</h2>
    <form action="${pageContext.request.contextPath}/score/update" method="post">
        <input type="hidden" name="id" value="${score.id}">
        <input type="hidden" name="stuId" value="${stuId}">
        <div class="input-item">
            <label>课程名称</label>
            <input type="text" value="${score.course}" readonly disabled>
            <input type="hidden" name="course" value="${score.course}">
        </div>
        <div class="input-item">
            <label>分数</label>
            <input type="number" step="0.1" name="score" value="${score.score}" required>
        </div>
        <button class="btn" type="submit">保存修改</button>
    </form>
    <a href="${pageContext.request.contextPath}/score/list?stuId=${stuId}" class="back-link">返回列表</a>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增成绩</title>
    <style>
        * {margin:0;padding:0;box-sizing:border-box;font-family:"Microsoft YaHei",sans-serif;}
        body {background:linear-gradient(135deg,#42a5f5,#478edf);height:100vh;display:flex;align-items:center;justify-content:center;}
        .form-box {background:#fff;width:400px;padding:40px;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,0.15);}
        h2 {text-align:center;margin-bottom:30px;color:#333;}
        .input-item {margin-bottom:20px;}
        .input-item input {width:100%;padding:12px 15px;border:1px solid #ddd;border-radius:8px;font-size:15px;outline:none;}
        .input-item input:focus {border-color:#42a5f5;box-shadow:0 0 0 3px rgba(66,165,245,0.2);}
        .btn {width:100%;padding:13px;background:#42a5f5;color:white;border:none;border-radius:8px;font-size:16px;cursor:pointer;}
        .btn:hover {background:#3393e0;}
        .back-link {display:block;text-align:center;margin-top:20px;color:#42a5f5;text-decoration:none;}
        .msg {color:red;text-align:center;margin-bottom:15px;}
    </style>
</head>
<body>
<div class="form-box">
    <h2>新增成绩</h2>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/score/add" method="post">
        <input type="hidden" name="stuId" value="${stuId}">
        <div class="input-item">
            <input type="text" name="course" placeholder="课程名称" required>
        </div>
        <div class="input-item">
            <input type="number" step="0.1" name="score" placeholder="分数" required>
        </div>
        <button class="btn" type="submit">提交</button>
    </form>
    <a href="${pageContext.request.contextPath}/score/list?stuId=${stuId}" class="back-link">返回列表</a>
</div>
</body>
</html>
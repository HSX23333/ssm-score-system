<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成绩列表</title>
    <style>
        * {margin:0;padding:0;box-sizing:border-box;font-family:"Microsoft YaHei",sans-serif;}
        body {background:linear-gradient(135deg,#42a5f5,#478edf);padding:30px;}
        .container {max-width:1000px;margin:0 auto;background:#fff;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,0.15);padding:30px;}
        h2 {margin-bottom:20px;color:#333;}
        .top-bar {display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;}
        .btn {padding:8px 16px;background:#42a5f5;color:white;border:none;border-radius:6px;text-decoration:none;font-size:14px;cursor:pointer;}
        .btn:hover {background:#3393e0;}
        .btn-danger {background:#f56c6c;}
        .btn-danger:hover {background:#dd6161;}
        table {width:100%;border-collapse:collapse;}
        th,td {padding:12px;text-align:center;border-bottom:1px solid #eee;}
        th {background:#f5f7fa;color:#666;}
    </style>
</head>
<body>
<div class="container">
    <div class="top-bar">
        <h2>成绩列表</h2>
        <a href="${pageContext.request.contextPath}/score/toAdd?stuId=${stuId}" class="btn">新增成绩</a>
    </div>
    <table>
        <thead>
        <tr><th>ID</th><th>课程</th><th>分数</th><th>操作</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${scoreList}" var="score" varStatus="status">
            <tr>
                <td>${score.id}</td>
                <td>${score.course}</td>
                <td>${score.score}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/score/toUpdate?id=${score.id}&stuId=${stuId}" class="btn">编辑</a>
                    <a href="${pageContext.request.contextPath}/score/delete?id=${score.id}&stuId=${stuId}" class="btn btn-danger" onclick="return confirm('确定删除？')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin-top:20px;">
        <a href="${pageContext.request.contextPath}/student/list" class="btn">返回学生列表</a>
    </div>
</div>
</body>
</html>
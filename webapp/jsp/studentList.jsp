<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生列表</title>
    <style>
        * {margin: 0;padding: 0;box-sizing: border-box;font-family: "Microsoft YaHei", sans-serif;}
        body {background: #f0f2f5;padding: 30px;}
        .container {max-width: 1200px;margin: 0 auto;background: #fff;padding: 30px;border-radius: 16px;box-shadow: 0 4px 12px rgba(0,0,0,0.08);}
        h2 {margin-bottom: 20px;color: #333;}
        .top-bar {display: flex;justify-content: space-between;align-items: center;margin-bottom: 20px;}
        .btn {padding: 8px 16px;background: #42a5f5;color: white;border: none;border-radius: 6px;text-decoration: none;font-size: 14px;cursor: pointer;transition: 0.3s;}
        .btn:hover {background: #3393e0;}
        .btn-danger {background: #f56c6c;}
        .btn-danger:hover {background: #dd6161;}
        table {width: 100%;border-collapse: collapse;}
        table th, table td {padding: 12px;text-align: center;border-bottom: 1px solid #eee;}
        table th {background: #f5f7fa;color: #666;}
        table tr:hover {background: #f9fafc;}
        .empty-tip {text-align:center; padding: 40px; font-size: 16px;}
        .empty-tip-warning {color: #ff6b6b;}
        .empty-tip-info {color: #999;}
    </style>
</head>
<body>
<div class="container">
    <div class="top-bar">
        <h2>学生列表</h2>
        <div>
            <a href="${pageContext.request.contextPath}/dashboard" class="btn">返回首页</a>
            <form action="${pageContext.request.contextPath}/student/list" method="get" style="display:inline;">
                <input type="text" name="keyword" placeholder="输入ID/姓名搜索" value="${keyword}" style="padding:6px 12px; border-radius:4px; border:1px solid #ddd;">
                <button type="submit" class="btn" style="padding:6px 12px;">搜索</button>
                <a href="${pageContext.request.contextPath}/student/list" class="btn">刷新</a>
                <a href="${pageContext.request.contextPath}/student/toAdd" class="btn">添加学生</a>
            </form>
        </div>
    </div>

    <table>
        <thead>
            <tr><th>学生ID</th><th>姓名</th><th>性别</th><th>年龄</th><th>班级</th><th>操作</th></tr>
        </thead>
        <tbody>
            <c:forEach items="${stuList}" var="stu" varStatus="status">
                <tr>
                    <td>${stu.id}</td>
                    <td>${stu.stuName}</td>
                    <td>${stu.gender}</td>
                    <td>${stu.age}</td>
                    <td>${stu.stuClass}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/student/toUpdate?id=${stu.id}" class="btn">编辑</a>
                        <a href="${pageContext.request.contextPath}/student/delete?id=${stu.id}" class="btn btn-danger" onclick="return confirm('确定删除？')">删除</a>
                        <a href="${pageContext.request.contextPath}/score/list?stuId=${stu.id}" class="btn">成绩管理</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty stuList}">
        <c:choose>
            <c:when test="${not empty keyword}">
                <div class="empty-tip empty-tip-warning">⚠️ 未找到与“${keyword}”相关的学生，请检查ID或姓名是否正确。</div>
            </c:when>
            <c:otherwise>
                <div class="empty-tip empty-tip-info">📭 暂无学生数据，请点击“添加学生”进行添加。</div>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>
</body>
</html>
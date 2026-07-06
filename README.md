# SSM学生成绩管理系统
## 技术栈
后端：Spring + SpringMVC + MyBatis | Maven | MySQL
前端：JSP + Bootstrap + jQuery + Ajax
工具：Tomcat、MD5加密、登录拦截器

## 项目功能
1. 登录权限控制：拦截器未登录自动跳转登录页，验证码刷新
2. 学生管理：新增、编辑、删除、模糊搜索学生信息
3. 成绩管理：录入成绩、修改成绩、数据列表渲染
4. 表单校验、删除弹窗确认、防止重复提交
5. 数据库三张关联表：admin管理员、student学生、score成绩，外键级联操作
6. 标准分层架构：entity实体→mapper映射→service业务层（事务注解）→controller控制层

## 本地运行步骤
1. 导入MySQL，执行根目录 `score.sql` 初始化数据表
2. 修改 db.properties 数据库账号密码为本地MySQL配置
3. Maven加载依赖，Tomcat8/9部署项目
4. 浏览器访问本地localhost端口登录

## 补充说明
本项目为前后端一体后台管理系统，无线上在线预览，仅支持本地Tomcat运行。

# SSM学生成绩管理系统
## 技术栈
后端：Spring + SpringMVC + MyBatis | Maven | MySQL
前端：JSP + Bootstrap + jQuery + Ajax
服务器：Tomcat 8.5/9
附加功能：登录拦截器、验证码、表单校验、事务管理

## 项目模块分层
1. entity：管理员、学生、成绩实体类
2. mapper：MyBatis数据库映射接口与xml
3. service：业务逻辑层，添加事务注解
4. controller：请求控制层，处理前端交互
5. webapp：所有JSP页面、css/js图片静态资源

## 核心功能
1. 权限拦截：未登录用户自动跳转登录页面，验证码刷新验证
2. 学生信息管理：新增、编辑、删除、关键词模糊查询
3. 成绩数据管理：成绩录入、修改、批量列表渲染
4. 交互优化：删除二次弹窗确认、表单实时校验、防止重复提交
5. 数据库设计：admin/student/score三张关联表，支持外键级联增删改查

## 本地部署运行步骤
1. MySQL执行根目录 `admin.sql`、`student.sql`、`score.sql` 初始化数据表
2. 修改 `resources/db.properties` 内MySQL账号、密码、端口为本地配置
3. Maven自动加载pom.xml全部依赖
4. Tomcat部署项目，启动后访问本地localhost端口进入登录页

## 补充说明
本系统为前后端一体后台管理项目，依赖Java+MySQL环境，无线上静态预览地址，仅支持本地Tomcat运行。

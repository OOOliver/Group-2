# Group-2
We decide to build a web service which can send the information of user’s account. There will be two choices namely “sign-in” and “sign-up”. When you sign in, the web service can send and get the information which will be used to check the authority of users. When you sign up, the web service can transmit the information so that information can be recorded by the service. 
一、部署环境 
操作系统：windows XP及以上
JDK：JDK6.0及以上；
数据库：Mysql5.0及以上；
应用服务器：Tomcat6.0及以上；
二、部署流程 
1. 安装Java运行环境JDK，添加环境变量： 
(1) 选择【新建系统变量】--弹出“新建系统变量”对话框，在“变量名”文本框输入“JAVA_HOME”,在“变量值”文本框输入JDK的安装路径
(2) 在“系统变量”选项区域中查看PATH变量，如果不存在，则新建变量 PATH，否则选中该变量，单击“编辑”按钮，在“变量值”文本框的起始位置添加 %JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;
(3) 在“系统变量”选项区域中查看CLASSPATH 变量，如果不存在，则新建变量CLASSPATH，否则选中该变量，单击“编辑”按钮，在“变量值”文本框的起始位置添加 .;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
2. 安装Mysql数据库，创建数据库plantdata，其中字符编码为： 字符集： utf8 -- UTF-8 Unicode 整理：utf8_general_ci 让后再将plantdata文件夹中的文件导入数据库
3. 安装Tomcat
4. 将flora文件夹拷贝到%Tomcat安装目录%\webapps\文件夹下，也即： %Tomcat安装目录%\webapps\flora
5. 在\webapps\flora\WEB-INF\classes\文件夹下打开hibernate.cfg.xml，将如下内容：
<property name="connection.username">root</property> 中的root替换为本地Mysql的名称，将如下内容 <property name="connection.password">XXXX</property> 中的XXXX替换为本地Mysql数据库的密码

# Group-2
We decide to build a web service which can send the information of user’s account. There will be two choices namely “sign-in” and “sign-up”. When you sign in, the web service can send and get the information which will be used to check the authority of users. When you sign up, the web service can transmit the information so that information can be recorded by the service. 
1. 开发环境：(1).myeclipse10    (2).myeclipse自带的 tomcat    (3).jdk1.7     (4)maven3.2.1
2. 给myeclipse配置以上环境
3. 把所有项目导入到myeclipse中
4. 启动3个服务，dubbo服务采用是的main方法发布的，每个服务中都有一个服务启动类 和项目名对应 Provider  Provider2  Provider3
5.把dubbo-consumer-web加入到tomcat中启动
5.访问路径  http://localhost:8080/dubbo-consumer-web/index.jsp

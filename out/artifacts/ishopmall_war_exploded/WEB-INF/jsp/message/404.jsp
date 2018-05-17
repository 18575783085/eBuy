<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
  	<style type="text/css">
  		body{
  			text-align: center;
  		}
  		a{
  			 text-decoration:none; 
  		}
  	</style>
  </head>
  <body>
  	<img src="${appPath}/images/error/404.jpg" />
  	<a href="${appPath }/index.jsp">回到个人中心</a>
  	<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
		<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
		href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/login.css">
<style>
</style>
</head>
<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">
						<div class="navbar-header">
								<div>
										<a class="navbar-brand" href="index.html"
												style="font-size: 32px;">铭圆学校平台</a>
												<shiro:user>
													<jsp:forward page="/showMain"></jsp:forward>
												</shiro:user>
								</div>
						</div>
				</div>
		</nav>
		
		<div class="container">
				<form class="form-signin" role="form" action="${APP_PATH}/user/login" id="login_form">
						<h2 class="form-signin-heading">
								<i class="glyphicon glyphicon-user"></i> 用户登录
						</h2>
						<div class="form-group has-success has-feedback">
								<input type="text" class="form-control" id="login_userName"
										placeholder="请输入登录账号" autofocus name="username"> <span
										class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="form-group has-success has-feedback">
								<input type="text" class="form-control" id="login_password"
										name="password" placeholder="请输入登录密码"
										style="margin-top: 10px;"> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="form-group has-success has-feedback">
								<select class="form-control">
										<option value="member">会员</option>
										<option value="user">管理</option>
								</select>
						</div>
						<div class="checkbox">
								<label> <input type="checkbox" value="remember-me">
										记住我
								</label> <br> <label> 忘记密码 </label> <label style="float: right">
										<a href="${APP_PATH}/showReg">我要注册</a>
								</label>
						</div>
						<a class="btn btn-lg btn-success btn-block" onclick="dologin()">
								登录</a>
				</form>
		</div>
		<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
		<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
		<script>
			function dologin() {
				var name = $("#login_userName").val();
				var password = $("#login_password").val();
				if (name == "") {
					alert("用户名不能是空");
					return;
				}
				if (password == "") {
					alert("密码不能是空");
					return;
				}
				$("#login_form").submit();
				/*  var type = $(":selected").val();
				 if ( type == "user" ) {
				     window.location.href = "main.html";
				 } else {
				     window.location.href = "member.html"; }*/
			}
		</script>
</body>
</html>
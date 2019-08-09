<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
		href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
</head>
<body>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="${APP_PATH}/user/showUser">数据列表</a></li>
				  <li class="active">修改</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" action="reg" method="post" id="editForm">
				  <div class="form-group">
					<label for="editForm_lastName">用户名称</label>
					<input type="text" class="form-control" id="editForm_lastName" name="lastName" placeholder="请输入用户名称">
				  <a></a>
				  </div>
				  <div class="form-group">
					<label for="editForm_password">初始密码</label>
					<input type="text" class="form-control" id="editForm_password" name="password" placeholder="请输入初始化密码">
					<p class="help-block label label-warning">密码为6-15位的英文字母数字和_,例如： xx_xx_111</p><a></a>
				  </div>
				  <div class="form-group">
					<label for="editForm_phone">电话</label>
					<input type="text" class="form-control" id="editForm_phone" name="phone" placeholder="请输入联系电话"">
				  <a></a>
				  </div>
				  <div class="form-group">
					<label for="editForm_email">邮箱地址</label>
					<input type="email" class="form-control" id="editForm_email" name="email"  placeholder="请输入邮箱地址">
					<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p><a></a>
				  </div>
				  <button type="button" class="btn btn-success" id="editForm_submit"><i class="glyphicon glyphicon-plus"></i> 修改</button>
				</form>
			  </div>
			</div>
        </div>
		<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
		<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
		<script src="${APP_PATH}/script/docs.min.js"></script>
		<script type="text/javascript">
			
		</script>
</body>
</html>
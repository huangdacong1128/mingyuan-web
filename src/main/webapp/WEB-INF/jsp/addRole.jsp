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
				  <li class="active">新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" action="${APP_PATH}/role/addrole" method="post" id="addrole">
				  <div class="form-group">
					<label for="addForm_userName">角色的名称</label>
					<input type="text" class="form-control" id="addRoleName" name="roleName" placeholder="请输入角色的名称">
				  	<p class="help-block label label-warning">角色的名称为2-15位字符, 格式为： zhangsan123</p><a></a>				  
				  <button type="button" class="btn btn-success" id="addForm_submit"><i class="glyphicon glyphicon-plus"></i> 新增</button>
				  <button type="button" class="btn btn-danger" id="addForm_reset"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
				</form>
			  </div>
			</div>
        </div>
		<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
		<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
		<script src="${APP_PATH}/script/docs.min.js"></script>
		<script type="text/javascript">	
		$("#addForm_submit").click(function(){
			$("#addrole").submit();
		});
		</script>
</body>
</html>
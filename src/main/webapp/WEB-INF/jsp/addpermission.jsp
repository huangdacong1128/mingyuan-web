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
				<form role="form" action="${APP_PATH}/pm/add_permission" method="post" id="add_permission_form">
				  <div class="form-group">
					<label >权限的名称</label>
					<input type="text" class="form-control"  name="permission" placeholder="请输入权限的名称">
				  	<p class="help-block label label-warning">权限的名称为2-15位英文字符和下划线, 格式为：add_student </p><a></a>	
				  </div>	
				  <div class="form-group">
					<label >权限的描述</label>
					<input type="text" class="form-control"  name="power_name" placeholder="请输入权限的描述">
				  	<p class="help-block label label-warning">权限的描述为2-15位字符, 格式为： 添加课程</p><a></a>	
				  	</div>		  
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
			$("#add_permission_form").submit();
		});
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
		href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}
</style>
</head>
<body>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
						<li><a href="#">首页</a></li>
						<li><a href="#">数据列表</a></li>
						<li class="active">分配角色</li>
				</ol>
				<div class="panel panel-default">
						<div class="panel-body">
								<form role="form" class="form-inline">
								<input type="hidden" value="${userId}" name="userId">
										<div class="form-group">
												<label for="exampleInputPassword1">未分配角色列表</label><br>
												<select class="form-control" multiple size="10"
														style="width: 100px; overflow-y: auto;" id="unRoles">													
												</select>
										</div>
										<div class="form-group">
												<ul>
														<li
																class="btn btn-default glyphicon glyphicon-chevron-right" id="inRole"></li>
														<br>
														<li
																class="btn btn-default glyphicon glyphicon-chevron-left"
																style="margin-top: 20px;" id="outRole"></li>
												</ul>
										</div>
										<div class="form-group" style="margin-left: 40px;">
												<label for="exampleInputPassword1">已分配角色列表</label><br>
												<select class="form-control" multiple size="10"
														style="width: 100px; overflow-y: auto;" id="roles">								
												</select>
										</div>
								</form>
						</div>
				</div>
		</div>
		<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
		<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
		<script src="${APP_PATH}/script/docs.min.js"></script>
		<script type="text/javascript">
		$(function() {
			selectBuild();
		});
		function selectBuild() {
			var userId=$("form>input[name='userId']").val();
			$.ajax({
				url : "${APP_PATH}/user/showUserRole",
				data : "userId=" + userId,
				dataType : "json",
				type : "GET",
				success : function(result) {
					build_role_option(result);
				}
			})			
		}
		function build_role_option(result) {
			
			$("#unRoles").empty();
			$("#roles").empty();
			
			var  outUseRoles= result.extend.outUseRoles;
			var  userRoles= result.extend.userRoles;
			$.each(outUseRoles,function(index, item) {
					var roleNameOption= $("<option></option>").text(item.roleName)
																												.val(item.roleId);								
					$("#unRoles").append(roleNameOption);
			});
			$.each(userRoles,function(index, item) {
					var roleOption= $("<option></option>").text(item.roleName)
																												.val(item.roleId);								
					$("#roles").append(roleOption);						
			});
		}		
		//添加角色
		$("#inRole").click(function(){		
			var opts = $("#unRoles :selected");
			var userId=$("form>input[name='userId']").val();
			var roleIds=[];
			$.each(opts,function(index, item) {
					roleIds.push($(item).val());				
			});
    	if (opts.length == 0 ) {
    			alert("请选择需要分配的角色数据");	
    			return;
    		}    	
    	$.ajax({
				url : "${APP_PATH}/user/addUserRole",
				dataType : "json",
				data : "roleIds=" + roleIds +"&userId=" + userId,
				type : "POST",
				success : function(result) {
					
				}
    	    });
    	$("#roles").append(opts);   	
		});	
		//删除角色
		$("#outRole").click(function(){		
			var opts = $("#roles :selected");
			var userId=$("form>input[name='userId']").val();
			var roleIds=[];
			$.each(opts,function(index, item) {
				roleIds.push($(item).val());				
			});
    	if (opts.length == 0 ) {
    			alert("请选择需要删除的角色");	
    			return;
    		}    	
    	$.ajax({
				url : "${APP_PATH}/user/deleteUserRole",
				dataType : "json",
				data : "roleIds=" + roleIds +"&userId=" + userId,
				type : "POST",
				success : function(result) {
					
				}
    	    });
    	$("#unRoles").append(opts);   	
		});	
		</script>
</body>
</html>
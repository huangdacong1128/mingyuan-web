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
								<input type="hidden" value="${roleId}" name="roleId">
										<div class="form-group">
												<label for="exampleInputPassword1">未分配权限</label><br>
												<select class="form-control" multiple size="10"
														style="width: 100px; overflow-y: auto;" id="outPermission">													
												</select>
										</div>
										<div class="form-group">
												<ul>
														<li
																class="btn btn-default glyphicon glyphicon-chevron-right" id="in_btn" ></li>
														<br>
														<li
																class="btn btn-default glyphicon glyphicon-chevron-left"
																style="margin-top: 20px;" id="out_btn"></li>
												</ul>
										</div>
										<div class="form-group" style="margin-left: 40px;">
												<label for="exampleInputPassword1">已分配权限</label><br>
												<select class="form-control" multiple size="10"
														style="width: 100px; overflow-y: auto;" id="inPermission">								
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
			var roleId=$("form>input[name='roleId']").val();
			$.ajax({
				url : "${APP_PATH}/role/show_role_p",
				data : "roleId=" + roleId,
				dataType : "json",
				type : "GET",
				success : function(result) {
					build_permission_option(result);
				}
			})			
		}
		function build_permission_option(result) {
			
			$("#outPermission").empty();
			$("#inPermission").empty();
			
			var  outPermissions= result.extend.outPermission;
			var  inPermissions= result.extend.inPermission;
			$.each(outPermissions,function(index, item) {
					var outPerOption= $("<option></option>").text(item.pname)
																												.val(item.pId);								
					$("#outPermission").append(outPerOption);
			});
			$.each(inPermissions,function(index, item) {
					var inPerOption= $("<option></option>").text(item.pname)
																												.val(item.pId);								
					$("#inPermission").append(inPerOption);						
			});
		}		
		//添加角色
		$("#in_btn").click(function(){		
			var opts = $("#outPermission :selected");
			var roleId=$("form>input[name='roleId']").val();
			var pIds=[];
			$.each(opts,function(index, item) {
				pIds.push($(item).val());				
			});
    	if (opts.length == 0 ) {
    			alert("请选择需要分配的权限");	
    			return;
    		}    	
    	$.ajax({
				url : "${APP_PATH}/role/add_role_p",
				dataType : "json",
				data : "pIds=" + pIds +"&roleId=" + roleId,
				type : "POST",
				success : function(result) {
					
				}
    	    });
    	$("#inPermission").append(opts);   	
		});	
		//删除角色
		$("#out_btn").click(function(){		
			var opts = $("#inPermission :selected");
			var roleId=$("form>input[name='roleId']").val();
			var pIds=[];
			$.each(opts,function(index, item) {
				pIds.push($(item).val());				
			});
    	if (opts.length == 0 ) {
    			alert("请选择需要权限");	
    			return;
    		}    	
    	$.ajax({
				url : "${APP_PATH}/role/delete_role_p",
				dataType : "json",
				data : "pIds=" + pIds +"&roleId=" + roleId,
				type : "POST",
				success : function(result) {
					
				}
    	    });
    	$("#outPermission").append(opts);   	
		});	
		</script>
</body>
</html>
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
				<div class="panel panel-default">
						<div class="panel-heading">
								<h3 class="panel-title">
										<i class="glyphicon glyphicon-th"></i> 数据列表
								</h3>
						</div>
						<div class="panel-body">
								<form class="form-inline" role="form" style="float: left;">
										<div class="form-group has-feedback">
												<div class="input-group">
														<div class="input-group-addon">查询条件</div>
														<input class="form-control has-success" type="text"
																placeholder="请输入查询条件">
												</div>
										</div>
										<button type="button" class="btn btn-warning">
												<i class="glyphicon glyphicon-search"></i> 查询
										</button>
								</form>
								<button type="button" class="btn btn-danger"
										style="float: right; margin-left: 10px;">
										<i class=" glyphicon glyphicon-remove"></i> 删除
								</button>
								<button type="button" class="btn btn-primary"
										style="float: right;"
										onclick="window.location.href='${APP_PATH}/addRole'">
										<i class="glyphicon glyphicon-plus"></i> 新增
								</button>
								<br>
								<hr style="clear: both;">
								<div class="table-responsive">
										<table class="table  table-bordered" id="permission_list">
												<thead>
														<tr>
																<th width="30">#</th>
																<th width="30"><input type="checkbox"></th>
																<th>名称</th>
																<th width="100">操作</th>
														</tr>
												</thead>
												<tbody>												
														<tr>
																<td>8</td>
																<td><input type="checkbox"></td>
																<td>CMO / CMS - 配置管理员</td>
																<td>
																		<button type="button" class="btn btn-success btn-xs">
																				<i class=" glyphicon glyphicon-check"></i>
																		</button>
																		<button type="button" class="btn btn-primary btn-xs">
																				<i class=" glyphicon glyphicon-pencil"></i>
																		</button>
																		<button type="button" class="btn btn-danger btn-xs">
																				<i class=" glyphicon glyphicon-remove"></i>
																		</button>
																</td>
														</tr>
												</tbody>
											
										</table>
								</div>
						</div>
				</div>
		</div>
		<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
		<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
		<script src="${APP_PATH}/script/docs.min.js"></script>	
		<script type="text/javascript">
		$(function() {
			var pageNo = 1;
			to_page(pageNo,name);
		});
		function to_page(pageNo,name) {
			$.ajax({
				url : "${APP_PATH}/pm/show_all_p",
				dataType : "json",
				type : "GET",
				success : function(result) {
					build_role_table(result);
				}
			})			
		}
		function build_role_table(result) {
			// 清空table表格
			$("#permission_list>tbody").empty();
			var permissions = result.extend.permission;
			$.each(permissions,function(index, item) {
								var checkTd = $("<td><input type='checkbox' name='checks'></td>")
								var pIdTd = $("<td></td>").append(item.pId);
								var pNameTd = $("<td></td>").append(item.pname);
								var bntTd = $("<td></td>").append();
								bntTd.append("<button type='button'  class='btn btn-success btn-xs'> <i class=' glyphicon glyphicon-check'> </i> </button>&nbsp");
								bntTd.append("<button type='button'  class='btn btn-primary btn-xs'> <i class=' glyphicon glyphicon-pencil'> </i> </button>&nbsp");
								bntTd.append("<button type='button'  class='btn btn-danger btn-xs'> <i class=' glyphicon glyphicon-remove'> </i> </button>");
								$("<tr></tr>").append(pIdTd)
															 .append(checkTd)
															 .append(pNameTd)
															 .append(bntTd)
															 .appendTo("#permission_list>tbody");
							});
			//注册编辑按钮
			//editUser();
			//assignRole();
			//注册删除按钮
		/* 	table_deleteClick(); */
		}		
		</script>
</body>
</html>
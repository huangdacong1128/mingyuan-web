<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
</style>
</head>
<body>
	<input type="hidden" name="pageNumMax" value="${PageMax}">
	<input type="hidden" name="termPram">
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
										onclick="window.location.href='showAdd'">
										<i class="glyphicon glyphicon-plus"></i> 新增
								</button>
								<br>
								<hr style="clear: both;">
								<div class="table-responsive">
										<table class="table  table-bordered" id="user_list">
												<thead>
														<tr>
																<th width="30">#</th>
																<th width="30"><input type="checkbox"></th>
																<th>账号</th>
																<th>名称</th>
																<th>电话</th>
																<th width="100">操作</th>
														</tr>
												</thead>
												<tbody>
														<tr>
																<td>16</td>
																<td><input type="checkbox"></td>
																<td>sodales</td>
																<td>ligula</td>
																<td>in</td>
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
												<tfoot>
														<tr>
																<td colspan="6" align="center" id="page_info_total">																												
																</td>
														</tr>
												</tfoot>
										</table>
										<div class="col-md-4 col-md-offset-8">
											<nav aria-label="...">
										<ul class="pagination" id="page_info_show">												
										</ul>
								</nav>
						</div>
								</div>
						</div>
				</div>
		</div>
		<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
		<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
		<script src="${APP_PATH}/script/docs.min.js"></script>
		<script type="text/javascript">
			var currentPage;
			var totalItem;
			$(function() {
				var pageNum = $("body>input[name='pageNumMax']").val();
				var pageNo = 1;
				if(pageNum!=""){
					pageNo=pageNum
				}			
				var name = $("body>input[name='termPram']").val();
				to_page(pageNo,name);
			});
			function to_page(pageNo,name) {
				$.ajax({
					url : "${APP_PATH}/user/listUser",
					data : "pageNo=" + pageNo +"&name=" + name,
					dataType : "json",
					type : "GET",
					success : function(result) {
						build_student_table(result);
						build_page_info(result);
					}
				});		
			}
			//显示学生表格内容
			function build_student_table(result) {
				// 清空table表格
				$("#user_list>tbody").empty();
				var users = result.extend.PageInfo.list;
				$.each(users,function(index, item) {
									var checkTd = $("<td><input type='checkbox' name='checks'><input type='hidden' name='address' value='"+item.address+"'></td>")
									var userIdTd = $("<td></td>").append(item.userId);
									var userNameTd = $("<td></td>").append(item.userName);
									var realNameTd = $("<td></td>").append(item.lastName);
									var PhoneTd = $("<td></td>").append(item.phone);
									var bntTd = $("<td></td>").append();
									bntTd.append("<button type='button'  class='btn btn-success btn-xs'> <i class=' glyphicon glyphicon-check'> </i> </button>&nbsp");
									bntTd.append("<button type='button'  class='btn btn-primary btn-xs'> <i class=' glyphicon glyphicon-pencil'> </i> </button>&nbsp");
									bntTd.append("<button type='button'  class='btn btn-danger btn-xs'> <i class=' glyphicon glyphicon-remove'> </i> </button>");
									$("<tr></tr>").append(userIdTd)
																 .append(checkTd)
																 .append(userNameTd)
																 .append(realNameTd)
																 .append(PhoneTd)
																 .append(bntTd)
																 .appendTo("#user_list>tbody");
								});
				//注册编辑按钮
				editUser();
				assignRole();
				//注册删除按钮
			/* 	table_deleteClick(); */
			}		
			// 显示分页信息
			function build_page_info(result) {
				var pageInfo = result.extend.PageInfo;
				//记录当前的页的号码
				currentPage=pageInfo.pageNum;
				//记录总的记录数
				totalItem=pageInfo.total;
				
				// 清空ul
				$("#page_info_total").empty();
				$("#page_info_total").append("当前" + pageInfo.pageNum + "页 , 共" + pageInfo.pages + "页,总共"+ pageInfo.total + "条记录");
				var ul = $("#page_info_show");
				ul.empty();
				var firstLi = $("<li><button value='1'  class='btn btn-default btn-sm'>首页</button></li>");
				ul.append(firstLi);
				if (pageInfo.hasPreviousPage) {
					var pre = parseInt(pageInfo.pageNum) - 1;
					var previousPageLi = $("<li><button value='" + pre+ "' class='btn btn-default btn-sm' > &laquo;</button></li>");
					ul.append(previousPageLi);
				}
				// 遍历需要显示的页号
				$.each(pageInfo.navigatepageNums, function(index, item) {
					var li = $("<li></li>").append(
							"<button value='" + item + "' class='btn btn-default btn-sm'>"+ item + "</button>")
					if (pageInfo.pageNum == item) {
						li.addClass("active");
					}
					ul.append(li);
				});
				if (pageInfo.hasNextPage) {
					var next = parseInt(pageInfo.pageNum) + 1;
					var hasNextPageLi = $("<li><button value='" + next+ "' class='btn btn-default btn-sm'> &raquo;</button></li>");
					ul.append(hasNextPageLi);
				}
				var lastLi = $("<li><button value='" + pageInfo.pages+ "' class='btn btn-default btn-sm'>末页</button></li>");
				ul.append(lastLi);
				pageClick(); 
			}
			
			function pageClick(){
				$("#page_info_show>li").click(function() {
					var term = $("body>input[name='termPram']").val();
					var pageNo = $(this).children("button").val();
					to_page(pageNo,term);
					return false;
				});
			}
			function assignRole(){
				$("tbody .btn-success").click(function(){
					var userId= $(this).parent().siblings().html();
			    window.location.href = "assignRole?userId="+userId;
			       });
			}
			 function editUser(){
				 $("tbody .btn-primary").click(function() {
					 //var userId= $(this).parent().children("td").html();
					 var userId= $(this).parent().siblings().html();
					 //alert(userId);
					 window.location.href = "editUser?userId="+userId;
				});
			 }	      			
		</script>
</body>
</html>
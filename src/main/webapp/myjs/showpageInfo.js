function build_student_table(result) {
				// 清空table表格
				$("#user_list>tbody").empty();
				var users = result.extend.PageInfo.list;
				$.each(users,function(index, item) {
									var checkTd = $("<td><input type='checkbox' name='checks'></td>")
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
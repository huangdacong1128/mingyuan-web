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
				<form role="form" action="reg" method="post" id="addForm">
				  <div class="form-group">
					<label for="addForm_userName">登陆账号</label>
					<input type="text" class="form-control" id="addForm_userName" name="userName" placeholder="请输入登陆账号">
				  	<p class="help-block label label-warning">登录名为2-15位的英文字母和数字, 格式为： zhangsan123</p><a></a>
				  </div>
				  <div class="form-group">
					<label for="addForm_lastName">用户名称</label>
					<input type="text" class="form-control" id="addForm_lastName" name="lastName" placeholder="请输入用户名称">
				  <a></a>
				  </div>
				  <div class="form-group">
					<label for="addForm_password">初始密码</label>
					<input type="text" class="form-control" id="addForm_password" name="password" placeholder="请输入初始化密码">
					<p class="help-block label label-warning">密码为6-15位的英文字母数字和_,例如： xx_xx_111</p><a></a>
				  </div>
				  <div class="form-group">
					<label for="addForm_phone">电话</label>
					<input type="text" class="form-control" id="addForm_phone" name="phone" placeholder="请输入联系电话"">
				  <a></a>
				  </div>
				  <div class="form-group">
					<label for="addForm_email">邮箱地址</label>
					<input type="email" class="form-control" id="addForm_email" name="email"  placeholder="请输入邮箱地址">
					<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p><a></a>
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
		
		$("form input[name='userName']").change(function(){
			var nameReg=/^[\w]{2,15}$/
			var userName=$(this).val();
			checkInfo($(this),nameReg,"登录名不合法");	
			checkUserName(userName);		
		});	
		$("form input[name='lastName']").change(function(){
			var realnameReg=/^[\w\u2E80-\u9FFF]{2,10}$/
			checkInfo($(this),realnameReg,"姓名不合法");					
		});								
		//检查年龄是否合法
		$("form input[name='email']").change(function(){
			var emailReg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			checkInfo($(this),emailReg,"email不合法");					
		});
		$("form input[name='password']").change(function(){
			var passwordReg=/^[\w]{6,15}$/;
			checkInfo($(this),passwordReg,"密码不合法");					
		});
		//检查电话是否合法
		$("form input[name='phone']").change(function(){
			var phoneReg=/^[1-9][\d]{4,10}$/;
			checkInfo($(this),phoneReg,"电话号码不合法");					
		});
	
		$("#addForm_submit").click(function(){
			addForm
			var formInfo=$("#addForm").serialize();
			var userName=$("#addForm input[name='userName']").val();
			var realname=$("#addForm input[name='lastName']").val();
			var email=$("#addForm input[name='email']").val();
			var password=$("#addForm input[name='passowrd']").val();
			var phone=$("#addForm input[name='phone']").val();			
			if(checkUserForm(userName,realname,email,password,phone)){
				$("#addForm").submit();
			}else{
				alter("输入的信息不合法");
			}		
		});
		function checkUserForm(userName,realname,email,password,phone){
			var result=false;
			var nameReg=/^[\w]{2,15}$/
			var realnameReg=/^[\w\u2E80-\u9FFF]{2,10}$/
			var emailReg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			var passwordReg=/^[\w]{6,15}$/;
			var phoneReg=/^[1-9][\d]{4,10}$/;
			if(nameReg.test(userName)&&realnameReg.test(realname)&&emailReg.test(email)
					&&passwordReg.test(password)&&phoneReg.test(phone)){
				result=true;
			}
			return result;
		}
		//检查方法的抽取
		function checkInfo(ob,reg,message){
			ob.parent().children("a").empty();
			if(!reg.test(ob.val())){
				ob.parent().children("a").append("<span class='fa fa-times' >"+message+"</span>");
				ob.parent().children("a").children("span").css("color","red");
				return;
			}
			ob.parent().children("a").append("<span class='fa fa-check-square-o'></span>");
			ob.parent().children("a").children("span").css("color","green");
		}
		function checkUserName(userName){
			$.ajax({
				url : "${APP_PATH}/user/checkUserName",
				data : "userName=" + userName,
				type : "POST",
				success : function(result) {
					console.log(result);
					if(result.code==200){
						//console.log(result);
						$("form input[name='userName']").parent().children("a").empty();
						$("form input[name='userName']").parent().children("a").append("<span class='fa fa-check-square-o'>用名已经被注册过</span>");
						$("form input[name='userName']").parent().children("a").children("span").css("color","red");
					}
				}
			})			
		}
		</script>
</body>
</html>
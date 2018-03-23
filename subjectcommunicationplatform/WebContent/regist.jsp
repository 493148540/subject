<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=0.5, minimum-scale=0.5, maximum-scale=0.5, user-scalable=no" />
<!-- base需要放到head中 -->    
    	<base href="<%=basePath%>"> 
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	#refistform input{
		width:300px
	}
	.title{
		line-height:31px;
		background: #F2F2F2;
		margin:0;
		border-bottom: 1px solid #CDCDCD !important;
		border-top: 1px solid #CDCDCD !important;
		padding:10px;
		
	}
	.title h1{
		margin:0;
		font-size:14px
	}
</style>
</head>
<body style="    border: 1px solid #ccc;">
<div class="title">
	<h1>立即注册</h1>
</div>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column" style="padding-left: 30%;padding-top:20px;padding-bottom:20px">
			
			<div>
				<form role="form" id="refistform"action="opened/regist" method="post">
				  <div class="form-group">
				    <label for="name">用户名</label>
				    <input type="text" class="form-control" name="username" placeholder="请输入登录帐号">
				  </div>
				  <div class="form-group">
				    <label for="name">密码</label>
				    <input type="text" class="form-control"  name="password" placeholder="请输入密码">
				  </div>
				  <div class="form-group">
				    <label for="name">确认密码</label>
				    <input type="text" class="form-control"  name="repassword" placeholder="请确认密码">
				  </div>
				  <button type="button" onclick="regist(this)" class="btn btn-default">提交</button>
				</form>
			</div>
			
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
</body>

<script>
function regist(submit){
	//var formdata = new FormData($(submit).parent()[0]);
	$.ajax({
		url:'opened/regist',
		type:'post',
		data:$(submit).parent().serialize(),
		success:function(rsp){
			alert(rsp.message);
		},
		error:function(e){
			alert(JSON.stringify(e));
		}
		
	});
}
$(function(){
	
	
	
})

</script>
</html>
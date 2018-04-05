<!-- 登录注册div -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.loginbox table{
	margin:0px;
}
.loginbox table tr td{
	padding:1px;
	 vertical-align: middle; 
	 border-top: 0px solid #ddd; 
	 
}
.loginbox table .col_1{
	width: 35px; 
}
.loginbox table .col_2{
	width: 30%; 
    height: 23px; 
}
.loginbox table .col_3{
	width: 80px;
	border-right: 1px solid #ddd;  
}
.loginbox table .col_4{
	padding-left:5px
}
.content-loginbox{
	margin-top:10px;
	margin-bottom:10px;
	
	}
.content-loginbox:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
	.content-loginbox input{
	
	border: 1px solid;
    border-color: #848484 #E0E0E0 #E0E0E0 #848484;
    background: #FFF;
	}
	 .content-loginbox table span:hover{ 
	 	    text-decoration: underline;
	 }
.menulist ul{
	width:100%;
	    border-radius: 5px;
	background: linear-gradient(#e9f4f5,white );
	list-style:none;
	margin:0px;
}
.menulist  li{
	float:left;
}
.menulist a{
	color: #607D8B;
    padding: 10px;
    /* margin: 10px; */
    display: block;
}
.menulist  li:hover{ background:#00bcd44a;    cursor: pointer;}

.clearfix { 
          *zoom: 1; 
        } 
        .clearfix:before, .clearfix:after { 
          display: table; 
          line-height: 0; 
          content: ""; 
        } 
        .clearfix:after { 
          clear: both; 
        }
         
	.content{
	}
	.active{
		background-color:#00bcd44a
	}
</style>
<div class="row clearfix">
		<div class="col-md-1 column" >
		</div>
		
		
		<div class="col-md-10 column ">
			<div class="content-loginbox">
			<div style="width:20%;float:left"><img alt="140x140" src="img/logo.png" /></div>
			
			<div style="width:60%;float:right" class="loginbox">
				<%if(session.getAttribute("user")!=null){%>
		<table class="table" style="margin:20px">
			<tbody>
				<tr><td>欢迎,${sessionScope.user.userName}</td>
					<td><a href="javascript:void(0)" onclick="exitlogin()">注销</a></td>
				</tr>
			</tbody>
		</table>
		<%} else{ %>	
				<table class="table" >
					<tbody>
						<tr>
							<td class="col_1" >
								<font>帐号</font>
							</td>
							<td class="col_2">
								<input type="text"  id="userName"  placeholder="请输入帐号">
							</td>
							<td class="col_3">
								<input type="checkbox" ><font>自动登录</font>
							</td>
							<td class="col_4">
								<span style="cursor: pointer;">找回密码</span>
							</td>
						</tr>
						<tr>
							<td class="col_1">
								密码
							</td>
							<td class="col_2">
								<input type="text"  id="userPassword"  placeholder="请输入密码">
							</td>
							<td class="col_3"">
								<button    style="width: 80px;" id="login">登录</button>
							</td>
							<td class="col_4">
								<a style="cursor: pointer;color: #369;font-weight: 700;" class="aurl" href="registview">注册</a>
							</td>
						</tr>
						
					</tbody>
				</table>
				<% }%>
			</div>
			
			</div>
		</div>
		
		<div class="col-md-1 column">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<div  class="menulist">
				<ul class="clearfix">
					<li class="active" id="menulistat1"><a url="index">论坛</a></li>
					<li id="menulistat2"><a href="article">文章</a></li>
					<li id="menulistat3"><a href="fileview">资源</a></li>
					<li id="menulistat4"><a href="video">视频</a></li>
					<li id="menulistat5"><a >测试</a></li>
				</ul>
			</div>
			</div><div class="col-md-1 column">
		</div>
	</div>
	<script>


var exitlogin = function(){
	$.ajax({
		url:'opened/exitlogin',
		type:'post',
		success:function(rsp){
			alert(rsp.message);
			if(rsp.statecode==200){
				window.history.go(0);
			}
		},
		error:function(e){
			alert(JSON.stringify(e));
		}
		
	});
}
$(function(){
	
	
	$('#login').click(function(){
		var username= $('#userName').val();
		var password=$('#userPassword').val();
		
	
		$.ajax({
			url:'opened/login',
			type:'post',
			data:{username:username,password:password},
			success:function(rsp){
				alert(rsp.message);
				if(rsp.statecode==200){
					window.history.go(0);
				}
			},
			error:function(e){
				alert(JSON.stringify(e));
			}
		});
	})
})


</script>
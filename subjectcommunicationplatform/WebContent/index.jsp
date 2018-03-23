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
	padding:10px;
}
.menulist a{
	color:#607D8B;
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
	margin-top: 30px;}
	.active{
		background-color:#00bcd44a
	}
</style>
<script>
      
(function (doc, win) {   
    var docEl = doc.documentElement,   
    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',   
    recalc = function () {   
    var clientWidth = docEl.clientWidth;   
    if (!clientWidth) return;   
    docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';   
};   
if (!doc.addEventListener) return;   
win.addEventListener(resizeEvt, recalc, false);   
doc.addEventListener('DOMContentLoaded', recalc, false);   
})(document, window);   
 

function SetCwinHeight(iframe) {
	if (iframe) {
		var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		if (iframeWin.document.body) {
			iframe.height = (iframeWin.document.documentElement.scrollHeight+200 || iframeWin.document.body.scrollHeight+200);
		}
	}
}
</script>



</head>
<body onhashchange="hashchange()">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column" style="background-color:black">
		</div>
		
		
		<div class="col-md-10 column content-loginbox">
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
								<span style="cursor: pointer;color: #369;font-weight: 700;" class="aurl" url="regist.jsp">注册</span>
							</td>
						</tr>
						
					</tbody>
				</table>
				<% }%>
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
					<li class="active"><span url="#forum">论坛</span></li>
					<li><span url="#article.jsp">文章</span></li>
					<li><span url="#file.jsp">资源</span></li>
					<li><span url="#video.html">视频</span></li>
					<li><span >测试</span></li>
				</ul>
			</div>
			
			<div class="content clearfix">
			
				<!--  <div class="col-md-2 column content-left" style="padding-left: 0;padding-right: 0;">
					<div style="border:1px solid #CCC;"> 这是导航</div>
				</div>-->
				<div class="column content-right" style="padding-right: 0;">
					<iframe id="ifrm" src="forum" scrolling=no   style="border:none;width:100%;">这是正文</iframe>
				</div>
				
			</div>
			
		</div>
		<div class="col-md-1 column">
		</div>
	</div>
	
	
</div>



</body>
<script>
//url哈希改变事件
var hashchange = function(){
		if(location.hash=="")
			return;
		url =location.hash.substring(1,location.hash.length);
		document.getElementById("ifrm").src=url;
	}
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
	//导航菜单点击事件
	$('.menulist li').click(function(){
		$('.menulist ul .active').removeClass('active');
		$(this).addClass('active');
		var hash = $(this).children().attr('url');
		location.hash=hash;
	})
	//页面就绪时执行哈希改变事件
	hashchange();
	
	//我标识为aurl的元素为一个超链接
	$('.aurl').click(function(){
		var hash = $(this).attr('url');
		location.hash = hash;
	})
	
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

</html>
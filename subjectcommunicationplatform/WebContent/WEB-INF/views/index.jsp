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
.menulist  li:hover{
	background:#00bcd44a;	
	cursor: pointer;
}

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
        .querybox{
		    padding: 6px 12px;
		    box-shadow: none;
		    border: 0;
		    border-right: none;
		    border-radius: 5px 0px 0px 5px;
		    outline: 0;
		    width: 100%;
		    height: 34px;
		}
     select.querybox {	    
    border-radius: 0px 5px 5px 0px;
    }
    button.querybox{
    	border-radius:5px
    }  
	.content{
	margin-top: 30px;}
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

function SetCwinHeight()
{
    var iframeid=document.getElementById("iframeid"); //iframe id
    if (document.getElementById)
    {
        if (iframeid && !window.opera)
        {
            if (iframeid.contentDocument && iframeid.contentDocument.body.offsetHeight){
                iframeid.height = iframeid.contentDocument.body.offsetHeight;
            }
            else if(iframeid.Document && iframeid.Document.body.scrollHeight)
            {
                iframeid.height = iframeid.Document.body.scrollHeight;
            }
        }
    }
}
</script>

</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column" style="background-color:black">
		</div>
		<div class="col-md-10 column content-loginbox">
			<div style="width:20%;float:left"><img alt="140x140" src="img/logo.png" /></div>
			<div style="width:60%;float:right" class="loginbox">
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
								<button    style="width: 80px;">登录</button>
							</td>
							<td class="col_4">
								<span style="cursor: pointer;color: #369;font-weight: 700;">注册</span>
							</td>
						</tr>
						
					</tbody>
				</table>
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
					<li><a href="javascript:void(0)">论坛</a></li>
					<li><a href="javascript:void(0)">文章</a></li>
					<li><a href="javascript:void(0)">资源</a></li>
					<li><a href="javascript:void(0)">视频</a></li>
					<li><a href="javascript:void(0)">测试</a></li>
				</ul>
			</div>
			<div  style="background-color:#e9f4f5;padding:5px">
				<table>
					<tr>
						<td>
                   			<input type="text"  class="querybox" placeholder="请输入搜索内容">
                 			</td>
                 			<td>
                   			<select  class="querybox">
                   				<option>帖子</option>
                   				<option>用户</option>
                   			</select>
                 			</td>
                 			<td style="padding:0 5px 0 5px;">
                  			<button type="button" class="btn btn-default btn-lg querybox">
								<span class="glyphicon  glyphicon-search"></span>
							</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="content clearfix">
				<div class="col-md-2 column content-left" style="padding-left: 0;padding-right: 0;">
					<div style="border:1px solid #CCC;"> 这是导航</div>
				</div>
				<div class="col-md-10 column content-right" style="padding-right: 0;">
					<iframe src="index.jsp"  id="iframeid" onload="javascript:SetCwinHeight()" style="border:1px solid #CCC;">这是正文</iframe>
				</div>
			</div>
		</div>
		<div class="col-md-1 column">
		</div>
	</div>
</div>

</body>
</html>
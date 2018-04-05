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
<link href="umeditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.js"></script>
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>
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

<style>
.list-group-item:first-child{
border-radius: 0px;
 border-radius: 0px; 

}
.list-group-item:last-child{
border-radius: 0px;
 border-radius: 0px; 

}
.topictypelist{
	padding: 10px;
    margin-bottom: 0px;
    padding-left: 0px;
}
.topictypelist li{
	float: left;
    list-style: none;
    margin-left: 5px;
    /* margin: 5px; */
    margin-right: 5px;
}
.topictypelist li a{
	
    border: 1px solid #CDCDCD;
    background: #FFF;
    padding: 5px;
    cursor: pointer;
}
.topictypelist li a.active{
	
    background: #91BDD3;
}  
.topictypelist:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
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
.postlistdiv{
   	border: 1px solid #ccc;
    padding: 5px;
    margin-bottom: 10px;
    background-color:white;
   } 
#postlisttableid tbody{
border-bottom: 1px solid #C2D5E3;
	
}
#postlisttableid th
{
 	width: 60%;
    padding: 10px;
    font-weight: 400;
    font-style: normal;
} 
#postlisttableid th em
{
 	margin-right:5px;
 	font-style:normal;
}
#postlisttableid td
{
 	color:#666;
 	font-size:11px;
 	text-align:center
} 
#postlisttableid td cite
{
 	color:#333;
 	display:block;
} 
#postlisttableid a
{
 	cursor:pointer;
 	color:#666;
}

.nextpage{
	
    display:block;
    text-align:center;
    border: 1px solid rgb(194,213,227);
    border-radius: 3px;
    background: #F2F2F2;
    padding:  5px;
   
    cursor:pointer;
} 

.nextpage:hover{
	background:#fff;
}
.postbox{
margin-top:10px;
border: 1px solid #CDCDCD !important;
}
.title{
		line-height:31px;
		background: #F2F2F2;
		margin:0;
		border-bottom: 1px solid #CDCDCD !important;
		
		padding:10px;
		
}
.title h1{
	margin:0;
	font-size:14px
}
	
.editbox{
	padding:20px;
}
</style>
<script>
      

 


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
		<div class="col-md-10 column" style="padding:0px">
			<%@ include file="menu.txt"%>
			<div class="content clearfix">
				<div class="column content-right" style="padding-right: 0;">
					
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
			<ul href="javascript:void(0)"  class="topictypelist">
					<li>
						
						<c:choose>
						    <c:when test="${param.postTopicTypeId==null}">
						      	<a class="active" data-topicid="" href="/subjectcommunicationplatform/forum">全部</a>
						    </c:when>
						    <c:otherwise>
						        <a   href="/subjectcommunicationplatform/forum">全部</a>
						    </c:otherwise>
						</c:choose>
					</li>
    				<c:forEach items="${topic}"  var="item" varStatus="status">
								 <li>
								 	
								 	<c:choose>
									    <c:when test="${param.postTopicTypeId==item.topicTypeId}">
									      	<a  class="active"data-topicid="${item.topicTypeId}" href="/subjectcommunicationplatform/forum?postTopicTypeId=${item.topicTypeId }">${item.topicTypeName}</a>
									    </c:when>
									    <c:otherwise>
									        <a data-topicid="${item.topicTypeId}" href="/subjectcommunicationplatform/forum?postTopicTypeId=${item.topicTypeId }">${item.topicTypeName}</a>
									    </c:otherwise>
									</c:choose>
								 </li>
					</c:forEach>
    				
    		</ul>
			
			<div class="list-group postlistdiv" >
				 <table style="width:100%" id="postlisttableid">
				 <tbody><tr >
				 	<th ><em style="    font-style: normal;"></th>
				 	<td>作者</td>
				 	<td>回复/查看</td>
				 	<td>最后发表</td>
				 </tr></tbody>
				 <c:forEach items="${postlist.rows}"  var="item" varStatus="status">
								
					<tbody style="border-bottom: 1px solid #C2D5E3;">
					<tr>
					 	<th><em>[<a href="/subjectcommunicationplatform/forum?postTopicTypeId=${item.topicTypeId }">${item.topicTypeName}</a>]</em><a href="javascript:void(0)" data-id="${item.postId}"onclick="openview(this)">${item.postName}</a></th>
						<td class="by"><cite><a data-userid="${item.postUserId}">${item.userName}</a></cite><em><span>${item.postTime}</span></em></td>
						<td class=""><cite><a href="javascript:void(0)">${item.postReplyNum }</a></cite><em>${item.postLookedNum}</em></td>
						<td class=""><cite><a href="javascript:void(0)"data-userid="${item.postLastreply}">${item.postLastreplyName}</a></cite><em>${item.postLastreplyTime }</em></td>
				 	</tr>
				 	</tbody>
				 </c:forEach>
				 
				 </table>
				
			</div>
			<a class="nextpage" id="nextpage" data-page="${thispage}">下一页 »</a>
		
		<div class="postbox">
			<div class="title"><h1 style="font-size: 1em;">快速发帖</h1></div>
			
			<div class="editbox">
				<form id="postcontentbox">
				<div class="input-group" style="margin-bottom:10px;width:500px">
					<div class="input-group-btn">
						<select class="form-control" name="postTopicTypeId" style="width: 100px;" >
						 	<c:forEach items="${topic}"  var="item" varStatus="status">
								<option value="${item.topicTypeId}">${item.topicTypeName}</option>
							</c:forEach>
						</select>
					</div><!-- /btn-group -->
					<input type="text" class="form-control" name="postName">
				</div><!-- /input-group -->
				<script type="text/plain" id="myEditor" name="postContent" style="width:100%;height:240px;">
				</script>
				</form>
				<button class="btn btn-default" type="button"  onclick="doFatie(this)"style="margin-top:10px">发帖</button>
			</div>
			
		</div>
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
<script>
var um = UM.getEditor('myEditor');

$(function(){
	$('.edui-container').css("width","100%");
	//检测草稿里是否存有内容 如有 则填入编辑框
	if(typeof(window.localStorage.draft)!= 'undefined' &&window.localStorage.draft!=null && window.localStorage.draft!=""&&typeof(window.localStorage.draftcontent)!="undefined")
	{
		um.setContent(window.localStorage.draftcontent);
		$('#postcontentbox').find('[name="postTopicTypeId"]').val(window.localStorage.draftpostTopicTypeId);
		$('#postcontentbox').find('[name="postName"]').val(window.localStorage.draftpostName);
	}
	$('#nextpage').click(function(){
		alert(1);
		var button = $(this);
		$.get('postmanage/findbylist',{postTopicTypeId:$('.topictypelist .active').attr('data-topicid'),page:parseInt(button.attr('data-page'))+1},function(rsp){
			button.attr('data-page',parseInt(button.attr('data-page'))+1);
			var list = $('#postlisttableid');
			for(var index in rsp.rows){
				var i = rsp.rows[index];
				var tbody = 
					'<tbody style="border-bottom: 1px solid #C2D5E3;">'+
					'<tr>'+
				 	'<th><em>[<a href="/subjectcommunicationplatform/forum?postTopicTypeId="'+i.topicTypeId+'>'+i.topicTypeName+'</a>]</em><a data-id="'+i.postId+'"onclick="openview(this)">'+i.postName+'</a></th>'+
					'<td class="by"><cite><a data-userid="'+i.postUserId+'">'+i.userName+'</a></cite><em><span>'+i.postTime+'</span></em></td>'+
					'<td class=""><cite><a href="javascript:void(0)">'+i.postReplyNum+'</a></cite><em>'+i.postLookedNum+'</em></td>'+
					'<td class=""><cite><a href="javascript:void(0)"data-userid="'+i.postLastreply+'">'+i.postLastreplyName+'</a></cite><em>'+i.postLastreplyTime+'</em></td>'+
					'</tr>'+
					'</tbody>';
				$(tbody).appendTo(list);
				parent.document.getElementById("ifrm").height =parseInt(parent.document.getElementById("ifrm").height)+41;
			}
			debugger;
		});
	})
})

var doFatie = function(btn){
	debugger;
	var formdata = new FormData($('#postcontentbox')[0]);
	window.localStorage.draftpostTopicTypeId=$('#postcontentbox').find('[name="postTopicTypeId"]').val();
	window.localStorage.draftpostName=$('#postcontentbox').find('[name="postName"]').val();
	window.localStorage.draftcontent=um.getContent();
	//如果未登录,则保存编辑框的内容
	if("${sessionScope.user.userName}"=='null' ||"${sessionScope.user.userName}"=="" )
	{
		alert("请登录后操作");
		return false;
	}
	$.ajax({
		url:'postmanage/insert',
		type:'post',
		data:formdata,
		dataType:'JSON',
		cache: false,                      // 不缓存
	    processData: false,                // jQuery不要去处理发送的数据
	    contentType: false,                // jQuery不要去设置Content-Type请求头
		success:function(rsp){
			if(rsp.statecode==200){
				addpostlist(rsp.obj);
				
				localStorage.removeItem('draftpostTopicTypeId');
				localStorage.removeItem('draftpostName');
				localStorage.removeItem('draftcontent');
			}
				
		},
		error:function(e){
			
		}
	})
};
var addpostlist = function(obj){
	var form = $('#postcontentbox');

	var tbody = 
		'<tbody style="border-bottom: 1px solid #C2D5E3;">'+
		'<tr>'+
	 	'<th><em>[<a href="/subjectcommunicationplatform/forum?postTopicTypeId='+obj.postTopicTypeId+'">'+$('#postcontentbox').find('[name="postTopicTypeId"] [value="'+obj.postTopicTypeId+'"]').text()+'</a>]</em><a data-id="'+obj.postId+'"onclick="openview(this)">'+obj.postName+'</a></th>'+
		'<td class="by"><cite><a data-userid="'+obj.postUserId+'">'+"${sessionScope.user.userName}"+'</a></cite><em><span>'+obj.postTime+'</span></em></td>'+
		'<td class=""><cite><a href="javascript:void(0)">'+obj.postReplyNum+'</a></cite><em>'+obj.postLookedNum+'</em></td>'+
		'<td class=""><cite><a href="javascript:void(0)"data-userid="'+obj.postLastreply+'">'+"${sessionScope.user.userName}"+'</a></cite><em>'+obj.postLastreplyTime+'</em></td>'+
		'</tr>'+
		'</tbody>';
	$(tbody).appendTo($('#postlisttableid'));
	parent.document.getElementById("ifrm").height =parseInt(parent.document.getElementById("ifrm").height)+41;
}
var refreshpostlist = function(){
	
}
var openview = function(a){
	debugger;
	console.log($(a).attr('data-id'));
	parent.location.hash="postmanage/thread-"+$(a).attr('data-id')+"-1";
	
}
</script>
</html>
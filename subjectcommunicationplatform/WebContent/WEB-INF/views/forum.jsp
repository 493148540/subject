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
</head>

<body onload="IFrameResize()" >

		<div class="col-md-12 column" style="padding:0">
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
					 	<th><em>[<a>${item.topicTypeName}</a>]</em><a>${item.postName}</a></th>
						<td class="by"><cite><a data-userid="${item.postUserId}">${item.userName}</a></cite><em><span>${item.postTime}</span></em></td>
						<td class=""><cite><a href="javascript:void(0)">${item.postReplyNum }</a></cite><em>${item.postLookedNum}</em></td>
						<td class=""><cite><a href="javascript:void(0)"data-userid="${item.postLastreply}">${item.postLastreplyName}</a></cite><em>${item.postLastreplyTime }</em></td>
				 	</tr>
				 	</tbody>
				 </c:forEach>
				 
				 </table>
				
			</div>
			<a class="nextpage" id="nextpage" data-page="${thispage}">下一页 »</a>
		</div>
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
	 	'<th><em>[<a>'+$('#postcontentbox').find('[name="postTopicTypeId"] [value="'+obj.postTopicTypeId+'"]').text()+'</a>]</em><a>'+obj.postName+'</a></th>'+
		'<td class="by"><cite><a data-userid="'+obj.postUserId+'">'+"${sessionScope.userName}"+'</a></cite><em><span>'+obj.postTime+'</span></em></td>'+
		'<td class=""><cite><a href="javascript:void(0)">'+obj.postReplyNum+'</a></cite><em>'+obj.postLookedNum+'</em></td>'+
		'<td class=""><cite><a href="javascript:void(0)"data-userid="'+obj.postLastreply+'">'+"${sessionScope.userName}"+'</a></cite><em>'+obj.postLastreplyTime+'</em></td>'+
		'</tr>'+
		'</tbody>';
	$(tbody).appendTo($('#postlisttableid'));
	parent.document.getElementById("ifrm").height =parseInt(parent.document.getElementById("ifrm").height)+41;
}
var refreshpostlist = function(){
	
}

</script>


<script>  
function IFrameResize(){  
  
 //alert(this.document.body.scrollHeight); //弹出当前页面的高度  
 var obj = parent.document.getElementById("ifrm");  //取得父页面IFrame对象  
 //alert(obj.height); //弹出父页面中IFrame中设置的高度  
 obj.height = this.document.body.scrollHeight+100;  //调整父页面中IFrame的高度为此页面的高度  
  
}  

</script> 
</body>
</html>
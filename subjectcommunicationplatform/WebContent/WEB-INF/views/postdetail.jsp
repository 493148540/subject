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
<%@include file="head.jsp" %>
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
.postdetailbox {border-bottom: 3px solid #e3e6e8;}
.postdetailbox .c1{	
		width: 20%;
	   
	  
	    /* padding-top: 0px; */
	    /* text-align: center; */
	    vertical-align: unset;
	    border-top:1px solid #cdcdcd;
	    border-left:1px solid #cdcdcd;
	    
	    background-color:#ebf5f6;
}
.auther {
	border-bottom: 1px dashed #CDCDCD;
	margin-top:5px;
	padding-bottom: 5px;
	  padding-left: 30px;
	    padding-right: 30px;
}
	
.postdetailbox .ma	{
	margin-top:10px;
	padding-left: 30px;
	    padding-right: 30px;
}
.postdetailbox .c2{
	width:80%;padding: 5px;
	border-bottom: 1px;
	vertical-align: unset;
	border-top:1px solid #cdcdcd;
	border-left:1px solid #cdcdcd;
	border-right:1px solid #cdcdcd;
}
.postdetailbox .table{
	margin-bottom:0px;
}
.content{
min-height: 300px;}
.c1 .ma img{
width:120px;
height:auto;
}

.pob .c1{
	border-top:none;
	
}
.pob .c2{
	
	border-top: 1px dashed #CDCDCD;
	    padding-left: 30px;
	        padding-right: 30px;
	
}
.postedit{
	width:100%;
}

.postedit .pe1{
	width:20.8%;
}
.postedit .pe2{
	width:79.2%;
}

#editbox table tr.t1{

	height: 8px;
    background-color: #666;
    opacity: 0.2;
}
#editbox table tr td.td1{
	background-color: #666;
    opacity: 0.2;
	width: 8px;
}
#editbox h3{
    margin: 0px;
    padding: 10px;
    /* float: left; */
    font-size: 14px;
    font-weight: 700;
    color: #52667D;
    cursor:move;
	background-color:#fff;    
}
#editbox{
	padding:20px;
	position:fixed;
	left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
        width: 484px;
    height: 400px;
   display:none;
}
</style>
</head>
<body>
<div class="container">
	<%@include file="loginbox.jsp"%>
	
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column" style="
    padding-top:  10px;
    padding-bottom: 10px;
		">
			<c:forEach items="${postlist.rows}"  var="item" varStatus="status">
					<div class="postdetailbox">
				<table class="table"  id="floor-${item.postFloorid}">
					<tr>
					<td class="c1" style="">
					<div class="auther"><c:if test='${item.userName==null}'>火星人</c:if><c:if test='${item.userName!=null}'>${item.userName}</c:if> </div>
					<div class="ma"><img src="${item.userHead}" onerror="this.src='img/noavatar_middle.gif'"</img> </div>
					</td>
					<td class="c2">
					
						<div class="auther">
							发表于${item.postTime} | 
							<c:choose>
							<c:when test='${queryparam==""}'>
								<a href="thread-${postid}-1?postUserId=${item.postUserId}">只看该作者</a>
							</c:when>
							<c:otherwise>
								<a href="thread-${postid}-1">查看全部</a>
							</c:otherwise>
							</c:choose>
						<span style="float:right">
							<c:choose>
						    <c:when test="${item.postFloorid==0}">
						      	<a href="javascript:void(0)">楼主</a>
						    </c:when>
						    <c:when test="${item.postFloorid==1}">
						      	<a href="javascript:void(0)">沙发</a>
						    </c:when>
						    <c:when test="${item.postFloorid==2}">
						      	<a href="javascript:void(0)">板凳</a>
						    </c:when>
						    <c:when test="${item.postFloorid==3}">
						      	<a href="javascript:void(0)">地板</a>
						    </c:when>
						    <c:otherwise>
						        <a  href="javascript:void(0)">#${item.postFloorid}</a>
						    </c:otherwise>
						</c:choose>
						</span>
						</div>
						<div class="content ma">
						${item.postContent}
						</div>
					</td>
					</tr>
					<tr class="pob">
						<td class="c1"></td>
						<td class="c2">回复</td>
					</tr>
				</table>
			</div>			 
			</c:forEach>
			<table class="postedit" >
			<td class="pe1"></td>
			<td class="pe2">
			
			
			</td>
			</table>
			
			<%@include file="postdetailpagelist.jsp" %>
			<div id="editbox">
				<table>
				<tr class="t1"><td class="td1"></td><td></td><td class="td1"></td></tr>
				<tr class="t2">
				<td  class="td1"></td>
				<td>
					<h3 id="editbox-title">回复</h3>
					<form id="postcontentbox">
					<script type="text/plain"  id="myEditor" name="postContent" style="width:100%;height:240px;">
					</script>
					<input type="hidden"  name="postParentId"value="${postid}">
					
					</form>
					<div><button class="btn"id="dosetpost">回复</button></div>
				</td>
				<td  class="td1"></td>
				</tr>
				<tr class="t1"><td></td><td></td><td></td></tr>
				
			</table>
			</div>
		</div>
		<div class="col-md-1 column"></div>
	</div>
	</div>
	
	
</body>
<script>


$(function(){

	var div1 = document.getElementById("editbox-title");
	var editbox = document.getElementById("editbox");
	div1.onmousedown = function(ev){
		var oevent = ev || event;
		
		var distanceX = oevent.clientX - editbox.offsetLeft;
	var distanceY = oevent.clientY - editbox.offsetTop;
	
	document.onmousemove = function(ev){
	var oevent = ev || event;
	editbox.style.left = oevent.clientX - distanceX + 'px';
	editbox.style.top = oevent.clientY - distanceY + 'px'; 
	};
	document.onmouseup = function(){
	document.onmousemove = null;
	document.onmouseup = null;
	};
	}
	
	$('#fatiebtn').click(function(){
		alert('fatie');
	});
	$('#huifubtn').click(function(){
		if("${sessionScope.user.userName}"=='null' ||"${sessionScope.user.userName}"=="" )
		{
			alert("请登录后操作");
			return false;
		}
		$('#editbox').css('display','block');
		var um = UM.getEditor('myEditor');
	});
	
	$('#dosetpost').click(function(){
		var formdata = new FormData($('#postcontentbox')[0]);
		$.ajax({
			url:'postmanage/insertById',
			type:'post',
			data:formdata,
			dataType:'JSON',
			cache: false,                      // 不缓存
		    processData: false,                // jQuery不要去处理发送的数据
		    contentType: false,                // jQuery不要去设置Content-Type请求头
			success:function(rsp){
				if(rsp.statecode==200)
					alert('true');
					
					
					
			},
			error:function(e){
				
			}
		})
		
	});
})
</script>
</html>
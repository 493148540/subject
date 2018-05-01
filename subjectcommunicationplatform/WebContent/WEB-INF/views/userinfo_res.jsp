<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.user_info{

    text-align:  center;
    border: 1px solid #eee;
    /* padding: 20px; */
}
.user_info img{
border-radius: 50%;
width:120px;
height:auto;
}
.user_info table{

	width:100%;
}
button.redbutton{
	color:white;
	background-color:red;
}
button.redbutton:hover{
	
	background-color:white;
	color:red;
}
button.redbutton:focus{
	
	color:white;
	background-color:red;
}
</style>

<div class="user_info">
	<div><img src="${sessionScope.user.userHead}" onerror="this.src='upload/image/noavatar_middle.gif'"/></div>
	<div>下载积分:<span>${sessionScope.user.userResPoint}</span></div>
	<table>
		<td><button class="btn btn-default redbutton" onclick="window.location.href='usercenter'">我的资源</button></td>
		<td><button class="btn btn-default redbutton" onclick="$('#myModal_uploadRes').modal('show')">上传资源</button></td>
	</table>
</div>
<%@include file="resupload.jsp" %>
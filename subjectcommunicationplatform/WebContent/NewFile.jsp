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
	   
	    padding-left: 30px;
	    padding-right: 30px;
	    /* padding-top: 0px; */
	    /* text-align: center; */
	    vertical-align: unset;
	    border-top:1px solid #cdcdcd;
	    border-left:1px solid #cdcdcd;
}
.auther {
	border-bottom: 1px dashed #CDCDCD;
	margin-top:5px;
	padding-bottom: 5px;
}
	
.postdetailbox .ma	{
	margin-top:10px;
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
</style>
</head>
<body>

		<div class="col-md-12 column" style="padding:0px" >
			<div class="postdetailbox">
				<table class="table ">
					<td class="c1">
					<div class="auther">geekcheng</div>
					<div class="ma"><img src="https://www.mukedaba.com/uc_server/avatar.php?uid=618&size=middle"</img> </div>
					</td>
					<td class="c2">
						<div class="auther">发表于7天前 | 只看该作者</div>
						<div class="content ma">
						<table style="word-wrap: break-word; empty-cells: show; table-layout: fixed; width: 757px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><tbody style="word-wrap: break-word;"><tr style="word-wrap: break-word;"><td class="t_f" id="postmessage_1529547" style="word-wrap: break-word; font-size: 14px;"><span style="font-size:18px;word-wrap: break-word;"><span style="word-wrap: break-word; font-weight: 700;">【课程内容】</span></span><br/><br/>java8并发异步编程<br/>java9并发异步编程<br/>java9新特性之核心类库<br/>JavaBeans内省机制以及在Spring中的应用<br/>spring注解驱动编程<br/>高并发 Reactor 编程<br/></td></tr></tbody></table><p><br/></p>
						</div>
					</td>
				</table>
			</div>
			<div class="postdetailbox">
				<table class="table">
					<td class="c1" style="">
					<div class="auther">geekcheng</div>
					<div class="ma"><img src="https://www.mukedaba.com/uc_server/avatar.php?uid=618&size=middle"</img> </div>
					</td>
					<td class="c2">
						<div class="auther">发表于7天前 | 只看该作者</div>
						<div class="content ma">
						<table style="word-wrap: break-word; empty-cells: show; table-layout: fixed; width: 757px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><tbody style="word-wrap: break-word;"><tr style="word-wrap: break-word;"><td class="t_f" id="postmessage_1529547" style="word-wrap: break-word; font-size: 14px;"><span style="font-size:18px;word-wrap: break-word;"><span style="word-wrap: break-word; font-weight: 700;">【课程内容】</span></span><br/><br/>java8并发异步编程<br/>java9并发异步编程<br/>java9新特性之核心类库<br/>JavaBeans内省机制以及在Spring中的应用<br/>spring注解驱动编程<br/>高并发 Reactor 编程<br/></td></tr></tbody></table><p><br/></p>
						</div>
					</td>
				</table>
			</div>
		</div>
	

</body>
</html>